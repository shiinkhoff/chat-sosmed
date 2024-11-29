import 'package:chatdansosmed/settingspage/chatsettings/chatHistory.dart';
import 'package:chatdansosmed/settingspage/chatsettings/fontsize.dart';
import 'package:chatdansosmed/settingspage/settings.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatSettingsScreenState();
}

class _ChatSettingsScreenState extends State<ChatPage> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text(
            'Chat',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Judul untuk container pertama
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tampilan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF545353),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 3),

              // container pertama dengan custom switch
              Container(
                width: 380,
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'images/nightmode.png', // Path gambar
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 8), // Jarak antara gambar dan teks
                    Expanded(
                      child: buildCustomSwitchRow('Night mode', isSwitched1,
                          (value) {
                        setState(() {
                          isSwitched1 = value;
                        });
                      }),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 43),

              // Judul untuk container kedua
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Setelan chat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF545353),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 5),

              // container kedua dengan custom switch
              Container(
                width: 380,
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCustomSwitchRow('Enter to send', isSwitched2, (value) {
                      setState(() {
                        isSwitched2 = value;
                      });
                    }),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0, left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'The enter button will send your message',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // container ketiga dengan custom switch
              Container(
                width: 380,
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCustomSwitchRow('Media visibity', isSwitched3,
                        (value) {
                      setState(() {
                        isSwitched3 = value;
                      });
                    }),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0, left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Display newly downloaded media in your device’s galery',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // container keempat
              Container(
                width: 380,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Row untuk Font size
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FontSize()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Font size',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF545353)),
                              ),
                            ],
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: const Icon(Icons.arrow_forward_ios,
                                color: Color(0xFF545353)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 45),

              // container keempat
              Container(
                width: 380,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Row untuk Chat history
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatHistoryPage()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'images/chathis.png',
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Chat history',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF545353)),
                              ),
                            ],
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: const Icon(Icons.arrow_forward_ios,
                                color: Color(0xFF545353)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi helper untuk membangun Row dengan custom switch
  Row buildCustomSwitchRow(
      String text, bool switchValue, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16, color: Color(0xFF545353)),
        ),
        GestureDetector(
          onTap: () {
            onChanged(!switchValue);
          },
          child: Container(
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              color: switchValue ? const Color(0xFFFA956A) : Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment: switchValue
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
