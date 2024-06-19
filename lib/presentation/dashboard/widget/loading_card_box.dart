import 'package:flutter/material.dart';

class LoadingCardBox extends StatelessWidget {
  const LoadingCardBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      margin: const EdgeInsets.only(top: 5),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: CircularProgressIndicator(
            color: Colors.green,
          ))
        ],
      ),
    );
  }
}
