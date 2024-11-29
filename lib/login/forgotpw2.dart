import 'package:chatdansosmed/login/forgotpw3.dart';
import 'package:flutter/material.dart';


class ForgotPasswordScreen2 extends StatefulWidget {
  const ForgotPasswordScreen2({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreen2State createState() => _ForgotPasswordScreen2State();
}

class _ForgotPasswordScreen2State extends State<ForgotPasswordScreen2> {
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
      color: const Color.fromARGB(255, 223, 223, 223),
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
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white, // Button color
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
          height: 50, // Match height with number buttons
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent, // Transparent background for backspace
          ),
          child: const Center(
            child: Icon(
              Icons.backspace_outlined,
              size: 30,
              color: Colors.grey,
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
            const SizedBox(
              height: 30,
              width: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  height: 20,
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'images/back.png', // Replace with your image name
                    width: 24, // Set the width of the image as needed
                    height: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Text(
                "Masukkan kode verifikasi yang dikirim ke nomor/email",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            _buildPasscodeFields(),
            GestureDetector(
              onTap: () {
                // Navigate to the next screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen3()),
                );
              },
              child: Container(
                width: 300,
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: const Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(), // Spacer to push the keypad down

            _buildNumberPad(),
          ],
        ),
      ),
    );
  }
}