import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;

  late List<CameraDescription> _cameras;
  bool _isFlashOn = false;
  bool _isCameraFront = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras[0], ResolutionPreset.medium);
    await _controller.initialize();
    setState(() {});
  }

  Future<void> _openGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(imagePath: image.path),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'images/x2.png',
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _isFlashOn = !_isFlashOn;
                    _controller.setFlashMode(
                        _isFlashOn ? FlashMode.torch : FlashMode.off);
                  });
                },
                icon: Icon(
                  _isFlashOn ? Icons.flash_on : Icons.flash_off,
                  color: Colors.white,
                ),
              ),
            ]),
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
          _controller.value.isInitialized
              ? CameraPreview(_controller)
              : const Center(child: CircularProgressIndicator()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(
                        onPressed: _openGallery,
                        icon: Image.asset('images/galeri.png'),
                      ),
                      const SizedBox(height: 4),
                    ]),
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(
                        onPressed: () async {
                          try {
                            final XFile picture =
                                await _controller.takePicture();
                            final String imagePath = picture.path;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DisplayPictureScreen(imagePath: imagePath),
                              ),
                            );
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: Text('Failed to take picture: $e'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        icon: Image.asset('assets/images/Camera.png'),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Video'),
                          SizedBox(width: 8), // Memberikan jarak antara teks
                          Text(
                            'Foto',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ],
                      ),
                    ]),
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isCameraFront = !_isCameraFront;
                            _controller = CameraController(
                                _cameras[_isCameraFront ? 1 : 0],
                                ResolutionPreset.medium);
                            _controller.initialize().then((_) {
                              if (!mounted) return;
                              setState(() {});
                            });
                          });
                        },
                        icon: Image.asset('assets/images/balik camera.png'),
                      ),
                      const SizedBox(height: 4),
                    ]),
                  ]),
            ),
          ),
        ]));
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
          Center(
            child: Image.file(File(imagePath)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.black.withOpacity(0.7),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.7),
                    hintText: 'Add a caption...',
                    hintStyle: const TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/b.png',
                        width: 25,
                        height: 25,
                      ),
                      label: const Text(
                        'status (33 excluded)',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Post',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context); // Close the page
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: Column(
              children: [
                IconButton(
                  icon: Image.asset('assets/images/musik.png',
                      width: 25, height: 25),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  splashRadius: 20,
                  color: Colors.transparent, // No background
                ),
                const SizedBox(height: 10),
                IconButton(
                  icon: Image.asset('assets/images/aa.png',
                      width: 25, height: 25),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  splashRadius: 20,
                  color: Colors.transparent, // No background
                ),
                const SizedBox(height: 10),
                IconButton(
                  icon: Image.asset('assets/images/memoji.png',
                      width: 25, height: 25),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  splashRadius: 20,
                  color: Colors.transparent, // No background
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
