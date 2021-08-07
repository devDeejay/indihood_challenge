import 'package:dhananjay_indihood_submission/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContentCard extends StatefulWidget {
  final String title;
  final List<Widget> listOfWidgets;
  final int collapsedDataLength;
  final String collapsedButtonTextToShow;

  ContentCard(
      {this.title,
      this.listOfWidgets,
      this.collapsedDataLength,
      this.collapsedButtonTextToShow,
      Key key})
      : super(key: key);

  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return buildContentCard();
  }

  Widget buildContentCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFDDE4E7), width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildTextWidget(widget.title,
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.collapsedDataLength != null
                  ? isCollapsed
                      ? widget.listOfWidgets
                          .sublist(0, widget.collapsedDataLength)
                      : widget.listOfWidgets
                  : widget.listOfWidgets,
            ),
            widget.collapsedDataLength != null
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isCollapsed = !isCollapsed;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: buildTextWidget(isCollapsed ? widget.collapsedButtonTextToShow : "SEE LESS",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
