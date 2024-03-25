import 'package:englishcoach/domain/export/export.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserMcqQuestionsOptions()),
        ChangeNotifierProvider(create: (context) => UserproviderPassword()),
        ChangeNotifierProvider(create: (context) => UserProviderTest()),
        ChangeNotifierProvider(create: (context) => UserProviderTest2()),
        ChangeNotifierProvider(create: (context) => UserproviderModules()),
        ChangeNotifierProvider(create: (context) => UserProviderExercises()),
        ChangeNotifierProvider(create: (context) => UserproviderFinalTest()),
        ChangeNotifierProvider(create: (context) => UserproviderTopicTest()),
        ChangeNotifierProvider(create: (context) => UserProviderTrail()),
      ],
      child: const RootScreen(),
    ),
  );
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: ResponsiveDashBoard(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
