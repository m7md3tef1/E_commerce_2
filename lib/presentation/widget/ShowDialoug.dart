import 'package:flutter/material.dart';
class ShowDialoug extends StatefulWidget {
  const ShowDialoug({Key? key}) : super(key: key);

  @override
  State<ShowDialoug> createState() => _ShowDialougState();
}

class _ShowDialougState extends State<ShowDialoug> {

  showInformationDialoug(BuildContext? context)async{
    return await showDialog(context: context!, builder: (context){
      return AlertDialog(
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Row(
                children: const[
                  Center(child: Text('Language',style: TextStyle(fontSize: 20),)),
                ],
              ),
              Row(
                children:const [
                  Text('English',style: TextStyle(fontSize: 20),),
                ],
              ),
              Row(
                children:const [
                  SizedBox(
                      width: double.infinity,
                      child: Divider(
                        color: Colors.black26,
                        thickness: 1.5,
                      )),
                ],
              ),
              Row(
                children:const [
                  Text('English',style: TextStyle(fontSize: 20),),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: (){}, child:const Text('Okay'))
        ],
      );
    });


  }
  @override
  Widget build(BuildContext context) {
    return showInformationDialoug(context);

  }
}
