import 'package:flutter/material.dart';

class StreamPage extends StatelessWidget {

  Stream<int> countStream() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Materi Stream"),
      ),
      body: StreamBuilder(
        stream: countStream(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text("Data = ${snapshot.data}", style: TextStyle(fontSize: 30),)
            );
          }
        },
      ),
    );
  }
}