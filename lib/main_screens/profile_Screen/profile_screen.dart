import 'package:ecommericeapp/main_screens/profile_Screen/header/profile_header.dart';
import 'package:flutter/material.dart';
import '../../utils/helpers/helper_functions.dart';
import 'body_profile/Account_Setting.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = Thelper.isdarkmode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,),
              child: Text(" Account Settings",style:Theme.of(context).textTheme.headlineSmall,),
            ),
            Account_settings(dark: dark)
          ],
        ),
      ),
    );
  }
}


