#  AWS Lambda

## ✅ What I Learned

- Learned about AWS Lambda (Serverless Compute Service).
- Understood how Lambda executes code without managing servers.
- Learned that Lambda automatically scales and charges only when the code runs.
- Understood the importance of IAM Roles for Lambda.
- Learned how Lambda can automate AWS services like EC2.

---

## 🔹 What is AWS Lambda?

AWS Lambda is a **serverless compute service** that allows you to run code without creating or managing servers. You simply upload your code, and AWS takes care of execution, scaling, and infrastructure.

---

## 🔹 Why Use Lambda?

- No server management
- Automatic scaling
- Pay only when the function executes
- Easy integration with AWS services
- Ideal for automation tasks

---

## 🔹 Real-Time Use Case

Automatically start and stop EC2 instances to reduce AWS costs.

Example:
- Start EC2 every morning.
- Stop EC2 every night.

---

# 🚀 Practical: Stop an EC2 Instance Using Lambda
### search in internet for python code
### Step 1
Launch an EC2 instance.

### Step 2
Copy the EC2 **Instance ID**.

### Step 3
Create an IAM Role with:
- AmazonEC2FullAccess *(for learning)*
- AWSLambdaBasicExecutionRole

### Step 4
Create a Lambda Function.
- Runtime: Python 3.x
- Attach the IAM Role

### Step 5
Paste the Python code to stop the EC2 instance.

### Step 6
Deploy the Lambda function.

### Step 7
Click **Test**.

### Step 8
Verify that the EC2 instance changes from:

```
Running
   ↓
Stopped
```

---

# 🚀 Practical: Start an EC2 Instance Using Lambda

### Step 1
Use the same Lambda function or create another one.

### Step 2
Replace the code with the EC2 Start code.

### Step 3
Deploy the changes.

### Step 4
Click **Test**.

### Step 5
Verify that the EC2 instance changes from:

```
Stopped
   ↓
Running
```

---

## 🔹 AWS Services Used

- AWS Lambda
- Amazon EC2
- IAM

---

## 📚 Key Takeaways

- Lambda is a serverless service.
- IAM Role provides permissions to Lambda.
- Lambda can automate EC2 operations.
- Lambda helps reduce AWS costs by starting and stopping EC2 instances automatically.
