import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  String? name;
  String? hint;
  var  icondata;
  var iconquation;
  var suffix;
  var color;
  bool? secure;
  var validator;
  var onSaved;
  var keyboardType = TextInputType.visiblePassword;

  TextEditingController? controller;
   CustomTextFormField(
      {Key? key,
      this.name,
      this.iconquation,
      this.color,
      required this.keyboardType,
      this.controller,
      this.hint,
      this.icondata,
      this.secure,
      this.suffix,
      this.validator,
      this.onSaved
      }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:(context,cons)=> Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.name!,
                      style:const TextStyle(fontSize: 18, ),
                    ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: MediaQuery.of(context).size.height*.08,
                width: MediaQuery.of(context).size.width,

                child: TextFormField(
                  controller: widget.controller,
                 onSaved:  widget.onSaved!,
                  validator: widget.validator,
                  obscureText: widget.secure!,
                  keyboardType: widget.keyboardType,
                  decoration: InputDecoration(
                    labelText: widget.hint,
                    prefixIcon: Icon(
                      widget.icondata,
                      color: widget.color,
                    ),
                    suffixIcon: widget.suffix,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                /*  decoration: InputDecoration(
                    hintText: widget.hint,
                    prefixIcon: Icon(
                      widget.icondata,
                      color: widget.color,
                    ),
                    suffixIcon: widget.suffix,
                    border: InputBorder.none,
                  ),*/
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
