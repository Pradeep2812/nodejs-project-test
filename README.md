# For set-uping the EC2 instance & RDS using terraform

I created the Ubuntu EC2 instance and Mysql for Database.

I mentioned the terraform files for creating EC2 and RDS.

To run the terraform Commands like terraform init , terraform plan, terraform apply, terraform destroy.

**terrform init**: installig the required versions of the aws and hashicorp

**terraform plan**: before creating the required modules to verfiying the syntax in the terraform file.

**terraform apply**: Create the specified modules in the terraform file

**terraform destroy**: To remove the all created modules 


# Docker file:
Used nodejs as a base image to create the Docker file 

Copying the files from the server to Docker container, and install the reuqired dependencies using npm module.

To run the application using "node app.js"

docker build -t pradeep1228/nodejs:latest --->> this is used for build the image

docker run --name con1 -p 3002:3000 -d pradeep1228/nodejs:latest . -->> to run the container used this command

docker push pradeep1228/nodejs:latest --->>> to push the docker image to dockerhub.


# Jenkins File

**stage1**: Clone the project from git hub

**stage2**: build the image, run the conatiner and  push the image to docker hub

**Note**: installed the pluggings in the jenkins to communicate with docker hub i,e Docker and Docker pipeline

Then set-up the webhook triggers to build the pipeline, if any changes done in the code 

# Work flow Diagram

![image](https://github.com/user-attachments/assets/b68fe37f-b7de-4f15-b5c6-ee1e2441c3a6)


