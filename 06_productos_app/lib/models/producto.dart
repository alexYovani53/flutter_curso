
import 'dart:convert';

class Producto {
	bool available;
	String name;
  String? id;
	String? picture;
	double price;

  Producto({
    required this.available,
    required this.name,
    required this.price,
    this.picture,
    this.id
  });

	@override
	String toString() {
		return 'Producto(available: $available, name: $name, picture: $picture, price: $price)';
	}

	factory Producto.fromFromService(Map<String, dynamic> json) => Producto(
				available: json['available'] as bool,
				name: json['name'] as String,
				picture: json['picture'] as String?,
				price: json['price'] as double,
			);

	Map<String, dynamic> toMap() => {
				"available": available,
				"name": name,
				"picture": picture,
				"price": price,
			};

  String toJson() => json.encode(toMap());

  Producto copy() => Producto(
        available: available,
        name: name,
        picture: picture,
        price: price,
        id: id,
      );
}
