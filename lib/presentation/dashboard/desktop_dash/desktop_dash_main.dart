// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:englishcoach/presentation/dashboard/widget/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            color: Colors.green,
            child: Row(
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
          color: Theme.of(context).colorScheme.primary,
        ),
        height: 45,
        child: TextField(
          cursorColor: Theme.of(context).colorScheme.tertiary,
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.tertiary,
            fontWeight: FontWeight.w400,
          ),
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
            fillColor: Colors.cyan,
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Theme.of(context).colorScheme.tertiary,
            hintStyle: GoogleFonts.lora(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.tertiary,
            ),
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
