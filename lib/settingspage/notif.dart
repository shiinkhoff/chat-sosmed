import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationPage> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;
  bool isSwitched5 = false;
  bool isSwitched6 = false;
  bool isSwitched7 = false;
  bool isSwitched8 = false;
  bool isSwitched9 = false;
  bool isSwitched10 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('images/back.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text(
            'Notifications',
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
              const SizedBox(height: 37),

              // Judul untuk container pertama
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'NOTIFICATION PRIORITY',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF545353),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 3),

              // container pertama dengan custom switch
              Container(
                width: 380,
                height: 120,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCustomSwitchRow('All message', isSwitched1, (value) {
                      setState(() {
                        isSwitched1 = value;
                      });
                    }),
                    const Divider(color: Colors.grey, thickness: 1, height: 0),
                    buildCustomSwitchRow('Important message only', isSwitched2,
                        (value) {
                      setState(() {
                        isSwitched2 = value;
                      });
                    }),
                    const Divider(color: Colors.grey, thickness: 1, height: 0),
                    buildCustomSwitchRow('No notifications', isSwitched3,
                        (value) {
                      setState(() {
                        isSwitched3 = value;
                      });
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 42),

              // Judul untuk container kedua
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SILENT MODE',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF545353),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 3),

              // container kedua dengan custom switch
              Container(
                width: 380,
                height: 120,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCustomSwitchRow('Silent for 1 hour', isSwitched4,
                        (value) {
                      setState(() {
                        isSwitched4 = value;
                      });
                    }),
                    const Divider(color: Colors.grey, thickness: 1, height: 0),
                    buildCustomSwitchRow('Silent until tomorrow', isSwitched5,
                        (value) {
                      setState(() {
                        isSwitched5 = value;
                      });
                    }),
                    const Divider(color: Colors.grey, thickness: 1, height: 0),
                    buildCustomSwitchRow('Silent until reenabled', isSwitched6,
                        (value) {
                      setState(() {
                        isSwitched6 = value;
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
                    'Silent mode will mute your notifications massanges\nand calls ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // Judul untuk container ketiga
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'MEDIA NOTIFICATIONS',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF545353),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 3),

              // container ketiga dengan custom switch
              Container(
                width: 380,
                height: 77,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCustomSwitchRow('Image/videos only', isSwitched7,
                        (value) {
                      setState(() {
                        isSwitched7 = value;
                      });
                    }),
                    const Divider(color: Colors.grey, thickness: 1, height: 0),
                    buildCustomSwitchRow('All messages', isSwitched8, (value) {
                      setState(() {
                        isSwitched8 = value;
                      });
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 45),

              // Judul untuk container keempat
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'DO-NOT-DISTURB MODE',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF545353),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 3),
              // container keempat dengan custom switch
              Container(
                width: 380,
                height: 45,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCustomSwitchRow('Enable DND', isSwitched9, (value) {
                      setState(() {
                        isSwitched9 = value;
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
                    'Do Not Disturb let your silence notification. Turn it on\nand off in control ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // Judul untuk container kelima
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'IMPORTANT CONTACT NOTIFICATIONS',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF545353),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 3),

              // container kelima dengan custom switch
              Container(
                width: 380,
                height: 45,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCustomSwitchRow('Enable', isSwitched10, (value) {
                      setState(() {
                        isSwitched10 = value;
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
