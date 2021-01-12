#!/bin/bash

# This is a Script1.sh for starting an existing mysql docker instance
# navigate to wd MyWorkingDirectory
# activate permissions to this script by typing the following on the terminal: chmod 0755 Script1.sh or chmod +x Script1.sh 
# excute in terminal by typing the following on the terminal:  ./Script1.sh


echo ""
echo "Welcome, You are executing Script1.sh for starting an existing mySQL docker instance."
echo ""

echo ""
echo "NOTE! We will be making use of mySQL Community Edition image maintained by the MySQL team at Oracle which was built specifically for Linux platforms & in our case we aare making use of MySQL Server 8.0."
echo ""

echo ""
echo "Just to prove that this script will be starting an existing docker instance of mysql, below we will display all docker instances/containers that exist on this machine."
echo ""
echo "This machine has the following docker instances on it: **************************************************************************************"
docker ps -a --format "table {{.Names}}\t{{.Image}}"
echo "*********************************************************************************************************************************************"

echo ""
read -p " Please enter the name of the docker instance/container you would like to start: " container_name 
echo ""



if [ "$(docker inspect -f '{{.State.Running}}' ${container_name} 2>/dev/null)" = "true" ]; 
then 
   echo "..........$container_name DOCKER INSTANCE/CONTAINER IS ALREADY RUNNING............"
   echo ""
else 
   echo ""
   echo "..........STARTING $container_name DOCKER INSTANCE/CONTAINER..........."\
	&& docker start $container_name 
   echo ""
           docker logs $container_name
   echo ""
   echo "..........$container_name DOCKER INSTANCE/CONTAINER HAS BEEN STARTED, PLEASE WAIT A MOMENT FOR CONTAINER TO STARTUP & INITIALIZE BEFORE USE........."
   echo ""
   echo "Below are the details of all running docker instances/containers at the moment, verify if you see the instance/container you have just started: "\
        && docker container ls
   echo ""
fi








