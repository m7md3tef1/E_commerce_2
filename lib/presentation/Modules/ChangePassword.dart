import 'package:flutter/material.dart';
import 'package:untitled1/presentation/widget/TextButton.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,8,8,8),
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
                  label:const Center(child: Text('Change Password',style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)),
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8),            child: TextFormField(
              decoration:const  InputDecoration(
                hintText: '  Current Password',
                hintStyle: TextStyle(color: Colors.grey,fontSize:18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8),            child: TextFormField(
              decoration:const  InputDecoration(
                hintText: '  New Password ',
                hintStyle: TextStyle(color: Colors.grey,fontSize:18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8),
            child: TextFormField(
              decoration:const  InputDecoration(
                hintText: '  Confirm New Password ',
                hintStyle: TextStyle(color: Colors.grey,fontSize:18),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextButton1(
                name:'Submit'
            ),
          )
        ],
      ),
    );
  }
}
