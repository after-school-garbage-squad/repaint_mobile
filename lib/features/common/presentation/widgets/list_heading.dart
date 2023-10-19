import 'package:flutter/material.dart';

class ListHeading extends StatelessWidget {
  const ListHeading(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
