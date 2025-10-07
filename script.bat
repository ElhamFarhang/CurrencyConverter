@echo off
echo Stopping microservice-a
docker stop currencyconverter
echo Deleting container microservice-a
docker rm currencyconverter
echo Deleting image microservice-a
docker rmi currencyconverter
echo Running mvn package
call mvn package -DskipTests
echo Creating image microservice-a
docker build -t currencyconverter .
echo Creating and running container microservice-a
docker run -d -p 9900:9900 --name currencyconverter --network services-network currencyconverter
echo Done!