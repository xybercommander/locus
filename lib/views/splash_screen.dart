import 'package:flutter/material.dart';
import 'package:locus/services/news_api.dart';
import 'package:locus/views/home_page.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  Future<void> callApi() async {
    await NewsApi().getTopHeadlines();
    await NewsApi().getNationNews();
    await NewsApi().getGlobalNews();
    // await NewsApi().getTechNews();
  }

  void loadNews() async {
    await callApi();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, PageTransition(
        child: HomePage(),
        type: PageTransitionType.bottomToTop,
        duration: Duration(milliseconds: 300)
      ));
    });
  }

  @override
  void initState() {    
    super.initState();    
    loadNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(        
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/newspaper_loading.json'),
            Text(
              'Locus', 
              style: TextStyle(
                fontSize: 50, 
                fontFamily: 'RobotoSlab-ExtraBold'
              ),
            ),
          ],
        ),
      )
    );
  }
}