// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CurrentWeather  welcomeFromJson(String str) => CurrentWeather .fromJson(json.decode(str));

String welcomeToJson(CurrentWeather  data) => json.encode(data.toJson());

class CurrentWeather {
    CurrentWeather ({
        this.coord,
        this.weather,
        this.base,
        this.main,
        this.visibility,
        this.wind,
        this.rain,
        this.clouds,
        this.dt,
        this.sys,
        this.timezone,
        this.id,
        this.name,
        this.cod,
    });

    Coord coord;
    List<Weather> weather;
    String base;
    Main main;
    int visibility;
    Wind wind;
    Rain rain;
    Clouds clouds;
    int dt;
    Sys sys;
    int timezone;
    int id;
    String name;
    int cod;

    factory CurrentWeather .fromJson(Map<String, dynamic> json) => CurrentWeather(
        coord: Coord.fromJson(json["coord"]),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"],
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        rain: Rain.fromJson(json["rain"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
    );

    Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "rain": rain.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
    };
}

class Clouds {
    Clouds({
        this.all,
    });

    int all;

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class Coord {
    Coord({
        this.lon,
        this.lat,
    });

    var lon;
    var lat;

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"],
        lat: json["lat"],
    );

    Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
    };
}

class Main {
    Main({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.humidity,
    });

    var temp;
    var feelsLike;
    var tempMin;
    var tempMax;
    int pressure;
    int humidity;

    factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"],
        tempMin: json["temp_min"],
        tempMax: json["temp_max"],
        pressure: json["pressure"],
        humidity: json["humidity"],
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
    };
}

class Rain {
    Rain({
        this.the1H,
    });

    var the1H;

    factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"],
    );

    Map<String, dynamic> toJson() => {
        "1h": the1H,
    };
}

class Sys {
    Sys({
        this.type,
        this.id,
        this.country,
        this.sunrise,
        this.sunset,
    });

    int type;
    int id;
    String country;
    int sunrise;
    int sunset;

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"],
        id: json["id"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class Weather {
    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    int id;
    String main;
    String description;
    String icon;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}

class Wind {
    Wind({
        this.speed,
        this.deg,
        this.gust,
    });

    var speed;
    int deg;
    var gust;

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"],
        deg: json["deg"],
        gust: json["gust"],
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
    };
}
