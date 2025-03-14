import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final _fire = FirebaseFirestore.instance;
  final String collectionNameCleaning = "cleaning_requests";
  final String collectionNamePayment = "payment_requests";

  Future<void> createClean(Map<String, dynamic> data) async {
    try {
      await _fire.collection(collectionNameCleaning).add(data);
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

  Future<void> createPayment(Map<String, dynamic> paymentData) async {
    try {
      await _fire.collection(collectionNamePayment).add(paymentData);
      log("Pembayaran berhasil ditambahkan");
    } catch (e) {
      log("Error saat menyimpan pembayaran: ${e.toString()}");
    }
  }
}
    // createPilihHari() {
    //   try {
    //     _fire.collection("users").add({"hari": "Hari Ini"});
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // createPilihJam() {
    //   try {
    //     _fire.collection("users").add({"jam": "10.00"});
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // createPilihLuas() {
    //   try {
    //     _fire.collection("users").add({"luas": "85m2"});
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // createPilihAlamat() {
    //   try {
    //     _fire.collection("users").add({"alamat": "Lowokwaru"});
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // createPilihPegawai() {
    //   try {
    //     _fire.collection("users").add({"pegawai": "1"});
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // createPilihCatatan() {
    //   try {
    //     _fire.collection("users").add({"catatan": "lorem ipsum dolor sit amet"});
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // readPilihHari() async {
    //   try {
    //     final data = await _fire.collection("users").get();
    //     final user = data.docs[0];
    //     log(user["hari"]);
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // readPilihJam() async {
    //   try {
    //     final data = await _fire.collection("users").get();
    //     final user = data.docs[0];
    //     log(user["jam"]);
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // readPilihLuas() async {
    //   try {
    //     final data = await _fire.collection("users").get();
    //     final user = data.docs[0];
    //     log(user["luas"]);
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // readPilihAlamat() async {
    //   try {
    //     final data = await _fire.collection("users").get();
    //     final user = data.docs[0];
    //     log(user["alamat"]);
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // readPilihPegawai() async {
    //   try {
    //     final data = await _fire.collection("users").get();
    //     final user = data.docs[0];
    //     log(user["pegawai"]);
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // readPilihCatatan() async {
    //   try {
    //     final data = await _fire.collection("users").get();
    //     final user = data.docs[0];
    //     log(user["catatan"]);
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // updatePilihHari() async {
    //   try {
    //     await _fire.collection("users").doc("").update({"hari": "Besok"});
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // updatePilihJam() async {
    //   try {
    //     await _fire.collection("users").doc("").update({"jam": "11.00"});
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // updatePilihLuas() async {
    //   try {
    //     await _fire.collection("users").doc("").update({"luas": "100m"});
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // updatePilihAlamat() async {
    //   try {
    //     await _fire.collection("users").doc("").update({"alamat": "Sigura-gura"});
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // updatePilihPegawai() async {
    //   try {
    //     await _fire.collection("users").doc("").update({"pegawai": "2"});
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // updatePilihCatatan() async {
    //   try {
    //     await _fire.collection("users").doc("").update({"catatan": "kosong"});
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // deletePilihHari() async {
    //   try {
    //     await _fire.collection("users").doc("").delete();
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // deletePilihJam() async {
    //   try {
    //     await _fire.collection("users").doc("").delete();
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // deletePilihLuas() async {
    //   try {
    //     await _fire.collection("users").doc("").delete();
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // deletePilihAlamat() async {
    //   try {
    //     await _fire.collection("users").doc("").delete();
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // deletePilihPegawai() async {
    //   try {
    //     await _fire.collection("users").doc("").delete();
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

    // deletePilihCatatan() async {
    //   try {
    //     await _fire.collection("users").doc("").delete();
    //   } catch (e) {
    //     log(e.toString());
    //   }
    // }

