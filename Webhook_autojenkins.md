# GitHub Webhook Setup for Jenkins

## Prerequisites

- Jenkins installed and running
- GitHub repository
- ngrok installed
# Step 1: Install Required Jenkins Plugins
Manage Jenkins
→ Plugins
→ Available Plugins

Install the following plugins:
- Git Plugin
- GitHub Plugin
- GitHub Integration Plugin
Restart Jenkins after installation.

# Step 2: Configure Jenkins Job
Open your Jenkins Job.
Configure
Under **Build Triggers**, enable:
✔ GitHub hook trigger for GITScm polling
Save

# Step 3: Create ngrok Account

Sign up for a free ngrok account:
https://dashboard.ngrok.com/signup
Verify your email.
---

# Step 4: Configure ngrok Authentication

Login to ngrok and copy your Auth Token:
https://dashboard.ngrok.com/get-started/your-authtoken

bash run:
ngrok config add-authtoken YOUR_AUTH_TOKEN
Eg o/p:
ngrok config add-authtoken 2xxxxxxxxxxxxxxxxxxxx

# Step 5: Expose Jenkins Using ngrok(IN CLI)
Start ngrok:
bash run:
ngrok http 8080
Example output:
text
Forwarding https://abcd-12-34-56-78.ngrok-free.app -> http://localhost:8080

Copy the HTTPS URL.

---

# Step 6: Configure GitHub Webhook

Open GitHub Repository.
Navigate to:

Settings
→ Webhooks
→ Add webhook
### Payload URL
https://YOUR-NGROK-URL.ngrok-free.app/github-webhook/
Example:
https://abcd-12-34-56-78.ngrok-free.app/github-webhook/
### Content Type
application/json
### Secret
Leave Empty

### Which events would you like to trigger this webhook?
Select:
Just the push event
Click:
Add webhook
---

# Step 7: Verify Webhook
Go to:
Settings
→ Webhooks
→ Recent Deliveries

Expected Response:
200 OK
---

# Step 8: Test
Push code to GitHub:
git add .
git commit -m "Webhook Test"
git push origin main

If configured correctly, Jenkins will automatically start a new build.
