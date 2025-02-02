import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Iconsax.add),
          )
        ],
      ),
    );
  }
}
