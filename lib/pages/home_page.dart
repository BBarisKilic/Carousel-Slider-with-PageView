import 'dart:math';

import 'package:flutter/material.dart';

import '../models/car_model.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    _currentPage = 0;
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.85);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(40.0),
                child: Center(
                  child: Text(
                    'Find Your Dream Car',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 26.0,
                    ),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 0.85,
                child: PageView.builder(
                  itemCount: carModels.length,
                  physics: const ClampingScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (_, index) => carouselView(index),
                ),
              )
            ],
          ),
        ),
      );

  Widget carouselView(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (_, child) {
          double value = 0.0;

          if (_pageController.position.haveDimensions) {
            value = index.toDouble() - (_pageController.page ?? 0);
            value = (value * 0.038).clamp(-1, 1);
          }

          return Transform.rotate(
            angle: pi * value,
            child: carouselCard(carModels[index]),
          );
        },
      );

  Widget carouselCard(CarModel model) => Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Hero(
                tag: model.imageName,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsPage(model: model),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                        image: AssetImage(
                          model.imageName,
                        ),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black26,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              model.title,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${model.price}',
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      );
}
