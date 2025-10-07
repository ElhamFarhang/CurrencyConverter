@echo off
echo Stopping microservice-a
docker stop currencyconvertermicroservice
echo Deleting container microservice-a
docker rm currencyconvertermicroservice
echo Deleting image microservice-a
docker rmi currencyconvertermicroservice
echo Running mvn package
call mvn package -DskipTests
echo Creating image microservice-a
docker build -t currencyconvertermicroservice .
echo Creating and running container microservice-a
docker run -d -p 9900:9900 --name currencyconvertermicroservice --network services-network currencyconvertermicroservice
echo Done!