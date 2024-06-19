// ignore_for_file: non_constant_identifier_names

import 'package:englishcoach/application/provider/user_provider_payment_coupon.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/domain/model/coupon_model.dart';
import 'package:englishcoach/presentation/drawer/coupon/update_coupon/edit_coupon.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopCoupon extends StatefulWidget {
  const DesktopCoupon({super.key});

  @override
  State<DesktopCoupon> createState() => _DesktopCouponState();
}

class _DesktopCouponState extends State<DesktopCoupon> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserproviderCoupon>(context, listen: false).getData();
    });
    super.initState();
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserproviderCoupon>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55.0),
        child: Container(
          height: 100,
          decoration: const BoxDecoration(
              color: AppColors.accentColor1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.transparent,
              ),
              Text(
                'Coupon Code',
                style: AppStyles.appBarTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  child: IconButton(
                      onPressed: () {
                        modelSheet(context);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.accentColor1,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<UserproviderCoupon>(builder: (context, value, child) {
        if (value.isLoding) {
          return const Center(child: CircularProgressIndicator());
        }
        final posts = value.posts;
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            var user = posts[index];
            return Container(
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                ),
                child: Card(
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 6,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: AppColors.accentColor1,
                          child: Text(
                            posts[index].couponId.toString(),
                            style: const TextStyle(
                                color: AppColors.secondaryColor),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Coupon Name : ${posts[index].couponName}',
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.bodyText,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Reduction : ${posts[index].couponReduction}',
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.bodyText,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Count : ${posts[index].couponCount}',
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.bodyText,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            controller.updateCouponNameController.text =
                                user.couponName;
                            controller.updateCouponReductionController.text =
                                user.couponReduction;
                            controller.updateCouponCountController.text =
                                user.couponCount;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    UpdateCoupon(user: user)));

                            print('Edit button tapped');
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.accentColor1,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteAlertBox(
                                context, posts, index, controller, user);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: AppColors.actionColor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<dynamic> deleteAlertBox(BuildContext context, List<Coupon> posts,
      int index, UserproviderCoupon controller, Coupon user) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Delete Coupon ${posts[index].couponId}',
              style: AppStyles.bodyText,
            ),
            content: Text(
              'Are you sure?',
              style: AppStyles.bodyText,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: AppStyles.bodyText,
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  controller.deleteData(user.couponId, context);
                  Navigator.pop(context);
                  snackbar(context, text: "deleted");
                },
                child: Text(
                  'yes',
                  style: AppStyles.bodyText,
                ),
              ),
            ],
          );
        });
  }

//floating action button function

  Future<dynamic> modelSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        ),
        builder: (BuildContext context) {
          return Container(
              height: 450.0,
              color: AppColors.transColor,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        'Add New Coupon',
                        style: AppStyles.bodyText,
                      ),
                      const SizedBox(height: 50),
                      CouponNameTextArea(),
                      const SizedBox(height: 20),
                      reductionTextArea(),
                      const SizedBox(height: 20),
                      countTextArea(),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'POST',
                        ontap: () {
                          if (formkey.currentState!.validate()) {
                            Provider.of<UserproviderCoupon>(context,
                                    listen: false)
                                .addData();

                            Navigator.pop(context);
                            snackbar(context, text: "added");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  TextArea CouponNameTextArea() {
    var controller = Provider.of<UserproviderCoupon>(context, listen: false);
    return TextArea(
      keyboardType: TextInputType.text,
      name: 'Coupon Name',
      controller: controller.couponNameController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter Name';
        } else {
          return null;
        }
      },
      suffixIcon: const Icon(
        Icons.abc,
        color: AppColors.transColor,
      ),
      obscureText: false,
      prefixIcon: const Icon(Icons.question_mark),
    );
  }

  TextArea reductionTextArea() {
    var controller = Provider.of<UserproviderCoupon>(context, listen: false);
    return TextArea(
      keyboardType: TextInputType.text,
      name: 'Reduction',
      controller: controller.couponReductionController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter Reduction';
        } else {
          return null;
        }
      },
      suffixIcon: const Icon(
        Icons.abc,
        color: AppColors.transColor,
      ),
      obscureText: false,
      prefixIcon: const Icon(Icons.question_answer),
    );
  }

  TextArea countTextArea() {
    var controller = Provider.of<UserproviderCoupon>(context, listen: false);
    return TextArea(
      keyboardType: TextInputType.text,
      name: 'Count',
      controller: controller.couponCountController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter count';
        } else {
          return null;
        }
      },
      suffixIcon: const Icon(
        Icons.abc,
        color: AppColors.transColor,
      ),
      obscureText: false,
      prefixIcon: const Icon(Icons.question_answer),
    );
  }

  //snackBar

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
