import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubites/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class Home_View extends StatefulWidget {
  const Home_View({super.key});

  @override
  State<Home_View> createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () async {
                final weatherModel = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Search_view()),
                );
                if (weatherModel != null) {
                  // Handle the weather data and update the UI
                  // You can display the weather information in the Home_View.
                  // For example, you can show the weather information in a Text widget.
                  print(
                      "Weather Data: ${weatherModel.cityName}, ${weatherModel.temp}");
                }
                //log(weatherModel.cityName);
              },
              icon: const Icon(Icons.search),
            ),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder:(context, State ){
            if(State is NoWeatherState){
              return No_Weather_Body();
            }else if(State is WeatherLoadedState){
              return Weather_Info_Body(
                weather: State.weatherModel,
              );
            }else{
              return const Text('Ops there is an error');
            }
            
          },
      ),
    );
  }
}
