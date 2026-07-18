import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 10),
                SvgPicture.asset('assets/icons/Arrow1.svg'
                , width: 24,
                  height: 24,),
                Spacer(),

                SvgPicture.asset('assets/icons/Profile.svg',
                 width: 24,
                  height: 24,),
                SizedBox(width: 10),
                Text('Member',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                SizedBox(width: 10),
                SvgPicture.asset('assets/icons/ActionIcon.svg',
                 width: 24,
                  height: 24,),
                SizedBox(width: 10),
                Text('Coupon',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                SizedBox(width: 10),
              ],
            ),
            
          ],

        ),
      ),
    );
  }
}
