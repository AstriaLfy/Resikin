import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/beranda.dart';
import 'package:resikin/page/register_page.dart';
import 'forgot_pw.dart';
import 'reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resikin/features/user_auth/firebase_auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthServices _authServices = FirebaseAuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

Future<void> _login() async {
  setState(() {
    _isLoading = true;
  });

  String email = _emailController.text.trim();
  String password = _passwordController.text.trim();

  String? errorMessage = await _authServices.signInWithEmailAndPassword(email, password);

  setState(() {
    _isLoading = false;
  });

  if (errorMessage == null) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Beranda()));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red, 
      ),
    );
  }
}

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        debugPrint("Google Sign-In dibatalkan.");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        debugPrint("Firebase Sign-In berhasil.");

        if (mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Beranda()),
            (route) => false,
          );
        }
      }
      debugPrint("Firebase Sign-In berhasil.");
    } catch (e) {
      debugPrint("Google Sign-In gagal: ${e.toString()}");
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFCF9),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ReusableContainer(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 112),
                      Text(
                        "MASUK",
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

              SizedBox(height: 10),
              SvgPicture.asset("assets/images/Login.svg"),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text("Email", style: GoogleFonts.poppins()),
                ],
              ),
              Container(
                height: 56,
                width: 320,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.mail),
                    hintText: "Email",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text("Kata Sandi", style: GoogleFonts.poppins()),
                ],
              ),
              Container(
                height: 56,
                width: 320,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: "Kata Sandi",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 15),

              Row(
                children: [
                  SizedBox(width: 230),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: Text("Lupa Password?", style: GoogleFonts.poppins()),
                  ),
                ],
              ),

              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3D8D7A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(320, 56),
                ),
                child: Text(
                  "Masuk",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                ),
              ),

              SizedBox(height: 10),

              SizedBox(height: 10),

              GestureDetector(
                onTap: () => signInWithGoogle(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  height: 56,
                  width: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/google.svg"),
                      SizedBox(width: 10),
                      Text(
                        "Masuk dengan Google",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 23),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum punya akun?", style: GoogleFonts.poppins()),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Container(
                      child: Text(
                        " Daftar",
                        style: GoogleFonts.poppins(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
