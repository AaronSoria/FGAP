import 'package:flutter/material.dart';

class CustomDrawer extends Drawer {
  CustomDrawer({Key key}):
  super(key:key,
  child: new ListView(children: <Widget>[new DrawerHeader(
                child: new Text("Drawer Header"),
                decoration: new BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              new Text("Item 1"),
              new Text("Item 2"),
              new Text("Item 3"),
              new Text("Item 4"),
              new Text("Item 5"),
              new Text("Item 6"),
              ],
            )
  );
}