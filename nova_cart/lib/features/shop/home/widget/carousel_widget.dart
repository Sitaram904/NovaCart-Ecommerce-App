import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  List imageUrl = [];
  CarouselController carouselController = CarouselController(initialItem: 0);
  int currentIndex = 0;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    getBannerImages();
    _repeated();
  }

  Future<void> getBannerImages() async {
    final doc = await FirebaseFirestore.instance
        .collection('bannerImages')
        .doc('Zy7PHrCbGATHvejntNPL')
        .get();

    imageUrl = doc.data()?['banerImages'] ?? [];
    setState(() {});
  }

  void _repeated() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentIndex < imageUrl.length - 1) {
  currentIndex++;
} else {
  currentIndex = 0;
}

if(!mounted)return;
      currentIndex != currentIndex+1
          ? carouselController.animateToItem(
              currentIndex,
              duration: Duration(milliseconds: 500),
              curve: Curves.linear,
            )
          : carouselController.jumpTo(0);
    });
  }

  @override
  void dispose() {
    carouselController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: CarouselView(
              scrollDirection: Axis.horizontal,
              itemSnapping: true,
              controller: carouselController,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10),
              ),

              itemExtent: double.infinity,
              children: List.generate(imageUrl.length, (index) {
                return Image.network(
                  imageUrl[index],
                  fit: BoxFit.cover,

                  height: 200,
                  width: double.infinity,
                );
              }),
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: List.generate(imageUrl.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: 5,
                width: currentIndex == index ? 20 : 5,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
