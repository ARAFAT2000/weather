import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weather/model/WeatherData.dart';


class AppServices{

  fetchWeather()async{
    final response= await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?lat=25.7494&lon=89.2611&appid=0c3293277b9fcc6b4374874a5d8ba30b'));
    try{
      if(response.statusCode==200){
        var data=jsonDecode(response.body);
        print(response.body);
        return WeatherData.fromJson(data);

      }else{
        throw Exception();
      }

    }catch(e){
      print(e);
    }


  }
  
}

