import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Fungsi untuk menampilkan Snackbar
void showSnackbar(BuildContext context, String message, {Color color = Colors.red}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
    ),
  );
}

/// Menampilkan dialog konfirmasi
void showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

/// Fungsi untuk menampilkan DatePicker
Future<String?> pickDate(BuildContext context) async {
  DateTime now = DateTime.now();
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: now,
    firstDate: now,
    lastDate: now.add(Duration(days: 365)),
  );

  if (picked != null) {
    return DateFormat('yyyy-MM-dd').format(picked);
  }
  return null;
}

/// Fungsi navigasi ke halaman tertentu
void navigateTo(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
