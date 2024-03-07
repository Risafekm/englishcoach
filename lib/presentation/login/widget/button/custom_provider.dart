import 'package:englishcoach/Application/Provider/user_provider_password_update.dart';
import 'package:englishcoach/presentation/login/widget/button/FormField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomPovider extends StatefulWidget {
  const CustomPovider({super.key});

  @override
  State<CustomPovider> createState() => _CustomPoviderState();
}

class _CustomPoviderState extends State<CustomPovider> {
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<UserproviderPassword>(
      create: (_) => UserproviderPassword(),
      builder: (context, child) {
        return LoginForm();
      },
    );
  }
}
