import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:untitled1/constant/Screens.dart';
import 'package:untitled1/presentation/widget/TextButton.dart';

import '../../domain.cubit.checkConnection/auth/auth_cubit.dart';

class OtpPhoneScreen extends StatefulWidget {
  const OtpPhoneScreen({Key? key}) : super(key: key);

  @override
  _OtpPhoneScreenState createState() => _OtpPhoneScreenState();
}

class _OtpPhoneScreenState extends State<OtpPhoneScreen> {
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cons) => Scaffold(
        backgroundColor: Colors.white,
        body: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child:
          SingleChildScrollView(
            child: SafeArea(
              child: Container  (
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:const Icon(
                              Icons.west,
                              color: Colors.black,
                              size: 28,
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Center(
                          child: Image(
                            image:const AssetImage('images/th.jpg'),
                            width: cons.maxWidth * .5,
                          ),
                        ),
                        Center(
                          child:const Text(
                            'Verify Phone',
                            style: TextStyle(fontSize: 20),
                          ).tr(),
                        ),
                        Center(
                          child:const Text(
                            'Code Is Sent To  ',
                            style: TextStyle(fontSize: 20),
                          ).tr(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        OTPTextField(
                          length: 6,
                          controller: otpController,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: 50,
                          style:const TextStyle(fontSize: 17),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                          },
                          onChanged: (pin) {
                            print("Changed: " + pin);
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                            Text(
                              'Don\'t Receive Code ?',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'Resend Code',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              PhoneAuthCubit.get(context).submitOTP(otpController.toString());
                              print(otpController);
                              Navigator.pushNamed(context, HomeScreenPath);
                            },
                            child: TextButton1(
                              name: 'Verify And Create Account',

                            ),
                          ),
                        ],
                      ),
                    )
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
