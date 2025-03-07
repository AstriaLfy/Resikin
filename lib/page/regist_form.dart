import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 150,
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
              ),


              SizedBox(height: 30,),
              Text("DAFTAR", style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),),

              Text('Nama'),

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
                      Icon(Icons.person),
                      SizedBox(width: 10,),
                      Text("Nama Lengkap"),

                    ],
                  )
              ),
              SizedBox(height: 30,),

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
                      Text("Email"),

                    ],
                  )
              ),
              SizedBox(height: 30,),

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
                      Icon(Icons.lock),
                      SizedBox(width: 10,),
                      Text("Kata Sandi"),

                    ],
                  )
              ),
              SizedBox(height: 30,),

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
                      Icon(Icons.person),
                      SizedBox(width: 10,),
                      Text("Konfirmasi Kata Sandi"),

                    ],
                  )
              ),
              SizedBox(height: 30,),

        Container(
          height: 56,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          child: Center(
            child:
            Text("Daftar", style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,

            ),),

          ),
        )

            ],
          ),
    );
  }
}