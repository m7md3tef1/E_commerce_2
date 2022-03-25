
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/domain.cubit.checkConnection/DataProduct_Cubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/DataProduct_State.dart';
import 'package:untitled1/models/Product.dart';
import 'package:untitled1/presentation/dialouges/toast.dart';

class DeleteProductScreen extends StatelessWidget {
  const DeleteProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataProductCubit, DataProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          var products = DataProductCubit.get(context).ProductList;
          return products != null
              ? Scaffold(
                  backgroundColor: Colors.grey[100],
                  body: SafeArea(
                      child: Column(
                    children: [
                      if(state is GetDataLoading)
                        const LinearProgressIndicator(),
                      if(state is GetDataLoading)
                        const SizedBox(
                          height: 10,
                        ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Container(
                          height: 53,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
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
                                  'Products',
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
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          child: GridView.builder(
                              itemCount: products.length,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: .7, crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Badge(
                                      position:
                                          const BadgePosition(top: -1, end: -3),
                                      badgeColor: Colors.red,
                                      borderRadius: BorderRadius.circular(15),
                                      badgeContent: InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return SimpleDialog(
                                                  title:
                                                      const Text('Sure Delete'),
                                                  children: [
                                                    SimpleDialogOption(
                                                      child: InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              'Cancel')),
                                                    ),
                                                    SimpleDialogOption(
                                                      child: InkWell(
                                                          onTap: () async {
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'Product')
                                                                .doc(products[index].id)
                                                                .delete()
                                                                .then((value) async{

                                                             DataProductCubit
                                                                      .get(
                                                                          context)
                                                                  .GetAllProduct;
                                                              showToast(
                                                                  msg: 'Done',
                                                                  state: ToastedStates.SUCCESS);
                                                            }).catchError((onError) {
                                                              showToast(
                                                                  msg: onError.toString(),
                                                                  state: ToastedStates.SUCCESS);
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                            showToast(
                                                                msg:
                                                                    '${products[index].name}'
                                                                    ' '
                                                                    'تم حذف المنتج',
                                                                state:
                                                                    ToastedStates
                                                                        .SUCCESS);
                                                          },
                                                          child: const Text(
                                                              'Delete')),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: double.infinity,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.green[200],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20)),
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4.0),
                                                            child: Text(
                                                              'Name: ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Text(
                                                            products[index]
                                                                .name,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4.0),
                                                            child: Text(
                                                              'Price:  ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Text(
                                                              products[index]
                                                                  .price,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4.0),
                                                            child: Text(
                                                              'Description:',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Text(
                                                            products[index]
                                                                .Description,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4.0),
                                                            child: Text(
                                                              'Size: ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Text(
                                                            products[index]
                                                                .Size,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ],
                  )),
                )
              : const Center(
                  child: Text(
                  'No Data',
                ));
        });
  }
}
