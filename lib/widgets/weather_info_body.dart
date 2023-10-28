import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class Weather_Info_Body extends StatelessWidget {
  const Weather_Info_Body({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context ).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getThemeColor(weatherModel.weatherStatus),
          getThemeColor(weatherModel.weatherStatus)[300]!,
          getThemeColor(weatherModel.weatherStatus)[50]!,
        ],
          begin: Alignment.topCenter, end: Alignment.bottomCenter
        )
      ),
      child:Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                Column(
                children: [
                  Text(weatherModel.cityName,style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Text('Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',style: const TextStyle(fontSize: 20,)),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 5,),
                  Image.network("https:${weatherModel.image}"),
                  const SizedBox(width: 70,),
                  Text('${weatherModel.temp.round()}' ,style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  const SizedBox(width: 60,),
                  Column(
                    children: [
                      Text('maxTemp: ${weatherModel.maxTemp.round()}',style: const TextStyle(fontSize: 15,),),
                      Text('minTemp: ${weatherModel.minTemp.round()}',style: const TextStyle(fontSize: 15,),),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40,),
              Text(weatherModel.weatherStatus,style:const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      
    );
  }
}