import 'package:belajar_bloc/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MateriBlocBuilder extends StatelessWidget {
  MateriBlocBuilder({super.key});

  CounterCubit myCounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Materi Bloc Builder"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            // child: StreamBuilder(
            //   initialData: myCounter.initialData,
            //   stream: myCounter.stream, 
            //   builder: (context, snapshot) {
            //   return Text("${snapshot.data}", style: TextStyle(fontSize: 40),);
            // },)
            child: BlocBuilder<CounterCubit, int>(
              buildWhen: (previous, current) {
                if(current % 2 == 0) {
                  return true;
                } else {
                  return false;
                }
              },
              bloc: myCounter,
              builder:(context, state) {
              return Text("${state}", style: TextStyle(fontSize: 40),);
            },),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  myCounter.decrement();
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  myCounter.increment();
                },
                icon: Icon(Icons.add),
              ),
            ]
          )
        ],
      ),
    );
  }
}