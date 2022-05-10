import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({ 
    required this.title,
    Key? key 
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title:',
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 20,
      ),
    );
  }
}