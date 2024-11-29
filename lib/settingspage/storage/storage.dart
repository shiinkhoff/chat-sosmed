import 'package:chatdansosmed/settingspage/storage/sDatausage.dart';
import 'package:chatdansosmed/settingspage/storage/storageusage.dart';
import 'package:flutter/material.dart';

class Storage extends StatelessWidget {
  const Storage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoragePage(),
    );
  }
}

// Halaman Storage Page
class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  // Status untuk tombol on/off di dalam container kedua dan ketiga
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitchedImage = false;
  bool isSwitchedDocument = false;
  bool isSwitchedSticker = false;
  bool isSwitchedVideo = false;
  bool isSwitchedAudio = false;
  bool isSwitchedMusic = false;

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
            'Storage',
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              // container pertama
              Container(
                width: 380,
                height: 85,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Row untuk Storage Usage
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StorageUsage()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Storage usage',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: const Icon(Icons.arrow_forward_ios,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.grey, thickness: 1),

                    // Row untuk Data Usage
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DataUsage()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Data usage',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: const Icon(Icons.arrow_forward_ios,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Judul untuk container kedua
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Automatic media download',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF545353),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // container kedua dengan custom switch
              Container(
                width: 380,
                height: 152,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCustomSwitchRow('Using cellular data', isSwitched1,
                        (value) {
                      setState(() {
                        isSwitched1 = value;
                      });
                    }),
                    const Divider(color: Colors.grey, thickness: 1, height: 0),
                    buildCustomSwitchRow('Connected to wifi', isSwitched2,
                        (value) {
                      setState(() {
                        isSwitched2 = value;
                      });
                    }),
                    const Divider(color: Colors.grey, thickness: 1, height: 0),
                    buildCustomSwitchRow('Roaming', isSwitched3, (value) {
                      setState(() {
                        isSwitched3 = value;
                      });
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Judul untuk container ketiga
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Auto download',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF545353),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // container ketiga dengan custom switch
              Container(
                width: 380,
                height: 296,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCustomSwitchRow('Image', isSwitchedImage, (value) {
                      setState(() {
                        isSwitchedImage = value;
                      });
                    }),
                    const Divider(color: Colors.grey, thickness: 1, height: 0),
                    buildCustomSwitchRow('Document', isSwitchedDocument,
                        (value) {
                      setState(() {
                        isSwitchedDocument = value;
                      });
                    }),
                    const Divider(color: Colors.grey, thickness: 1, height: 0),
                    buildCustomSwitchRow('Sticker', isSwitchedSticker, (value) {
                      setState(() {
                        isSwitchedSticker = value;
                      });
                    }),
                    const Divider(color: Colors.grey, thickness: 1, height: 0),
                    buildCustomSwitchRow('Video', isSwitchedVideo, (value) {
                      setState(() {
                        isSwitchedVideo = value;
                      });
                    }),
                    const Divider(color: Colors.grey, thickness: 1, height: 0),
                    buildCustomSwitchRow('Audio', isSwitchedAudio, (value) {
                      setState(() {
                        isSwitchedAudio = value;
                      });
                    }),
                    const Divider(color: Colors.grey, thickness: 1, height: 0),
                    buildCustomSwitchRow('Music', isSwitchedMusic, (value) {
                      setState(() {
                        isSwitchedMusic = value;
                      });
                    }),
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
