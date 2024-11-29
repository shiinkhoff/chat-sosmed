import 'package:flutter/material.dart';




class ArchiveStoryPage extends StatelessWidget {
  const ArchiveStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    child: Image.asset(
                      'images/back.png',
                      width: 14,
                      height: 22,
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Center(
                        child: Text(
                          'Archive Story',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: 333,
                height: 34,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.history,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    ArchiveSection(
                      dateImagePath: 'images/18.png',
                      month: "Sept",
                      images: [
                        Image.asset(
                          'images/story1.png',
                          width: 108,
                          height: 171,
                        ),
                        Image.asset(
                          'images/story2.png',
                          width: 108,
                          height: 171,
                        ),
                      ],
                    ),
                    ArchiveSection(
                      dateImagePath: 'images/19.png',
                      month: "Sept",
                      images: [
                        Image.asset(
                          'images/story3.png',
                          width: 108,
                          height: 171,
                        ),
                        Image.asset(
                          'images/story4.png',
                          width: 108,
                          height: 171,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Only you can see your memories and archived stories",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArchiveSection extends StatelessWidget {
  final String dateImagePath;
  final String month;
  final List<Widget> images;

  const ArchiveSection({super.key, 
    required this.dateImagePath,
    required this.month,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                dateImagePath,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 6),
              Text(
                month,
                style: const TextStyle(
                  color: Color.fromARGB(255, 105, 105, 105),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: images.map((image) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: image,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
