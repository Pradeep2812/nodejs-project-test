#base image 
FROM node:latest
#maintainer name
MAINTAINER 'Pradeep'
#set up workdir location
WORKDIR ./var
#copying the json package
COPY package.json .
#installin the all dependencies based on packge.json file
RUN npm install
#copy all project related files
COPY . .
#to start the application
CMD ["node","app.js"]
#expose the application 
EXPOSE 3000

