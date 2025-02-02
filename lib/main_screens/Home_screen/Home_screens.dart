import 'package:ecommericeapp/utils/constants/Tsize.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../../utils/helpers/helper_functions.dart';
import 'Header/Categories/catogeries_list.dart';
import 'Header/seachbar/Seachbar_code.dart';
import 'body/card/cards_view.dart';
import 'body/slider/slider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = Thelper.isdarkmode(context);
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: dark?Colors.grey:Colors.blueAccent.withOpacity(0.9),
        automaticallyImplyLeading: false,
        leading: null,
        title: Text("Home",style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Iconsax.shopping_bag,size: Tsize.iconxl,))
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
                      Container(
              decoration: BoxDecoration(
                  color: dark?Colors.grey:Colors.blueAccent.withOpacity(0.9),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  seachbar(
                     color: dark?Colors.black:Colors.white.withOpacity(0.9),
                    hint_text:'Search..',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Categories",style:TextStyle(color: dark?Colors.black:Colors.white,fontSize: 20,fontWeight:FontWeight.bold),),
                  ),
                  SizedBox(
                      height: 100,
                      child: Categories()),



                ],
              ),
            ),
            SliderWithIndicator(),
            SizedBox(
                height: 700,
                child: CardsView()),




          ],
        ),

      ),
    );
  }
}



