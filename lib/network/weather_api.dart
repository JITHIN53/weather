import 'dart:convert';

import '../models/weather_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<WeatherResponseModel> getWeatherDetails(lat, long) async {
    final String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=00a4a426590fdbcd74e5d3c86ada1743";
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = response.body;
      var decodedJson = jsonDecode(json);
      print(response.body);
      return WeatherResponseModel.fromJson(decodedJson);
    } else {
      throw (e) {
        print(e);
        return null;
      };
    }
  }
}
