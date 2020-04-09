import 'package:flutter/material.dart';
import 'package:tgd_music_player/colors.dart';
import 'package:tgd_music_player/playerControls.dart';

import 'albumart.dart';
import 'navbar.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Circular'),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sliderValue = 2;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          NavigationBar(),
          Container(
            height: height / 2.5,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AlbumArt();
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Text(
            'Gidget',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: darkPrimaryColor),
          ),
          Text(
            'The Free Nationals',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: darkPrimaryColor),
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 5,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)
            ),
            child: Slider(
              value: sliderValue,
              activeColor: darkPrimaryColor,
              inactiveColor: darkPrimaryColor.withOpacity(0.3),
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
              min: 0,
              max: 20,
            ),
          ),

          PlayerControls(),

          SizedBox(height: 100,)
        ],
      ),
    );
  }
}
