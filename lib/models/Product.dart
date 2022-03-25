class Product {
  var  id;
  var  name;
  var price;
  var Size;
  var imgurl;
  var Description;
  var type;
  int? counter = (1);
  Product(
      {this.type,
      this.counter,
      this.name,
      this.price,
      this.id,
      this.Description,
      this.imgurl,
      this.Size});

  Product.fromJson(Map<String, dynamic> json){
    name =json['name'];
    price=json['prise'];
    id=json['id'];
    Description=json['Description'];
    Size=json['size'];
  }
  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'prise': price,
      'Description': Description,
      'size': Size,
    };
  }
}
