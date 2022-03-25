import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/constant/Screens.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/emil_auth_state.dart';
import 'package:untitled1/presentation/dialouges/toast.dart';
import '../../models/Product.dart';
class EmailAuthCubit extends Cubit<EmailAuthStates> {
  EmailAuthCubit() : super(InitialState());
  static EmailAuthCubit get(context) => BlocProvider.of(context);
  FirebaseAuth auth = FirebaseAuth.instance;
  var fireStore = FirebaseFirestore.instance;
  Product product = Product();
  SignInAuth(var email,var password,context ){
    emit(SignInLoading());
    Product p  = Product();
    product.id=email;
    emit(SignInLoading());
   auth.signInWithEmailAndPassword(email: email,password: password,).then((value) async {
      if (value != null) {
        await FirebaseFirestore.instance.collection('Login In').doc(product.id ).set({
          'Password': password.toString(),
          'Email': email.toString(),
          'id':p.id,



        });
        showToast(msg: 'Done', state: ToastedStates.SUCCESS);
        Navigator.pushNamed(context, HomeScreenPath);
        emit(SignInSuccess(email));
      } else {
        showToast(msg: onError.toString(), state: ToastedStates.ERROR);
        emit(SignInFailed(onError.toString()));
        print(onError.toString());
      }
   }).catchError((onError){
      print(onError.toString());
      showToast(msg: onError.toString(), state: ToastedStates.WARNING);
      emit(SignInFailed(onError.toString()));
      print(onError.toString());
    });
  }
  forgetPass(email)async{
    await auth.sendPasswordResetEmail(email: email);
  }

  signup(email, password, name,Phone,context) async {
    emit(SignUpLoading());
    var u = await auth.createUserWithEmailAndPassword(
      email: email, password: password,);
         auth.currentUser?.sendEmailVerification();
         fireStore.collection('Users').doc(u.user?.uid).set(
            {
              'id':u.user?.uid,
              'name':name,
              'Password': password,
              'Email': email,
              'Phone':Phone,
            });
        showToast(msg: 'Done', state: ToastedStates.SUCCESS);
        Navigator.pushNamed(
            context, signinPath);
        emit(SignUpSuccess());


  }


}