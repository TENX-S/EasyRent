import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final VoidCallback? onPressed;

  final Widget? icon;

  final String? title;
  final Color titleColor;

  final String? describe;
  final Color describeColor;

  final Widget? rightWidget;

  ListItem({
    Key? key,
    this.onPressed,
    this.icon,
    this.title,
    this.titleColor: Colors.black,
    this.describe,
    this.describeColor: Colors.grey,
    this.rightWidget,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: ShapeDecoration(
        shape: Border.all(
          color: Colors.transparent,
          width: 0.0,
          style: BorderStyle.none,
        ),
      ),
      child: TextButton(
        onPressed: widget.onPressed,
        child: Container(
          height: 60.0,
          width: double.infinity,
          child: Row(
            children: <Widget>[
              widget.icon != null
                  ? Container(
                      padding: EdgeInsets.all(14.0),
                      child: SizedBox(
                        height: 32.0,
                        width: 32.0,
                        child: widget.icon,
                      ),
                    )
                  : Container(
                      width: 14.0,
                    ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    widget.title != null
                        ? Text(
                            widget.title!,
                            style: TextStyle(
                              color: widget.titleColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Container(),
                    widget.describe != null
                        ? Text(
                            widget.describe!,
                            maxLines: 2,
                            style: TextStyle(
                              color: widget.describeColor,
                              fontSize: 12.0,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              widget.rightWidget ?? Container(),
              Container(
                width: 14.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyIcon extends Icon {
  const EmptyIcon() : super(Icons.hourglass_empty);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
