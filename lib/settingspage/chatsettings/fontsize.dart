import 'package:flutter/material.dart';

class FontSize extends StatefulWidget {
  const FontSize({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FontSizeSettingsScreenState createState() => _FontSizeSettingsScreenState();
}

class _FontSizeSettingsScreenState extends State<FontSize> {
  String _selectedFontSize = 'Medium'; // Default selected size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF3771C8)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text(
            'Font Size',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: ListView(
        children: [
          _buildFontSizeOption('Small'),
          _buildFontSizeOption('Medium'),
          _buildFontSizeOption('Large'),
        ],
      ),
    );
  }

  Widget _buildFontSizeOption(String size) {
    return ListTile(
      title: Text(size),
      trailing: _selectedFontSize == size
          ? const Icon(Icons.check, color: Colors.orange)
          : null,
      onTap: () {
        setState(() {
          _selectedFontSize = size;
        });
      },
    );
  }
}
