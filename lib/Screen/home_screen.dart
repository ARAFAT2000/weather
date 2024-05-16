
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/Services/app_services.dart';
import 'package:weather/model/WeatherData.dart';
import 'package:weather/widget/reuseable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherData ? weatherinfo;

  myWeather(){
    AppServices().fetchWeather().then((value){
      setState(() {
        weatherinfo=value;
        print('afdasd');
      });
    });
  }
  @override
  void initState() {
    myWeather();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String dateformate=DateFormat('EEEE d,MMMM yyyy').format(DateTime.now());
    String timeformate=DateFormat('hh:mm a').format(DateTime.now());
    return SafeArea(
      child: Scaffold(
       
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
            child: Column(
              children: [
                Center(child: ReuseAble(
                  weatherData: weatherinfo,
                  dateformate: dateformate,
                  timeformate: timeformate,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ReuseAble extends StatelessWidget {
  WeatherData? weatherData;
  String dateformate;
  String timeformate;
  ReuseAble({required this.weatherData,
    required this.dateformate,
    required this.timeformate});

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Column(
      children: [
        if(weatherData != null) Text(weatherData!.name.toString(),
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
        Text(weatherData != null?
        '${weatherData!.temperature.current.toStringAsFixed(2)}°C': null.toString() ,
          style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
        Text(timeformate),
        Text(dateformate) ,
        SizedBox(
          height: size.height/17,
        ),
        Container(
          height: size.height/3,
          child: Image.asset('images/assets/weather.jpg'),
        ),
        Container(
          height: size.height/4,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12,right: 12,top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherCard('Wind', weatherData!.wind.speed.toStringAsFixed(2), Icons.wind_power),
                    WeatherCard('Min', weatherData!.minTemperature.toStringAsFixed(2), Icons.sunny_snowing),
                    WeatherCard('Max', weatherData!.maxTemperature.toStringAsFixed(2), Icons.sunny),
                  ],
                ),
              ),
              SizedBox(height: size.height/40,),
              Divider(thickness: 2,color: Colors.white,),
              Padding(
                padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherCard('Humadity', weatherData!.humidity.toStringAsFixed(2), Icons.wind_power),
                    WeatherCard('Pressure', weatherData!.pressure.toStringAsFixed(2), Icons.sunny_snowing),
                    WeatherCard('Sea Level', weatherData!.seaLevel.toStringAsFixed(2), Icons.sunny),
                  ],
                ),
              ),
            ],
          ),
        ),

//if(weatherData !=null)

      ],
    );
  }

  Column WeatherCard(String title,String value, icon) {
    return Column(
                  children: [
                    Icon(icon),
                    Text(value),
                    Text(title)
                  ],
                );
  }
}