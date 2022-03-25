import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/constant/Screens.dart';
import 'package:untitled1/domain.cubit.checkConnection/DataProduct_Cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/DataProduct_State.dart';
import 'package:untitled1/models/Order.dart';
import 'package:untitled1/models/Product.dart';
import 'package:untitled1/presentation/widget/TextButton.dart';
import '../../models/Product.dart';

class ProductDetails extends StatefulWidget {
  static String id = 'ProductDetails';

  Product? product;
  ProductDetails({Key? key, this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<Product> products = [
    Product(
      imgurl: 'images/photo_2021-07-02_15-06-19.png',
      name: 'mix grill',
      price: '115',
    ),
    Product(
      imgurl: 'images/photo_2021-07-02_15-06-18.png',
      name: 'mix seafood',
      price: '115',
    ),
  ];
  List<Product> cal = [
    Product(
      name: 'calories',
      Size: '632',
    ),
    Product(
      name: 'protein',
      Size: '100',
    ),
    Product(
      name: 'carbs',
      Size: '13',
    ),
    Product(
      name: 'fat',
      Size: '20',
    ),
  ];
  Order order = Order();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataProductCubit, DataProductState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: SafeArea(
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  if(state is GetOrderLoading)
                    const LinearProgressIndicator(),
                  if(state is GetOrderLoading)
                    const SizedBox(
                      height: 10,
                    ),
                  Container(
                    height: 300,
                    child: Stack(children: [
                      Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.product?.imgurl),
                                fit: BoxFit.cover),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 38,
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite_border_sharp,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Text(
                          ' ' + widget.product!.name,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: cal.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 29.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 29,
                                    backgroundColor: Colors.lightGreen,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: CircleAvatar(
                                        radius: 26,
                                        backgroundColor: Colors.white,
                                        child: Text(
                                          cal[index].Size,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    cal[index].name,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12, bottom: 4, top: 4),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      height: 46,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: const [
                                Text(
                                  ' side 1',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Required',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                        child: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.white,
                                      size: 25,
                                    )),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12, bottom: 4, top: 4),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      height: 46,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: const [
                                Text(
                                  ' side 1',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Required',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                        child: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.white,
                                      size: 25,
                                    )),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '  Comment For Ordering....',
                              hintStyle: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                 // if(state is GetOrderSuccess)
                 /*     Column(
             children: [
               const SizedBox(
                 height: 20,
               ),
               InkWell(
                 onTap: (){
                   Navigator.pushNamed(context, OrderDetailsPath);
                 },
                 child: Container(
                   child: const Center(child: Text('Go TO Your Orders',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                 ),
               )
             ],
           )*/
                 //   else
                    InkWell(
                      onTap: () {
                        DataProductCubit.get(context).createOrder(
                          name: widget.product?.name,
                          price: widget.product?.price,
                          imgurl: widget.product?.imgurl,
                        );
                        /*  FirebaseFirestore.instance.collection('Order').doc(order.id).set({
                        'name': widget.product?.name,
                        'price': widget.product?.price,
                        'image': widget.product?.imgurl
                      });*/
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('الى الكارت' +
                                widget.product!.name +
                                '' +
                                'تم اضافه ')));
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child:
                            Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height * .08,
                                width: MediaQuery.of(context).size.width * .90,
                                decoration: BoxDecoration(
                                    color: Colors.lightGreen,
                                    borderRadius: BorderRadius.circular(13)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Add (1) To Cart - ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        widget.product!.price.toString() + ' EGY',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
