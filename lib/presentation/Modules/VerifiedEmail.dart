import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/constant/Screens.dart';
import 'package:untitled1/domain.cubit.checkConnection/DataProduct_State.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:untitled1/presentation/dialouges/toast.dart';
import '../../domain.cubit.checkConnection/DataProduct_Cubit.dart';

class VerifiedEmail extends StatefulWidget {
  const VerifiedEmail({Key? key}) : super(key: key);

  @override
  State<VerifiedEmail> createState() => _VerifiedEmailState();
}

class _VerifiedEmailState extends State<VerifiedEmail> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataProductCubit,DataProductState>(
      listener: (context,state){},
      builder:(context,state)=> Scaffold(
        appBar: AppBar(
          title:const Text( 'News Feed'),
        ),
        body:ConditionalBuilder(
          condition: DataProductCubit.get(context).ProductList !=null,
          builder: (context){
            return Column(
                children: [
                  if(!FirebaseAuth.instance.currentUser!.emailVerified)
                    Container(
                      color: Colors.amber.withOpacity(.6),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children:  [
                            const Icon(Icons.info_outline),
                            const   SizedBox(
                              width: 15,
                            ),
                            const  Expanded(child: Text('Please Verify Your Email')),
                            const SizedBox(width: 20,),
                            TextButton(onPressed:  (){
                              FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value){
                                showToast(msg: 'check your mail ',state: ToastedStates.SUCCESS);
                                Navigator.pushNamed(context, HomeScreenPath);
                              }).catchError((onError){showToast(msg: onError.toString(),state: ToastedStates.ERROR);});


                            }, child:const  Text('send') ,)

                          ],
                        ),
                      ),

                    ),
                ],
              );

          },
          fallback: (context)=>const Center(child:CircularProgressIndicator(),),
        ),
      ),
    );
  }
}
