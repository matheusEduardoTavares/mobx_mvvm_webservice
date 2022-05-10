import 'package:flutter/material.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/view/widgets/title_widget.dart';

class RowSpecificNameFieldWidget extends StatelessWidget {
  const RowSpecificNameFieldWidget({ 
    required this.title,
    required this.value,
    Key? key 
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleWidget(
          title: title,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}