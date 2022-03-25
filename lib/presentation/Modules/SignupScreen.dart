import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/constant/Screens.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/emil_auth_cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/emil_auth_state.dart';
import 'package:untitled1/models/Product.dart';
import 'package:untitled1/presentation/dialouges/toast.dart';
import 'package:untitled1/presentation/widget/CostomTextFormField.dart';
import 'package:untitled1/presentation/widget/TextButton.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var Name ;
  var Phone ;
  var Email ;
  var Password ;
  Product product = Product();

  bool passwordVisible = true;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  var Signupkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailAuthCubit,EmailAuthStates>(
      listener:(context, state){} ,
      builder:(context, state) =>  Scaffold(

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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Center(
                                child: Image(
                                  image: const AssetImage('images/th.jpg'),
                                  fit: BoxFit.cover,
                                  width: cons.maxWidth * .37,
                                ),
                              ),
                              Center(
                                child: const Text(
                                  'Twenty seven_string',
                                  style: TextStyle(fontSize: 20),
                                ).tr(),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              LayoutBuilder(
                                builder: (context, cons) => Column(
                                  children: [
                                    Form(
                                        key: Signupkey,
                                        child: Column(
                                      children: [
                                        CustomTextFormField(
                                          name: ('Sixteen_string').tr(),
                                          hint: ('Seventeen_string').tr(),
                                          icondata: Icons.person,
                                          validator:  (v){
                                            if (v.toString().isEmpty) {
                                              return 'Please Enter Name ';
                                            }
                                          },
                                          onSaved: (v){
                                            setState(() {
                                              Name = v;
                                            });
                                          },
                                          secure: false,
                                          keyboardType: TextInputType.name,
                                        ),
                                        CustomTextFormField(
                                          name: ('Sixth_string').tr(),
                                          hint: ('Seventh_string').tr(),

                                          validator:  (v){
                                            if (v.toString().isEmpty) {
                                              return 'Please Enter Email ';
                                            }
                                          },
                                          onSaved: (v){
                                            setState(() {
                                              Email  = v;
                                            });
                                          },
                                          controller: controllerEmail,
                                          icondata: Icons.email,
                                          color: Colors.black12,
                                          secure: false,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        CustomTextFormField(
                                          name: ('Eighteen_string').tr(),
                                          hint: ('Nineteen_string').tr(),
                                          color: Colors.black12,
                                          validator:  (v){
                                            if (v.toString().isEmpty) {
                                              return 'Please Enter Phone ';
                                            }
                                          },
                                          onSaved: (v){
                                            setState(() {
                                              Phone = v;
                                            });
                                          },
                                          secure: false,
                                          icondata: Icons.flag,
                                          keyboardType: TextInputType.phone,
                                        ),
                                        CustomTextFormField(

                                          name: ('Eighth_string').tr(),
                                          hint: ('Ninth_string').tr(),
                                          controller: controllerPass,
                                          icondata: Icons.lock,
                                          onSaved: (v){
                                            if(Signupkey.currentState?.validate() == true){
                                              Password = v.toString();
                                            }
                                          },
                                          validator: (v){
                                            if(v.toString().isNotEmpty){

                                            if(v.toString().length > 8){
                                            }
                                            else  {
                                              return "Please Entre Pass >= 8";
                                            }
                                            }
                                            else {
                                              return "please Enter Pass";
                                            }  },

                                          suffix: IconButton(
                                            icon: Icon(passwordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                            onPressed: () {
                                              setState(() {
                                                passwordVisible =
                                                    !passwordVisible;
                                              });
                                            },
                                          ),
                                          secure: passwordVisible,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                        ),
                                        InkWell(
                                          onTap: ()async {
                                            if (Signupkey.currentState!.validate() ==true ) {
                                              Signupkey.currentState?.save();
                                          try{
                                              EmailAuthCubit.get(context)
                                                .signup(
                                                controllerEmail.text,
                                                controllerPass.text,Name,Phone, context);

                                          }catch(e){
                                            showToast(msg: e.toString(),state: ToastedStates.ERROR );
                                            print(e.toString());

                                          }

                                            }
                                          },
                                          child: Row(
                                            children: [
                                              TextButton1(
                                                name: ('Fourteen_string').tr(),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3, bottom: 3),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'twenty_string',
                                                style: TextStyle(fontSize: 14),
                                              ).tr(),
                                              InkWell(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                        context, signinPath);
                                                  },
                                                  child: const Text(
                                                    'Twenty one_string',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.green),
                                                  ).tr())
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
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
