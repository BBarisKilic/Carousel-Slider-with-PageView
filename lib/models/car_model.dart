class CarModel {
  final String title;
  final String imageName;
  final double price;

  CarModel({
    required this.title,
    required this.imageName,
    required this.price,
  });
}

List<CarModel> carModels = [
  CarModel(
    title: 'BMW',
    imageName: 'assets/images/bmw.jpeg',
    price: 100000,
  ),
  CarModel(
    title: 'Ferrari',
    imageName: 'assets/images/ferrari.jpeg',
    price: 400000,
  ),
  CarModel(
    title: 'Lamborghini',
    imageName: 'assets/images/lamborghini.jpeg',
    price: 350000,
  ),
  CarModel(
    title: 'Porsche',
    imageName: 'assets/images/porsche.jpeg',
    price: 180000,
  ),
];
