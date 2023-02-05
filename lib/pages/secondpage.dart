import 'package:bazday/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with WidgetsBindingObserver {
  final assetsAudioPlayer = AssetsAudioPlayer();

  late AppLifecycleState appLifecycle;

  didChangeAppLifecycleState(AppLifecycleState state) async {
    appLifecycle = state;
    setState(() {});

    if (state == AppLifecycleState.paused) {
      await assetsAudioPlayer.stop();
    }
  }

  @override
  void initState() {
    assetsAudioPlayer.open(Audio("assets/sounds/boypablo.mp3"),
        autoStart: true);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> dispose() async {
    await assetsAudioPlayer.stop();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 35,
          title: Text("Bazday",
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Center(
                child: Text(
                  "HAPPY 20st BIRTHDAY",
                  style: GoogleFonts.jacquesFrancois(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Bazlin Fania Farransahad",
                  style: GoogleFonts.jacquesFrancois(fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/staryellow.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 225,
                  width: 225,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/vikibaz.jpg"),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("#D7D0F1"),
                        offset: Offset(-9, -2), // Shadow position
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/starblue.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
              width: 20,
              margin: EdgeInsets.only(left: 80),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/starpurple.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: GestureFlipCard(
                animationDuration: const Duration(milliseconds: 300),
                axis: FlipAxis.vertical,
                enableController: false,
                frontWidget: Container(
                  height: 252,
                  width: 319.59375,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/vhs.png"),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("#D7D0F1"),
                        offset: Offset(5, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backWidget: Container(
                  height: 252,
                  width: 319.59375,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/wish.png"),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("#D7D0F1"),
                        offset: Offset(5, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Center(
              child: InkWell(
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(3, 4), // Shadow position
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: Container(
                        child: Text(
                          "HOME",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor("#BD6EC3"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.offAll(HomePage());
                  }),
            ),
          ],
        ));
  }
}
