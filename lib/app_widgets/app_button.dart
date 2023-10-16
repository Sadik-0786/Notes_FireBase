import 'package:flutter/material.dart';
class AppButton extends StatelessWidget {
   AppButton({super.key,required this.widthByMdQuery,required this.onPressed,required this.buttonName,required this.buttonColor,});
  double widthByMdQuery;
  VoidCallback onPressed;
  String buttonName;
  Color buttonColor;
  //TextStyle buttonStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
        width: MediaQuery.of(context).size.width*widthByMdQuery,
        child: ElevatedButton
          (onPressed:onPressed ,
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
        ),
            child:Center(child: Text(buttonName,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Colors.white),),
            ),
        ));
  }
}
