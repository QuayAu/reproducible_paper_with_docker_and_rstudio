# reproducible_paper_with_docker_and_rstudio
This is a small guide on how to make a project with Rstudio completely reproducible with Docker.

## What is Docker?
- https://opensource.com/resources/what-docker

## Why Docker?
Suppose you are working on an analysis in R and you send your code to a colleague. The colleague executes exactly this code with exactly the same data set, but the code won't run. This can have several reasons, e.g. a different operating system or a different version of an R package. Docker solves this problem.

## But... is it complicated to use?
You can create complicated machine learning pipelines with docker. e.g. upload images with a shiny app and have these images classified with python on another container with a pre-trained deep neural network (see https://www.youtube.com/watch?v=GOW6yQpxOIg).
Of course, you have to dig deeper into docker to do such things.
For this tutorial on how to make an R-Project completely reproducible, we only need to scratch the surface of Docker

## Install Docker
- https://docs.docker.com/get-docker/

## Dockerhub
Dockerhub is like GitHub for Docker containers. You can pull openly available docker containers from Dockerhub or push your own docker there. See https://hub.docker.com/

## Dockerfile
The Dockerfile defines what your virtual machine contains. For our purpose, we will use an openly available R-Studio image and install R-packages on there. We will push this image on dockerhub to make this available for colleagues to use.
You can just copy the Dockerfile into your projects directory and change the Dockerfile to install the packages you need.

## Building your image
Just run the following command from your projects directory in the terminal:
```
docker build -t your_projects_name .
```
With the `-t`-option you can name your image as you wish. The build process will take some time.
All files in your projects directory, which are not ignored by .dockerignore, will also be copied into the container.

## Share your image
Push your image to dockerhub with:
```
docker push your_projects_name
```

I have pushed this image under the name `quayau/reproducible_paper_with_docker_and_rstudio`, available here https://hub.docker.com/repository/docker/quayau/reproducible_paper_with_docker_and_rstudio

## I've built an image, what now?
You can run this container using following command (see https://hub.docker.com/r/rocker/rstudio for more details):
```
docker run --rm -p 8787:8787 -e PASSWORD=yourpasswordhere quayau/reproducible_paper_with_docker_and_rstudio
```
Visit `localhost:8787` in your browser and log in with username `rstudio` and the password you set.

## Stop running containers
To stop all running containers, run
```
docker stop $(docker ps -a -q)
```
