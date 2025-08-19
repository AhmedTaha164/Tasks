# Docker Compose with Spring petclinic
## Dockerfile for your spring pet app
<img width="486" height="261" alt="image" src="https://github.com/user-attachments/assets/76d8ca74-006b-4732-a58e-2278823fb449" />

first stage for building the app to have the `.jar` file 
second stage for running the application

## Docker Compose file 
### petclinic service
Define the services with optional names I defined them with `petclinic , db , pet , database`

<img width="1338" height="691" alt="image" src="https://github.com/user-attachments/assets/ce83f6c2-9222-4a62-89cc-a3c129c84e69" />
we want to have this form we created the service petclinic and give it the destnation for the dockerfile to build the imgage
<img width="563" height="66" alt="image" src="https://github.com/user-attachments/assets/7731f9f2-f749-4ab3-b5ab-99be05eeccf9" />

define the environment variables for the connected database here I used mysql database 
<img width="683" height="109" alt="image" src="https://github.com/user-attachments/assets/cbe9303e-069b-49d9-9e52-d1d7a4a2bca7" />

and define the ports to access the web page from browser here I used `0:8083` becuase I will scale to make 2 containers 

and make the petclinic service connect to the network net1 and dont run this service before service db using `depends_on`

### db service 
we use the image `mysql` to build our container using `image:` and give the container a name using `container_name: sql1` 

<img width="482" height="69" alt="image" src="https://github.com/user-attachments/assets/c11aed01-1fda-4870-8cf6-5f0ccd81d50f" />

then define the environment variables to connect properly with the application

<img width="608" height="71" alt="image" src="https://github.com/user-attachments/assets/7733a001-a6e7-427a-9f92-9eb1437f08bc" />
and attach the database to a volume to keep data `volumes: vol2:/var/lib/mysql`

make the container connect to the network `net1` with the petclinic containers and expose the container on port `3306`

### pet and database service 
we define these service with the same steps but in the pet service add two networks `net1` & `net2`
<img width="647" height="352" alt="image" src="https://github.com/user-attachments/assets/4d79e6f6-605e-4fdd-a746-7f55bf5fb9f2" />
<img width="445" height="272" alt="image" src="https://github.com/user-attachments/assets/ecb1dd5d-181f-49b7-bd12-a4626efce6c9" />

in the last section define the volumes and networks you used in your docker-compose file
<img width="274" height="148" alt="image" src="https://github.com/user-attachments/assets/5a90998e-72e2-4498-8a87-8665debc8990" />

## Run the docker compose file
`sudo docker compose up --build --scale petclinic=2 -d` we will run 2 containers frrom petclinic service 

## Check if the application and db is running

<img width="871" height="381" alt="Screenshot 2025-08-19 165558" src="https://github.com/user-attachments/assets/e38874fa-0342-433d-90b2-c125c2684372" />
<img width="1594" height="807" alt="image" src="https://github.com/user-attachments/assets/d3f8716e-455f-4606-a7b5-93a473676ee9" />

