1. Check RAM Usage Percentage
✅ Command
```bash
free -m
```
Direct Linux command for RAM %
```bash
free | awk '/Mem:/ {printf("%.2f\n", $3/$2 * 100)}'
```
3. Check Disk Usage Percentage
✅ Command
```bash
df -h
```
Direct command for root partition %
```bash
df / | tail -1
```
4. Check CPU Usage Percentage
✅ Simple command
```bash
top
```
One-line CPU percentage
```bash
top -bn1 | grep "Cpu(s)"
```
5.See the top 10 memory-consuming processes
```bash
ps aux --sort=-%mem | head -10
```
