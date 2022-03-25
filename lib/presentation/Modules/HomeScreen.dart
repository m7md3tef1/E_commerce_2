import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Blocs/FavBlocCubit.dart';
import 'package:untitled1/Blocs/FavBlocState.dart';
import 'package:untitled1/constant/Screens.dart';
import 'package:untitled1/models/Product.dart';
import 'package:untitled1/presentation/Modules/ProductDetails.dart';
import '../widget/ondrawer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  List images = [
    'images/photo_2021-07-06_17-26-06.png',
    'images/photo_2021-07-06_17-26-04.png',
    'images/photo_2021-07-06_17-26-02 (2).png',
    'images/photo_2021-07-06_17-25-56 (2).png',
    'images/photo_2021-07-06_18-19-00.png',
    'images/photo_2021-07-06_17-25-56.png',
    'images/photo_2021-07-06_17-25-58.png',
    'images/photo_2021-07-06_17-26-00.png',
    'images/photo_2021-07-06_17-26-01.png'
  ];

  List categoryNames = [
    'sandwiches',
    'seafood',
    'drinks',
    'dessert',
    'ketogenic.',
    'sides',
    'salad',
    'chicken',
    'beef',
  ];
  List colors = [
    Colors.lightGreenAccent,
    Colors.orangeAccent,
    Colors.pink,
    Colors.indigo,
    Colors.green,
    Colors.deepOrangeAccent,
    Colors.lime,
    Colors.deepOrange,
    Colors.lightGreen
  ];
  List picture = [
    'images/photo_2021-07-02_15-06-19.png',
    'images/photo_2021-07-02_15-06-18.png'
  ];
  List name = [
    'mix grill',
    'mix seafood',
  ];
  List price = ['115' , '115' ];
  List<Product> products = [
    Product(
      imgurl: 'images/photo_2021-07-02_15-06-19.png',
      name: 'mix grill',
      price: '115',
    ),
    Product(
      imgurl: 'images/photo_2021-07-02_15-06-18.png',
      name: 'mix seafood',
      price: '115' ,
    ),
  ];

  List<Product> category = [
    Product(
      imgurl: 'images/photo_2021-07-02_15-06-20.png',
      name: 'kabab hala',
      price: '115',
    ),
    Product(
      imgurl: 'images/photo_2021-07-06_17-26-01.png',
      name: 'beef',
      price: '115' ,
    ),
  ];
  List categoryimage = [
    'images/photo_2021-07-02_15-06-20.png',
    'images/photo_2021-07-06_17-26-01.png'
  ];
  List categoryname = [
    'mix grill',
    'mix seafood',
  ];

  @override
  Widget build(BuildContext context) {
    var favlist = FavCubit.get(context);
    return LayoutBuilder(
      builder: (context, cons) => Scaffold(
          key: scaffoldkey,
          backgroundColor: Colors.grey[100],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (i) {
              setState(() {
                selectedIndex = i;
              });
            },
            selectedItemColor: Colors.lightGreen,
            unselectedItemColor: Colors.grey,
            items: [
               BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, HomeScreenPath);
                    },
                    child:const Icon(
                      Icons.home_outlined,
                      size: 40,
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, FavScreenPath);
                    },
                    child: const Icon(
                      Icons.favorite_border_outlined,
                      size: 40,
                    ),
                  ),
                  label: ''),
               BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, OrderDetailsPath);
                    },
                    child:const Icon(
                      Icons.shopping_cart_outlined,
                      size: 40,
                    ),
                  ),
                  label: ''),
               BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, SettingScreenPath);
                    },
                    child:const  Icon(
                      Icons.settings_outlined,
                      size: 40,
                    ),
                  ),

                  label: ''),
            ],
          ),
          drawer: const OnDrawer(),
          body: SingleChildScrollView(
            child: SafeArea(
              child: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: cons.maxHeight * .07,
                          width: cons.maxWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: InkWell(
                                    onTap: () {
                                      scaffoldkey.currentState!.openDrawer();
                                    },
                                    child: const Icon(
                                      Icons.menu_outlined,
                                      color: Colors.black,
                                    )),
                                suffixIcon: const Icon(
                                  Icons.search_outlined,
                                  color: Colors.black,
                                ),
                                label: const Center(
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                border: InputBorder.none),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            'category',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: cons.maxHeight * .26,
                      width: cons.maxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: categoryNames.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 155,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: colors[index],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                    child: Text(
                                                  categoryNames[index],
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 35,
                                                    backgroundImage: AssetImage(
                                                        images[index]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'best seller',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'see more',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //best seller
                    Container(
                      height: cons.maxHeight * .37,
                      width: cons.maxWidth,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: products.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BlocConsumer<FavCubit, FavState>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    for (var product in favlist.favList) {
                                      if (product == products[index]) {
                                        return InkWell(
                                          onTap: () {
//favlist.removeProduct(products[index]);
                                          },
                                          child: Badge(
                                            badgeColor: Colors.grey[100]!,
                                            badgeContent: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(context, FavScreenPath);
                                              },
                                              child: const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder: (context) {
                                                          return ProductDetails(
                                                            product: products[index],
                                                          );
                                                        }));
                                                  },
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: Hero(
                                                      tag:
                                                          "image-${picture[index]}",
                                                      child: Image(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            picture[index]),
                                                        width: 180,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            .50,
                                                      ),
                                                    ),
                                                    height: 160,
                                                    width: 250,
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.white,
                                                  height: 70,
                                                  width: 250,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Hero(
                                                              tag:
                                                                  "name-${name[index]}",
                                                              child: Text(
                                                                name[index],
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            Hero(
                                                              tag:
                                                                  "price-${price[index].toString()}",
                                                              child: Text(
                                                                price[index].toString()+' EGY',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .lightGreen,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .lightGreen,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              width: 40,
                                                              height: 40,
                                                              child:
                                                                  const Icon(
                                                                Icons
                                                                    .add_shopping_cart_outlined,
                                                                size: 25,
                                                                color: Colors
                                                                    .white,
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
                                        );
                                      }
                                    }
                                    return InkWell(
                                      onTap: () {
                                        // favlist.addProduct(products[index]);
                                      },
                                      child: Badge(
                                        badgeColor: Colors.grey[100]!,
                                        badgeContent: InkWell(
                                          onTap: () {
                                          Navigator.pushNamed(context, FavScreenPath);
                                        },
                                          child: const Icon(
                                            Icons.favorite_border_outlined,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (context) {
                                                      return ProductDetails(
                                                        product: products[index],
                                                      );
                                                    }));
                                              },
                                              child: Container(
                                                color: Colors.white,
                                                child: Hero(
                                                  tag:
                                                      "image-${picture[index]}",
                                                  child: Image(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        picture[index]),
                                                    width: 180,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .50,
                                                  ),
                                                ),
                                                height: 160,
                                                width: 250,
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              height: 70,
                                              width: 250,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Hero(
                                                          tag:
                                                              "name-${name[index]}",
                                                          child: Text(
                                                            name[index],
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Hero(
                                                          tag:
                                                              "price-${price[index].toString()}",
                                                          child: Text(
                                                            price[index].toString()+' EGY',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .lightGreen,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .lightGreen,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          width: 40,
                                                          height: 40,
                                                          child: const Icon(
                                                            Icons
                                                                .add_shopping_cart_outlined,
                                                            size: 25,
                                                            color:
                                                                Colors.white,
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
                                    );
                                  }),
                            );
                          }),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.lightGreen,
                        ),
                        height: cons.maxHeight * .21,
                        width: cons.maxWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '  Healthy Food',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Text(
                                    '   For Busy People',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 12, 12, 0),
                                  child: Container(
                                    height: cons.maxHeight * .06,
                                    width: cons.maxWidth * .3,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'View Our Menu',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image(
                                  image: const AssetImage(
                                    'images/photo_2021-04-04_01-38-29.png',
                                  ),
                                  height: cons.maxHeight * .21,
                                  width: cons.maxWidth * .33,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'new arrival',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'see more',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    ///new arrival
                    Container(
                      height: cons.maxHeight * .37,
                      width: cons.maxWidth,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: category.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Badge(
                                badgeColor: Colors.grey[100]!,
                                badgeContent: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(context, FavScreenPath);
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        child: Hero(
                                          tag: "image-${categoryimage[index]}",
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image:
                                                AssetImage(categoryimage[index]),
                                            width: 180,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .50,
                                          ),
                                        ),
                                        height: 160,
                                        width: 250,
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      height: 70,
                                      width: 250,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Hero(
                                                  tag:
                                                      "name-${categoryname[index]}",
                                                  child: Text(
                                                    categoryname[index],
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Hero(
                                                  tag: "price-${price[index].toString()}",
                                                  child: Text(
                                                    price[index].toString()+' EGY',
                                                    style: const TextStyle(
                                                        color:
                                                            Colors.lightGreen,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.lightGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  width: 40,
                                                  height: 40,
                                                  child: const Icon(
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
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
