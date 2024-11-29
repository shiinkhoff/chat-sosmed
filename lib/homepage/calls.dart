import 'package:chatdansosmed/homepage/home.dart';
import 'package:flutter/material.dart';

class Callspage extends StatelessWidget {
  const Callspage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Call> calls = [
      Call(
          name: "asta",
          time: "21:03",
          imageAssets: "images/asta.png",
          isIncoming: false),
      Call(
          name: "asta",
           time: "21:30",
          imageAssets: "images/asta.png",
          isIncoming: false),
      Call(
          name: "asta",
          time: "17:53",
          imageAssets: "images/asta.png",
          isIncoming: true),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Calls',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'images/back.png',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: calls.length,
        itemBuilder: (context, index) {
          final call = calls[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(call.imageAssets),
            ),
            title: Text(call.name),
            subtitle: Text(call.time),
            trailing: Icon(
              call.isIncoming ? Icons.call_received : Icons.call_made,
              color: Colors.black,
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('images/chats.png'),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/callss.png'),
            label: 'Calls',
          ),
        ],
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 1) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const Callspage()), // or another page
            // );
          }
        },
      ),
    );
  }
}

class Call {
  final String name;
  final String time;
  final String imageAssets;
  final bool isIncoming;

  Call({
    required this.name,
    required this.time,
    required this.imageAssets,
    required this.isIncoming,
  });
}
