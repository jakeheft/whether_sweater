# Whether to Sweater or not in this Weather

## About this Application

## Setup
To use to this app, you will need 3 different API keys:
- [MapQuest](https://developer.mapquest.com)
- [OpenWeather](https://openweathermap.org/appid)
- [Unsplash](https://unsplash.com/developers)
  * Unsplash will grant you a demo key (50 calls per hour) for an app in development. To apply for a production key, which will grant you 5,000 calls per hour, submit a screenshot of a photo on the app that has been properly attributed to Unsplash and the photographer.

- Run `$ figaro install`
- Add your 3 API keys to the `application.yml` file that Figaro creates in the following manner:
```
UNSPLASH_API_KEY: <API key>
MAPQUEST_API_KEY: <API key>
OPENWEATHER_API_KEY: <API key>
```

## Endpoints
#### Forecast Request
```
GET '/api/v1/forecast?location=<enter city & state/country (e.g denver,co)>
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
```
GET '/api/v1/backgrounds?location=<enter city & state/country (e.g denver,co)>
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

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
