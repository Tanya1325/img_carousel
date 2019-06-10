import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
void main()=> runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )
); 
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageCarousel(),
    );
  }
}
class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 5000));
    _animation = Tween(begin: 0.0,end: 18.0).animate(_animationController)
    ..addListener(()
    {
      setState(() {
        
      });
    });
    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
  
    Widget carousel = Carousel(
          boxFit: BoxFit.fitHeight,
          images: [
            NetworkImage('https://images.pexels.com/photos/736230/pexels-photo-736230.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),
            NetworkImage('https://images.pexels.com/photos/1086178/pexels-photo-1086178.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
           NetworkImage('https://images.pexels.com/photos/259707/pexels-photo-259707.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
          ],
         
          animationCurve: Curves.easeInOutCubic,
          animationDuration: Duration(seconds: 1),
           );
           return Container(
             height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
             child: 
            carousel,
           );
  }
  @override
  void dispose() {
   _animationController.dispose();
    super.dispose();
  }
}
