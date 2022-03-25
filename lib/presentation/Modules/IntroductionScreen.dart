import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled1/constant/Screens.dart';
import 'package:untitled1/data/cacheHelper.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/lang%20Cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/langState.dart';

import '../../constant/Picture.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);
  var controller = PageController(viewportFraction: 0.8, keepPage: true);
bool language=true;
  final pages = List.generate(
      3,
      (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Container(
              height: 280,
              width: 50,
              child: Center(
                  child: Image(
                image: AssetImage(Images[index]),width: double.infinity,height: double.infinity,
              )),
            ),
          ));
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<langCubit,langStates>(
      listener: (context,state)
      {
      },
      builder:(context,state)=>
         Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              controller.jumpToPage(2);
                            },
                            child:const Text(
                              'first_string',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ).tr()),
                        InkWell(
                          onTap: ()
                          {
                           langCubit.get(context).changeLang(context);
                          },
                          child: const Text(
                            'second_string',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color:Colors.green),
                          ).tr(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 380,
                    child: PageView.builder(
                      controller: controller,
                      // itemCount: pages.length,
                      itemBuilder: (_, index) {
                        return pages[index % pages.length];
                      },
                    ),
                  ),
                 Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.fromLTRB(64.0,64,64,25),
                       child:const Text(
                         'third_string',
                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                       ).tr(),
                     ),
                     Padding(
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
                             child:const Text(
                               'Fifth_string',
                               style: TextStyle(
                                 fontSize: 14,
                               ),
                             ).tr(),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:30.0),
                        child: Container(
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: pages.length,
                            effect:const WormEffect(
                              dotHeight: 20,
                              dotWidth: 20,
                              activeDotColor: Colors.green,
                              // strokeWidth: 5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 55.0),
                        child: InkWell(
                          onTap: (){
                            CacheHelper.putPool('onBoarding', true);
                            Navigator.pushNamed(context, signinPath);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.green,
                            child: SvgPicture.asset('images/Group 16.svg'),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),

    );
  }
}
