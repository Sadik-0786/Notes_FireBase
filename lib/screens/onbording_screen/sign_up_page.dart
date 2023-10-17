import 'package:flutter/material.dart';

import '../../app_widgets/app_button.dart';
import '../../app_widgets/app_form_field.dart';
class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final formKey=GlobalKey<FormState>();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _userNameController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _confirmPasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50,),
                  const Text('Sign Up Now',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 28),),
                  const SizedBox(height: 8,),
                  const Text('Please fill the detail and create an account',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.grey),),
                  const SizedBox(height: 50,),
                  Form(
                      key: formKey,
                      child: Column(children: [
                        AppTextField(textFieldHeading: 'Your Name', tittleStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,), hintText: 'Enter Your Name', widthByMdQuery:MediaQuery.of(context).size.width, controller: _userNameController, validation: (value){
                          if (value == null || value == '') {
                            return 'Please enter any name ';
                          }
                        }),
                        AppTextField(textFieldHeading: 'Email', tittleStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,), hintText: 'your@gmail.com', widthByMdQuery:MediaQuery.of(context).size.width, controller: _emailController, validation: (value){
                          if (value == null||value.isEmpty) {
                            return 'Please enter valid email ';
                          }else if(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                            return null;
                          }
                          return 'invalid email';
                        }),
                        //const SizedBox(height: 15,),
                        AppTextField(textFieldHeading: 'Password', tittleStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,), hintText: 'Enter Your Password', widthByMdQuery:MediaQuery.of(context).size.width, controller: _passwordController, validation: (value){
                          if (value == '' || value!.length < 8) {
                            return 'Please enter valid password ';
                          }
                        },isThereIcon: true,),
                        AppTextField(textFieldHeading: 'Confirm Password', tittleStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,), hintText: '**************', widthByMdQuery:MediaQuery.of(context).size.width, controller: _confirmPasswordController, validation: (value){
                          if (value != _passwordController.text) {
                            return 'Please enter valid password ';
                          }
                        },isThereIcon: true,),
                      ],)),
                  const SizedBox(height: 10,),
                  AppButton(widthByMdQuery: MediaQuery.of(context).size.width, onPressed: (){
                    if(formKey.currentState!.validate()){
                      Navigator.pop(context);
                    }
                  }, buttonName:" Create Account", buttonColor: Colors.purple),

                  const Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

