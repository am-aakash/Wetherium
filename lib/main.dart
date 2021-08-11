import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home:
    );
  }
}

/************************************************************************************************************
 
  Key Concepts :
    Observe state changes with BlocObserver
    BlocProvider -> Flutter widget that provides a bloc to its children
    BlocBuilder -> Flutter widget that handles building the widget in response to new states
    Prevent unnecessary rebuilds with Equatable
    RepositoryProvider-> a Flutter widget that provides a repository to its children
    BlocListener -> a Flutter widget that invokes the listener code in response to state changes in the bloc
    MultiBlocProvider -> a Flutter widget that merges multiple BlocProvider widgets into one
    BlocConsumer -> a Flutter widget that exposes a builder and listener in order to react to new states
    HydratedBloc -> to manage and persist state

  here's what the layers will do:
    Data -> retrieve raw weather data from the API
    Repository -> abstract the data layer and expose domain models for the application to consume
    Business Logic -> manage the state of each feature (unit information, city details, themes, etc.)
    Presentation -> display weather information and collect input from users (settings page, search page etc.)
    
 
 *************************************************************************************************************/
