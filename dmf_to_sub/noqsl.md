REPORT OF MODEL, IMPLEMENT AND QUERY A SELECTED NoSQL DATABASE (MONGODB)
Introduction:(MONGODB)
MongoDB is an open-source document database built on a horizontal scale-out architecture that uses a flexible schema for storing data. 
Founded in 2007, MongoDB has a worldwide following in the developer community.
Instead of storing data in tables of rows or columns like SQL databases, each record in a MongoDB database is a document described in BSON,
a binary representation of the data. Applications can then retrieve this information in a JSON format.Unlike SQL databases, where you must determine and declare a table's schema before inserting data,
MongoDB's collections, by default, do not require their documents to have the same schema. That is:The documents in a single collection do not need to have the same set of fields and the data type for a field can differ across documents within a collection.
To change the structure of the documents in a collection, such as add new fields, remove existing fields, or change the field values to a new type, update the documents to the new structure.
This flexibility facilitates the mapping of documents to an entity or an object. Each document can match the data fields of the represented entity, even if the document has substantial variation from other documents in the collection.
during practice in the assignment, however, the documents in a collection share a similar structure, and you can enforce document validation rules for a collection during update and insert operations
the essence of modeling was to change the database from sql to nosql database so that all the data will be in one collection and for the essence of the assignment a station/location was used which is "brislington depot station"
in nosql a table is called collection. Related information is stored together for fast query access through the MongoDB query language. 
MongoDB uses dynamic schemas, meaning that you can create records without first defining the structure, 
such as the fields or the types of their values. 
You can change the structure of records (which we call documents) simply by adding new fields or deleting existing ones. 
This data model give you the ability to represent hierarchical relationships, to store arrays, and other more complex structures easily. 
Documents in a collection need not have an identical set of fields and denormalization of data is common. 
MongoDB was also designed with high availability and scalability in mind, and includes out-of-the-box replication and auto-sharding.

Implementation:

mongodb was downloaded and installed, its was accessed by using git bash terminal and "mongosh" was used to lunch it. then the database was switched to the pre loaded database which was "pollutiondb-2" using this function
``````
use pollutiondb-2
``````
MongoDB groups data through collections. A collection is simply a grouping of documents that have the same or a similar purpose. A collection acts similarly to a table in a traditional SQL database. However, it has a major difference: In MongoDB, a collection is 
not enforced by a strict schema. Instead, documents in a collection can have a slightly different structure from one another, as needed. This reduces the need to break items in a document into several different tables, as is often done in SQL implementations. 
A collection that contains all the information of the station was created by importing a particular station in this case "Brislington depot with locationid 203" was used and a one to many relationship was showed in this, because the location has many readings
``````
pollutiondb-2> db.createCollection("BrislingtonDepot");
``````

An  SQL query was written to import the "brisliginton depot" and file was exported and saved as a JSON file. attached here is the SQL query used and it was limited to the first 100 by using the limit 100 function.
````
SELECT * from reading r where locationid = 203 limit 100
`````

The information pertaining to location 203 was imported on the mongodb as a JASON file (exported above) using a different terminal attached here is the used in the importation:
``````
./mongoimport.exe--jsonArray - dbNAme -c Collection name jsonfilename.jason i.e
./mongoimport.exe--jsonArray -d pollutiondb-2 -c BrislingtonDepot.json
``````
Attached here is the output of the json file importation to mongo
$ ./mongoimport.exe --jsonArray -d pollutiondb-2 -c BrislingtonDepot Brislington.json
2022-05-04T15:31:15.736+0100    connected to: mongodb://localhost/
2022-05-04T15:31:15.755+0100    1 document(s) imported successfully. 0 document(s) fa
this formed as the collection we needed to carry out the required task

mongodb tools was downloaded for accessibility of the information on the database such as:
show collection: this command below displays how to show collections
``````
pollutiondb-2> show collections
``````
this is the output of the command:

Brislinghthon
Brislinghton
BrislingtonDepot
location
reading
readings
street

find function
The find function was also implemented to find information i have saved on my database
``````
db.BrislingtonDepot.find() 
``````

attached here is the sample of the output:
``````
pollutiondb-2> db.BrislingtonDepot.find()
``````
[
  {
    _id: ObjectId("62728e335c1464f91dae2c2c"),
    name: 'Brislington Depot',
    id: 203,
    geo_point: '51.484848484,585858585',
    readings: [
      {
        id: 7,
        nox: 26,
        no2: 16.5,
        locationid: 203,
        datetime: '2014-08-21T20:00:00+00:00',
        pm10: 0,
        nvpm10: 0,
        vpm10: 0,
        nvpm25: 0,
        vpm25: 0,
        co: 0,
        o3: 0,
        so2: 0,
        temperature: 0,
        rh: 0,
        airpressure: 0,
        datestart: '',
        date_end: '2001-01-01T00:00:00+00:00',
        current: 1,
        instrument_type: 'Continuous (Reference)',
        pm25: 0,
        no: 6.25
      },
      {
        id: 28,
        nox: 44.5,
        no2: 26.25,
        locationid: 203,
        datetime: '2014-08-21T01:00:00+00:00',
        pm10: 0,
        nvpm10: 0,
        vpm10: 0,
        nvpm25: 0,
        vpm25: 0,
        co: 0,
        o3: 0,
        so2: 0,
        temperature: 0,
        rh: 0,
        airpressure: 0,
        datestart: '',
        date_end: '2001-01-01T00:00:00+00:00',
        current: 1,
        instrument_type: 'Continuous (Reference)',
        pm25: 0,
        no: 12.25
      },
      {
        id: 30,
        nox: 49.75,
        no2: 28.25,
        locationid: 203,
        datetime: '2014-08-21T00:00:00+00:00',
        pm10: 0,
        nvpm10: 0,
        vpm10: 0,
        nvpm25: 0,
        vpm25: 0,
        co: 0,
        o3: 0,
        so2: 0,
        temperature: 0,
        rh: 0,
        airpressure: 0,
        datestart: '',
        date_end: '2001-01-01T00:00:00+00:00',
        current: 1,
        instrument_type: 'Continuous (Reference)',
        pm25: 0,
        no: 14.25
      },
      {
        id: 53,
        nox: 0,
        no2: 0,
        locationid: 203,
        datetime: '2014-08-19T09:00:00+00:00',
        pm10: 0,
        nvpm10: 0,
        vpm10: 0,
        nvpm25: 0,
        vpm25: 0,
        co: 0,
        o3: 0,
        so2: 0,
        temperature: 0,
        rh: 0,
        airpressure: 0,
        datestart: '',
        date_end: '2001-01-01T00:00:00+00:00',
        current: 1,
        instrument_type: 'Continuous (Reference)',
        pm25: 0,
        no: 0
      },

Example of the output above is what is referred to as a document in NoSQL.A document is a representation of a single entity of data in the MongoDB database. A collection consists of one or more related objects. A major difference exists between MongoDB and SQL, in that documents are different from rows. Row data is flat, 
with one column for each value in the row. However, in MongoDB, documents can contain embedded subdocuments, providing a much closer inherent data model to your applications. In fact, the records in MongoDB that represent documents are stored as BSON, a lightweight binary form of JSON. It uses field:value pairs that correspond to JavaScript property:value pairs that define the values stored in the document. 
Little translation is necessary to convert MongoDB records back into JSON strings that you might be using in your application.
