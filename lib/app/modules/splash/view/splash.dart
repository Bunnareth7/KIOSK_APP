import 'package:flutter/material.dart';
import 'package:kiosk_app/app/modules/language/view/language_view.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      LanguageView.open();
    });
    return Scaffold(
      body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
          SizedBox(height: 250),
           const SizedBox(
            height: 200,
            width: 200,
            child: Image(image: AssetImage('assets/images/koi.png'))),
            SizedBox(height: 300),
            SizedBox(
                  width: 80,
                  height: 30,
                  child: Image.asset(
                    "assets/images/MONOKOM_LOGO1.png",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.business, size: 30),
                      );
                    },
                  ),
                ),
         ],
       ),
      ),
    );
  }
}