import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/constant/Screens.dart';

import '../../presentation/dialouges/toast.dart';
import 'auth_state.dart';


class PhoneAuthCubit extends Cubit<AuthState> {
  PhoneAuthCubit() : super(initialState());


  static PhoneAuthCubit get(context) => BlocProvider.of(context);

  FirebaseAuth auth = FirebaseAuth.instance;
  String? id;

  PhoneAuth(String? phone,context) {
    emit(PhoneAuthLoading());
    auth.verifyPhoneNumber(
        phoneNumber: phone!,

        timeout: const Duration(seconds: 60),

        verificationCompleted: (credential) {
          auth.signInWithCredential(credential).then((value) =>
          {emit(OtpSuccess()),
          Navigator.pushNamed( context, OtbPhoneScreenPath)
          })
              .catchError((error)
          {
            showToast(msg:error ,state:ToastedStates.ERROR );
            emit(OtpFailed(error));
          });
        },

        verificationFailed: (error) {
          showToast(msg:error.message.toString() ,state:ToastedStates.ERROR );
          emit(OtpFailed(error.toString()));
        },
        codeSent: (String? PhoneId, [int? token]) {
          id = PhoneId!;
          emit(PhoneAuthSuccess(phone));
          Navigator.pushNamed( context, OtbPhoneScreenPath);
        },
        codeAutoRetrievalTimeout: (String time) {
          print('TimeOut');
          emit(OtpFailed('TimeOut'));
        });
  }

  void submitOTP(String otpCode) {
    emit(OtpLoading());
    print('otpCode $otpCode');
    AuthCredential credential = PhoneAuthProvider.credential(verificationId: id!, smsCode: otpCode);
    auth.signInWithCredential(credential).then((value) {
      if(value.user!=null){
        showToast(msg:'login_success' ,state:ToastedStates.SUCCESS );
      }else{
        showToast(msg:onError.toString() ,state:ToastedStates.WARNING );
        emit(OtpFailed(onError.toString()));
      }
    } ).catchError((onError){
      print('${onError.toString()}');
      showToast(msg:onError.toString(),state:ToastedStates.WARNING );
      emit(OtpFailed(onError.toString()));
    });
  }
}
