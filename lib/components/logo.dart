import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: const TextSpan(
            text: 'MY',
            style: TextStyle(
              color: Color.fromARGB(255, 84, 161, 203),
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'list',
                style: TextStyle(
                  color: Color.fromARGB(255, 84, 161, 203),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        // const Text('MYSHOP LIST', style: TextStyle(
        //   color: Color.fromARGB(255, 84, 161, 203),
        //   fontSize: 20,
        //   fontWeight: FontWeight.w700
        // ),)
      ],
    );
  }
}