
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/get_weather_cubit/get_weather_cubit.dart';


class Search_view extends StatelessWidget {
  const Search_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 50),
        child: Center(
          child: TextField(
            onSubmitted: (value) async{
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            strutStyle: const StrutStyle(
              height: 2.5,
            ),
            decoration: InputDecoration(
              hintText: 'Enter city name',
              labelText: "Search",
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }
}
