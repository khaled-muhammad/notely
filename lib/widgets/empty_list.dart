import 'package:flutter/material.dart';

import 'movable.dart';
import './gradient_icon.dart';

class EmptyList extends StatelessWidget {
  final String title;
  final IconData icon;
  final Gradient gradient;

  const EmptyList({required this.title, required this.icon, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Movable(
          endOffset: const Offset(0.0, -0.1),
          effect: Curves.easeInQuad,
          duration: const Duration(seconds: 2),
          child: Transform.translate(
            offset: Offset(0, -85),
            child: GradientIcon(
              icon,
              MediaQuery.of(context).size.width*0.30,
              gradient,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -85),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white38),
          ),
        ),
      ],
    );
  }
}