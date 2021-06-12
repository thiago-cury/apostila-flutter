import 'forecast.dart';

class Temperature {

  String? cityName;
  int? temperature;
  String? description;
  String? windSpeedy;
  String? conditionSlug;
  String? date;
  List<Forecast>? forecasts;

  Temperature();

  Temperature.fromMap(Map<String, dynamic> map) {
    this.cityName = map['city'];
    this.temperature = map['temp'];
    this.description = map['description'];
    this.windSpeedy = map['wind_speedy'];
    this.conditionSlug = map['condition_slug'];
    this.date = map['date'] as String?;

    List<dynamic> forecasts = map['forecast'];
    this.forecasts = forecasts.map((element) => Forecast.fromMap(element)).toList();

  }

  @override
  String toString() {
    return 'Temperature{cityName: $cityName, temperature: $temperature, description: $description, windSpeedy: $windSpeedy, conditionSlug: $conditionSlug, forecasts: $forecasts}';
  }

  //https://console.hgbrasil.com/documentation/weather/condition_slugs

  dynamic getIconCondition() {
    switch(this.conditionSlug) {
      case 'storm': return 'images/storm.svg';
      case 'hail': return 'images/hail.svg';
      case 'rain': return 'images/rain.svg';
      case 'clear_day': return 'images/clear_day.svg';
      case 'cloudly_day': return 'images/cloudly_day.svg';
      default: return 'images/cloudly_day.svg';
    }
  }

  String getCondition() {
    switch(this.conditionSlug) {
      case 'storm': return 'tempestade';
      case 'snow': return 'neve';
      case 'hail': return 'granizo';
      case 'rain': return 'chuva';
      case 'fog': return 'neblina';
      case 'clear_day': return 'dia limpo';
      case 'clear_night': return 'noite limpa';
      case 'cloud': return 'nublado';
      case 'cloudly_day': return 'nublado de dia';
      case 'cloudly_night': return 'nublado de noite';
      case 'none_day': return 'erro ao obter mas está de dia';
      case 'none_night': return 'erro ao obter mas está de noite';
      default: return '';
    }
  }

/*
  condition slug list
  storm - tempestade
  snow - neve
  hail - granizo
  rain - chuva
  fog - neblina
  clear_day - dia limpo
  clear_night - noite limpa
  cloud - nublado
  cloudly_day - nublado de dia
  cloudly_night - nublado de noite
  none_day - erro ao obter mas está de dia
  none_night - erro ao obter mas está de noite
  */

}

/*
* {"by":"woeid","valid_key":false,
* "results":
* {"temp":17,
* date":"2021-06-12",
* "time":"14:17",
* "condition_code":"27",
* "description":"Night Mostly cloudy",
* "currently":"day",
* "cid":"",
* "city":"Porto Alegre, RS",
* "img_id":"27",
* "humidity":49,
* "wind_speedy":"0.89 km/h",
* "sunrise":"07:17 am","sunset":"05:31 pm","condition_slug":"clear_day",
* "city_name":"Porto Alegre","forecast":[{"date":"12/06","weekday":"Sáb","max":17,"min":8,"description":"Tempo limpo","condition":"clear_day"},{"date":"13/06","weekday":"Dom","max":19,"min":10,"description":"Tempo limpo","condition":"clear_day"},{"date":"14/06","weekday":"Seg","max":21,"min":11,"description":"Tempo limpo","condition":"clear_day"},{"date":"15/06","weekday":"Ter","max":14,"min":12,"description":"Chuvas esparsas","condition":"rain"},{"date":"16/06","weekday":"Qua","max":14,"min":11,"description":"Tempo nublado","condition":"cloudly_day"},{"date":"17/06","weekday":"Qui","max":14,"min":10,"description":"Tempo nublado","condition":"cloudly_day"},{"date":"18/06","weekday":"Sex","max":13,"min":11,"description":"Chuva","condition":"rain"},{"date":"19/06","weekday":"Sáb","max":13,"min":12,"description":"Chuva","condition":"rain"},{"date":"20/06","weekday":"Dom","max":15,"min":11,"description":"Chuvas esparsas","condition":"rain"},{"date":"21/06","weekday":"Seg","max":17,"min":10,"description":"Chuvas esparsas","condition":"rain"}]},"execution_time":0.28,"from_cache":false}
* */