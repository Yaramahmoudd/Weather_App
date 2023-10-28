import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseURL = "https://api.weatherapi.com/v1";
  final String apiKey = "be84ef27796c41aab6c230238232010";
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1");
        WeatherModel weatherModel = WeatherModel.fromJson(response.data);
        return weatherModel;
    } on DioException catch (e) {
      final String errmessage = e.response?.data['error']['message']??'ops there was an error, try later';
      throw Exception(errmessage);
    } catch(e){
      log(e.toString());
      throw Exception('ops there was an error, try later');
    }
  }
}
