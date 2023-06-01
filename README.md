#please run the following step by step

#step_1:start and run postgres database

docker run --name postgres-db-4 -e TZ=PRC -e POSTGRES_USER=root -e POSTGRES_DB=database -e POSTGRES_PASSWORD=Root123 -p 5432:5432 -v pgdata:/var/lib/postgresql/data --privileged -d postgres

#step_2:build application

docker build -t etl-app .

#step_3:run the application

docker run -i -p 8000:8000 etl-app

#step_4:trigger the ETL process

curl -X POST http://127.0.0.1:8000/etl

#step_5:you can use any SQL developer to connect the postgres database using configuration info below: 

Host: 127.0.0.1

Database: database

Username: root

Password: Root123

#step_6:after connected with SQL developer, you can get the table result by using the SQL query below:

SELECT 
    * 
FROM derived_features