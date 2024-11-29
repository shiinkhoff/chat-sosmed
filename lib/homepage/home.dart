import 'package:chatdansosmed/homepage/calls.dart';
import 'package:chatdansosmed/homepage/detailchat.dart';
import 'package:chatdansosmed/homepage/edit.dart';
import 'package:chatdansosmed/settingspage/settings.dart';
import 'package:chatdansosmed/homepage/yourstory.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Custom names and profile images for the users in the story section
  final List<Map<String, String>> _userStories = [
    {'name': 'your story', 'image': 'images/mystory.png'},
    {'name': 'elsa', 'image': 'images/person.png'},
    {'name': 'chesy', 'image': 'images/person.png'},
    {'name': 'rezy', 'image': 'images/person.png'},
    {'name': 'florist', 'image': 'images/person.png'},
    {'name': 'buket', 'image': 'images/person.png'},
    {'name': 'budi', 'image': 'images/person.png'},
    {'name': 'naren', 'image': 'images/person.png'},
    {'name': 'lays', 'image': 'images/person.png'},
    {'name': 'jarwowo', 'image': 'images/person.png'},
  ];

  // Chat data list with custom profile images and read receipts
  final List<Map<String, dynamic>> _chats = [
    {
      'name': 'tyafaa',
      'message': 'emang sanggup?',
      'time': '15.58',
      'isRead': true,
      'unreadCount': 0,
      'image': 'images/tyafaaa.png'
    },
    {
      'name': 'asta',
      'message': 'semangat yaa, jangan nyerah!!!',
      'time': '15.58',
      'isRead': false,
      'unreadCount': 3,
      'image': 'images/asta.png'
    },
    {
      'name': 'litch',
      'message': 'susah emang kalo egois',
      'time': '15.58',
      'isRead': true, // mark as read
      'unreadCount': 0,
      'image': 'images/litch.png'
    },
    {
      'name': 'figma',
      'message': 'jangan lupa streakkkkkkk',
      'time': '15.58',
      'isRead': true, // mark as read
      'unreadCount': 0,
      'image': 'images/person.png'
    },
    {
      'name': 'buket',
      'message': 'mochii duren ada kaga?',
      'time': '15.58',
      'isRead': true,
      'unreadCount': 0,
      'image': 'images/person.png'
    },
    {
      'name': 'python',
      'message': 'emang harus banyak-banyak sabar ngadepinnya',
      'time': '15.58',
      'isRead': true, // mark as read
      'unreadCount': 0,
      'image': 'images/person.png'
    },
    {
      'name': 'naren',
      'message': 'cepet sembuh yaa...',
      'time': '15.58',
      'isRead': false,
      'unreadCount': 3,
      'image': 'images/person.png'
    },
    {
      'name': 'lays',
      'message': 'gamau lah, yakalii',
      'time': '15.58',
      'isRead': false,
      'unreadCount': 3,
      'image': 'images/lays.png'
    },
    {
      'name': 'jarwowo',
      'message': 'apa?',
      'time': 'yesterday',
      'isRead': true,
      'unreadCount': 0,
      'image': 'images/person.png'
    },
  ];

  // Function to filter chats based on search query in both names and messages
  List<Map<String, dynamic>> _filteredChats() {
    if (_searchQuery.isEmpty) {
      return _chats;
    } else {
      return _chats.where((chat) {
        final nameMatch =
            chat['name'].toLowerCase().contains(_searchQuery.toLowerCase());
        final messageMatch =
            chat['message'].toLowerCase().contains(_searchQuery.toLowerCase());
        return nameMatch || messageMatch;
      }).toList();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Chat',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        leading: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const editpage(),
              ),
            );
          },
          child: const Text(
            'Edit',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('images/setting.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Story list section
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _userStories.length,
                itemBuilder: (context, index) {
                  final story = _userStories[index];
                  return GestureDetector(
                      onTap: () {
                        // Navigate to a different page when "Your Story" is tapped
                        if (story['name'] == 'your story') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CameraPage(), // Replace with your actual page
                            ),
                          );
                        } else if (story['name'] == 'chesy') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChesyStoryPage(),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Container(
                              width: 60, // Atur lebar sesuai kebutuhan
                              height: 60, // Atur tinggi sesuai kebutuhan
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(story['image']!),
                                  fit: BoxFit
                                      .cover, // Mengatur agar gambar memenuhi area
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              story['name']!,
                              style: const TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ));
                }),
          ),
          // Search field section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset(
                    'images/search.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Chat list section
          Expanded(
            child: ListView(
              children: _filteredChats().map((chat) {
                return ChatItem(
                    name: chat['name'],
                    message: chat['message'],
                    time: chat['time'],
                    isRead: chat['isRead'],
                    unreadCount: chat['unreadCount'],
                    image: chat['image'],
                    onTap: () {
                      if (chat['name'] == 'asta') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatDetail(
                                name: chat['name'],
                                message: chat['message'],
                                time: chat['time'],
                              ),
                            ));
                      }
                    });
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('images/chat.png'),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/call.png'),
              label: 'Calls',
            ),
          ],
          onTap: (index) {
            if (index == 1) {
              // Jika item yang ditekan adalah Calls
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Callspage()),
              );
            }
          }),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final bool isRead;
  final int unreadCount;
  final String image;
  final VoidCallback onTap;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    this.isRead = true,
    this.unreadCount = 0,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          )),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              color: isRead ? Colors.black : Colors.black,
              fontSize: 12,
            ),
          ),
          if (unreadCount > 0)
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.orange,
                child: Text(
                  unreadCount.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          if (isRead)
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Image.asset(
                'images/read.png', // Path to your custom read indicator image
                width: 16,
                height: 16,
              ),
            ),
        ],
      ),
    );
  }
}

