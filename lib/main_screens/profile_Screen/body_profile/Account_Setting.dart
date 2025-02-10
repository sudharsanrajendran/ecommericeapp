import 'package:ecommericeapp/main_screens/profile_Screen/body_profile/widget/List_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class Account_settings extends StatelessWidget {
  const Account_settings({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          List_view(leadingIcon:Icon(Iconsax.add_square1), title:'My Address', dark: dark, subtitle: 'Set Shopping delivery Address',ontap: (){},),
          List_view(leadingIcon:Icon(Iconsax.shop), title:'My Cart', dark: dark, subtitle: 'Add,remove products and move to checkout',ontap: (){},),
          List_view(leadingIcon:Icon(Iconsax.add_square1), title:'My Orders', dark: dark, subtitle: 'In-progress and Completed Orders',ontap: (){},),
          List_view(leadingIcon:Icon(Iconsax.add_square1), title:'Bank Account', dark: dark, subtitle: 'Withdraw balance to registered bank account',ontap: (){},),
          List_view(leadingIcon:Icon(Iconsax.percentage_circle1), title:'My Coupons', dark: dark, subtitle: 'List of all the discounter Coupons',ontap: (){},),
          List_view(leadingIcon:Icon(Iconsax.notification), title:'Notifications', dark: dark, subtitle: 'Set any kind of notification message',ontap: (){},),
          List_view(leadingIcon:Icon(Iconsax.notification), title:'Account Privacy', dark: dark, subtitle: 'Manage data usage and connected account',ontap: (){},)
        ],
      ),
    );
  }
}