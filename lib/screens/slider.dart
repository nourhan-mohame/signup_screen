import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Carouslider extends StatefulWidget {
  const Carouslider({Key? key});

  @override
  _CarousliderState createState() => _CarousliderState();
}

class _CarousliderState extends State<Carouslider> {
  int _currentSlide = 0;
  int _selectedIndex = 0;

  void navigateToBottom(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    Center(
      child: Text(
        'Home Screen',
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        'Category Screen',
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        'Cart Screen',
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(fontSize: 50),
      ),
    ),
  ];
  final List<String> imageList = [
    "assets/image1.jpg",
    "assets/image2.jpg",
    "assets/image3.jpg",
    "assets/image4.jpg",
    "assets/image5.jpg",
    "assets/image6.jpg",
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: pages,
          ),
          Positioned(
            top:20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CarouselSlider(
                  items: imageList.map((item) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 300,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentSlide = index;
                      });
                    },
                    enableInfiniteScroll: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  ),
                ),
                SizedBox(height: 30),
                DotsIndicator(
                  dotsCount: imageList.length,
                  position: _currentSlide.toInt(),
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: navigateToBottom,
        backgroundColor:Colors.black26,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}