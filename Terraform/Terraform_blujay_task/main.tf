# With key pair
resource "aws_key_pair" "mykey" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

# SECURITY GROUP
# Allow SSH (22) and HTTP (80)

resource "aws_security_group" "web_sg" {
  name        = "web-security-group"
  description = "Allow SSH and HTTP traffic"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow All Outbound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 INSTANCE

resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Terraform-EC2"
  }
}

# EBS VOLUME (10GB)

resource "aws_ebs_volume" "logs_volume" {
  availability_zone = aws_instance.web.availability_zone
  size              = 10

  tags = {
    Name = "logs-volume"
  }
}

# ATTACH EBS VOLUME TO EC2

resource "aws_volume_attachment" "logs_attach" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.logs_volume.id
  instance_id = aws_instance.web.id
}

# DEFAULT VPC

resource "aws_default_vpc" "default" {
}

# DEFAULT SUBNETS

resource "aws_default_subnet" "subnet1" {
  availability_zone = "us-east-1a"
}

resource "aws_default_subnet" "subnet2" {
  availability_zone = "us-east-1b"
}

# TARGET GROUP

resource "aws_lb_target_group" "tg" {
  name     = "web-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

# APPLICATION LOAD BALANCER

resource "aws_lb" "alb" {
  name               = "terraform-alb"
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.web_sg.id
  ]

  subnets = [
    aws_default_subnet.subnet1.id,
    aws_default_subnet.subnet2.id
  ]
}

# LOAD BALANCER LISTENER

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# LAUNCH TEMPLATE

resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.mykey.key_name

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ASG-Instance"
    }
  }
}

# AUTO SCALING GROUP

resource "aws_autoscaling_group" "asg" {
  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  target_group_arns = [
    aws_lb_target_group.tg.arn
  ]

  vpc_zone_identifier = [
    aws_default_subnet.subnet1.id,
    aws_default_subnet.subnet2.id
  ]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "ASG-Server"
    propagate_at_launch = true
  }
}