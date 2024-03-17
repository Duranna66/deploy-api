#!/bin/bash

VAR1=$1
PATHSH="/home/vsevolod/deploy/deploy-api/src/main/java/org/example/scripts"  #проблему с путями решить     указывать надо отностиельный
PATHBUILD="/home/vsevolod/deploy/deploy-api/$VAR1/build/libs"
cd /home/vsevolod/deploy/deploy-api
git clone https://github.com/Duranna66/$VAR1.git
cd $VAR1
gradle build
selected_file=$(ls -v $PATHBUILD/*.jar | grep -v plain | head -n 1)
cd /home/vsevolod/deploy
echo $selected_file
mv $selected_file ./$VAR1.jar
if sudo docker ps -a --format '{{.Names}}' | grep -Eq "^${VAR1}\$"; then
 echo "Контейнер существует"
 docker stop $VAR1
 docker rm $VAR1
 docker rmi $VAR1-image
fi

docker build --build-arg JAR_FILE=$VAR1.jar -t $VAR1-image .
selected_file=$(ls -v *.jar | grep -v plain | head -n 1)
rm $selected_file.jar
docker run -d --name $VAR1 --network host -p 8080:8090 $VAR1-image #менять порты в зависимости от названия и записывать в txt  cont_name = port:port
rm -rf /home/vsevolod/deploy/deploy-api/$VAR1