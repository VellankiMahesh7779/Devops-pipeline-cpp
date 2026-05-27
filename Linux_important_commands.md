1. Check RAM Usage Percentage
✅ Command
free -m
Direct Linux command for RAM %
free | awk '/Mem:/ {printf("%.2f\n", $3/$2 * 100)}'

2. Check Disk Usage Percentage
✅ Command
df -h
Direct command for root partition %
df / | tail -1

3. Check CPU Usage Percentage
✅ Simple command
top
One-line CPU percentage
top -bn1 | grep "Cpu(s)"
