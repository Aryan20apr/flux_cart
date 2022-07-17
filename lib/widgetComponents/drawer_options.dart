import 'package:flutter/material.dart';
class DrawerOptions extends StatelessWidget {
  DrawerOptions({Key? key, required this.name, required this.icon,this.color=Colors.blueAccent})
      : super(key: key);
  String name;
  IconData icon;
  Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //InkWell makes the list title clickable
      onTap: () {},
      child: ListTile(
        title: Text('$name',style: TextStyle(fontSize: 17.0,),),
        leading: Icon(icon,color: color,),
      ),
    );
  }
}
