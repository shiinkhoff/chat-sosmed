import 'package:chatdansosmed/homepage/home.dart';
import 'package:chatdansosmed/login/forgotpw1.dart';
import 'package:chatdansosmed/login/tampilanlogin.dart';
import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  const Login({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFA6A6A),
                Color(0XFFFA956A),
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(top: 50, bottom: 0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.56),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TampilanLogin(),
                            ),
                          );
                        },
                        child: Image.asset('images/x.png'),
                      ),
                    ),
                    Image.asset(
                      'images/catlogo.png',
                      height: 300,
                      width: 300,
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Column(children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Username/Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordScreen1()));
                            },
                            child: const Text('Forgot Password?'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(height: 30),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 157, 77, 53),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 120, vertical: 20),
                              textStyle: const TextStyle(fontSize: 18),
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: const Text('Login')),
                        const SizedBox(
                          height: 70,
                        )
                      ]),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}