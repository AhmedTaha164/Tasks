# Ansible Playbook: Deploy Spring PetClinic with Docker

This repository contains an Ansible playbook that automates the installation of Docker, Docker Compose, and Python dependencies on remote hosts, copies the Spring PetClinic application, builds a Docker image, and runs the container.

---

## Table of Contents

- [Requirements](#requirements)  
- [Inventory](#inventory)    
- [Playbook Structure](#playbook-structure)  
- [Tasks Explained](#tasks-explained)  
- [License](#license)  

---

## Requirements

- Control machine with **Ansible 2.12+** installed.  
- Target hosts running **Ubuntu 20.04+** (or compatible).  
- SSH access to remote hosts with a private key.  
- Dockerfile for the Spring PetClinic app in your project folder.

---

## Inventory

Create a file named `host.ini` with the remote hosts:

```ini
[webservers]
192.168.56.10 ansible_user=vagrant ansible_private_key_file=/path/to/private_key
192.168.56.9 ansible_user=vagrant ansible_private_key_file=/path/to/private_key
```
## Playbook Structure
```
playbook.yml
├── Install Docker packages
├── Add Docker GPG key & repository
├── Install Docker CE
├── Download Docker Compose
├── Ensure application directory exists
├── Copy Spring PetClinic files
├── Install Python pip & Docker SDK
├── Build Docker image
└── Run container

```
### Tasks Explained
- Install required packages
  ```
  - name: Install required packages
      apt:
        pkg: 
          - apt-transport-https
          - ca-certificates
          - curl
        state: latest
        update_cache: true
  ```
  `pkg` like `name` but you can use lists with is
Ensures the host can download and install packages securely.

- Add Docker GPG key & repository
  ```
  - name: Add Docker GPG key
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present

    - name: Add Docker repository
      apt_repository:
        repo: "deb https://download.docker.com/linux/ubuntu {{ ansible_distribution_release }} stable"
        state: present
  ```
`GPG keys` to download docker securly `{{ ansible_distribution_release }}` ansible module to to determine the distribution of OS
 and Allows Docker to be installed from the official repository.

- Install Docker CE
  ```
   - name: Install Docker CE
      apt:
        name: docker-ce
        state: latest
        update_cache: true
  ```

Installs the latest Docker Engine on the host.

- Ensure application directory exists
  ```
    - name: Ensure app directory exists
      file:
        path: /home/vagrant/spring-petclinic
        state: directory 
  ```
Creates /home/vagrant/spring-petclinic if it doesn’t exist.

- Copy Spring PetClinic application
 ```
    - name: Copy Dockerfile and app to hosts
      copy:
        src: /home/ahmed-taha/petclinic/spring-petclinic
        dest: /home/vagrant/spring-petclinic
      register: copy_result
```
Copies all app files including the Dockerfile from the control machine.

- Install Python pip & Docker SDK
```
   - name: Install Python pip
      apt:
        name: python3-pip
        state: present

    - name: Install Docker SDK for Python
      pip:
        name: docker
```
Required for Ansible to manage Docker containers.

- Build Docker image
```
    - name: Build Docker image
      docker_image:
        name: spring-pet-image
        build:
          path: /home/vagrant/spring-petclinic/spring-petclinic
        source: build
```
Builds the spring-pet-image. Runs only if files changed for idempotency.

- Run container
    ```
        - name: Run the container
      docker_container:
        name: spring_petclinic
        image: spring-pet-image
        state: started
        restart_policy: always
        published_ports:
          - "8080:8083"
    ```

Runs the container, maps host port 8080 to container port 8083, and sets restart_policy: always.

- Run the playbook.yml
  ```
  ansible-playbook -i host.ini playbook.yml
  ```
- access the application on the browser
  enter to your browser and go to `<host-ip>:<host port>`
  <img width="1596" height="851" alt="image" src="https://github.com/user-attachments/assets/05171cb2-0c4f-4e39-865d-f8d53f9a8cd5" />
