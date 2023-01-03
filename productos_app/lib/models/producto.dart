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

	Map<String, dynamic> toFromService() => {
				'available': available,
				'name': name,
				'picture': picture,
				'price': price,
			};

  Producto copy() => Producto(
        available: available,
        name: name,
        price: price,
        id: id,
      );
}
