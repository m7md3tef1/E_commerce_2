 import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/langState.dart';

class langCubit extends Cubit<langStates>
 {
  langCubit() : super(intialState());
   static langCubit get(context)=>BlocProvider.of(context);

 void changeLang(BuildContext context)
 {
  if(context.locale.toString().contains('en'))
  {
   context.setLocale(Locale('ar',''));
   emit(Arabic());
  }else{
   context.setLocale(Locale('en',''));
   emit(english());
  }
 }
 }