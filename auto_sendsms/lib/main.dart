import 'dart:async';

import 'package:auto_sendsms/sendmsg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp/flutter_otp.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_share/whatsapp_share.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OTP(),
    );
  }
}

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {

  Future<void> share() async {
    await WhatsappShare.share(
      text: 'Example share text',
      linkUrl: 'https://flutter.dev/',
      phone: '919488635735',
    );
  }

  openWhatsapp() {
    FlutterOpenWhatsapp.sendSingleMessage("919087187087", "Hello");
  }

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+919087187087',
      text: "Hey! I'm inquiring about the apartment listing",
    );
    await launch('$link');
  }

  FlutterOtp otp = FlutterOtp();
  int minnumber = 1000;
  int maxnumber = 6000;
  String countrycode = "+91";

  funcotp() {
    otp.sendOtp(
        '9884164415',
        'Hello Sir',
        minnumber,
        maxnumber,
        countrycode);
  }

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 15), (Timer t) async => await launch("https://wa.me/918667285563?text=Hello"));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


