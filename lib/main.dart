import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgd_music_player/colors.dart';
import 'package:tgd_music_player/model/myaudio.dart';
import 'package:tgd_music_player/playerControls.dart';
import 'albumart.dart';
import 'navbar.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Circular'),
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(
        create: (_)=>MyAudio(),
        child: HomePage()),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sliderValue = 2;


  Map audioData = {
    'image':'https://thegrowingdeveloper.org/thumbs/1000x1000r/audios/quiet-time-photo.jpg',
    'url':'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4'
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          NavBar(),
          Container(
            margin: EdgeInsets.only(left: 40),
            height: height / 2.5,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AlbumArt();
              },
              itemCount: 1,
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
         Column(
              children: [
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 5,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)
                  ),
                  child: Consumer<MyAudio>(
                    builder:(_,myAudioModel,child)=> Slider(
                      value: myAudioModel.position==null? 0 : myAudioModel.position.inMilliseconds.toDouble() ,
                      activeColor: darkPrimaryColor,
                      inactiveColor: darkPrimaryColor.withOpacity(0.3),
                      onChanged: (value) {

                        myAudioModel.seekAudio(Duration(milliseconds: value.toInt()));

                      },
                      min: 0,
                      max:myAudioModel.totalDuration==null? 20 : myAudioModel.totalDuration.inMilliseconds.toDouble() ,
                    ),
                  ),
                ),
              ],

          ),

          PlayerControls(),

          SizedBox(height: 100,)
        ],
      ),
    );
  }
}
