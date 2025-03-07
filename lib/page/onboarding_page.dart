import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;

  final PageController controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 234 ,),
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(125),
                        ),
                      ),

                      SizedBox(height: 130,),

                      Text('Memudahkan Dalam\n Memilah Sampah!', style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.w700,
                      ),),


                      SizedBox(height: 30,),

                      GestureDetector(
                        onTap: (){
                          controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);

                        },

                        child:
                        Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey,
                          ),
                          child:
                          Center(
                            child:
                            Text("Lanjut", style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,

                            ),),

                          ),
                        )
                        ,
                      )



                    ],
                  )
              ),

              Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 250 ,),
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(125),
                        ),
                      ),

                      SizedBox(height: 100,),

                      Text('Tukarkan\n Sampah!', style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.w700,
                      ),),


                      SizedBox(height: 30,),


                  GestureDetector(
                    onTap: (){
                      controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);

                    },child:

                      Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child:
                          Text("Lanjut", style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,

                          ),),

                        ),
                      ))

                    ],
                  )
              ),

              Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 250 ,),
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(125),
                        ),
                      ),

                      SizedBox(height: 100,),

                      Text('Kumpulkan Poin &\n Tukarkan Reward!', style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.w700,
                      ),),


                      SizedBox(height: 30,),

                      GestureDetector(
                        onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                        },child:
                      Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey,

                          ),
                          child:
                          Center(
                            child:
                            Text("Mulai", style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,

                            ),
                            ),

                          )


                      )

                        ,
                      )


                    ],
                  )
              ),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.3),
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect:
              WormEffect(),
            ),
          ),
        ],
      ),
    );
  }
}
