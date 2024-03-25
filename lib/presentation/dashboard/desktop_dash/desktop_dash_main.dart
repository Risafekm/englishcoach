// ignore_for_file: must_be_immutable

import 'package:englishcoach/presentation/dashboard/widget/custom_card_box.dart';
import 'package:flutter/material.dart';

class DashBoardDesktop extends StatelessWidget {
  DashBoardDesktop({super.key});

  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            const SizedBox(width: 5),
            CustomCardBox(
              title: 'Modules',
              count: '34',
            ),
            const SizedBox(width: 15),
            CustomCardBox(
              title: 'Trial Modules',
              count: '12',
            ),
            const SizedBox(width: 15),
            CustomCardBox(
              title: 'Users',
              count: '4',
            ),
          ],
        ),
      ),
    );
  }

  // Widget centerArea() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const SizedBox(height: 10),
  //       CustomCard(
  //         text: 'No Of Questions',
  //         icon: Icons.arrow_forward_ios,
  //         ontap: () {},
  //       ),
  //       CustomCard(
  //         text: 'No of Students',
  //         icon: Icons.arrow_forward_ios,
  //         ontap: () {},
  //       ),
  //       CustomCard(
  //         text: 'No of Answers',
  //         icon: Icons.arrow_forward_ios,
  //         ontap: () {},
  //       ),
  //       CustomCard(
  //         text: 'List toppers',
  //         icon: Icons.arrow_forward_ios,
  //         ontap: () {},
  //       ),
  //     ],
  //   );
  // }
}
