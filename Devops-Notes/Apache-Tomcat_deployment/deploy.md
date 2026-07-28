# Day X - Apache & Tomcat Deployment

## Apache (Static Website)

### Install
```bash
sudo apt update
sudo apt install apache2 -y
```

### Start Service
```bash
sudo systemctl start apache2
sudo systemctl enable apache2
```

### Deploy
- Copy website files to:
```
/var/www/html
```

### Test
### Use ip a to know ip 
```
http://<IP>
```

---

## Tomcat (Java Application)

### Install
```bash
sudo apt update
sudo apt install default-jdk tomcat10 -y
```

### Start Service
```bash
sudo systemctl start tomcat10
sudo systemctl enable tomcat10
```

### Deploy
- Copy the `.war` file to:
```
/var/lib/tomcat10/webapps/
```

### Test
```
http://<Public-IP>:8080/<application-name>
```

---

## Key Difference

- **Apache** → Hosts Static Websites (HTML, CSS, JS, PHP)
- **Tomcat** → Hosts Java Web Applications (.war)

## Outcome

- Installed Apache & Tomcat.
- Started and enabled both services.
- Deployed applications.
- Verified deployment using the browser.
