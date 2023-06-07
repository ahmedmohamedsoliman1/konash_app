import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/core/app_strings.dart';
import 'package:konash_app/features/cashBook/presentation/screens/cashBook_screen.dart';
import 'package:konash_app/features/creditBook/presentation/screens/creditBook_screen.dart';
import 'package:konash_app/features/more/presentation/screens/more_screen.dart';

class MajorScreen extends StatefulWidget {

  static const String routeName = AppStrings.major ;

  @override
  State<MajorScreen> createState() => _MajorScreenState();
}

class _MajorScreenState extends State<MajorScreen> {

  int selectedIndex = 0 ;
  List <Widget> tabsList = [CreditBookScreen() , CashBookScreen() , MoreScreen()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       bottomNavigationBar: BottomNavigationBar (
         onTap: (index){
           selectedIndex = index ;
           setState(() {

           });
         },
         currentIndex: selectedIndex,
         items: [
           BottomNavigationBarItem(icon: Icon(Icons.credit_card) ,
           label: "Creditbook"),
           BottomNavigationBarItem(icon: Icon(Icons.credit_score_sharp) ,
               label: "Cashbook"),
           BottomNavigationBarItem(icon: Icon(Icons.more) ,
               label: "More"),
         ],

       ),
        body: tabsList[selectedIndex],
      ),
    );
  }
}