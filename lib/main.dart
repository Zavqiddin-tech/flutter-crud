import 'package:cli_project/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:cli_project/auth/login_or_register.dart';
import 'package:cli_project/firebase_options.dart';
// import 'package:cli_project/home_screen/bloc/home_bloc.dart';
// import 'package:cli_project/home_screen/screen/home_screen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cli_project/pages/home_page.dart';
import 'package:cli_project/theme/dark_mode.dart';
import 'package:cli_project/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      home: const AuthPage(),
    );
  }

}

  /* @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  } */