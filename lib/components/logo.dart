import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'SHMOT',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff603F26),
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
