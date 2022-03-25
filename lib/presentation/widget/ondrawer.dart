import 'package:flutter/material.dart';
import 'package:untitled1/constant/Screens.dart';
class OnDrawer extends StatefulWidget {
  const OnDrawer({Key? key}) : super(key: key);

  @override
  _OnDrawerState createState() => _OnDrawerState();
}

class _OnDrawerState extends State<OnDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [const
          Center(child: Image(image: AssetImage('images/mm.png'))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children:const [
                       Text(
                        'Hello',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: const[
                      Text(
                        'Menna Shafik',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const[
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.home_outlined,
                    color: Colors.lightGreen,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text(
                    'Home',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, DeleteProductScreenPath);
              },
              child: Row(
                children:const [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.store,
                      color: Colors.lightGreen,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text(
                      'Products',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, MyOrdersPath);
              },
              child: Row(
                children:const [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.lightGreen,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text(
                      'My Orders',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children:const [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.phone_in_talk_outlined,
                    color: Colors.lightGreen,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text(
                    'About Us ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children:const [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.feedback,
                    color: Colors.lightGreen,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text(
                    'Send Feedback',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.share_outlined,
                    size: 20,
                    color: Colors.lightGreen,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text(
                    'Share This App',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );;
  }
}

