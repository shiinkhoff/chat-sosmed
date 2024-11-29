import 'package:flutter/material.dart';

class DeleteAllChats extends StatelessWidget {
  void _onCancel(BuildContext context) {
    Navigator.pop(context); // Kembali ke layar sebelumnya
  }

  void _onConfirm(BuildContext context) {
    // Tambahkan aksi untuk menghapus chat
    Navigator.pop(context); // Kembali ke layar sebelumnya setelah konfirmasi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chat & medsos"),
        backgroundColor: Colors.grey[850],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center, // Tambahkan ini
            children: [
              Text(
                'Delete all chats',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Delete all chats?',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.orange),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Also delete media received in chat from the device gallery?',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => _onCancel(context),
                    child: Text('Batal', style: TextStyle(color: Colors.blue)),
                  ),
                  TextButton(
                    onPressed: () => _onConfirm(context),
                    child: Text('Oke', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
