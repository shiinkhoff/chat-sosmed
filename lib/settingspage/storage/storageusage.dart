import 'package:flutter/material.dart';

class StorageUsage extends StatefulWidget {
  const StorageUsage({super.key});

  @override
  _StorageUsage createState() => _StorageUsage();
}

class _StorageUsage extends State<StorageUsage> {
  final Map<String, double> cacheSizes = {
    'Image': 1, // GB
    'Document': 22.41, // KB
    'Sticker': 100, // MB
    'Video': 2.9, // GB
    'Audio': 10, // KB
    'Music': 450, // MB
  };

  final Map<String, bool> selectedCache = {
    'Image': true,
    'Document': false,
    'Sticker': false,
    'Video': true,
    'Audio': false,
    'Music': false,
  };

  double get selectedCacheSize {
    double totalSize = 0;
    selectedCache.forEach((key, value) {
      if (value) {
        totalSize += _convertToGB(cacheSizes[key]!, key);
      }
    });
    return totalSize;
  }

  double _convertToGB(double size, String key) {
    switch (key) {
      case 'Document':
      case 'Audio':
        return size / (1024 * 1024);
      case 'Sticker':
      case 'Music':
        return size / 1024;
      default:
        return size;
    }
  }

  String _formatSize(double size, String key) {
    switch (key) {
      case 'Document':
        return '${size.toStringAsFixed(2)} KB';
      case 'Audio':
        return '${size.toStringAsFixed(0)} KB';
      case 'Sticker':
      case 'Music':
        return '${size.toStringAsFixed(0)} MB';
      default:
        return '${size.toStringAsFixed(1)} GB';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF3771C8)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text(
            'Storage Usage',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 90,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select to clear cache',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF545353),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: 380,
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16.0, bottom: 30.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...cacheSizes.keys.map((key) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCache[key] = !selectedCache[key]!;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selectedCache[key]!
                                      ? const Color(0xFFFD8E4F)
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 110, 110, 110),
                                    width: 1.5,
                                  ),
                                ),
                                width: 18,
                                height: 18,
                                child: selectedCache[key]!
                                    ? const Icon(
                                        Icons.check,
                                        size: 15,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              key,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                            const Spacer(),
                            Text(
                              _formatSize(cacheSizes[key]!, key),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.grey, thickness: 1),
                      ],
                    );
                  }).toList(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      width: 320,
                      height: 37,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFD8E4F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 24,
                                child: Container(
                                  width: 350,
                                  height: 120,
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Are you sure want to delete selected\ncache?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Divider(
                                          color: Colors.grey, thickness: 1),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              foregroundColor: Colors.black,
                                            ),
                                            child: const Text('Batal'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              'Oke',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          'Delete selected cache ${selectedCacheSize.toStringAsFixed(2)} GB',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0, left: 24, right: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'All media will stay in the Tatalk cloud and can be\nre-downloaded if you need them again.',
                  style: TextStyle(fontSize: 13, color: Color(0xFF545353)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
