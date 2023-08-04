import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

const c1 = "assets/images/c1.jpg";
const c2 = "assets/images/c2.webp";
const c3 = "assets/images/c3.webp";
const c4 = "assets/images/c4.webp";
const c5 = "assets/images/c5.jpeg";

final List<String> imgList = [c1, c2, c3, c4, c5];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  // Image.asset(item, fit: BoxFit.cover, width: 1000.0),

                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                      // child: Text(
                      //   'No. ${imgList.indexOf(item)} image',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 20.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Complicated image slider demo')),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              // Wrap the CarouselSlider with Expanded
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
