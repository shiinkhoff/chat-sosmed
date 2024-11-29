import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class DataUsage extends StatelessWidget {
  // Data grafik
  final Map<String, double> dataMap = {
    "Media": 10,
    "Message": 2.1,
    "Story": 2,
    "Calls": 3,
    "Music": 5,
    "Document": 4,
  };

  // Daftar warna grafik
  final List<Color> colorList = [
    const Color(0xFFFD8E4F),
    const Color(0xFF3771C8),
    const Color(0xFF524F4F),
    const Color(0xFFFF0000), //()
    const Color(0xFFD89AD1),
    const Color(0xFF97552F),
  ];

  DataUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            'Data Usage',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 60,
                centerText: "36.3 GB",
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: false,
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: false,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildDataTile('Media', '4.7 GB', '5 GB', 'images/media.png',
                    const Color(0xFFFD8E4F)),
                _buildDataTile('Message', '850 MB', '2.1 GB',
                    'images/message.png', const Color(0xFF3771C8)),
                _buildDataTile('Story', '200 MB', '9.3 GB', 'images/story.png',
                    const Color(0xFF524F4F)),
                _buildDataTile('Calls', '1.2 GB', '3 GB', 'images/calls.png',
                    const Color(0xFFFF0000)),
                _buildDataTile('Music', '25.1 MB', '50 MB', 'images/music.png',
                    const Color(0xFFD89AD1)),
                _buildDataTile('Document', '1.8 GB', '150 MB',
                    'images/documen.png', const Color(0xFF97552F)),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //Logika tombol reset
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
                              'Are you sure want to reset statistics?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Divider(color: Colors.grey, thickness: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFD8E4F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(300, 40),
              ),
              child: const Text(
                'Reset statistics',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataTile(String title, String sent, String received,
      String imagePath, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: 200,
        height: 45,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // image
            Image.asset(
              imagePath,
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 15),
            ),
            const Spacer(),
            // row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text("Terkirim\n $sent",
                        style: const TextStyle(
                            fontSize: 8, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    const Icon(Icons.arrow_upward, size: 12),
                  ],
                ),
                const SizedBox(width: 25),
                Row(
                  children: [
                    Text("Diterima\n $received",
                        style: const TextStyle(
                            fontSize: 8, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    const Icon(Icons.arrow_downward, size: 12),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
