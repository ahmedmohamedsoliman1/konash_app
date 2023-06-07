import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {

  String title ;
  String subTitle ;
  String image ;
  TextStyle titleStyle ;
  TextStyle subTitleStyle ;


  PageViewWidget ({required this.title , required this.subTitle
    , required this.image , required this.titleStyle ,
    required this.subTitleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Image(image: AssetImage (image ) , height:
          MediaQuery.of(context).size.height*0.4,),
        ) ,
        SizedBox(height:MediaQuery.of(context).size.height*0.05,),
        Text(title , style: titleStyle, textAlign: TextAlign.center,) ,
        SizedBox(height:MediaQuery.of(context).size.height*0.02,),
        Text(subTitle , style: subTitleStyle,textAlign: TextAlign.center,)
      ],
    );
  }
}