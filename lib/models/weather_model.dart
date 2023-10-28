class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStatus;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStatus});
  factory WeatherModel.fromJson(dynamic json) {
    return WeatherModel(
      cityName: json['location']?['name'] ?? 'Unknown', // Provide a default value
      date:DateTime.parse(json["current"]?["last_updated"] ?? 'Unknown'),  // Provide a default value
      image: json["forecast"]?["forecastday"]?[0]?["day"]?["condition"]
              ?["icon"] ??
          'Unknown', // Provide a default value
      temp: json["forecast"]?["forecastday"]?[0]?["day"]?["avgtemp_c"]??
          0.0, // Provide a default value
      maxTemp:
          json["forecast"]?["forecastday"]?[0]?["day"]?["maxtemp_c"]??
              0.0, // Provide a default value
      minTemp:
          json["forecast"]?["forecastday"]?[0]?["day"]?["mintemp_c"]??
              0.0, // Provide a default value
      weatherStatus: json["forecast"]?["forecastday"]?[0]?["day"]?["condition"]
              ?["text"] ??
          'Unknown', // Provide a default value
    );
  }
}
