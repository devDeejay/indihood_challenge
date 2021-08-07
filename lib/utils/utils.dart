

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildSingleCardLoadingShimmer(BuildContext context,
    {double height = 300, double width, double sidePadding = 16}) {
  return Shimmer.fromColors(
    enabled: true,
    period: Duration(milliseconds: 700),
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Padding(
      padding: EdgeInsets.fromLTRB(sidePadding, 4, sidePadding, 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: SizedBox(
          height: height,
          width: width == null ? getMaxAllowedWidth(context) : width,
          child: Container(
            color: Colors.grey.withOpacity(0.7),
          ),
        ),
      ),
    ),
  );
}

double getMaxAllowedWidth(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  if (width >= 600) {
    return 600;
  } else {
    return width;
  }
}

Widget buildTextWidget(String title,
    {Color color = Colors.black,
      double fontSize = 20,
      double leftMargin = 0,
      double rightMargin = 0,
      double height = 1.25,
      TextAlign textAlign = TextAlign.center,
      decoration: TextDecoration.none,
      String fontFamily,
      FontWeight fontWeight = FontWeight.normal}) {
  return (title != null && title.isNotEmpty)
      ? Padding(
    padding: EdgeInsets.only(left: leftMargin, right: rightMargin),
    child: Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: fontFamily,
          height: height,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          decoration: decoration),
    ),
  )
      : Container(
    width: 0,
    height: 0,
  );
}

Widget buildInfoTemplate({String title, String data}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextWidget(title, fontSize: 10),
        buildTextWidget(data, fontSize: 14,fontWeight: FontWeight.bold),
      ],
    ),
  );
}

Widget buildVerticalSpace(double space) {
  return SizedBox(
    height: space,
  );
}

void showSnackbarMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: "OK",
      textColor: Colors.white,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
    behavior: SnackBarBehavior.floating,
  ));
}