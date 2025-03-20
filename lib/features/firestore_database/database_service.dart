import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final _fire = FirebaseFirestore.instance;
  final String collectionUserLogin = "user_login";
  final String collectionPegawaiLogin = "pegawai_login";
  final String collectionNameCleaning = "cleaning_requests";
  final String collectionNamePickUp = "pickup_requests";
  final String collectionNamePayment = "payment_requests";

  Future<void> createClean(Map<String, dynamic> cleaningData) async {
    try {
      await _fire.collection(collectionNameCleaning).add(cleaningData);
      log("Data berhasil ditambahkan");
    } catch (e) {
      log("Error saat menambahkan data: ${e.toString()}");
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

  Future<void> createPayment(Map<String, dynamic> paymentData) async {
    try {
      await _fire.collection(collectionNamePayment).add(paymentData);
      log("Pembayaran berhasil ditambahkan");
    } catch (e) {
      log("Error saat menyimpan pembayaran: ${e.toString()}");
    }
  }

  Future<void> createUserLogin(Map<String, dynamic> userData) async {
    try {
      await _fire.collection(collectionUserLogin).add(userData);
      log("User berhasil ditambahkan");
    } catch (e) {
      log("Error saat menambahkan data: ${e.toString()}");
    }
  }

  Future<bool> checkUserExists(String userId) async {
  try {
    DocumentSnapshot userDoc = await _fire.collection("user_login").doc(userId).get();
    return userDoc.exists; 
  } catch (e) {
    print("Error saat mengecek user: ${e.toString()}");
    return false;
  }
}

  Future<void> createPegawaiLogin(Map<String, dynamic> pegawaiData) async {
    try {
      await _fire.collection(collectionPegawaiLogin).add(pegawaiData);
      log("User berhasil ditambahkan");
    } catch (e) {
      log("Error saat menambahkan data: ${e.toString()}");
    }
  }
}
