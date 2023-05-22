class Productmodel {
  String? date;
  int? id, userId, v;
  List<dynamic>? Products;

  Productmodel({this.date, this.id, this.userId, this.v, this.Products});

  factory Productmodel.fromjson(Map m1) {

    List productList=m1['products'];

    List<Productmodel> item=productList.map((e) => Productmodel.fromjson(e)).toList();

    return Productmodel(
        date: m1['date'],
        id: m1['id'],
        userId: m1['userId'],
        v: m1['__v'],
        Products: item,
    );
  }
}

class products {
  int? productId, quantity;

  products({this.productId, this.quantity});

  factory products.fromjson(Map m1) {
    return products(productId: m1['productId'], quantity: m1['quantity']);
  }
}
