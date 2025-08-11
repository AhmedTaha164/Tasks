# nginx task
## installing nginx 
`sudo apt install nginx` to install nginx on your machine 
`sudo systemctl enable nginx` and `sudo systemctl restart nginx` to start nginx when the machine start up
`sudo systemctl status nginx` to show the status of nginx 
<img width="1173" height="370" alt="image" src="https://github.com/user-attachments/assets/36835e7f-15eb-407b-ae67-c5dda546fd44" />
## Adding new config file
nginx config files are in `/etc/nginx/conf.d/`  
add new config file in this dir `sudo vim /etc/nginx/conf.d/firstapp.conf` 
<img width="712" height="322" alt="image" src="https://github.com/user-attachments/assets/84be91a6-0df9-45d5-acbd-6a77c7806c53" />
it will listen on port 85 you access this web site on the following link `http://localhost:85/`

## PHP application with nginx
`sudo apt-get install php8.1-fpm -y`
<img width="848" height="526" alt="image" src="https://github.com/user-attachments/assets/c0225bce-1263-461f-bf0e-c25492d8272f" />
the application will listen on port 89 and it uses php application using socket to use the port method add thi0s line `# Nginx PHP fastcgi_pass 127.0.0.1:9000;`

