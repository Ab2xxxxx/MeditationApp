import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app/screens/meditation_screen.dart';
import 'package:meditation_app/provider/audio_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioPlayerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MeditationScreen(),
    );
  }
}
