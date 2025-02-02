import 'package:flutter/cupertino.dart';

class TcustomCuredEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0,size.height);
    final firstCureve= Offset(0, size.height-20);
    final lastCureve= Offset(30, size.height-20);
path.quadraticBezierTo(firstCureve.dx, firstCureve.dy,lastCureve.dx, lastCureve.dx);
final secondfirstcruve = Offset(0, size.height-20);
final secondlastcruve = Offset(size.width-30, size.height-20);
   path.quadraticBezierTo(secondfirstcruve.dx, secondfirstcruve.dx, secondlastcruve.dx, secondlastcruve.dx);
   final thirdfirstcruve = Offset(size.width, size.height-20);
    final thirdlastcruve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdfirstcruve.dx, thirdfirstcruve.dx, thirdlastcruve.dx, thirdlastcruve.dx);
path.lineTo(size.width, 0);
path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }}

class TcurvedEdgesWigest extends StatelessWidget {
  const TcurvedEdgesWigest({super.key, this.Child});

  @override
  final Child;
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TcustomCuredEdges(),
      child: Child,
    );
  }
}
