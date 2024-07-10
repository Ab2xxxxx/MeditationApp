import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app/provider/audio_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AudioPlayerProvider>(
          builder: (context, audioProvider, child) {
            return ListView.builder(
              itemCount: audioProvider.items.length,
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
                          audioProvider.items[index].imagePath,
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(audioProvider.items[index].name),
                      leading: IconButton(
                        icon: (audioProvider.playingIndex == index)
                            ? const FaIcon(FontAwesomeIcons.stop)
                            : const FaIcon(FontAwesomeIcons.play),
                        onPressed: () {
                          audioProvider.togglePlayPause(index);
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
