// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ButtonTest extends StatelessWidget {
  String test;
  Color color;
  bool icon;
  VoidCallback onTap;
  ButtonTest({
    super.key,
    required this.color,
    required this.test,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * .7,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: icon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.lock,
                    size: 24,
                    color: Colors.white,
                  ),
                  Text(
                    test,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: Colors.white,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      test,
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: Colors.white,
                  ),
                ],
              ),
      ),
    );
  }
}
