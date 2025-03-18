import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  static final FirebaseAuthServices _instance =
      FirebaseAuthServices._internal();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  factory FirebaseAuthServices() {
    return _instance;
  }

  FirebaseAuthServices._internal();

  //Validasi Email Address
  bool validateEmailAddress(String email) {
    return RegExp(r"^[a-z0-9.]+@[a-z0-9]+\.[a-z]+$").hasMatch(email);
  }

  //Validasi Password Minimal 8
  bool validatePassword(String password) {
    return password.length >= 8;
  }

  //Sign Up Email
  Future<String?> signUpWithEmailAndPassword(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    email = email.toLowerCase();
    print("Mencoba mendaftarkan pengguna dengan email: $email");

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      print("Kesalahan: Kolom tidak boleh kosong.");
      return 'Harap isi semua kolom';
    }
    if (!validateEmailAddress(email)) {
      print("Kesalahan: Format email tidak valid.");
      return 'Format email tidak valid';
    }
    if (!validatePassword(password)) {
      print("Kesalahan: Password kurang dari 8 karakter.");
      return 'Password harus minimal 8 karakter';
    }
    if (password != confirmPassword) {
      print("Kesalahan: Konfirmasi password tidak cocok.");
      return 'Konfirmasi kata sandi tidak cocok';
    }

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User signed up: ${credential.user?.uid}');
      return null;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      return getFirebaseAuthErrorMessage(e.code);
    } catch (e) {
      print("Kesalahan umum: $e");
      return 'Terjadi kesalahan, coba lagi nanti.';
    }
  }

  Future<String?> validateRegistrationInputs(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      return 'Harap isi semua kolom';
    }

    if (!validateEmailAddress(email)) {
      return 'Format email tidak valid';
    }

    if (!validatePassword(password)) {
      return 'Password harus minimal 8 karakter';
    }

    if (password != confirmPassword) {
      return 'Konfirmasi kata sandi tidak cocok';
    }

    return null;
  }

  //Sign In Email
  Future<String?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return getFirebaseAuthErrorMessage(e.code);
    } catch (e) {
      return 'Terjadi kesalahan, coba lagi nanti.';
    }
  }

  String getFirebaseAuthErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'Format email tidak valid.';
      case 'missing-password':
        return 'Masukkan password.';
      case 'invalid-credential':
        return 'Email atau password anda tidak sesuai.';
      case 'user-not-found':
        return 'Akun tidak ditemukan. Silakan daftar terlebih dahulu.';
      case 'wrong-password':
        return 'Kata sandi salah. Silakan coba lagi.';
      case 'email-already-in-use':
        return 'Email sudah digunakan. Gunakan email lain.';
      case 'weak-password':
        return 'Kata sandi terlalu lemah. Gunakan minimal 8 karakter.';
      default:
        return 'Terjadi kesalahan. Coba lagi nanti.';
    }
  }

  //Sign Out Email
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('User signed out');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  //Mendapatkan user yang login
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //Mengirim email untuk reset password
  Future<void> sendPasswordResetEmail(String email) async {
    if (!validateEmailAddress(email)) {
      print('Invalid email address');
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      print('Password reset email sent to $email');
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  // Update email
  Future<void> updateEmail(String newEmail) async {
    if (!validateEmailAddress(newEmail)) {
      print('Invalid email format');
      return;
    }

    try {
      await _auth.currentUser?.updateEmail(newEmail);
      print('Email updated to $newEmail');
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  // Update password
  Future<void> updatePassword(String newPassword) async {
    if (!validatePassword(newPassword)) {
      print('Password must be at least 6 characters');
      return;
    }

    try {
      await _auth.currentUser?.updatePassword(newPassword);
      print('Password updated');
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  //Login dengan nomor telepon
}
