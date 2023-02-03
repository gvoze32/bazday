import 'package:bazday/pages/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse(
    'https://open.spotify.com/playlist/2xz1ALiYDO4IdDidETzgNZ?si=289e01a2db5a4f9b&nd=1');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
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
                            height: 15,
                          ),
                          Column(
                            children: [
                              Text(
                                "TICKET",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Birthday Celebration",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 300,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(200, 150),
                                  bottomRight: Radius.elliptical(200, 150)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/illust.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Divider(
                          //   color: Colors.grey,
                          // ),
                          SizedBox(
                            height: 45,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Center(
                                      child: Text(
                                        '''Bazlin's Turning
               20''',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  height: 115,
                                  child: VerticalDivider(
                                    color: Colors.white,
                                    width: 1,
                                    thickness: 2,
                                  )),
                              Column(
                                children: [
                                  Text(
                                    "DATE",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "18",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: HexColor("#B3A2CA"),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "02",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: HexColor("#B3A2CA"),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "23",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: HexColor("#B3A2CA"),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: Center(
                                          child: Text(
                                            "DD",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        width: 30,
                                        height: 30,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        child: Center(
                                          child: Text(
                                            "MM",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        width: 30,
                                        height: 30,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        child: Center(
                                          child: Text(
                                            "YY",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        width: 30,
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                  height: 115,
                                  child: VerticalDivider(
                                    color: Colors.white,
                                    width: 1,
                                    thickness: 2,
                                  )),
                              Column(
                                children: [
                                  Text(
                                    "SCAN OR\nCLICK ME",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/qr.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      _launchUrl();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
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
                        child: Text(
                          "GET STARTED",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor("#BD6EC3"),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.to(FirstPage());
                    }),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 180,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                ),
                Expanded(
                  child: DottedLine(
                    dashColor: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 640,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25.8,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 25.8,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 560,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25.8,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 25.8,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
