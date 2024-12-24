import 'package:flutter/material.dart';

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Items for the list
  final List<String> items = [
    "https://th.bing.com/th/id/OIP.9jTwIgGsjJdeZESd2rZLAAHaFC?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/R.825bc4d47245fbfd76fd99c554320a4a?rik=GxIYjSgQkds8BQ&riu=http%3a%2f%2fssorkc.com%2fwp-content%2fuploads%2f2016%2f04%2fknee-pain.jpg&ehk=6zvblMfYqCvzPRoImQV%2bPz419%2b7yiB8IMxLyiptMFLw%3d&risl=1&pid=ImgRaw&r=0",
    "https://th.bing.com/th/id/OIP.1sJWq0gijPt50YRXvRL48gHaEK?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/R.fdddbf5d106a4545d034b0b9ed53b360?rik=p6SqDPKygKxKeA&pid=ImgRaw&r=0",
    "https://th.bing.com/th/id/R.434407a19796bfd184ab7cabb8ee17b0?rik=TlzXOWXEL3Nogg&pid=ImgRaw&r=0",   "https://th.bing.com/th/id/OIP.9jTwIgGsjJdeZESd2rZLAAHaFC?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/R.825bc4d47245fbfd76fd99c554320a4a?rik=GxIYjSgQkds8BQ&riu=http%3a%2f%2fssorkc.com%2fwp-content%2fuploads%2f2016%2f04%2fknee-pain.jpg&ehk=6zvblMfYqCvzPRoImQV%2bPz419%2b7yiB8IMxLyiptMFLw%3d&risl=1&pid=ImgRaw&r=0",
    "https://th.bing.com/th/id/OIP.1sJWq0gijPt50YRXvRL48gHaEK?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/R.fdddbf5d106a4545d034b0b9ed53b360?rik=p6SqDPKygKxKeA&pid=ImgRaw&r=0",
    "https://th.bing.com/th/id/R.434407a19796bfd184ab7cabb8ee17b0?rik=TlzXOWXEL3Nogg&pid=ImgRaw&r=0",
  ];

  // Titles for each item
  final List<String> titles = [
    "Neck pain got you down?", "Knee Pain Solutions", "Back Pain Help", "Wrist Pain Recovery", "Foot pain making every step a challenge",
    "Neck pain got you down?", "Knee Pain Solutions", "Back Pain Help", "Wrist Pain Recovery", "Foot pain making every step a challenge",
  ];

  // Descriptions for each item
  final List<String> descriptions = [
    "It can be a real pain (pun intended)! Physical therapy can help relieve tension, improve posture, and get you back to doing the things you love. Say goodbye to discomfort and hello to a pain-free neck! 💪 #PhysicalTherapy #NeckPain #PostureFix",
    " Whether it's arthritis, an injury, or just wear and tear, physical therapy can help reduce pain and improve your knee function. Don’t let knee pain keep you from your favorite activities! 🏃‍♂️ #KneePain #PhysicalTherapy #StrongerKnees",
    "Back pain got you bending over backwards? Don’t let it rule your life! Physical therapy can help strengthen your core, improve posture, and alleviate pain. Let’s get you standing tall again. 💪 #BackPainRelief #PhysicalTherapy #StrongerBack",
    "Wrist pain putting a strain on your daily activities? Carpal tunnel syndrome can be a real pain. Physical therapy can help reduce pain, numbness, and tingling in your hands. Take control of your wrist health today! 🖐️ #WristPain #CarpalTunnel #PhysicalTherapy",
    "Foot pain making every step a challenge? Whether it’s plantar fasciitis or another condition, physical therapy can help alleviate pain and improve your gait. Let’s get you walking pain-free again! 👣 #FootPain #PlantarFasciitis #PhysicalTherapy",
    "It can be a real pain (pun intended)! Physical therapy can help relieve tension, improve posture, and get you back to doing the things you love. Say goodbye to discomfort and hello to a pain-free neck! 💪 #PhysicalTherapy #NeckPain #PostureFix",
    " Whether it's arthritis, an injury, or just wear and tear, physical therapy can help reduce pain and improve your knee function. Don’t let knee pain keep you from your favorite activities! 🏃‍♂️ #KneePain #PhysicalTherapy #StrongerKnees",
    "Back pain got you bending over backwards? Don’t let it rule your life! Physical therapy can help strengthen your core, improve posture, and alleviate pain. Let’s get you standing tall again. 💪 #BackPainRelief #PhysicalTherapy #StrongerBack",
    "Wrist pain putting a strain on your daily activities? Carpal tunnel syndrome can be a real pain. Physical therapy can help reduce pain, numbness, and tingling in your hands. Take control of your wrist health today! 🖐️ #WristPain #CarpalTunnel #PhysicalTherapy",
    "Foot pain making every step a challenge? Whether it’s plantar fasciitis or another condition, physical therapy can help alleviate pain and improve your gait. Let’s get you walking pain-free again! 👣 #FootPain #PlantarFasciitis #PhysicalTherapy",
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(width, height),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40,left: 15,right: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Importance of Physical Therapy',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),

                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 72.0,
                                width: 72.0,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withAlpha(70),
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 2.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      items[index],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    titles[index],
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    descriptions[index],
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}