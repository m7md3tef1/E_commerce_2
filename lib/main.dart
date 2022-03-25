import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled1/Blocs/FavBlocCubit.dart';
import 'package:untitled1/data/cacheHelper.dart';
import 'package:untitled1/domain.cubit.checkConnection/DataProduct_Cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/DataProduct_State.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/GetOrder_Cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/auth_cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/auth_state.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/emil_auth_cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/emil_auth_state.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/lang%20Cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/langState.dart';
import 'package:untitled1/domain.cubit.checkConnection/bloc_observer.dart';
import 'package:untitled1/domain.cubit.checkConnection/connect_cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/connect_state.dart';
import 'package:untitled1/domain.cubit.checkConnection/locationCubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/locationState.dart';
import 'package:untitled1/presentation/Modules/ProductDetails.dart';
import 'app_route.dart';
import 'domain.cubit.checkConnection/auth/GetOrder_State.dart';
import 'presentation/dialouges/noInterNet.dart';
import 'presentation/dialouges/toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();

  BlocOverrides.runZoned(
        () {
      runApp(EasyLocalization(
          saveLocale: true,
          supportedLocales:const [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          path: 'translations',
          fallbackLocale:const Locale('en', ''),
          child: DevicePreview(enabled: true, builder: (_) => MyApp())));
    },
    blocObserver: MyBlocObserver(),
  );
  // Wrap your app
}

class MyApp extends StatelessWidget {
  get product => null;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, dType) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CheckConnectCubit()..initialConnection()),
          BlocProvider(create: (_) => PhoneAuthCubit()),
          BlocProvider(create: (_) => langCubit(),),
          BlocProvider(create: (_) => EmailAuthCubit()),
          BlocProvider(create: (_) => LocationCubit()..location(),),
          BlocProvider(create: ((_)=>FavCubit())),
          BlocProvider(create: ((_)=>DataProductCubit()..GetAllProduct())),
          BlocProvider(create: ((_)=>GetOrderCubit()..GetAllOrders())),
        ],
        child: BlocListener<CheckConnectCubit, CheckConnectionState>(
          listener: (context, state) {
            if (state is DisConnect) {
              showToast(
                  msg: 'Internet DisConnected', state: ToastedStates.ERROR);
              print('Internet DisConnected');
              OneContext().showDialog(builder: (context) => NoInterNetDialoug());
            } else if (state is Connect) {
              showToast(msg: 'Connected', state: ToastedStates.SUCCESS);
              print('Connected');
              OneContext().popAllDialogs();
            }
          },
          child: BlocBuilder<LocationCubit,LocationState>(
            builder:(context,state)=> BlocBuilder<langCubit,langStates>(
              builder:(context,state)=> BlocBuilder<PhoneAuthCubit,AuthState>(
                builder:(context,state)=>
                    BlocBuilder<EmailAuthCubit,EmailAuthStates>(
                      builder:(context,state)=>
                          BlocBuilder<DataProductCubit,DataProductState>(
                            builder:(context,state)=>
                            BlocBuilder<GetOrderCubit,DataOrderState>(
                            builder:(context,state)=>

                    MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  onGenerateRoute: AppRoute().onGenerateRoute,
                  builder: OneContext().builder,
                  useInheritedMediaQuery: true,
                      routes: {
                        ProductDetails.id: (context) => ProductDetails(),
                      },
                ),
              ),
            ),
          )
        ),

      ),
      ))));
  }
}
