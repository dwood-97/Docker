FROM nginx:latest

COPY /index.html /home/ec2-user/environment/Docker/Luit16Project/index.html

WORKDIR /home/ec2-user/environment/Docker/Luit16Project/

RUN date +%x_%H:%M:%S:%N >> ./index.html