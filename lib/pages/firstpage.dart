import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = true;

  @override
  void initState() {
    assetsAudioPlayer.open(Audio("assets/sounds/pamungkas.mp3"),
        autoStart: false);

    assetsAudioPlayer.isPlaying.listen((event) {
      if (mounted) {
        setState(() {
          isPlaying = event;
        });
      }
    });

    assetsAudioPlayer.onReadyToPlay.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration?.duration ?? Duration.zero;
        });
      }
    });

    assetsAudioPlayer.currentPosition.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });

    super.initState();
  }

  @override
  Future<void> dispose() async {
    await assetsAudioPlayer.stop();
    super.dispose();
  }

  Widget slider() {
    return Container(
      width: 270,
      child: Slider.adaptive(
          activeColor: Colors.white,
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: duration.inSeconds.toDouble(),
          onChanged: (value) async {
            await assetsAudioPlayer.seek(Duration(seconds: value.toInt()));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        title: Text("Bazday",
            style:
                GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(color: Colors.white),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.grey[50],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 20,
            bottom: 16,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor("#51396D"),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/cover.jpg"),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: Offset(10, 10), // Shadow position
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Row(
                            children: [
                              Text(
                                "Happy Birthday To You",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Pamungkas",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                slider(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                iconSize: 40.0,
                                color: Colors.white,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.skip_previous,
                                ),
                              ),
                              IconButton(
                                iconSize: 55.0,
                                color: Colors.white,
                                onPressed: () async {
                                  await assetsAudioPlayer.playOrPause();
                                },
                                icon: isPlaying
                                    ? const Icon(
                                        Icons.pause_circle,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.play_circle,
                                        color: Colors.white,
                                      ),
                              ),
                              IconButton(
                                iconSize: 40.0,
                                color: Colors.white,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.skip_next,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: HexColor("#BD6EC3"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