// Chesy's Story Page

class ChesyStoryPage extends StatefulWidget {
  const ChesyStoryPage({Key? key}) : super(key: key);

  @override
  _ChesyStoryPageState createState() => _ChesyStoryPageState();
}

class _ChesyStoryPageState extends State<ChesyStoryPage> {
  bool isReplying = false;
  final TextEditingController _replyController = TextEditingController();

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/profil.png'),
                ),
                title: Text(
                  'chesy',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Hari ini 20.19',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('images/storychesy.png'),
                      fit: BoxFit.cover,
                      colorFilter: isReplying
                          ? ColorFilter.mode(
                              Colors.black.withOpacity(0.4), BlendMode.darken)
                          : null,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'WKWK CU BANGET',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isReplying = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFD8E4F),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            isReplying ? 'Type your reply...' : 'Reply',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () {
                        // Implement like functionality here
                      },
                      icon: const Icon(Icons.favorite_border,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isReplying)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black87,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Emoji row (unchanged, assuming you want to keep emojis as text)
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("😍", style: TextStyle(fontSize: 28)),
                        Text("😂", style: TextStyle(fontSize: 28)),
                        Text("😇", style: TextStyle(fontSize: 28)),
                        Text("😭", style: TextStyle(fontSize: 28)),
                        Text("🙏", style: TextStyle(fontSize: 28)),
                        Text("👏", style: TextStyle(fontSize: 28)),
                        Text("🎉", style: TextStyle(fontSize: 28)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Input row with image assets for add, image, camera, and microphone
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFD8E4F),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                // Add button as an image
                                IconButton(
                                  icon: Image.asset('images/+.png', width: 20),
                                  onPressed: () {
                                    // Implement add functionality
                                  },
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _replyController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(179, 0, 0, 0)),
                                    ),
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ),
                                // Image icon for album
                                IconButton(
                                  icon: Image.asset('images/album.png',
                                      width: 25),
                                  onPressed: () {
                                    // Implement image selection
                                  },
                                ),
                                // Image icon for camera
                                IconButton(
                                  icon: Image.asset('images/camera2.png',
                                      width: 20),
                                  onPressed: () {
                                    // Implement camera functionality
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        // Microphone button as image
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFD8E4F),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Image.asset('images/mic.png', width: 20),
                            onPressed: () {
                              // Implement voice message functionality
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
