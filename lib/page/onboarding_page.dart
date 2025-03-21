import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_as.dart';

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
                color: Color(0xFFFAFCF9),
                child: Column(
                  children: [
                    SizedBox(height: 200),
                    SvgPicture.asset("assets/images/ob2.svg"),

                    SizedBox(height: 64),

                    Text(
                      'Memudahkan Dalam\n Memilah Sampah!',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 100),

                    GestureDetector(
                      onTap: () {
                        controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },

                      child: Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFF3D8D7A),
                        ),
                        child: Center(
                          child: Text(
                            "Lanjut",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                color: Color(0xFFFAFCF9),
                child: Column(
                  children: [
                    SizedBox(height: 200),
                    SvgPicture.asset("assets/images/ob1.svg"),

                    SizedBox(height: 64),

                    Text(
                      'Tukarkan\n Sampah!',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 100),

                    GestureDetector(
                      onTap: () {
                        controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFF3D8D7A),
                        ),
                        child: Center(
                          child: Text(
                            "Lanjut",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                color: Color(0xFFFAFCF9),
                child: Column(
                  children: [
                    SizedBox(height: 200),
                    SvgPicture.asset("assets/images/ob3.svg"),

                    SizedBox(height: 64),

                    Text(
                      'Kumpulkan Poin &\n Tukarkan Reward!',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 100),

                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginAs()),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFF3D8D7A),
                        ),
                        child: Center(
                          child: Text(
                            "Mulai",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Container(

          )

        ],
      ),
    );
  }
}