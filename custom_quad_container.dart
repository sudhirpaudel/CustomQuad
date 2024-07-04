import 'package:flutter/material.dart';
//this function was created by Sudhir Paudel from Pokhara, Nepal
// points of this quadrilateral can only be changed in Y-axis points on X-axis are fixed
class CustomQuadContainerClipper extends CustomClipper<Path> {
  final double borderRadius;
  final List<num> yAxisPoints;

  CustomQuadContainerClipper({
    required this.borderRadius,  // if you want border radius in the container
    required this.yAxisPoints,  // give Y-Axix points
  });

  @override
  Path getClip(Size size) {
    Path path = Path();

    //top left
    path.moveTo(borderRadius, size.height * yAxisPoints[0]);
    path.arcToPoint(Offset(0, size.height * yAxisPoints[0] + borderRadius),
        radius: Radius.circular(borderRadius), clockwise: false);

    //bottom left
    path.lineTo(0, size.height * yAxisPoints[1] - borderRadius);
    path.arcToPoint(Offset(borderRadius, size.height * yAxisPoints[1]),
        radius: Radius.circular(borderRadius), clockwise: false);

    //bottom right
    path.lineTo(size.width - borderRadius, size.height * yAxisPoints[2]);
    path.arcToPoint(
        Offset(size.width, size.height * yAxisPoints[2] - borderRadius),
        radius: Radius.circular(borderRadius),
        clockwise: false);

    //top right
    path.lineTo(size.width, size.height * yAxisPoints[3] + borderRadius);
    path.arcToPoint(
        Offset(size.width - borderRadius, size.height * yAxisPoints[3]),
        radius: Radius.circular(borderRadius),
        clockwise: false);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}



//example
//works better for containers with width greater than height
// use transform method for containers with height>width
//    ClipPath(
//     clipper: CustomQuadContainerClipper(
//                    borderRadius: 40,
//                    yAxisPoints: [0, 0.8, 1, 0.2],
//               ),
//       child:  Container(
//                   height: 300,
//                   width: 100,
//                   color: Colors.green,
//                ),
//      )