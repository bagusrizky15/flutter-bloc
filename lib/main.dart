import 'package:belajar_bloc/materi_bloc_builder.dart/bloc_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MateriBlocBuilder(),
      );
  }
}

