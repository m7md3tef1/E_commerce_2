import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Product.dart';

class ProductApi {
  List<Product>? products;
  ProductApi(this.products);
  getProducts() async {
    await FirebaseFirestore.instance.collection('Product').get().then((value) {
      value.docs.forEach((element) {
        Product p =Product.fromJson(element.data());
        p.id = element.id;
        products?.add(p);
      });
    });
    return products;
  }
}

class DeleteProductApi{
  Product? p;
  deleteProduct()async {
    await FirebaseFirestore.instance.collection('Products').doc(p!.id).delete();
  }
}

class UpdateProductApi{
  Product? p;
  deleteProduct()async {
    await FirebaseFirestore.instance.collection('Products').doc(p!.id).update(p!.toMap());
  }
}
