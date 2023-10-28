import 'package:flutter/material.dart';
class No_Weather_Body extends StatelessWidget {
  const No_Weather_Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("there is no weather 😔 start",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            Text("searching now 🔍",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ],
        ),
      )
    );
  }
}