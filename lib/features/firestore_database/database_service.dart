import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final _fire = FirebaseFirestore.instance;
  final String collectionUserLogin = "user_login";
  final String collectionPegawaiLogin = "pegawai_login";
  final String collectionNameCleaning = "cleaning_requests";
  final String collectionNamePickUp = "pickup_requests";
  final String collectionNamePayment = "payment_requests";

  Future<String?> createClean(Map<String, dynamic> cleaningData) async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? "";
      if (userId.isEmpty) {
        log("User belum login.");
        return null;
      }

      String cleaningId = _fire.collection(collectionNameCleaning).doc().id;
      cleaningData["id"] = cleaningId;
      cleaningData["user_id"] = userId;
      cleaningData["timestamp"] = FieldValue.serverTimestamp();

      await _fire
          .collection(collectionNameCleaning)
          .doc(cleaningId)
          .set(cleaningData);
      log("Cleaning request berhasil ditambahkan.");
      return cleaningId;
    } catch (e) {
      log("Error saat menambahkan cleaning request: ${e.toString()}");
      return null;
    }
  }

  Stream<QuerySnapshot> readClean() {
    return _fire
        .collection(collectionNameCleaning)
        .orderBy("timestamp", descending: true)
        .snapshots();
  }

  Future<void> updateClean(String docId, Map<String, dynamic> data) async {
    try {
      await _fire.collection(collectionNameCleaning).doc(docId).update(data);
      log("Data berhasil diperbarui");
    } catch (e) {
      log("Error saat update data: ${e.toString()}");
    }
  }

  Future<void> deleteClean(String docId) async {
    try {
      await _fire.collection(collectionNameCleaning).doc(docId).delete();
      log("Data berhasil dihapus dengan ID: $docId");
    } catch (e) {
      log("Error saat menghapus data: ${e.toString()}");
    }
  }

  Future<void> createPickUp(Map<String, dynamic> pickupData) async {
    try {
      await _fire.collection(collectionNameCleaning).add(pickupData);
      log("Data berhasil ditambahkan");
    } catch (e) {
      log("Error saat menambahkan data: ${e.toString()}");
    }
  }

  Future<void> createPayment(String cleaningId, double amount) async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? "";
      if (userId.isEmpty) {
        log("User belum login.");
        return;
      }

      String paymentId = _fire.collection(collectionNamePayment).doc().id;
      Map<String, dynamic> paymentData = {
        "id": paymentId,
        "user_id": userId,
        "cleaning_id": cleaningId,
        "amount": amount,
        "status": "paid",
        "timestamp": FieldValue.serverTimestamp(),
      };

      await _fire
          .collection(collectionNamePayment)
          .doc(paymentId)
          .set(paymentData);
      log("Pembayaran berhasil ditambahkan.");
    } catch (e) {
      log("Error saat menyimpan pembayaran: ${e.toString()}");
    }
  }

  Future<void> createUserLogin(Map<String, dynamic> userData) async {
    String userEmail = userData["email"].toLowerCase();
    String? userId = userData["uid"];

    if (userId == null || userId.isEmpty) {
      log("Error: userId tidak boleh null atau kosong.");
      return;
    }

    try {
      DocumentSnapshot userDoc =
          await _fire.collection(collectionUserLogin).doc(userId).get();

      QuerySnapshot result =
          await _fire
              .collection(collectionUserLogin)
              .where("email", isEqualTo: userEmail)
              .get();

      if (result.docs.isEmpty) {
        await _fire.collection(collectionUserLogin).doc(userId).set(userData);
        log("User berhasil ditambahkan ke Firestore.");
      } else {
        log("User sudah ada di Firestore.");
      }
    } catch (e) {
      log("Error saat menyimpan user: ${e.toString()}");
    }
  }

  Future<bool> checkUserExists(String userId) async {
    try {
      DocumentSnapshot userDoc =
          await _fire.collection("user_login").doc(userId).get();
      return userDoc.exists;
    } catch (e) {
      print("Error saat mengecek user: ${e.toString()}");
      return false;
    }
  }

  Future<void> createEmpLogin(Map<String, dynamic> userData) async {
    String userEmail = userData["email"].toLowerCase();
    String? userId = userData["uid"];

    if (userId == null || userId.isEmpty) {
      log("Error: userId tidak boleh null atau kosong.");
      return;
    }

    try {
      DocumentSnapshot userDoc =
          await _fire.collection(collectionUserLogin).doc(userId).get();

      QuerySnapshot result =
          await _fire
              .collection(collectionUserLogin)
              .where("email", isEqualTo: userEmail)
              .get();

      if (result.docs.isEmpty) {
        await _fire.collection(collectionUserLogin).doc(userId).set(userData);
        log("User berhasil ditambahkan ke Firestore.");
      } else {
        log("User sudah ada di Firestore.");
      }
    } catch (e) {
      log("Error saat menyimpan user: ${e.toString()}");
    }
  }

  Future<bool> checkEmpExists(String userId) async {
    try {
      DocumentSnapshot userDoc =
          await _fire.collection("user_login").doc(userId).get();
      return userDoc.exists;
    } catch (e) {
      print("Error saat mengecek user: ${e.toString()}");
      return false;
    }
  }
}
