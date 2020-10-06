import 'package:covid19_flutter_app/styles/styles.dart';
import 'package:covid19_flutter_app/utils/clipper.dart';
import 'package:covid19_flutter_app/widgets/info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CovidHeader extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;

  const CovidHeader({
    Key key,
    this.image,
    this.textTop,
    this.textBottom,
    this.offset,
  }) : super(key: key);
  @override
  _CovidHeaderState createState() => _CovidHeaderState();
}

class _CovidHeaderState extends State<CovidHeader> {
  @override
  Widget build(BuildContext context) {
    var cP = Navigator.of(context).canPop();
    double statusBarHeight = ScreenUtil.statusBarHeight;
    double pixelRatio = ScreenUtil.pixelRatio;
    double contentOffset = statusBarHeight * pixelRatio;
    return ClipPath(
      clipper: HomeImageClipper(),
      child: Container(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(contentOffset),
          left: ScreenUtil().setHeight(60),
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
              alignment: cP ? Alignment.topLeft : Alignment.topRight,
              child: cP ? Back() : Menu(),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
            Expanded(
                child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  top: (widget.offset < 0) ? 0 : widget.offset,
                  left: ScreenUtil().setHeight(100),
                  child: SvgPicture.asset(
                    widget.image,
                    width: ScreenUtil().setHeight(460),
                    alignment: Alignment(0.0, 1),
                  ),
                ),
                Positioned(
                  top: 20 - widget.offset / 2,
                  left: ScreenUtil().setHeight(400),
                  child: Text(
                    '${widget.textTop} \n${widget.textBottom}',
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

class Back extends StatelessWidget {
  const Back({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: SvgPicture.asset(
        'assets/icons/back.svg',
        width: 20,
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return InfoScreen();
            },
          ),
        );
      },
      icon: SvgPicture.asset(
        'assets/icons/menu.svg',
        width: 20,
      ),
    );
  }
}
