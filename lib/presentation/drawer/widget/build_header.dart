import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:flutter/material.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaPFJC-r3YeVbBL0ydVAMARkzcEliCloXfLw&usqp=CAU'),
          ),
          const SizedBox(height: 10),
          Text(
            'Hello ,Mariya John',
            style: AppStyles.drawerText,
          ),
        ],
      ),
    );
  }
}
