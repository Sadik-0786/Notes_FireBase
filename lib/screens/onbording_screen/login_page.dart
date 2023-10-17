import 'package:flutter/material.dart';
import 'package:note_fire_app/app_widgets/app_button.dart';
import 'package:note_fire_app/app_widgets/app_form_field.dart';
import 'package:note_fire_app/screens/onbording_screen/mobil_auth_screens/mobil_auth_page.dart';
import 'package:note_fire_app/screens/onbording_screen/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Happy to see you again.You can continue where',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'you left of by logging in.',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AppTextField(
                              textFieldHeading: 'Email',
                              tittleStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              hintText: 'Enter Your Email',
                              widthByMdQuery: MediaQuery.of(context).size.width,
                              controller: _emailController,
                              validation: (value) {}),
                          //const SizedBox(height: 15,),
                          AppTextField(
                            textFieldHeading: 'Password',
                            tittleStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: 'Enter Your Password',
                            widthByMdQuery: MediaQuery.of(context).size.width,
                            controller: _passwordController,
                            validation: (value) {},
                            isThereIcon: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Reset Password?',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  AppButton(
                      widthByMdQuery: MediaQuery.of(context).size.width,
                      onPressed: () {},
                      buttonName: " Login",
                      buttonColor: Colors.purple),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Or',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      const CircleAvatar(
                          child: Icon(
                        Icons.apple,
                        size: 40,
                      )),
                      const SizedBox(
                        width: 30,
                      ),
                      const CircleAvatar(
                          child: Icon(
                        Icons.g_mobiledata,
                        size: 40,
                      )),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileAuth()));
                        },
                        child: const CircleAvatar(
                          child: Icon(Icons.mobile_screen_share),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ))
                    ],
                  ),
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
