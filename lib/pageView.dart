import 'package:flutter/material.dart';

final imagesList = [
  "assets/one.jpg",
  "assets/two.jpg",
  "assets/three.jpg",
  "assets/four.jpg"
];
final colorList = [
  Colors.red.shade200,
  Colors.pink.shade200,
  Colors.blue.shade100,
  Colors.deepPurple.shade100
];

class pageView extends StatefulWidget {
  @override
  _pageViewState createState() => _pageViewState();
}

class _pageViewState extends State<pageView> {
  PageController _controller;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.8,
    );
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return item(index);
        },
        itemCount: 4,
        controller: _controller,
        pageSnapping: true,
        onPageChanged: _onPageChange,
      ),
    );
  }

  Widget item(index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 1;
        if(_controller.position.haveDimensions){
          value = _controller.page - index;
          value = (1 - value.abs()*0.5);
          return Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: Curves.easeIn.transform(value)*500,
            margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Material(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    imagesList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
        }else{
          return Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: Curves.easeIn.transform(index == 0 ? value:value*0.5)*500,
            margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Material(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    imagesList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
        }
      },
    );
  }

  _onPageChange(int index) {
    setState(() {
      print("CurrentIndex => $index");
      currentPage = index;
    });
  }
}
