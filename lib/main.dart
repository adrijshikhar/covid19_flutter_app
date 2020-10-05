import 'package:covid19_flutter_app/styles/styles.dart';
import 'package:covid19_flutter_app/utils/constant.dart';
import 'package:covid19_flutter_app/widgets/counter.dart';
import 'package:covid19_flutter_app/widgets/header.dart';
import 'package:covid19_flutter_app/widgets/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(bodyText2: TextStyle(color: bodyTextColor))),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 1080,
      height: 1920,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(
              image: 'assets/icons/Drcorona.svg',
              textTop: "All you need",
              textBottom: "is to stay at home",
            ),
            Container(
              height: ScreenUtil().setHeight(120),
              margin:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(60)),
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(60),
                  vertical: ScreenUtil().setHeight(20)),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/maps-and-flags.svg',
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(40),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        value: "India",
                        items: ['India', 'Bangladesh', 'United States', 'Japan']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(60),
                vertical: ScreenUtil().setWidth(40),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Case Update',
                                  style: titleTextstyle,
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Newest update on May 08",
                                  style: TextStyle(
                                    color: textLightColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        'See Details',
                        style: linkTextStyles,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setWidth(60),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(40),
                      horizontal: ScreenUtil().setWidth(80),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: shadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CaseCounter(
                          number: 1096,
                          textStyle: infectedTextStyles,
                          title: 'Infected',
                          color: infectedColor,
                        ),
                        CaseCounter(
                          number: 87,
                          textStyle: deathTextStyles,
                          title: 'Deaths',
                          color: deathColor,
                        ),
                        CaseCounter(
                          number: 34,
                          textStyle: recoveredTextStyles,
                          title: 'Recovered',
                          color: recovercolor,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Spread of Virus",
                        style: titleTextstyle,
                      ),
                      Text(
                        'See Details',
                        style: linkTextStyles,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setWidth(60),
                    ),
                    padding: EdgeInsets.all(
                      ScreenUtil().setWidth(40),
                    ),
                    height: ScreenUtil().setHeight(356),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 30,
                            color: shadowColor),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
