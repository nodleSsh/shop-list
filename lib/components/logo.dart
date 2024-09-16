import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Shmot',
          style: TextStyle(
            fontSize: 20,
            color: Colors.brown,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
