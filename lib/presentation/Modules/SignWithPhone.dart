import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/constant/Screens.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/auth_cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/auth_state.dart';
import 'package:untitled1/domain.cubit.checkConnection/locationCubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/locationState.dart';
import 'package:untitled1/presentation/dialouges/toast.dart';
import 'package:untitled1/presentation/widget/CostomTextFormField.dart';
import 'package:untitled1/presentation/widget/TextButton.dart';

class SignWithPhone extends StatelessWidget {
  SignWithPhone({Key? key}) : super(key: key);
  var SignPhonekey = GlobalKey<FormState>();
  String? phone;
  bool showcountry = true;
  bool passwordVisible = true;
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {},
      builder: (context, state) => BlocConsumer<PhoneAuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(

          body: SingleChildScrollView(
            child: SafeArea(
              child: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.white,
                      child: LayoutBuilder(
                        builder: (context, cons) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Center(
                                  child: Image(
                                    image: const AssetImage('images/th.jpg'),
                                    width: cons.maxWidth * .5,
                                  ),
                                ),
                                Center(
                                  child: const Text(
                                    'Twenty six_string',
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
                                          key: SignPhonekey,
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              ('Twenty-two_string')
                                                                  .tr(),
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              6.0),
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            .08,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .grey[900]!),
                                                        ),
                                                        child: TextFormField(
                                                          obscureText: false,
                                                          controller:
                                                              controller2,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: showcountry
                                                                ? ('Twenty three_string')
                                                                    .tr()
                                                                : controller2
                                                                    .toString(),
                                                            prefixIcon: InkWell(
                                                              onTap: () {
                                                                showCountryPicker(
                                                                  context:
                                                                      context,
                                                                  showPhoneCode:
                                                                      true,
                                                                  // optional. Shows phone code before the country name.
                                                                  onSelect: (Country
                                                                      country) {
                                                                    controller2
                                                                            .text =
                                                                        country
                                                                            .displayName;
                                                                    print(
                                                                        'Select country: ${country.displayName}');
                                                                  },
                                                                );
                                                              },
                                                              child: const Icon(
                                                                  Icons.flag),
                                                            ),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              CustomTextFormField(
                                                name:
                                                    ('Twenty four_string').tr(),
                                                hint: '1068382215',
                                                controller: controller,
                                                onSaved: (v) {
                                                    phone = v.toString();

                                                },
                                                validator: (v) {
                                                  if (v.toString().isNotEmpty) {
                                                  } else {
                                                    return "Required *";
                                                  }
                                                },
                                                icondata: Icons.phone,
                                                color: Colors.green,
                                                secure: false,
                                                keyboardType:
                                                    TextInputType.phone,
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await LocationCubit.get(context)
                                                  .location();
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: const [
                                                  Icon(Icons.location_on),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: InkWell(
                                                  onTap: () {
                                                    if (SignPhonekey
                                                        .currentState
                                                        ?.validate()==true) {
                                                      SignPhonekey.currentState
                                                          ?.save();

                                                      PhoneAuthCubit.get(
                                                          context)
                                                          .PhoneAuth(
                                                          controller.text,
                                                          context);

                                                      // Navigator.pushNamed(context, OtbPhoneScreenPath);
                                                    }  }
                                                    ,
                                                   child: TextButton1(
                                                    name: 'Twenty Five_string',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
      ),
    );
  }
}
