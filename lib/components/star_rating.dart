import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final Widget unselectedImage;
  final Widget selectedImage;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  StarRating({
    @required this.rating,
    this.maxRating = 10,
    this.size = 20,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffe0aa46),
    Widget unselectedImage,
    Widget selectedImage,
    this.count = 5
  }):unselectedImage = unselectedImage ?? Icon(Icons.star, size: size, color: unselectedColor,),
        selectedImage = selectedImage ?? Icon(Icons.star, size: size, color: selectedColor);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          getUnSelectImage(),
          getSelectImage()
        ],
      ),
    );
  }

  // 获取星星
  Widget getUnSelectImage(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:List.generate(widget.count, (int index) => widget.unselectedImage),
      /*
      * children: List.generate(widget.count, (int index){
        return widget.unselectedImage;
      })
      * */
    );
  }

  // 获取选中的星星
  Widget getSelectImage(){

    // 1.计算Star个数和剩余比例等
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    // 2.剩余的一个star显示的比例
    double leftValue = widget.rating - entireCount * oneValue;
    double leftRatio = leftValue / oneValue;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(entireCount+1, (int index){
        if (index < entireCount) return widget.selectedImage;
        return ClipRect(
          clipper: MyRectClipper(width: widget.size * leftRatio),
          child: widget.selectedImage,
        );
      }),
    );
  }
}

class MyRectClipper extends CustomClipper<Rect> {
  final double width;
  
  MyRectClipper({
    this.width
  });
  
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    return width != oldClipper.width;
  }
}
