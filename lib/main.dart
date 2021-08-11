import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/weather_bloc.dart';
import 'package:flutter_weather/repository/weather_repository.dart';
import 'package:splashscreen/splashscreen.dart';

import 'ui/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.grey[900],
          body: SplashScreen(
            photoSize: 110,
            image: Image.asset(
              'assets/splash.png',
            ),
            backgroundColor: Colors.grey[900],
            gradientBackground: LinearGradient(
              colors: [Colors.black, Colors.black87],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.repeated,
            ),
            loaderColor: Colors.blue[100],
            seconds: 200,
            navigateAfterSeconds: Scaffold(
              body: BlocProvider(
                create: (context) => WeatherBloc(WeatherRepo()),
                child: SearchPage(),
              ),
            ),
          ),
        ));
  }
}

/************************************************************************************************************
 
  Key Bloc Concepts :
    Observe state changes with BlocObserver
    BlocProvider -> Flutter widget that provides a bloc to its children
    BlocBuilder -> Flutter widget that handles building the widget in response to new states
    Prevent unnecessary rebuilds with Equatable
    RepositoryProvider-> a Flutter widget that provides a repository to its children
    BlocListener -> a Flutter widget that invokes the listener code in response to state changes in the bloc
    MultiBlocProvider -> a Flutter widget that merges multiple BlocProvider widgets into one
    BlocConsumer -> a Flutter widget that exposes a builder and listener in order to react to new states

  here's what the layers will do:
    Data -> retrieve raw weather data from the API
    Repository -> abstract the data layer and expose domain models for the application to consume
    Business Logic -> manage the state of each feature (unit information, city details, themes, etc.)
    Presentation -> display weather information and collect input from users (settings page, search page etc.)

 
 *************************************************************************************************************/
