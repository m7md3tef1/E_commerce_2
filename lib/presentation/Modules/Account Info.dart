
import 'package:flutter/material.dart';
import 'package:untitled1/constant/Screens.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: InkWell(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,3,8,8),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label:const Center(child: Text('Account Info',style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)),
                    prefixIcon: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:const Icon(Icons.west_outlined,color: Colors.black,
                        size: 20,),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('images/photo_2021-09-02_18-49-01.png'),
                  ),
                  const Text(
                    'Change Profile Picture',
                    style: TextStyle(fontSize: 15,color: Colors.grey, fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
            TextFormField(
              decoration:const InputDecoration(
                label: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('   Email',style: TextStyle(fontSize: 15,color: Colors.grey),),
                ),
                hintText: 'mennashafik@gmail.com',
              ),
            ),
            TextFormField(
              decoration:const InputDecoration(
                label: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('   First Name',style: TextStyle(fontSize: 15,color: Colors.grey),),
                ),
                hintText: 'menna',
              ),
            ),
            TextFormField(
              decoration:const InputDecoration(
                label: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('   Last Name',style: TextStyle(fontSize: 15,color: Colors.grey),),
                ),
                hintText: 'shafik',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const  Text(
                    '  Change Email ',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  InkWell(
                    onTap:() {
Navigator.pushNamed(context, ChangeEmailPath);
                    },
                    child:const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Colors.black26,
                  thickness: 1.5,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const   Text(
                    '  Change Password ',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, ChangePasswordPath);
                    },
                    child:const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Colors.black26,
                  thickness: 1.5,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height:50 ,
                width: 350,
decoration: BoxDecoration(
    color: Colors.grey[400],
  borderRadius: BorderRadius.circular(10)
),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container (
                      width: MediaQuery.of(context).size.width*.4,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(child:  Text('Male',style: TextStyle(fontSize: 18),)),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2,bottom: 2,right: 1),
                      child: Container (
                        width: MediaQuery.of(context).size.width*.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child:const Center(child:  Text('Female',style: TextStyle(fontSize: 18),)),


                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
