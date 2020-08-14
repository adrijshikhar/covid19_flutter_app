import 'package:covid19_flutter_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';


class CaseCounter extends StatelessWidget {
  final int number;
  final TextStyle textStyle;
  final Color color;
  final String title;
  const CaseCounter({
    Key key,
    this.number,
    this.textStyle,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(ScreenUtil().setHeight(12)),
          width: ScreenUtil().setWidth(60),
          height: ScreenUtil().setHeight(60),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        Container(
          child: Text('$number', style: textStyle),
        ),
        Container(
          child: Text('$title', style: subTextStyle),
        )
      ],
    );
  }
}
