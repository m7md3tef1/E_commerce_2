
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NoInterNetDialoug extends StatelessWidget {
  bool? dismiss;
  NoInterNetDialoug({Key? key, this.dismiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: AlertDialog(
          title: Row (
            children: [
             const Text('Twenty eight_string',style: TextStyle(fontSize: 14),).tr(),
              const Icon(Icons.not_interested),
            ],
          ),
          content:const Icon(Icons.wifi_off_outlined),
        ),
        onWillPop: () async {
          return dismiss! ? true : false;
        });
  }
}
