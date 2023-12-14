
class InfoClima {
    InfoClima({
        required this.dt,
        required this.main,
        required this.weather,
        required this.clouds,
        required this.wind,
        required this.visibility,
        required this.pop,
        required this.sys,
        required this.dtTxt,
        this.rain,
    });

    int dt;
    MainClass main;
    List<Weather> weather;
    Clouds clouds;
    Wind wind;
    int visibility;
    double pop;
    Sys sys;
    String dtTxt;
    Rain? rain;

    factory InfoClima.fromJson(Map<String, dynamic> json) => InfoClima(
        dt: json["dt"],
        main: MainClass.fromJson(json["main"]),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: Clouds.fromJson(json["clouds"]),
        wind: Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"].toDouble(),
        sys: Sys.fromJson(json["sys"]),
        dtTxt: json["dt_txt"],
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
    );

   
}

class Clouds {
    Clouds({
        required this.all,
    });

    int all;

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

}

class MainClass {
    MainClass({
        required this.temp,
        required this.feelsLike,
        required this.tempMin,
        required this.tempMax,
        required this.pressure,
        required this.seaLevel,
        required this.grndLevel,
        required this.humidity,
        required this.tempKf,
    });

    double temp;
    double feelsLike;
    double tempMin;
    double tempMax;
    int pressure;
    int seaLevel;
    int grndLevel;
    int humidity;
    double tempKf;

    factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"].toDouble(),
    );

  
}

class Rain {
    Rain({
        required this.the3H,
    });

    double the3H;

    factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the3H: json["3h"].toDouble(),
    );
}

class Sys {
    Sys({
        this.pod,
    });

    String? pod;

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: json["pod"] ?? '',
    );


}


class Weather {
    Weather({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

    int id;
    String main;
    String? description;
    String icon;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"] ?? '',
        icon: json["icon"],
    );

}







class Wind {
    Wind({
        required this.speed,
        required this.deg,
        required this.gust,
    });

    double speed;
    int deg;
    double gust;

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
    );
}



class Coord {
    Coord({
        required this.lat,
        required this.lon,
    });

    double lat;
    double lon;

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
    );

}