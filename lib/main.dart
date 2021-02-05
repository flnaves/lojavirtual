import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/home_screen.dart';
import 'package:global_configuration/global_configuration.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromPath("lib/assets/cfg/app_settings.json");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja Virtual',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 12, 53, 90), 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
