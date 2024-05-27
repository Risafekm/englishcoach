// ignore_for_file: must_be_immutable

import 'package:englishcoach/application/provider/user_count_provider.dart';
import 'package:englishcoach/domain/export/export.dart';
import 'package:englishcoach/presentation/dashboard/widget/custom_card_box.dart';

class DashBoardDesktop extends StatelessWidget {
  DashBoardDesktop({super.key});

  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              FutureBuilder(
                future: Provider.of<UserProviderTrail>(context, listen: false)
                    .getCount(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Provide appropriate API data here
                    int count =
                        snapshot.data as int; // Assuming count is an integer
                    return CustomCardBox(
                      title: 'Trial Modules',
                      count: count,
                      icons: Icons.draw,
                    );
                  }
                },
              ),
              const SizedBox(width: 10),
              FutureBuilder(
                future: Provider.of<UserproviderModules>(context, listen: false)
                    .getCount(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
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
              const SizedBox(width: 10),
              FutureBuilder(
                future: Provider.of<UserCountProvider>(context, listen: false)
                    .getCount(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Provide appropriate API data here
                    int count =
                        snapshot.data as int; // Assuming count is an integer
                    return CustomCardBox(
                      title: 'Users',
                      count: count,
                      icons: Icons.account_circle,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
