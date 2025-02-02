
import 'package:ecommericeapp/comman/Clippath_style/Tcustom_clippath.dart';
import 'package:ecommericeapp/utils/constants/Tcolors.dart';
import 'package:flutter/material.dart';
class Primaryheadercontainer extends StatelessWidget {
  const Primaryheadercontainer({super.key, required this.child});

  @override
  final Widget child;
  Widget build(BuildContext context) {
    return TcurvedEdgesWigest(
      Child: SizedBox(
        height: 400,
        child: Container(
          color: Colors.blue,
          child: Stack(
            children: [
              Positioned( top:-150,right:-250,child:Circularcontainer(backgroundColor: Colors.white.withOpacity(0.1),)),
              Positioned( top:100,right:-300,child:Circularcontainer(backgroundColor: Colors.white.withOpacity(0.1),))
           ,child,
            ],
          ),
        ),
      ),
    );
  }
}

class Circularcontainer extends StatelessWidget {
  const Circularcontainer({super.key, this.width=400, this.height=400, this.radius=400, this.backgroundColor=Colors.white, this.child});

  final double?width;
  final double?height;
  final double?radius;
  final double?child;
  final Color?backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(400),
      color: Tcolors.text_primary.withOpacity(0.1)),
    );
  }
}

