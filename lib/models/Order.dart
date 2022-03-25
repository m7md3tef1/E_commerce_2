import 'package:untitled1/models/Product.dart';

class Order {
  String? id;
  var name;
  var   price;
  var quantity;
  var imgurl;
  var category;
  var type;

  Order({this.type,this.name, this.price, this.id,this.category,this.imgurl,this.quantity});

  Order.fromJson(Map<String, dynamic> json){
    name =json['name'];
    price=json['prise'];
   // quantity=json['quantity'];
    id=json['id'];
    imgurl=json['image'];
  }
  Map<String, dynamic> toMap(){
    return{
      //'id': id ,
      'name': name,
      'price': price,
      //'quantity':quantity,
      'image':imgurl
    };
  }

}
