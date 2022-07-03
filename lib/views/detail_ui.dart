import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailUI extends StatefulWidget {
  // const DetailUI({Key? key}) : super(key: key);

  String? name;
  String? mobile;
  String? mobile2;
  String? image;
  String? detail;
  String? facebook;

  DetailUI({
    this.name,
    this.mobile,
    this.mobile2,
    this.image,
    this.detail,
    this.facebook,
  });

  @override
  State<DetailUI> createState() => _DetailUIState();
}

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

class _DetailUIState extends State<DetailUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          'รายละเอียด',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                widget.image!,
                height: 300.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 80.0,
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          widget.name!,
                        ),
                        subtitle: Text(
                          widget.detail!,
                        ),
                        leading: Icon(
                          FontAwesomeIcons.starOfLife,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          _makePhoneCall(
                            widget.mobile!,
                          );
                        },
                        title: Text(
                          widget.mobile!,
                        ),
                        leading: Icon(
                          color: Colors.red[600],
                          FontAwesomeIcons.phoneFlip,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
