import 'dart:convert';

import 'package:dio/dio.dart';

const apiKey = '4d4f822ecec687798b796571845cec57';
//const city = 'Maracaibo';

class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchData({required String city}) async {
    final response = await _dio.get(
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');
    // Respuesta en paralelo del laboratorio.
    if (response.statusCode == 200) {
      print(response.data);
      //return jsonDecode(response.data);
      return response.data;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
