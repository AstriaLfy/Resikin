import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: new beranda()));
}

class beranda extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            new Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  "ppp",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}