import 'package:flutter/material.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                scale: 1,
                image: AssetImage("assets/LogoApp.jpg"),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
