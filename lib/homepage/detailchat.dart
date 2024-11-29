
import 'package:chatdansosmed/homepage/call.dart';
import 'package:chatdansosmed/homepage/home.dart';
import 'package:chatdansosmed/homepage/vidcall.dart';
import 'package:flutter/material.dart';

class ChatDetail extends StatelessWidget {
  final String name;
  final String message;
  final String time;

  const ChatDetail({
    super.key,
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('images/asta.png'),
            ),
            const SizedBox(width: 10),
            Text(name),
          ],
        ),
        leading: IconButton(
          icon: Image.asset('images/back.png',
              width: 24, height: 24),
          onPressed: () {
            Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
          },
        ),
        actions: [
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Vidcall()),
              );
            },
            child: Image.asset(
              'images/vidcall.png',
              width: 24,
              height: 24,
            ),
          ),
          IconButton(
            icon: Image.asset('images/callss.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const call(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFd9d9d9),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: const [
                  ChatBubble(
                    message: 'kami juga lagi banyak tugas nih disemester ini',
                    time: '11.04',
                    isSent: true,
                  ),
                  ChatBubble(
                    message:
                        'iyakann, kenapa ya sama semester ini???? kayak byk bgt tugasnya',
                    time: '11.04',
                    isSent: false,
                  ),
                  ChatBubble(
                    message: 'temen yang lain juga taukk',
                    time: '11.04',
                    isSent: false,
                  ),
                  ChatBubble(
                    message:
                        'kayaknya emang semuanya lagi banyak-banyaknya tugas ga si?',
                    time: '11.06',
                    isSent: true,
                  ),
                  ChatBubble(
                    message: 'huhu',
                    time: '11.06',
                    isSent: false,
                  ),
                  ChatBubble(
                    message:
                        'ihh tau ga? aku sampe sering begadang loh karna banyak tugas',
                    time: '11.06',
                    isSent: false,
                  ),
                  ChatBubble(
                    message:
                        'pusing banget kepala ku rasanya hampir 24/7 stay di laptop terus T_T',
                    time: '11.06',
                    isSent: false,
                  ),
                  ChatBubble(
                    message:
                        'SAMAAA BGT!!!!! aku juga gitu, sampe kabur mata ni. tapi karna aku ngedesain jadi seru walupun bikin pusing sama stress tapi kek aku suka gitu lohh. kalo kan ngoding terus tiap hari pasti lebih susah, lebih stress gada seru serunya dikit punn',
                    time: '11.10',
                    isSent: true,
                  ),
                  ChatBubble(
                    message:
                        'cewe mah emang susah ngoding, kalo cowo biasanya emang suka ngoding, karna logikanya lebih jalan daripada cewe',
                    time: '11.12',
                    isSent: false,
                  ),
                  ChatBubble(
                    message: 'cewe kan logikanya ga jalan HAHA',
                    time: '11.13',
                    isSent: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSent;

  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isSent,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSent ? const Color(0xFFFFA37B) : const Color(0xFFffffff),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0.3,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(width: 10),
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
