import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditation_app/models/models.dart';

class AudioPlayerProvider extends ChangeNotifier {
  final AudioPlayer audioPlayer = AudioPlayer();
  int? playingIndex;

  List<Item> items = [
    Item(name: "Forest", imagePath: "assets/images/forest.jpeg", audioPath: "assets/audios/forest.mp3"),
    Item(name: "Night", imagePath: "assets/images/night.jpeg", audioPath: "assets/audios/night.mp3"),
    Item(name: "Ocean", imagePath: "assets/images/ocean.jpeg", audioPath: "assets/audios/ocean.mp3"),
    Item(name: "Waterfall", imagePath: "assets/images/waterfall.jpeg", audioPath: "assets/audios/waterfall.mp3"),
    Item(name: "Wind", imagePath: "assets/images/wind.jpeg", audioPath: "assets/audios/wind.mp3"),
  ];

  Future<void> togglePlayPause(int index) async {
    if (playingIndex == index) {
      playingIndex = null;
      await audioPlayer.stop();
    } else {
      await audioPlayer.setAsset(items[index].audioPath);
      audioPlayer.play();
      playingIndex = index;
    }
    notifyListeners();
  }
}
