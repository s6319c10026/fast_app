import 'package:fast_app/models/Call_list.dart';
import 'package:flutter/material.dart';
import 'package:fast_app/views/detail_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  List<PhoneEmcList> phoneemslistInfo = [
    PhoneEmcList(
      name: 'แจ้งเหตุ-เหตุร้าย',
      mobile: '191',
      image: 'assets/images/P1.jpg',
      detail: 'ติดต่อแจ้งเหตุเจ้าหน้าที่ตำรวจ',
    ),
    PhoneEmcList(
      name: 'แจ้งอุบัติเหตุ-เจ็บป่วยฉุกเฉิน',
      mobile: '1669',
      image: 'assets/images/P2.jpg',
      detail: 'ติดต่อแจ้งเหตุเจ้าหน้าที่กู้ภัย',
    ),
    PhoneEmcList(
      name: 'แจ้งเหตุอัคคีภัย-เพลิงไหม้',
      mobile: '199',
      image: 'assets/images/P3.jpg',
      detail: 'ติดต่อแจ้งเหตุเจ้าหน้าที่อัคคีภัย',
    ),
    PhoneEmcList(
      name: 'ตำรวจทางหลวง',
      mobile: '1193',
      image: 'assets/images/P4.jpg',
      detail: 'ติดต่อแจ้งเหตุเจ้าหน้าที่ตำรวจทางหลวง',
    ),
    PhoneEmcList(
      name: 'ตำรวจท่องเที่ยว',
      mobile: '1155',
      image: 'assets/images/P5.jpg',
      detail: 'ติดต่อแจ้งเหตุเจ้าหน้าที่ตำรวจท่องเที่ยว',
    ),
    PhoneEmcList(
      name: 'แจ้งรถหาย',
      mobile: '192',
      image: 'assets/images/P6.jpg',
      detail: 'ติดต่อแจ้งเหตุรถหาย',
      facebook: 'CarLostThailand',
    ),
    PhoneEmcList(
      name: 'สายด่วนจราจร',
      mobile: '1197',
      image: 'assets/images/P7.jpg',
      detail: 'สอบถามเส้นทางและสภาพจราจร',
    ),
    PhoneEmcList(
      name: 'ทางหลวงชนบท',
      mobile: '1146',
      image: 'assets/images/P8.jpg',
      detail: 'ติดต่อเจ้าหน้าที่ทางหลวงชนบท',
    ),
    PhoneEmcList(
      name: 'สายด่วน จส.100',
      mobile: '1137',
      image: 'assets/images/P9.jpg',
      detail: 'ติดต่อเจ้าหน้าที่ จส.100ห',
    ),
    PhoneEmcList(
      name: 'หน่วยแพทย์กู้ชีวิต วชิรพยาบาล',
      mobile: '1554',
      image: 'assets/images/P10.jpg',
      detail: 'ติดต่อเจ้าหน้าที่หน่วยแพทย์กู้ชีวิต วชิรพยาบาล(ทางน้ำ)',
    ),
    PhoneEmcList(
      name: 'หน่วยแพทย์ฉุกเฉิน (กทม.)',
      mobile: '1646',
      image: 'assets/images/P11.jpg',
      detail: 'ติดต่อเจ้าหน้าที่แพทย์ฉุกเฉิน (กทม.)',
    ),
    PhoneEmcList(
      name: 'มูลนิธิร่วมด้วยช่วยกัน',
      mobile: '1677',
      image: 'assets/images/P12.jpg',
      detail:
          'ติดต่อเจ้าหน้าที่มูลนิธิร่วมด้วยช่วยกัน-ช่วยเหลือทุกความเดือนร้อน ',
    ),
  ];

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: Text(
          'โทรสายด่วนฉุกเฉิน Emergency Call',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset(
                'assets/images/fastcall.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailUI(
                            name: phoneemslistInfo[index].name!,
                            mobile: phoneemslistInfo[index].mobile!,
                            image: phoneemslistInfo[index].image!,
                            detail: phoneemslistInfo[index].detail!,
                          ),
                        ),
                      );
                    },
                    leading: Text(
                      phoneemslistInfo[index].mobile!,
                    ),
                    title: Text(
                      phoneemslistInfo[index].name!,
                    ),
                    trailing: Column(
                      children: [
                        Container(
                          child: IconButton(
                            color: Colors.red[600],
                            icon: Icon(FontAwesomeIcons.phoneFlip),
                            onPressed: () {
                              _makePhoneCall(
                                phoneemslistInfo[index].mobile!,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: phoneemslistInfo.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
