import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/core/app_colors.dart';

class MoreWidget extends StatelessWidget {

  IconData avatarIcon ;
  String title ;
  Function onPressed ;

  MoreWidget ({required this.title , required this.avatarIcon , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(avatarIcon , color: Colors.white,),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                Text (title , style: Theme.of(context).textTheme.bodyLarge!.
                copyWith(color: Colors.black , fontSize: 18),),
              ],
            ),
            Icon(Icons.arrow_forward_ios , color: AppColors.primaryColor,),
          ],
        ),
      ),
    );
  }
}