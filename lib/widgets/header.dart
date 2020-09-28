
import 'package:covid19_flutter_app/styles/styles.dart';
import 'package:covid19_flutter_app/utils/clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;

  const Header({
    Key key,
    this.image,
    this.textTop,
    this.textBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HomeImageClipper(),
      child: Container(
        padding: EdgeInsets.only(
          left: ScreenUtil().setHeight(100),
          top: ScreenUtil().setHeight(100),
          right: ScreenUtil().setHeight(60),
        ),
        height: ScreenUtil().setHeight(720),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff3383cd),
              Color(0xff11249f),
            ],
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/virus.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset('assets/icons/menu.svg'),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
            Expanded(
                child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  top: ScreenUtil().setHeight(20),
                  left: ScreenUtil().setHeight(20),
                  child: SvgPicture.asset(
                    image,
                    width: ScreenUtil().setHeight(460),
                    alignment: Alignment.topCenter,
                  ),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(60),
                  left: ScreenUtil().setHeight(300),
                  child: Text(
                    '$textTop \n$textBottom',
                    style: headingTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
