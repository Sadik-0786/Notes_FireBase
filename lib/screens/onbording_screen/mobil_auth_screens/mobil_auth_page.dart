import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_fire_app/app_widgets/app_button.dart';
import 'package:note_fire_app/app_widgets/app_form_field.dart';
import 'package:note_fire_app/screens/onbording_screen/mobil_auth_screens/otp_page.dart';

class MobileAuth extends StatelessWidget {
   MobileAuth({super.key});
  final TextEditingController _mobileNumController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: [
       Container(
           color: Colors.purple.shade50,
           height: MediaQuery.of(context).size.height*0.4,
           width: MediaQuery.of(context).size.width ,
           child: Lottie.asset('assets/lottie/Animation - 1697519810894.json',repeat: false,)),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height*0.7,
            decoration: const BoxDecoration(
                borderRadius:BorderRadius.only(topLeft:Radius.circular(35),topRight: Radius.circular(35)),
                color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome Back',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                  ),
                  SizedBox(height: 6,),
                  const Text(
                    'Happy to see you again.You can continue where you left by ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'verifying your mobile number.',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 60,),
                  AppTextField(textFieldHeading: 'Mobile No.', tittleStyle:const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ), hintText: '91+70*****745', widthByMdQuery: MediaQuery.of(context).size.width, controller: _mobileNumController, validation: (value){},inputTypeIsNumber: true,),
                  AppButton(widthByMdQuery: MediaQuery.of(context).size.width, onPressed: (){
                    if(_mobileNumController.text.isNotEmpty&&_mobileNumController.text.length==10){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>OtpPage()));
                    }
                  }, buttonName: "Get OTP", buttonColor: Colors.purple)
                ],
              ),
            ),
          ),
        )
      ],
    ),
    );
  }
}
