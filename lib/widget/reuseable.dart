
import 'package:flutter/material.dart';
import 'package:weather/model/WeatherData.dart';

// class ReuseAble extends StatelessWidget {
//    WeatherData? weatherData;
//    String dateformate;
//    String timeformate;
//   ReuseAble({required this.weatherData,required this.dateformate,required this.timeformate});
//
//   @override
//   Widget build(BuildContext context) {
//     final size= MediaQuery.of(context).size;
//     return Column(
//       children: [
//
//       Text(timeformate),
//       Text(dateformate) ,
//       SizedBox(
//         height: size.height/17,
//       ),
//         // Container(
//         //   height: size.height/3,
//         //   child: Image.asset('images/assets/weather.jpg'),
//         // ),
//         Container(
//           height: size.height/3,
//           decoration: BoxDecoration(
//             color: Colors.blueGrey,
//             borderRadius: BorderRadius.circular(10)
//           ),
//         ),
//         if(weatherData !=null)Text(weatherData!.name.toString(),
//           style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
//         if(weatherData !=null)  Text(
//           '${weatherData!.temperature.current.toStringAsFixed(2)}°C',
//           style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
//
//
//       ],
//     );
//   }
// }
