
import 'package:flutter/material.dart';
import 'package:untitled1/presentation/widget/TextButton.dart';

class BMRScreen extends StatefulWidget {
  const BMRScreen({Key? key}) : super(key: key);

  @override
  State<BMRScreen> createState() => _BMRScreenState();
}

class _BMRScreenState extends State<BMRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,

                  prefixIcon: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.west,
                        color: Colors.black,
                        size: 20,
                      )),
                  label: const Center(
                    child: Text(
                      'BMR',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(7)
                            ),
                            height: 50,
                            width: 50,

                            child:const Icon(
                                Icons.transgender_outlined,color: Colors.white,),
                          ),
                         const Text('  Gender :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children:const [
                        Icon(Icons.radio_button_checked,size: 25,color: Colors.lightGreen,),
                        Text(' Female',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                    ],),
                    Row(
                      children:const [
                        Icon(Icons.radio_button_unchecked,size: 25,),
                        Text(' Male    ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                      ],)


                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(7)
                            ),
                            height: 50,
                            width: 50,

                            child:const Icon(

                              Icons.height_rounded,size:35,color: Colors.white,),
                          ),
                          const Text('  Height :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children:const [
                        Text('150',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                         SizedBox(
                            width: 45,
                            child: Divider(
                              color: Colors.black26,
                              thickness: 1.5,
                            )),
                      ],
                    ),
                    Column(
                      children:const [
                        Text('cm',style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(7)
                            ),
                            height: 50,
                            width: 50,

                            child:const Icon(
                              Icons.monitor_weight,color: Colors.white,),
                          ),
                          const Text('  Weight :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children:const [
                        Text('50',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(
                            width: 45,
                            child: Divider(
                              color: Colors.black26,
                              thickness: 1.5,
                            )),
                      ],
                    ),
                    Column(
                      children:const [
                        Text('kg',style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(7)
                            ),
                            height: 50,
                            width: 50,

                            child:const Icon(
                              Icons.calendar_month_rounded,color: Colors.white,),
                          ),
                          const Text('  Age :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children:const [
                        Text('21',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(
                            width: 45,
                            child: Divider(
                              color: Colors.black26,
                              thickness: 1.5,
                            )),
                      ],
                    ),
                    Column(
                      children:const [
                        Text('year',style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          TextButton1(
            name: 'Calculate',
          )
        ],
      ),
    );
  }
}
