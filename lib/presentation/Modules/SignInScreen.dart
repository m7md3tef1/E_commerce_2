import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/constant/Screens.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/emil_auth_cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/emil_auth_state.dart';
import 'package:untitled1/models/Product.dart';
import 'package:untitled1/presentation/widget/CostomTextFormField.dart';
import 'package:untitled1/presentation/widget/TextButton.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  var email;
  var password;
  bool passwordVisible = true;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  var icon1 = Icons.check_box_outline_blank;
  var icon2 = Icons.check_box_outlined;
  var Signinkey = GlobalKey<FormState>();
  Product product = Product();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailAuthCubit, EmailAuthStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(

        body: SingleChildScrollView(
          child: SafeArea(
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: LayoutBuilder(
                      builder: (context, cons) => Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Center(
                                  child: Image(
                                    image: const AssetImage('images/th.jpg'),
                                    fit: BoxFit.cover,
                                    width: cons.maxWidth * .39,
                                  ),
                                ),
                              ),
                              Center(
                                  child: const Text(
                                'third_string',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ).tr()),
                              Center(

                                child: Padding(

                                  padding: const EdgeInsets.all(1.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Fourth_string',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ).tr(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text(
                                          'Fifth_string',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ).tr(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  LayoutBuilder(
                    builder: (context, cons) => Column(
                      children: [
                        Form(
                            key: Signinkey,
                            child: Column(
                          children: [
                            CustomTextFormField(
                              name: ('Sixth_string').tr(),
                              hint: ('Seventh_string').tr(),
                              controller: controllerEmail,
                              validator: (v) {
                                if (v.toString().isEmpty) {
                                  return 'Please Enter Email ';
                                }
                              },
                              onSaved: (v) {

                                email = v;

                              },
                              icondata: Icons.email,
                              secure: false,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            CustomTextFormField(
                              name: ('Eighth_string').tr(),
                              hint: ('Ninth_string').tr(),
                               controller: controllerPass,
                              onSaved: (v){
                                if(Signinkey.currentState?.validate() == true){
                                  password = v.toString();
                                }
                              },
                              validator: (v){
                                if(v.toString().isNotEmpty){
                                  if(v.toString().length >= 8){
                                  }
                                  else {
                                    return "Invalid Password";
                                  }
                                }
                                else {
                                  return "Required *" ;
                                }
                              },
                              icondata: Icons.lock,
                              suffix: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                              secure: passwordVisible,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ],
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                    child: InkWell(
                                      onTap: () {
                                        icon1 = icon2;
                                      },
                                      child: Icon(
                                        icon1,
                                        color: Colors.black12,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  ('tenth_string').tr(),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Text(
                              ('Eleventh_string').tr(),
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        if(state is SignInLoading)
                 const Padding(
                   padding:  EdgeInsets.all(20.0),
                   child: CircularProgressIndicator(
                     color: Colors.lightGreen,
                     strokeWidth: 6,

                   ),
                 )
                        else

                        InkWell(
                          onTap: () async {
                            if (Signinkey.currentState!.validate()) {
                              Signinkey.currentState!.save();
                              try {
                                const CircularProgressIndicator();
                                await EmailAuthCubit.get(context).SignInAuth(controllerEmail.text.trim(),controllerPass.text,context);

                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Complete Require Data')));
                            }
                          },
                          child: Row(
                            children: [
                              TextButton1(
                                name: ('twelve_string').tr(),
                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ('thirteen_string').tr(),
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, signupPath);
                                    },
                                    child: Text(
                                      ('Fourteen_string').tr(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.green),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: cons.maxWidth * .4,
                                        child: const Divider(
                                          color: Colors.black26,
                                          thickness: 3,
                                        )),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    ('Fifteen_string'),
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.green),
                                  ).tr(),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                        width: cons.maxWidth * .4,
                                        child: const Divider(
                                          color: Colors.black26,
                                          thickness: 3,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                FontAwesomeIcons.google,
                                color: Colors.red,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context,  'ProductDetails');
                              },
                              child: const Image(
                                image: AssetImage(
                                  'images/facebook.png',
                                ),
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const Image(
                              image: AssetImage('images/Apple.png'),
                              width: 50,
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, signwithphone);
                                  },
                                  child: const Image(
                                    image: AssetImage('images/phone.jpg'),
                                    width: 50,
                                    height: 50,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
