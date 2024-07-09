import 'package:flutter/material.dart';
import 'package:meditation_app/models/models.dart';
import 'package:just_audio/just_audio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {

  List<Item> items = [
    Item(name: "Forest", imagePath: "assets/images/forest.jpeg", audioPath: "assets/audios/forest.mp3"),
    Item(name: "Night", imagePath: "assets/images/night.jpeg", audioPath: "assets/audios/night.mp3"),
    Item(name: "Ocean", imagePath: "assets/images/ocean.jpeg", audioPath: "assets/audios/ocean.mp3"),
    Item(name: "Waterfall", imagePath: "assets/images/waterfall.jpeg", audioPath: "assets/audios/waterfall.mp3"),
    Item(name: "Wind", imagePath: "assets/images/wind.jpeg", audioPath: "assets/audios/wind.mp3"),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();
  int? playingIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      items[index].imagePath
                    )
                  ),
                ),
                child: ListTile(
                  title: Text(items[index].name),
                  leading: IconButton(
                    icon: (playingIndex == index) ? const  FaIcon(FontAwesomeIcons.stop): const FaIcon(FontAwesomeIcons.play),
                    onPressed: () async {
                      if (playingIndex == index){

                        setState(() {
                          playingIndex = null;
                        });

                        audioPlayer.stop();

                      } else{
                          await audioPlayer.setAsset(items[index].audioPath);
                          audioPlayer.play();
                          setState(() {
                            playingIndex = index;
                          });
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}