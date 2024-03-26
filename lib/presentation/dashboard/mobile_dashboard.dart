import 'package:englishcoach/Application/Provider/user_provider_password_update.dart';
import 'package:englishcoach/Application/Provider/user_provider_trail_modules.dart';
import 'package:englishcoach/Application/Provider/userprovider_modules.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/dashboard/widget/custom_card_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../drawer/drawer.dart';

class MobileViewDashBoard extends StatelessWidget {
  const MobileViewDashBoard({Key? key});

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
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Provide appropriate API data here
                      int count =
                          snapshot.data as int; // Assuming count is an integer
                      return CustomCardBox(
                        title: 'Modules Trial',
                        count: count,
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future:
                      Provider.of<UserproviderModules>(context, listen: false)
                          .getCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Provide appropriate API data here
                      int count =
                          snapshot.data as int; // Assuming count is an integer
                      return CustomCardBox(
                        title: 'Modules',
                        count: count,
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future:
                      Provider.of<UserproviderPassword>(context, listen: false)
                          .getCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Provide appropriate API data here
                      int count =
                          snapshot.data as int; // Assuming count is an integer
                      return CustomCardBox(
                        title: 'User',
                        count: count,
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
