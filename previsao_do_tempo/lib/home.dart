import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:previsao_do_tempo/temperature.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'forecast.dart';

class Home extends StatefulWidget {

  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {

  //https://api.hgbrasil.com/weather?woeid=455823
  Temperature _temperature = Temperature();
  bool _circularProgress = false;

  _listForecast(Forecast forecast) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('${forecast.weekDay}', style: TextStyle(fontSize: 16, color: Colors.white),),
        SizedBox(height: 5,),
        SvgPicture.asset(forecast.getIconCondition()),
        SizedBox(height: 5,),
        Text('${forecast.max}º', style: TextStyle(fontSize: 16, color: Colors.white),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100,),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(_temperature.cityName ?? '', style: TextStyle(fontSize: 26, color: Colors.white),),
          ),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(_temperature.date ?? '', style: TextStyle(fontSize: 16, color: Colors.white),),
          ),

          Padding(
              padding: EdgeInsets.all(10.0),
              child: _temperature.cityName == null ? Text('') : SvgPicture.asset(_temperature.getIconCondition(), width: 100, height: 100,),
          ),

          Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('${_temperature.temperature ?? ''}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 100, color: Colors.white),),
          ),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(_temperature.getCondition() ?? '', style: TextStyle(fontSize: 20, color: Colors.white),),
          ),

          Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(_temperature.windSpeedy ?? '', style: TextStyle(fontSize: 20, color: Colors.white),),
          ),

          _circularProgress ? Center(child: CircularProgressIndicator(),) : Container(),

          _temperature.cityName == null ? Text('') : Expanded(
              flex: 1,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _temperature.forecasts?.length,
                  itemBuilder: (BuildContext context, int index) {
                      return _listForecast(_temperature.forecasts![index]);
                  }
              ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print('clicou');
          await _fetchConditionWeek(context);
        },
        child: Icon(Icons.ac_unit),
      ),
    );
  }

  _fetchConditionWeek(BuildContext context) {
    print('vai buscar a condição');
    setState(() {
      _circularProgress = true;
    });
                          //domínio            //endpoint   //query - consulta
    final url = Uri.https('api.hgbrasil.com', '/weather', {'woeid': '455823'});

    http.get(url).then((response) {
      if(response.statusCode == 200) { //Ok
        print('tudo OK');
        var jsonResponse = convert.jsonDecode(response.body);
        print('dados que a API retornou: ${jsonResponse}');
        setState(() {
          _temperature = Temperature.fromMap(jsonResponse['results']);
          _circularProgress = false;
        });
        print('valores convertidos ->> ${_temperature.toString()}');
      } else {
        print('Algo deu errado -> ${response.statusCode}');
        setState(() {
          _circularProgress = false;
        });
      }
    }).catchError((error) {
      print('Algum erro ocorreu! ${error.toString()}');
      setState(() {
        _circularProgress = false;
      });
    });
  }

}
