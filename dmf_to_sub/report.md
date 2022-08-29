A REFLECTIVE REPORT ON THE ASSIGNMENT.
libraries/tools downloaded includes;
-> pandas
-> mariadb
->XAMPP
-> mongodb
-> mongodb tools
-> SQL workbench

Each and every task had it own unique problems and as such individualized solution were provided, this is briefly explained below with few codes which was used. 
The assignment was started by downloading it from BB
and saved in a working directory created mainly for the assignment. its contained a csv file of bristol air quality data.
Pycharm was the selected working bench i chose to solve my assignment so i downloaded the installer and installed it on my machine and saved it where it can easily be accessed.
using the pycharm, a project was created to contain all the files for each number of the assignment so that i have my files saved in the same working direction for easily accessibility and prevention of data loss in transit.
new file creation was done by using the file tool present and prescribed names was given to each file.
-> crop file.
the file was created to solve the first problem in the assignment.
i downloaded the csv file attached to the assignment
i imported panda library for reading the csv file provided in the assignment and the csv file was read using this code
````
air_data = pd.read_csv("bristol-air-quality-data.csv",  sep=";")
````
the file was cropped to remove data before 01/01/2010 and the code was used
``````
df = air_data.loc[air_data["Date Time"] >= "2010-01-01"].index
a = air_data.loc[df]
print(len(a))
``````
-> clean.py file
pandas was imported and used to read crop.csv file generated above and "," was used as the separator in the imported csv file 
````
new_data = pd.read_csv("crop.csv", sep=";")
````
a list of dictionary was created to show the right station with street ID and street name
``````
street = [{}]
``````
subsequently, the new dataframe was Filtered and  dud records where there is no value for SiteID or there is a mismatch between SiteID and Location were removed looping through using this code
````````new_list = []
for lines, row in new_data.iterrows():
    if not any(street['street_name'] == row.Location
               and street["street_id"] == row.SiteID for street in street):
        print(lines+2, row.Location, row.SiteID)
    else:
        new_list.append(row)
new_df = pd.DataFrame(new_list)
new_df.to_csv('clean.csv', sep=";", index=False)
print(len(new_df ))
````````

-> SQL work bench
SQL workbench was downloaded and installed  on my machine, this was used to draw an ER diagram which shows the relationship between the readings table and the locationentity table, it also contains a schema which does not share any relationship with either of the table
once it was lunched, a new model was created and diagram was added, table option was selected for the creation of reading, locationentity and schema tables.
the information provided in the assignment was inputed into each entities of the appropriate tables and a foreign key was created to show the relationship that exsisted within the entities.
A forward engineering was done by clicking on file, then export, then forward engineering and the prompt was followed until a SQL scripted was generated and the diagram was exported as a png image/file. The forward Engineering generated an SQL file(pollution.sql), this forms a database that contains all the information each of the tables/entites holds
-> XAMPP
XAMPP installer was downloaded and installed on my machine which served as a localhost server for SQL database and this was used as the route 
to access the databased which had been created on  SQL during the forward engineering. the SQL showed all the information
as tables which consist of rows and columns.

->populate.py
A python code which uses loop function was written to create the schema, readings and locationentity on the pollution-db2 database in SQL. cursor function was excuted to  allows the processing of  individual row returned by a query.Mariadb was used as the connector to the database and this code was used to connect
``````
conn = mariadb.connect
cur.execute(create_database)
``````
-> insert-100.py
-> SQL query
An SQL query was written to Return the date/time, station name and the highest recorded value of nitrogen oxide (NOx) found in the dataset for the year 2019
attached here is the query used:
````
SELECT `datetime`, locationentity.name, `NOx` FROM reading,locationentity
WHERE NOx = (SELECT max(NOx) FROM reading WHERE`datetime` >= '2019-01-01' and `datetime` <='2019-12-31')and locationentity.idlocation_entity = reading.locationid;
````
also another query was written to Return the mean values of PM25 (particulate matter <2.5 micron diameter) & VPM2.5 (volatile particulate matter <2.5 micron diameter) by each station for the year 2019 for readings taken on or near 08:00 hours (peak traffic intensity).
attached here is the query used:
````````
SELECT locationentity.name, AVG(`reading`.vpm25), AVG(`reading`.pm25) from reading, locationentity where reading.locationid= locationentity.idlocation_entity and year(`reading`.`datetime`) = '2019' and reading.`datetime` LIKE '%08:00:00+00:00' GROUP BY locationentity.name
````````
in conclusion, a query was also written to Extend the previous query to show these values for all stations in the years 2010 to 2019.
attached here is the query used:
````
SELECT locationentity.name, AVG(`reading`.vpm25), AVG(`reading`.pm25) from reading, locationentity where reading.locationid = locationentity.idlocation_entity and year(`reading`.`datetime`) >= '2010-01-01' 
and year(`reading`.`datetime`) <= '2019-12-31' 
and reading.`datetime` LIKE '%08:00:00+00:00' GROUP BY locationentity.name;
````
-> mongodb
This data model give you the ability to represent hierarchical relationships, to store arrays, and other more complex structures easily. 
Documents in a collection need not have an identical set of fields and denormalization of data is common. 
MongoDB was also designed with high availability and scalability in mind, and includes out-of-the-box replication and auto-sharding.

learning outcome:
this assignment has prepared me for the task ahead of me as a data scientist because the question is a prototype of the kind of problem i would be facing on daily basis as a data scientist. it has shapen my mind and broaden my understanding as a data scientist.
this has helped me to practicalize theory which i have learnt in the course of my study because this was not limited to data management fundamentals rather it cut across all other areas of my study. it did encourage me to utilized all i have learnt so far 
and to also read/research beyond what i was taught within the walls of the classroom. so many part of the assignment was new to me but i was able to navigate through it by explore reading materials such as linkedin learning made available for student.
with the completion of this assignment i am inspired to start applying for job as a data scientist because i believe this has set a good foundation for me to build on during the course of my profession.this has given me enough confidence that i am ready for 
the task ahead me as a data scientist.
I AM INDEED GRATEFUL TO MY TUTOR!!!!!!!!!!!!!!