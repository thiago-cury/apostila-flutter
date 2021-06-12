
class Forecast {

  String? date;
  String? weekDay;
  int? max;
  int? min;
  String? description;
  String? condition;

  Forecast();

  Forecast.fromMap(Map<String, dynamic> map) {
    this.date = map['date'];
    this.weekDay = map['weekday'];
    this.max = map['max'];
    this.min = map['min'];
    this.description = map['description'];
    this.condition = map['condition'];
  }

  @override
  String toString() {
    return 'Forecast{date: $date, weekDay: $weekDay, max: $max, min: $min, description: $description, condition: $condition}';
  }

  dynamic getIconCondition() {
    switch(this.condition) {
      case 'storm': return 'images/storm.svg';
      case 'hail': return 'images/hail.svg';
      case 'rain': return 'images/rain.svg';
      case 'clear_day': return 'images/clear_day.svg';
      case 'cloudly_day': return 'images/cloudly_day.svg';
      default: return 'images/cloudly_day.svg';
    }
  }

}

/*
"forecast": [
  {"date":"12/06","weekday":"Sáb","max":17,"min":8,"description":"Tempo limpo","condition":"clear_day"},
  {"date":"13/06","weekday":"Dom","max":19,"min":10,"description":"Tempo limpo","condition":"clear_day"},
  {"date":"14/06","weekday":"Seg","max":21,"min":11,"description":"Tempo limpo","condition":"clear_day"},
  {"date":"15/06","weekday":"Ter","max":14,"min":12,"description":"Chuvas esparsas","condition":"rain"},
  {"date":"16/06","weekday":"Qua","max":14,"min":11,"description":"Tempo nublado","condition":"cloudly_day"},
  {"date":"17/06","weekday":"Qui","max":14,"min":10,"description":"Tempo nublado","condition":"cloudly_day"},
  {"date":"18/06","weekday":"Sex","max":13,"min":11,"description":"Chuva","condition":"rain"},
  {"date":"19/06","weekday":"Sáb","max":13,"min":12,"description":"Chuva","condition":"rain"},
  {"date":"20/06","weekday":"Dom","max":15,"min":11,"description":"Chuvas esparsas","condition":"rain"},
  {"date":"21/06","weekday":"Seg","max":17,"min":10,"description":"Chuvas esparsas","condition":"rain"}
]
},"execution_time":0.28,"from_cache":false}
 */