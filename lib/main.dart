import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:poll_app/model/url.dart';
import 'package:poll_app/view/screen/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: MyURL().url,
    anonKey: MyURL().anonKey,
  );
  //!   url: 'https://laofxcvbwjcksbclhfof.supabase.co',
  //!  anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxhb2Z4Y3Zid2pja3NiY2xoZm9mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEyNDI1MTMsImV4cCI6MjAzNjgxODUxM30.AomavYka0gRnG4zUM8qWc61qVSQN0LpzYUizDls9q98',
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
  