## installing nexus repo manger 
`wget https://sonatype-download.global.ssl.fastly.net/repository/downloads-prod-group/3/nexus-3.83.1-03-linux-x86_64.tar.gz` and extarct the tar file `tar -xvzf nexus-3.83.1-03-linux-x86_64.tar.gz`
then cd `nexus-3.83.1-03-linux-x86_64` and start the nexus server `bash ./bin/nexus start`
and you access the nexus through `localhost:8081`
## Add repo on nexus 
login to nexus with password and username `admin`
<img width="1399" height="730" alt="image" src="https://github.com/user-attachments/assets/59f5b671-ea53-4b03-9d7d-2e418e0a3b8f" />
choose create new repo
<img width="1389" height="697" alt="image" src="https://github.com/user-attachments/assets/12125a8b-3417-407d-9776-d4fda56c4205" />
then choose docker hosted
choose http and select the port for your repo 
<img width="1327" height="701" alt="image" src="https://github.com/user-attachments/assets/b6e2bc2b-e315-4bca-a24b-e9eb0fe9e19e" />
login to docker repo from your cli using `docker login <nexushost>:portnumber>`
# Multi docker-compose files
## docker-compose.yml
determined 3 services in the main docker-compose file `webapp`,`prometheus`,`grafana`
## webapp service 
pull the image from nexus repo and give the container name `pet_web` and make the application listen on port 8083 and make it connect to network `net1`
<img width="624" height="268" alt="image" src="https://github.com/user-attachments/assets/fbcb3f4f-a40e-4898-b871-9f386a014f6e" />
## prometheus service
pull the prometheus service and make it listen on port 9090 and connect to network net1 and mount the `prometheus.yml` to the defualt directory on the container `/etc/prometheus/prometheus.yml`
## grafana service 
pull the grafana image and make it listen on port 3000 and connect to network net1 and mount the `datasource.yml` to the defualt directory on the container `/etc/grafana/provisioning/datasources`

## docker-compose.dev.yml
add enviroment variables to webapp service to connect to the database and add mysql service and add environment variables
<img width="694" height="504" alt="image" src="https://github.com/user-attachments/assets/62a9a28c-2af4-4998-91ba-d7d956e87a2e" />
## docker-compose.prod.yml
<img width="813" height="549" alt="image" src="https://github.com/user-attachments/assets/f6985918-2c85-49f6-b627-47664627af93" />

## prometheus config
<img width="804" height="510" alt="image" src="https://github.com/user-attachments/assets/aefd59a5-d341-42a5-ac0b-c9c2678d91cb" />


## grafana datasource

<img width="824" height="501" alt="image" src="https://github.com/user-attachments/assets/9dc24b5d-78cd-4538-b462-ed31994899b5" />


