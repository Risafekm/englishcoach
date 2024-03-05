// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/dashboard/widget/custom_card_widget.dart';
import 'package:flutter/material.dart';
class DashBoardDesktop extends StatelessWidget {
  DashBoardDesktop({super.key});

  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          //search bar
          searchBox(context),
          centerArea(),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.accentColor1,
            child: const Row(
              children: [],
            ),
          ),
        ]),
      ),
    );
  }

  //search bar

  Widget searchBox(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:AppColors.accentColor1,
        ),
        height: 45,
        child: TextField(
          cursorColor: AppColors.secondaryColor,
          style:AppStyles.bodyText,
          showCursor: true,
          controller: searchText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 25,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.accentColor1,
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: AppColors.secondaryColor,
            hintStyle:AppStyles.dashboardText
          ),
        ),
      ),
    );
  }

  Widget centerArea() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        CustomCard(
          text: 'No Of Questions',
          icon: Icons.arrow_forward_ios,
          ontap: () {},
        ),
        CustomCard(
          text: 'No of Students',
          icon: Icons.arrow_forward_ios,
          ontap: () {},
        ),
        CustomCard(
          text: 'No of Answers',
          icon: Icons.arrow_forward_ios,
          ontap: () {},
        ),
        CustomCard(
          text: 'List toppers',
          icon: Icons.arrow_forward_ios,
          ontap: () {},
        ),
      ],
    );
  }
}
