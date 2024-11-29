import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Music',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(children: [
          const SizedBox(height: 24.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey[200],
            ),
            child: Column(children: [
              ListTile(
                leading: Image.asset(
                  'images/spotify.png',
                ),
                title: const Text('Spotify'),
                onTap: () {},
                trailing: Row(
                  mainAxisSize: MainAxisSize.min, // Prevents stretching
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showBottomSheet(context, 'Link tapped!');
                      },
                      child: const Text(
                        'Link',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        _showBottomSheet(context, 'Next image tapped!');
                      },
                      child: Image.asset('images/next.png'),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String message) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pop(); // Close the bottom sheet when tapped
              },
              child: Center(
                child: Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Confirm to link from Spotify?',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Link to Spotify',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 20,
              height: 10,
            ),
            const Divider(
              thickness: 5,
            ),
            const SizedBox(width: 10, height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pop(); // Close the bottom sheet when tapped
              },
              child: const Center(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
              height: 10,
            ),
          ]),
        );
      },
    );
  }
}
