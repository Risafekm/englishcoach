// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:englishcoach/application/provider/user_provider_payment_coupon.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/domain/model/coupon_model.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class UpdateCoupon extends StatelessWidget {
  UpdateCoupon({super.key, required this.user});

  Coupon user;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserproviderCoupon>(context);

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor1,
        elevation: 3,
        centerTitle: true,
        title: Text(
          'Edit Coupon',
          style: AppStyles.appBarTitle,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              'Coupon No ${user.couponId}',
              style: AppStyles.bodyText,
            ),
            const SizedBox(height: 50),
            TextArea(
              keyboardType: TextInputType.text,
              name: 'Coupon Name',
              controller: controller.updateCouponNameController,
              validator: (value) {
                return null;
              },
              suffixIcon: const Icon(
                Icons.abc,
                color: AppColors.transColor,
              ),
              obscureText: false,
              prefixIcon: const Icon(Icons.question_mark),
            ),
            const SizedBox(height: 20),
            TextArea(
              keyboardType: TextInputType.text,
              name: 'Reduction',
              controller: controller.updateCouponReductionController,
              validator: (value) {
                return null;
              },
              suffixIcon: const Icon(
                Icons.abc,
                color: AppColors.transColor,
              ),
              obscureText: false,
              prefixIcon: const Icon(Icons.question_answer),
            ),
            const SizedBox(height: 20),
            TextArea(
              keyboardType: TextInputType.text,
              name: 'Count',
              controller: controller.updateCouponCountController,
              validator: (value) {
                return null;
              },
              suffixIcon: const Icon(
                Icons.abc,
                color: AppColors.transColor,
              ),
              obscureText: false,
              prefixIcon: const Icon(Icons.question_answer),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'UPDATE',
              ontap: () {
                Provider.of<UserproviderCoupon>(context, listen: false)
                    .updateData(user.couponId, context);
                Navigator.pop(context);
                snackbar(context, text: "updated");
              },
            ),
          ],
        ),
      ),
    );
  }

  snackbar(context, {required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Row(
          children: [
            Expanded(child: Text('Successfully $text')),
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.done, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
