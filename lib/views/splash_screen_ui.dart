import 'package:fast_app/views/Home_ui.dart';
import 'package:flutter/material.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({Key? key}) : super(key: key);

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    Future.delayed(
      Duration(
        seconds: 2,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (
            context,
          ) =>
              HomeUI(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange[300],
              radius: 100.0,
              backgroundImage: AssetImage(
                'assets/images/fastcall.jpg',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'โทรสายด่วนฉุกเฉิน',
              style: TextStyle(
                color: Colors.red[500],
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CircularProgressIndicator(
              color: Colors.red,
              strokeWidth: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
