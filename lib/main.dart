import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_there/cubit/color_cubit.dart';

import 'package:hello_there/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

/// top widget accessed by runApp
class MyApp extends StatelessWidget {
  ///initializing constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello There',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'VT323'),
      routes: {
        '/': (context) => BlocProvider(
              create: (context) => ColorCubit(),
              child: const HomePage(),
            )
      },
      initialRoute: '/',
    );
  }
}
