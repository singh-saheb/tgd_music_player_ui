

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MyAudio extends ChangeNotifier{

  Duration totalDuration;
  Duration position;
  String audioState;

  MyAudio(){
    initAudio();
  }

  AudioPlayer audioPlayer = AudioPlayer();

  initAudio(){
    audioPlayer.onDurationChanged.listen((updatedDuration) {
        totalDuration = updatedDuration;
        notifyListeners();
    });

    audioPlayer.onAudioPositionChanged.listen((updatedPosition) {
        position = updatedPosition;
        notifyListeners();
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if(playerState == AudioPlayerState.STOPPED)
        audioState = "Stopped";
      if(playerState==AudioPlayerState.PLAYING)
        audioState = "Playing";
      if(playerState == AudioPlayerState.PAUSED)
        audioState = "Paused";
      notifyListeners();
    });
  }

  playAudio(){
    audioPlayer.play('https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4');
  }


  pauseAudio(){
    audioPlayer.pause();
  }

  stopAudio(){
    audioPlayer.stop();
  }

  seekAudio(Duration durationToSeek){
    audioPlayer.seek(durationToSeek);
  }



}