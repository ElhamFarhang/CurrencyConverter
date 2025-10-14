@echo off
echo Stopping currencyconverter
docker stop currencyconverter
echo Deleting container currencyconverter
docker rm currencyconverter
echo Deleting image currencyconverter
docker rmi currencyconverter
echo Running mvn package
call mvn package -DskipTests
echo Creating image currencyconverter
docker build -t currencyconverter .
echo Creating and running container currencyconverter
docker run -d -p 9900:9900 --name currencyconverter --network services-network currencyconverter
echo Done!