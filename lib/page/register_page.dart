import 'package:flutter/material.dart';
import 'package:resikin/page/regist_form.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(125.0),
                    bottomRight: Radius.circular(125.0),
                  ),
                ),

                child: Column(
                  children: [
                    SizedBox(height: 137,),
                    Center(
                      child: Text("DAFTAR", style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),),
                    )
                  ],
                )
            ),

            SizedBox(height: 40,),


            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterForm()));


              },child:
            Container(
                height: 56,
                width: 320,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Icon(Icons.email),
                    SizedBox(width: 10,),
                    Text("Daftar dengan Email"),

                  ],
                )
            ),

            ),



            SizedBox(height: 50,),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 130, // Adjust the width as needed
                child: Divider(thickness: 1, color: Colors.black),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('atau'), ),


              Container(
                width: 130, // Adjust the width as needed
                child: Divider(thickness: 1, color: Colors.black),
              ),
            ],
          ),



            SizedBox(height: 50,),

            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterForm()));
              },child:
            Container(
                height: 56,
                width: 320,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Icon(Icons.phone_android),
                    SizedBox(width: 10,),
                    Text("Daftar dengan No.HandPhone"),
                  ],
                )
            ),

            )




          ],
        )
      ),
    );
  }
}