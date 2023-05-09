# Use a smaller base image
FROM node:16

# Set the working directory
WORKDIR /app

# Copy the package files and install dependencies
COPY ./package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Set environment variables
ENV DB_USER=myuser
ENV DB_PASSWORD=myuser

# Expose the application port
EXPOSE 5000

# Start the application
CMD ["npm", "start"]


# 1st command to build docker cmd :- docker build -t rozi-roti-docker-app .
# 2nd docker images to check image is build or not :- docker images or docker image ls
# REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
# my-node-app   latest    8aa99aedfc00   6 minutes ago   978MB
# node          16        de468b37223b   3 days ago      910MB
# 3rd run the docker image:- docker run --rm -d -p 5000:5000 --name rozi-roti-app rozi-roti-docker-app
# 4th check which container is runnign:- deocker ps
# 5th to stop docker- copy container id and then:- docker stop 27cf06a54869
# 6th for binding root folder to docker folder:- docker run -d -p 5000:5000 -v $(pwd):/app --name rozi-roti-app rozi-roti-docker-app
# 7th for delete the docker image the not been used :- docker rmi -f 8aa99aedfc00
