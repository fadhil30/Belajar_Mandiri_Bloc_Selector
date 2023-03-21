import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:latihan_bloc/bloc/user.dart';
import 'package:latihan_bloc/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => UserBloc(),
        child: HomePage(),
      ),
    );
  }
}
