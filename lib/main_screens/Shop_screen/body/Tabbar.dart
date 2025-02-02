import 'package:ecommericeapp/utils/devies/devies_utility.dart';
import 'package:ecommericeapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
class Tabbar extends StatelessWidget  implements PreferredSizeWidget{
  const Tabbar({super.key, required this.tabs, this.tabcontroller});
final List<Widget>tabs;
final tabcontroller;
  @override
  Widget build(BuildContext context) {
    final dark= Thelper.isdarkmode(context);
    return  Material(
      color: dark?Colors.black.withOpacity(0.1):Colors.white,
      child: TabBar(tabs: tabs,

        controller: tabcontroller,
        isScrollable: true,
        indicatorColor: Colors.black, // Indicator color when selected
        labelColor: Colors.blue, // Tab text color when selected
        unselectedLabelColor: Colors.black,

      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(Tdevices.getappbarheight());
}
