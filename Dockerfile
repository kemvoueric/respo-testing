 FROM ubuntu:latest 
 MAINTAINER pert@gmail.com 
 RUN apt update -y 
 RUN apt install -y git 
 RUN apt install -y vim 
 RUN apt install -y curl 
 RUN apt install -y finger 
 RUN apt install -y ansible 
 EXPOSE 8085 
 CMD [ echo 'this group is amazing' ] 
 ENV peter=geraldine 
