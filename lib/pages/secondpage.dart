import 'package:bazday/pages/homepage.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
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
    super.dispose();
    await assetsAudioPlayer.stop();
    WidgetsBinding.instance.removeObserver(this);
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
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tekan Lagi Untuk Keluar'),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: Text(
                    "HAPPY 20st BIRTHDAY",
                    style: GoogleFonts.jacquesFrancois(fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "Bazlin Fania Farransahad",
                    style: GoogleFonts.jacquesFrancois(fontSize: 12),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 15,
                    width: 15,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/staryellow.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.only(top: 19.5),
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
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/starblue.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              // Container(
              //   height: 15,
              //   width: 15,
              //   margin: EdgeInsets.only(left: 80),
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("assets/icons/starpurple.png"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: GestureFlipCard(
                  animationDuration: const Duration(milliseconds: 300),
                  axis: FlipAxis.vertical,
                  enableController: false,
                  frontWidget: Container(
                    height: 201.6,
                    width: 255.675,
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
                    height: 201.6,
                    width: 255.675,
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
                      width: 150,
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
          ),
        ));
  }
}
