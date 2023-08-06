import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key,required this.name}):super(key: key);
final String name;
// final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: Icon(Icons.person),
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}