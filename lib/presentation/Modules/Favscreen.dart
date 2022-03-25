import 'package:flutter/material.dart';
import 'package:untitled1/Blocs/FavBlocCubit.dart';
import 'package:untitled1/models/Product.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);
  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  List<Product> category = [
    Product(
      imgurl: 'images/photo_2021-07-02_15-06-20.png',
      name: 'kabab hala',
      price: '115 EGY',
    ),
    Product(
      imgurl: 'images/photo_2021-07-06_17-26-01.png',
      name: 'beef',
      price: '115 EGY',
    ),
    Product(
      imgurl: 'images/photo_2021-07-06_17-26-01.png',
      name: 'beef',
      price: '115 EGY',
    ),
    Product(
      imgurl: 'images/photo_2021-07-06_17-26-01.png',
      name: 'beef',
      price: '115 EGY',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var favlist=FavCubit.get(context).favList ;
    return Scaffold(
      backgroundColor: Colors.grey[100],
        body:
          SingleChildScrollView(
            child: SafeArea
              (
              child: InkWell(
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
                child: Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child:TextFormField(
                         decoration: InputDecoration(
                           border: InputBorder.none,
                           prefixIcon: InkWell(
                               onTap: (){
                                 Navigator.pop(context);
                               },
                               child:const Icon(Icons.west,color: Colors.black,size: 20,)),
                           label:const Center(
                             child: Text(
                               'favorite',
                               style: TextStyle(
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black,
                               ),
                             ),
                           ),
                         ),
                        ) ,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 500,
                        width: double.infinity,
                        child: GridView.builder(
                          gridDelegate:const
                        SliverGridDelegateWithFixedCrossAxisCount
                          (crossAxisCount: 2,childAspectRatio: .7,),
                          itemCount: category.length,
                          itemBuilder: (context,index)=>
                        Column(
                          children: [
                            Container(
                              height:160,
                              width: 220,
                              color: Colors.white,

                              child: Hero(
                                tag: "image-${category[index].imgurl}",
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(category[index].imgurl.toString()),
                                  width: 180,
                                  height:
                                  MediaQuery.of(context).size.height *
                                      .50,
                                ),
                              ),

                            ),
                            Container(
                              color: Colors.white,
                              height:70 ,
                              width: 250,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Column(

                                      children: [
                                        Hero(
                                          tag: "name-${category[index].name}",
                                          child: Text(
                                            category[index].name.toString(),
                                            style:const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ),
                                        Hero(
                                          tag:
                                          "price-${category[index].price}",
                                          child: Text(
                                            category[index].price.toString(),
                                            style:const TextStyle(
                                                color:
                                                Colors.lightGreen,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Column(

                                      children: [
                                        Container(
                                          width: 40,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color: Colors.lightGreen,
                                            borderRadius:
                                            BorderRadius.circular(
                                                10),
                                          ),

                                          child:const Icon(
                                            Icons
                                                .add_shopping_cart_outlined,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

      );

  }
}
