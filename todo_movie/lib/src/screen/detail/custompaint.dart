import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

   Paint paint0 = Paint()
      ..color = Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    
     
         
    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(size.width*0.0034125,size.height*0.0021400);
    path0.lineTo(size.width,size.height*0.1769400);
    path0.lineTo(size.width,size.height);
    path0.lineTo(0,size.height);

    canvas.drawPath(path0, paint0);

  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
