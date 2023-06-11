import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef KeyBoardType = TextInputType?;
typedef Validate = String? Function(String?)?;
typedef OnChanged = void Function(String)? ;
class TextEditWidget extends StatelessWidget {

  String hint ;

  KeyBoardType type ;

  Validate validator ;

  OnChanged onChanged ;

  TextEditingController controller ;
  TextEditWidget ({required this.hint , required this.type
    , required this.validator , required this.controller ,
  required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: type,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint ,
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}