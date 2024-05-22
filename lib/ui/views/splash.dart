import 'package:ecommerce/ui/responsive/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/icons/logo.png',width: 250.w,fit: BoxFit.cover,),
      ),
    );
  }
}
