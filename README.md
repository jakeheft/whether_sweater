# Whether to Sweater?

## About this Application
Whether to Sweater? is an app that allows a registered user to plan for a road trip giving them trip time and weather details. The app checks drive time (consuming MapQuest's API) of a trip and uses that time/destination city to provide the weather upon arrival (consuming OpenWeather's API), exposing this data to the front end. This back-end application was built based on (fictional) front end requirements.

## Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs Front End development team
- Research, select, and consume an API based on your needs as a developer
- Work under a deadline - I had 5 days to build this application from scratch
- Continue to improve strong testing practices

## Setup
Prerequisites:
- Ruby 2.5.3
- Rails 5.2.4.4

To use to this app, you will need 3 different API keys:
- [MapQuest](https://developer.mapquest.com)
- [OpenWeather](https://openweathermap.org/appid)
- [Unsplash](https://unsplash.com/developers)
  * Unsplash will grant you a demo key (50 calls per hour) for an app in development. To apply for a production key, which will grant you 5,000 calls per hour, submit a screenshot of a photo on the app that has been properly attributed to Unsplash and the photographer.

- Clone down this repo, then `cd` into the repo
- Run `$ bundle install`
- Run `$ rails db:{create,migrate}`
- Run `$ figaro install`
- Inside your `config` folder add your 3 API keys to the `application.yml` file (created by Figaro) in the following manner:
```
UNSPLASH_API_KEY: <your API key>
MAPQUEST_API_KEY: <your API key>
OPENWEATHER_API_KEY: <your API key>
```
- Run `rails s` and use an API interface tool (such as [Postman](https://www.postman.com/)) to interact with the app, using the endpoints below.  
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/6fcbe32882faad889b73)

## Endpoints
#### Forecast Request
Use this endpoint to request forecast data for a city. Current, daily (5 days), and hourly (8 hours) weather data provided.
```
GET '/api/v1/forecast?location=<enter city & state/country (e.g denver,co)>
Content-Type: application/json
Accept: application/json
```
Example Forecast Response
```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "date_time": "2021-01-18 09:47:23 -0700",
                "sunrise": "2021-01-18 07:17:38 -0700",
                "sunset": "2021-01-18 17:02:55 -0700",
                "temp": 34.07,
                "feels_like": 25.92,
                "humidity": 61,
                "uvi": 1.23,
                "visibility": 10000,
                "conditions": "scattered clouds",
                "icon": "03d"
            },
            "daily_weather": [
                {
                    "date": "2021-01-18",
                    "sunrise": "2021-01-18 07:17:38 -0700",
                    "sunset": "2021-01-18 17:02:55 -0700",
                    "max_temp": 42.03,
                    "min_temp": 28.45,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
              ...
            ],
            "hourly_weather": [
                {
                    "time": "09:00",
                    "temp": 34.07,
                    "wind_speed": "5.97 mph",
                    "wind_direction": "from SSE",
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
              ...
            ]
        }
    }
}
```
#### Background Image Request
The front-end has requested a background image to display a city's weather over. Use this endpoint to find an image (provided by Unsplash) of a city by entering the city into the location parameters.
```
GET '/api/v1/backgrounds?location=<enter city & state/country (e.g denver,co)>
Content-Type: application/json
Accept: application/json
```
Example Background Image Response
```
{
  "data": {
    "id": null,
    "type": "images",
    "attributes": {
      "location": "ames,ia",
      "image_url": "https://images.unsplash.com/photo-1558220572-03669f15deb9?ixid=MXwxOTg5MTl8MHwxfHNlYXJjaHwxfHxsb2NhdGlvbjolMjBhbWVzLGlhfGVufDB8fHw&ixlib=rb-1.2.1",
      "photographer": "Akash Dutta",
      "photographer_url": "https://unsplash.com/@akashd91",
      "site_credit": "Image from Unsplash"
    }
  }
}
```
#### User Registration Request
Use this endpoint to register a new user by sending a JSON payload through the body of the request. An API key will be generated upon login.
```
POST '/api/v1/users'
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
Example Successful Registration Response:
```
{
  "data": {
    "id": null,
    "type": "users",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "61Se811f2-03fa-4rdf-b95a-e5290a6719"
    }
  }
}
```

#### User Login Request
Use this endpoint to log in a user by sending a JSON payload through the body of the request. Their email and API key will be returned in the response.
```
POST '/api/v1/sessions'
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
```
Example Successful Login Response:
```
{
  "data": {
    "id": null,
    "type": "users",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "61Se811f2-03fa-4rdf-b95a-e5290a6719"
    }
  }
}
```

#### Road Trip Request
Use this endpoint to generate trip details by sending a JSON payload through the body of the request. Submit an origin city and a destination city with a valid API key to get total travel time as well as the weather forecast at the time of arrival in your destination city.
```
POST '/api/v1/road_trip'
Content-Type: application/json
Accept: application/json

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "kdsluw09Df0sdfjJ"
}
```
Example Successful Road Trip Response:
```
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Pueblo, CO",
      "travel_time": "1 hours, 48 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "light rain"
      }
    }
  }
}
```
