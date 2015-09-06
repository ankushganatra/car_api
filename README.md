# Cars API


As an extension to our current backend infrastructure, we decided to create a car-sharing API to help us to show the best options around an user’s position.

In order to show cars on a map, all we need is a name, description and position of the vehicle. And it is up to the api to organize different data sources and provide a single response via an endpoint.

## Instructions

In this exercise, your job is to build a simple API/webservice that expose one single endpoint called `/cars` that receives a GET with the location parameter as the example below:

GET /cars?location=51.5444204,-0.22707

This endpoint should fetch the 10 closest cars from the database and return them ordered by distance from the point receive. See the following snippet of a valid response:

````json
{
    "cars": [
      {
        "description": "West Ealing - Hartington Rd",
        "latitude": 51.511318,
        "longitude": -0.318178
      },
      {
        "description": "Sudbury - Williams Way",
        "latitude": 51.553667,
        "longitude": -0.315159
      },
      {
        "description": "West Ealing - St Leonard’s Rd",
        "latitude": 51.512107,
        "longitude": -0.313599
      }
    ]
}
````

- You can use the file `data.json` as seed for your database
- We suggest you to save this content in a database, so you can sort and filter them easily.
- The endpoint should return the correct status codes for a success request and a failed one.
- Use this repository to build your solution.
- The solution should perform well regardless of the number of records
- Don't forget the instructions for testing and running the code.



Running the code: 

Setting up DB: 

For the technology stack: MongoDB, Sinatra are used to implement the solution. You can update the MongoDB URL from config/environment.rb under the 'development','production' section. 


Run the app: 

Once you do bundle install, you can run the application by command `rackup config.ru` or `shotgun config.ru`

DB Seed: 
Assuming the app is running on localhost:9393, you can seed the data with following commnad executed on other terminal

thor db_seed:dump_json "http://localhost:9393/public/data.json"



Testing Result: 
Once the data is inserted in DB you can verify results from below URL 

http://localhost:9393/cars?location=51.5444204,-0.22707

(Again this is assuming you are running the application in local at port 9393)