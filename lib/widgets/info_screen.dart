import 'dart:developer';

import 'package:covid19_flutter_app/styles/styles.dart';
import 'package:covid19_flutter_app/utils/constant.dart';
import 'package:covid19_flutter_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 1080,
      height: 1920,
    );
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(
            image: 'assets/icons/coronadr.svg',
            textTop: "Get to know",
            textBottom: "About Covid-19",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Symptoms",
                  style: titleTextstyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SymptomCard(
                      image: "assets/images/headache.png",
                      title: "Headache",
                      isActive: true,
                    ),
                    SymptomCard(
                      image: "assets/images/caugh.png",
                      title: "Caugh",
                    ),
                    SymptomCard(
                      image: "assets/images/fever.png",
                      title: "Fever",
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Prevention",
                  style: titleTextstyle,
                ),
                SizedBox(height: 20),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: activeShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: shadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 90,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
