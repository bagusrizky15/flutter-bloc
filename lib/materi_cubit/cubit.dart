import 'package:belajar_bloc/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MateriCubit extends StatelessWidget {
  CounterCubit myCounter = CounterCubit(initialData: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Materi Cubit"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: StreamBuilder(
              initialData: myCounter.initialData,
              stream: myCounter.stream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Text("${snapshot.data}", style: TextStyle(fontSize: 40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Current: ${myCounter.current}",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Next: ${myCounter.next}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                );
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return Center(
                //     child: CircularProgressIndicator(),
                //   );
                // } else {
                //   return Text("${snapshot.data}", style: TextStyle(fontSize: 40));
                // }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  myCounter.decrement();
                },
                child: Icon(Icons.remove),
              ),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  myCounter.increment();
                },
                child: Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
