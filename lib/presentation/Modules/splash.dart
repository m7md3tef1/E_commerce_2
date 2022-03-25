import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/domain.cubit.checkConnection/DataProduct_Cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/DataProduct_State.dart';

class SplashScreen extends StatelessWidget {
  final Widget? nextScreen;
  const SplashScreen({Key? key, this.nextScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: AnimatedSplashScreen(
          duration: 3000,
          nextScreen: nextScreen!,
          splash: LayoutBuilder(
              builder: (context, cons) => Center(
                    child: Image(
                        image:const AssetImage('images/th.jpg'),

                        height: cons.maxHeight ,
                        width: cons.maxWidth
                    ),
                  )),
        ),
      );

  }
}
