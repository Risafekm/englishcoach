import 'package:englishcoach/application/provider/user_count_provider.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/domain/export/export.dart';
import 'package:englishcoach/presentation/dashboard/widget/custom_card_box.dart';
import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

class TabViewDashBoard extends StatelessWidget {
  const TabViewDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        backgroundColor: AppColors.accentColor1,
        centerTitle: true,
        title: Text(
          'English Coach',
          style: AppStyles.appBarTitle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.power_settings_new_rounded,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: Provider.of<UserProviderTrail>(context, listen: false)
                      .getCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Provide appropriate API data here
                      int count =
                          snapshot.data as int; // Assuming count is an integer
                      return CustomCardBox(
                        title: 'Modules Trial',
                        count: count,
                        icons: Icons.draw,
                      );
                    }
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FutureBuilder(
                  future:
                      Provider.of<UserproviderModules>(context, listen: false)
                          .getCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Provide appropriate API data here
                      int count =
                          snapshot.data as int; // Assuming count is an integer
                      return CustomCardBox(
                        title: 'Modules',
                        count: count,
                        icons: Icons.draw,
                      );
                    }
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FutureBuilder(
                  future: Provider.of<UserCountProvider>(context, listen: false)
                      .getCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Provide appropriate API data here
                      int count =
                          snapshot.data as int; // Assuming count is an integer
                      return CustomCardBox(
                        title: 'Modules',
                        count: count,
                        icons: Icons.account_circle,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
