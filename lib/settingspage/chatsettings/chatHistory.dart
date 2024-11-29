import 'package:chatdansosmed/settingspage/chatsettings/chatpage.dart';
import 'package:flutter/material.dart';


// MainPage - Halaman utama dengan opsi setting seperti di gambar
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('Night mode'),
              value: false,
              onChanged: (value) {},
            ),
            SwitchListTile(
              title: const Text('Enter to send'),
              value: false,
              onChanged: (value) {},
            ),
            SwitchListTile(
              title: const Text('Media visibility'),
              value: false,
              onChanged: (value) {},
            ),
            ListTile(
              title: const Text('Font size'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Chat history'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatHistoryPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ChatHistoryPage - Halaman riwayat chat
class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat history'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            const SizedBox(height: 24.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Archive all chats'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArchiveChatsPage()),
                      );
                    },
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: const Text('Delete all chats'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeleteChatsPage()),
                      );
                    },
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ArchiveChatsPage - Halaman arsip chat
class ArchiveChatsPage extends StatelessWidget {
  const ArchiveChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => _showArchiveDialog(context));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive all chats'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text('All chats have been archived.'),
      ),
    );
  }

  void _showArchiveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Archive all chats"),
          content: const Text("Are you sure you want to archive all chats?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatPage(),
                  ),
                );
              },
              child: const Text("Oke"),
            ),
          ],
        );
      },
    );
  }
}

// DeleteChatsPage - Halaman hapus chat
class DeleteChatsPage extends StatelessWidget {
  const DeleteChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => _showDeleteDialog(context));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete all chats'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text('All chats have been deleted.'),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete all chats"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Delete all chats?"),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (bool? value) {}),
                  const Text(
                      "Also delete media received in chat\nfrom the device gallery?")
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatPage(),
                  ),
                );
              },
              child: const Text("Oke"),
            ),
          ],
        );
      },
    );
  }
}
