import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubites/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child:  Builder(
        builder: (context) =>
          BlocBuilder<GetWeatherCubit, WeatherState>(
            builder:(context, state) {
              return  MaterialApp(
            theme: ThemeData(
              primarySwatch: getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherStatus
              )
            ),
            debugShowCheckedModeBanner: false,
            home: const Home_View(),
              );
            },
          )
      )
    );
  }
}

MaterialColor getThemeColor(String? condition){
  condition = condition?.toLowerCase();
  if(condition == null){
    return Colors.blue;
  }
    switch (condition) {
      case 'sunny':
      case 'clear':
        return Colors.orange;
      case 'partly cloudy':
      case 'cloudy':
      case 'overcast':
      case 'mist':
        return Colors.grey;
      case 'patchy rain possible':
      case 'patchy snow possible':
      case 'patchy sleet possible':
      case 'patchy freezing drizzle possible':
      case 'blowing snow':
      case 'blizzard':
      case 'patchy light snow':
      case 'light snow':
      case 'patchy moderate snow':
      case 'moderate snow':
      case 'patchy heavy snow':
      case 'heavy snow':
      case 'ice pellets':
      case 'light sleet showers':
      case 'moderate or heavy sleet showers':
      case 'moderate rain':
      case 'light snow showers':
      case 'moderate or heavy snow showers':
      case 'light showers of ice pellets':
      case 'moderate or heavy showers of ice pellets':
        return Colors.lightBlue;
      case 'thundery outbreaks possible':
      case 'patchy light rain with thunder':
      case 'moderate or heavy rain with thunder':
      case 'patchy light snow with thunder':
      case 'moderate or heavy snow with thunder':
        return Colors.yellow;
      default:
        return Colors.blue; // Default color for unknown conditions
    }
  }




