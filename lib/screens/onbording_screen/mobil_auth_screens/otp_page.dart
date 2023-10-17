import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Container(
             color: Colors.purple.shade50,
             height: MediaQuery.of(context).size.height*0.4,
             child: Center(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  Lottie.asset('assets/lottie/Animation - 1697523194235.json',repeat: false,height: 200), const SizedBox(width: 5,),
                 ],
               ),
             ),
           ),
         Align(
           alignment: Alignment.bottomCenter,
           child: Container(
            height: MediaQuery.of(context).size.height*0.7,
             decoration: const BoxDecoration(
               borderRadius:BorderRadius.only(topLeft:Radius.circular(35),topRight: Radius.circular(35)),
               color: Colors.white
             ),
           ),
         )
        ],
      ),
    );
  }
}
