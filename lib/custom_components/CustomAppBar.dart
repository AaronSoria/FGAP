import 'package:flutter/material.dart';

class CustomAppBar extends AppBar{
  CustomAppBar({Key key, Widget title, bool isBack, VoidCallback onLeadingPressed }): 
  super(key:key, title: title, 
  leading: new IconButton(
    icon: (!isBack) ? new Icon(Icons.menu) : new Icon(Icons.arrow_back),
    onPressed: onLeadingPressed,
  ), 
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(30)
    )
  ));
}