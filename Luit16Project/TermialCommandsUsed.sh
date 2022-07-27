Dylan:~/environment/Docker/Luit16Project (main) $ docker build -t my-nginx .
Sending build context to Docker daemon  3.072kB
Step 1/4 : FROM nginx:latest
latest: Pulling from library/nginx
461246efe0a7: Pull complete 
060bfa6be22e: Pull complete 
b34d5ba6fa9e: Pull complete 
8128ac56c745: Pull complete 
44d36245a8c9: Pull complete 
ebcc2cc821e6: Pull complete 
Digest: sha256:1761fb5661e4d77e107427d8012ad3a5955007d997e0f4a3d41acc9ff20467c7
Status: Downloaded newer image for nginx:latest
 ---> 670dcc86b69d
Step 2/4 : COPY /index.html /home/ec2-user/environment/Docker/Luit16Project/index.html
 ---> 5f017392fa7c
Step 3/4 : WORKDIR /home/ec2-user/environment/Docker/Luit16Project/
 ---> Running in 2109d8b1eee4
Removing intermediate container 2109d8b1eee4
 ---> b0df332ae6d3
Step 4/4 : RUN date +%x_%H:%M:%S:%N >> ./index.html
 ---> Running in 88e215504453
Removing intermediate container 88e215504453
 ---> 8a1a6835cd6c
Successfully built 8a1a6835cd6c
Successfully tagged my-nginx:latest


Dylan:~/environment/Docker/Luit16Project (main) $ docker run -d -p 8080:80 --name my-nginx my-nginx
e8008ca40e1eeb722a60d43923a561267cc058db8e8e18db0054c64ac9589972


Dylan:~/environment/Docker/Luit16Project (main) $ aws sts get-caller-identity
{
    "Account": "262815966975", 
    "UserId": "AIDAT2MINM37RD4UHZC4W", 
    "Arn": "arn:aws:iam::262815966975:user/Dylan"
}


Dylan:~/environment/Docker/Luit16Project (main) $ aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 262815966975.dkr.ecr.us-east-1.amazonaws.com
WARNING! Your password will be stored unencrypted in /home/ec2-user/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded


Dylan:~/environment/Docker/Luit16Project (main) $ aws ecr create-repository --repository-name my-nginx
{
    "repository": {
        "repositoryUri": "262815966975.dkr.ecr.us-east-1.amazonaws.com/my-nginx", 
        "imageScanningConfiguration": {
            "scanOnPush": false
        }, 
        "encryptionConfiguration": {
            "encryptionType": "AES256"
        }, 
        "registryId": "262815966975", 
        "imageTagMutability": "MUTABLE", 
        "repositoryArn": "arn:aws:ecr:us-east-1:262815966975:repository/my-nginx", 
        "repositoryName": "my-nginx", 
        "createdAt": 1658949731.0
    }
}


Dylan:~/environment/Docker/Luit16Project (main) $ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
my-nginx     latest    8a1a6835cd6c   55 seconds ago   142MB
nginx        latest    670dcc86b69d   8 days ago       142MB


Dylan:~/environment/Docker/Luit16Project (main) $ docker tag 8a1a6835cd6c 262815966975.dkr.ecr.us-east-1.amazonaws.com/my-nginx:tag


Dylan:~/environment/Docker/Luit16Project (main) $ docker push 262815966975.dkr.ecr.us-east-1.amazonaws.com/my-nginx:tag
The push refers to repository [262815966975.dkr.ecr.us-east-1.amazonaws.com/my-nginx]
7098fe75b59c: Pushed 
8e1e025bf07c: Pushed 
abc66ad258e9: Pushed 
243243243ee2: Pushed 
f931b78377da: Pushed 
d7783033d823: Pushed 
4553dc754574: Pushed 
43b3c4e3001c: Pushed 
tag: digest: sha256:ef4a26f09b848beba3498f27a1be25106a85f960d3521eb66570ac563f73e930 size: 1984