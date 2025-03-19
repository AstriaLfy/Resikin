import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable.dart';
import 'package:flutter_svg/svg.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0), // Height of AppBar
        child: ReusableContainer(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 112),
                Text(
                  "History",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Center(
        child:
        Column(
          children: [
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 190,
              width: 320,

              child: SingleChildScrollView(
                child: Column(
                  children: [

                    SizedBox(height: 10,),

                    Container( decoration:
                      BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 150,
                      width: 284,
                      child:
                      Column(
                        children: [

                          SizedBox(height: 10,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             SvgPicture.asset("assets/images/PickIcon.svg"),
                             SizedBox(width: 10,),
                             Text("Pick Up"),
                           ],
                         ),
                          Container(
                            width: 270,
                            child: Divider(thickness: 1, color: Colors.black),
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.calendar_month),
                              Text("Tanggal : 00 Maret 2025")
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.location_on),
                              Text("Alamat : Jl Karet No 8, Jatimulyo, Kec")
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.monitor_weight),
                              Text("00 Kg")
                            ],
                          )

                        ],
                      )
                      ,

                    ),

                    SizedBox(height: 10,),

                    Container( decoration:
                    BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                      height: 150,
                      width: 284,

                      child:
                      Column(
                        children: [

                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              SvgPicture.asset("assets/images/PickIcon.svg"),
                              SizedBox(width: 10,),
                              Text("Cleaning"),
                            ],
                          ),
                          Container(
                            width: 270,
                            child: Divider(thickness: 1, color: Colors.black),
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.calendar_month),
                              Text("Tanggal : 00 Maret 2025")
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.location_on),
                              Text("Alamat : Jl Karet No 8, Jatimulyo, Kec")
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.monitor_weight),
                              Text("2 Lantai")
                            ],
                          )

                        ],
                      ),

                    ),

                    SizedBox(height: 10,),
                  ],
                ),
              ),

            ),

            SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 300,
              width: 320,
              child:
              SingleChildScrollView(
                child:
                Column(
                  children: [
                    SizedBox(height: 10,),

                    Container( decoration:
                    BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                      height: 150,
                      width: 284,
                      child:
                      Column(
                        children: [

                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              SvgPicture.asset("assets/images/PickIcon.svg"),
                              SizedBox(width: 10,),
                              Text("Cleaning"),
                            ],
                          ),
                          Container(
                            width: 270,
                            child: Divider(thickness: 1, color: Colors.black),
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.calendar_month),
                              Text("Tanggal : 00 Maret 2025")
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.location_on),
                              Text("Alamat : Jl Karet No 8, Jatimulyo, Kec")
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.monitor_weight),
                              Text("2 Lantai")
                            ],
                          )

                        ],
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container( decoration:
                    BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                      height: 150,
                      width: 284,
                      child:
                      Column(
                        children: [

                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              SvgPicture.asset("assets/images/PickIcon.svg"),
                              SizedBox(width: 10,),
                              Text("Cleaning"),
                            ],
                          ),
                          Container(
                            width: 270,
                            child: Divider(thickness: 1, color: Colors.black),
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.calendar_month),
                              Text("Tanggal : 00 Maret 2025")
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.location_on),
                              Text("Alamat : Jl Karet No 8, Jatimulyo, Kec")
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.monitor_weight),
                              Text("2 Lantai")
                            ],
                          )

                        ],
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container( decoration:
                    BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                      height: 150,
                      width: 284,
                      child:
                      Column(
                        children: [

                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              SvgPicture.asset("assets/images/PickIcon.svg"),
                              SizedBox(width: 10,),
                              Text("Cleaning"),
                            ],
                          ),
                          Container(
                            width: 270,
                            child: Divider(thickness: 1, color: Colors.black),
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.calendar_month),
                              Text("Tanggal : 00 Maret 2025")
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.location_on),
                              Text("Alamat : Jl Karet No 8, Jatimulyo, Kec")
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.monitor_weight),
                              Text("2 Lantai")
                            ],
                          )

                        ],
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container( decoration:
                    BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                      height: 135,
                      width: 270,
                    ),

                    SizedBox(height: 10,),

                    Container( decoration:
                    BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                      height: 135,
                      width: 270,
                    ),

                    SizedBox(height: 10,),

                    Container( decoration:
                    BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                      height: 135,
                      width: 270,
                    ),



                  ],
                ),
              )
              ,
            )
          ],
        )
        ,
      )



    );
  }
}
