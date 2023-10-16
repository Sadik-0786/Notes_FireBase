import 'package:flutter/material.dart';
import 'package:note_fire_app/app_widgets/app_button.dart';
import 'package:note_fire_app/app_widgets/app_form_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey=GlobalKey<FormState>();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                    Text('Login Page',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),),
                    SizedBox(width: 4,),
                    Icon(Icons.person,size: 25,)
                ],
              ),
              const SizedBox(height: 50,),
             Form(
               key: formKey,
                 child: Column(children: [
               AppTextField(textFieldHeading: 'Email', tittleStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,), hintText: 'Enter Your Email', widthByMdQuery:MediaQuery.of(context).size.width, controller: _emailController, validation: (value){}),
               //const SizedBox(height: 15,),
               AppTextField(textFieldHeading: 'Password', tittleStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,), hintText: 'Enter Your Password', widthByMdQuery:MediaQuery.of(context).size.width, controller: _passwordController, validation: (value){},isThereIcon: true,),
             ],)),
              const SizedBox(height: 10,),
              AppButton(widthByMdQuery: MediaQuery.of(context).size.width, onPressed: (){}, buttonName:" Login", buttonColor: Colors.purple),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
