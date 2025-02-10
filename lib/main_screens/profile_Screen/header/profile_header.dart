
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/Tsize.dart';
import '../../../utils/helpers/helper_functions.dart';
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Thelper.isdarkmode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: dark?Colors.grey:Colors.blueAccent.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 250, // Increased height for better visibility
          width: double.infinity,
          padding: const EdgeInsets.all(Tsize.defaultspace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20,top: 40,),
                child: Text(
                  'Account',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),

              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Card(
                      child: ListTile(
                        title: Text(
                          "Username",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Expanded(
                          child: Text(
                            'example.email.com',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        trailing: Icon(Iconsax.edit, color: dark?Colors.white:Colors.black),
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),




      ],
    );
  }
}




