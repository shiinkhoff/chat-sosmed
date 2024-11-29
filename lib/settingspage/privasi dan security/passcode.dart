import 'package:chatdansosmed/settingspage/privasi%20dan%20security/privacysecc.dart';
import 'package:chatdansosmed/settingspage/settings.dart';
import 'package:flutter/material.dart';

class PasscodeLockScreen extends StatelessWidget {
  const PasscodeLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            // Bagian panah kembali dan judul halaman
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Aksi ketika ikon panah diklik
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'images/back.png', // Ganti dengan nama gambar Anda
                    width: 14, // Atur lebar gambar sesuai kebutuhan
                    height: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            const Text(
              "Passcode Lock",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Image.asset(
                'images/pwlock.png',
                height: 300, // Adjust based on the design
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Passcode Lock",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "When a password is set, you'll need to use your Code to unlock Tatalk. You can still reply to messages from notifications and answer calls if Tatalk is locked.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 11,
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),
            // Tombol Passcode lock
            SizedBox(
              height: 30,
              width: 313, // Lebar tombol sesuai lebar layar dengan margin
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman PasscodeOnScreen ketika tombol ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PasscodeOnScreen()),
                  );
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  "Passcode Lock", // Ubah teks tombol
                  style: TextStyle(
                    fontSize: 13, // Ukuran font diatur menjadi 13
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.grey[300], // Warna teks hitam
                  padding:
                      const EdgeInsets.symmetric(vertical: 12), // Tinggi tombol
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Sudut tombol agak membulat
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "NOTE : If you forget your passcode, you'll need to log out and log in again.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 11,
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasscodeOnScreen extends StatefulWidget {
  const PasscodeOnScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasscodeOnScreenState createState() => _PasscodeOnScreenState();
}

class _PasscodeOnScreenState extends State<PasscodeOnScreen> {
  // Variable untuk menyimpan passcode
  List<String> passcode = ["", "", "", ""];

  void _onKeyboardTap(String value) {
    setState(() {
      for (int i = 0; i < passcode.length; i++) {
        if (passcode[i] == "") {
          passcode[i] = value;
          break;
        }
      }
    });
  }

  void _clearPasscode() {
    setState(() {
      for (int i = passcode.length - 1; i >= 0; i--) {
        if (passcode[i] != "") {
          passcode[i] = "";
          break;
        }
      }
    });
  }

  Widget _buildPasscodeFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 28,
            height: 41,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                passcode[index],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildNumberPad() {
    return Container(
      padding: const EdgeInsets.all(5.0),
      color: const Color.fromARGB(
          255, 223, 223, 223), // Warna background abu-abu untuk keypad
      child: Column(
        children: [
          _buildNumberRow(["1", "2", "3"], ["", "ABC", "DEF"]),
          _buildNumberRow(["4", "5", "6"], ["GHI", "JKL", "MNO"]),
          _buildNumberRow(["7", "8", "9"], ["PQRS", "TUV", "WXYZ"]),
          _buildNumberRow(["", "0", "backspace"], ["", "", ""]),
        ],
      ),
    );
  }

  Widget _buildNumberRow(List<String> numbers, List<String> letters) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(3, (index) {
        if (numbers[index] == "backspace") {
          return _buildBackspaceButton();
        } else if (numbers[index].isEmpty) {
          return _buildEmptyButton();
        } else {
          return _buildNumberButton(numbers[index], letters[index]);
        }
      }),
    );
  }

  Widget _buildNumberButton(String number, String letters) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _onKeyboardTap(number);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          height: 40, // Ukuran tinggi tombol
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white, // Warna putih untuk tombol
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              if (letters.isNotEmpty)
                Text(
                  letters,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyButton() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        height: 60,
        color: Colors.transparent,
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _clearPasscode();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          height: 60, // Sesuaikan tinggi dengan tombol angka
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent, // War an putih untuk tombol hapus
          ),
          child: const Center(
            child: Icon(
              Icons.backspace_outlined,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                    width: 16), // Menambahkan ruang kosong di sebelah kiri
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ),
                        );
                  },
                  child: Image.asset(
                    'images/back.png', // Ganti dengan nama gambar Anda
                    width: 14, // Atur lebar gambar sesuai kebutuhan
                    height: 22,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Text(
              "Passcode Lock",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              "Enter your passcode",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 20),
            _buildPasscodeFields(),
            const Spacer(), // Spacer agar keypad berada di bawah

            // Menambahkan panah "Next" di atas keypad
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman PrivacySecurity
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacySecurityPage()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 30,
                      color: Colors.black, // Atur warna panah sesuai kebutuhan
                    ),
                  ),
                ),
                const SizedBox(
                    width: 16), // Menambahkan ruang kosong di sebelah kanan
              ],
            ),

            _buildNumberPad(), // Keypad
          ],
        ),
      ),
    );
  }
}
