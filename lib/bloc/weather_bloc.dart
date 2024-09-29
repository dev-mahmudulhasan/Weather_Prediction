import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  
  final String apiKey = 'e305ec27f251de18242a11fd1eea8463'; // Add your OpenWeatherMap API key here

  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    final url = 'https://api.openweathermap.org/data/2.5/weather?lat=${event.lat}&lon=${event.lon}&appid=$apiKey';
print('Here');
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Response :::::::::::::::::::::${data.toString()}');
        emit(WeatherLoaded(weatherData: data));
      } else {
           print('Error :::::::::::::::::::::${response.statusCode.toString()}');
        emit(WeatherError(message: 'Failed to fetch weather data'));
      }
    } catch (e) {
       print('Error :::::::::::::::::::::${e.toString()}');
      emit(WeatherError(message: 'Error: ${e.toString()}'));
         
    }
  }
}
