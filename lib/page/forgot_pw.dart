import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/ForgetPw/ConfirmEmail.dart';
import 'package:resikin/page/login_page.dart';
import 'package:resikin/page/regist_form.dart';
import 'reusable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'loginEmp.dart';
import 'ForgetPw/ComfirmHp.dart';


class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFCF9),

      body: SingleChildScrollView(
        child:
        Center(
            child: Column(
              children: [
                ReusableContainer(child: Center(
                    child:
                    Column(
                      children: [
                        SizedBox(height: 112,),
                        Text("Lupa Kata Sandi", style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),),
                      ],
                    )

                )
                ),
                SizedBox(height: 40,),
                SvgPicture.asset("assets/images/lock.svg"),




                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Confirmemail()));


                  },child:
                Container(
                    height: 56,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Color(0xFF3D8D7A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Icon(Icons.mail, color: Colors.white,),
                        SizedBox(width: 10,),
                        Text("Konfirmasi Dengan Email",style: GoogleFonts.poppins(
                            color: Colors.white
                        )),

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
                      child: Text('atau', style: GoogleFonts.poppins(),), ),


                    Container(
                      width: 130, // Adjust the width as needed
                      child: Divider(thickness: 1, color: Colors.black),
                    ),
                  ],
                ),



                SizedBox(height: 50,),

                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Comfirmhp()));
                    },child:
                ReuseField(
                    color: Color(0xFF3D8D7A),
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Icon(Icons.person_pin_outlined, color: Colors.white,),
                        SizedBox(width: 10,),
                        Text("Konfirmasi dengan No.HandPhone",style: GoogleFonts.poppins(
                            color: Colors.white
                        )),

                      ],
                    )

                )

                ),

                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sudah punya akun?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Container(
                        child: Text(
                          " Masuk",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            )
        ),

      ),

    );
  }
}