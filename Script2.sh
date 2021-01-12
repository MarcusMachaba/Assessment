#!/bin/bash

# This is Script2.sh for importing the orders details information (data) into the mysql (northwind) database.
# When running this script, create a working directory (folder) & place only the .sh scripts in there.
# Create a folder & put only the two sql files a_schema.sql & b_data.sql Make sure the folder only has sql files only & not both sql & shell scripts
# activate permissions to this script by typing the following on the terminal: chmod 0755 Script1.sh or chmod +x Script1.sh
# excute in terminal by typing the following on the terminal:  ./Script1.sh



echo ""
echo "Welcome, You are executing Script2.sh for importing the orders details information (data) into the mysql (northwind) database. "
echo ""

echo ""
echo "NOTE! We will be making use of mySQL Community Edition image maintained by the MySQL team at Oracle which was built specifically for Linux platforms & in our case we aare making use of MySQL Server 8.0."
echo ""

echo "LETS BEGIN........"
echo ""
read -p "Please enter the full directory path of where the sql files/scripts (a_schema.sql & b_data.sql) are --EG:/mnt/c/Users/Marcus/Test_Workspace: " directory_path
echo ""
read -p "Please enter name of container to be created: " container_name
echo ""

echo "...............CREATING Container $container_name & the container ID is: "
docker run --name=$container_name --mount type=bind,src=/$directory_path,dst=/docker-entrypoint-initdb.d/ -e MYSQL_ROOT_PASSWORD=password -d mysql/mysql-server:8.0


echo "Container has been created and mysql database has been seeded with the data at initialization of the container............."
echo ""
echo "Note: The password for the created mysql instance created in the container $container_name is (password) make note of it you will need it to login to mysql! "
echo ""
echo ""
echo ""
echo "**************************Please make note of the following:"
echo "Please wait 5 minutes then execute the following docker command in the terminal to confirm db has been seeded by checking mysql."
echo ""
echo "docker exec -it $container_name mysql -uroot -p"
echo ""
echo "/* mysql shell will open & require password. The password is [password] */ "
echo "/* then you can verify if northwind db exists & whether it has data"
echo ""

read -p " ......................Seeding Db is complete Go ahead and enter that command to start mysql & confirm if you want. Press any key to exit " x
