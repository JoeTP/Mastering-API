import 'package:flutter/material.dart';

class MySelectBox extends StatelessWidget {
  MySelectBox({ super.key,});

  double size = 50;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: size * 2,
            height: size,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            child: Center(child: Text('Female',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: size * 2,
            height: size,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(child: Text('Male',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
          ),
        ),

      ],
    );
  }
}
