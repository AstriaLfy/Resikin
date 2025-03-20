import 'package:resikin/features/firestore_database/database_service.dart';
import 'package:resikin/features/user_auth/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/register_page.dart';
import 'forgot_pw.dart';
import 'reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resikin/bottomnavbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final _dbService = DatabaseService();
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

    String? validationMessage = await _authServices
        .validateWithEmailAndPassword(email, password);
    if (validationMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(validationMessage), backgroundColor: Colors.red),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    print("🟡 Login dimulai... Email: $email");

    String? errorMessage = await _authServices.signInWithEmailAndPassword(
      email,
      password,
    );

    setState(() {
      _isLoading = false;
    });

    if (errorMessage == null) {
      print("✅ Login sukses! Menunggu Firebase memperbarui user...");

      await Future.delayed(Duration(seconds: 1));
      User? user = await FirebaseAuth.instance.authStateChanges().first;

      if (user != null) {
        print("🎉 User ditemukan setelah login! UID: ${user.uid}");

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigationPage()),
          (route) => false,
        );
      } else {
        print("❌ Login sukses, tetapi user masih null!");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Autentikasi gagal, coba lagi"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      print("❌ Login gagal: $errorMessage");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
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

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      await Future.delayed(Duration(seconds: 1));
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String email = user.email ?? "";
        String namaUser = email.split('@')[0];

        bool isUserExists = await _dbService.checkUserExists(user.uid);

        debugPrint("Firebase Sign-In berhasil.");
        
        if (!isUserExists) {
        await _dbService.createUserLogin({
          "userId": user.uid,
          "email": email,
          "nama": namaUser,
          "created_At": FieldValue.serverTimestamp(),
        });
        debugPrint("User baru berhasil ditambahkan ke Firestore.");
      } else {
        debugPrint("User sudah terdaftar, tidak perlu menyimpan lagi.");
      }

        if (mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigationPage()),
            (route) => false,
          );
        }
      }
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
                onPressed: () {
                  _login();
                },

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
