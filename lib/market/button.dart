import 'package:flutter/material.dart';
import 'package:navaninew/market/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onClick;

  PrimaryButton({@required this.onClick, @required this.text});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding:
          EdgeInsets.only(top: 12.0, bottom: 12.0, left: 60.0, right: 60.0),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0)),
      onPressed: onClick,
      color: Theme.of(context).primaryColor,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'Metropolis', fontSize: 16.0, color: Colors.white),
      ),
    );
  }
}

class PrimaryButtonSmall extends StatelessWidget {
  final String text;
  final Function onClick;

  PrimaryButtonSmall({@required this.onClick, @required this.text});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 30.0,
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25.0)),
        onPressed: onClick,
        color: Theme.of(context).primaryColor,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Metropolis', fontSize: 12.0, color: Colors.white),
        ),
      ),
    );
  }
}

class PrimaryIconsButtonSmall extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onClick;

  PrimaryIconsButtonSmall(
      {@required this.onClick, @required this.text, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 30.0,
      child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25.0)),
          onPressed: onClick,
          color: Theme.of(context).primaryColor,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(icon, color: ThemeColor.SECONDARY, size: 16.0),
            SizedBox(width: 10.0,),
            Text(
              text,
              style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 12.0,
                  color: Colors.white),
            )
          ])),
    );
  }
}

class SimpleButton extends StatelessWidget {
  final String text;
  final Function onClick;

  SimpleButton({@required this.onClick, @required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(color: ThemeColor.BLACK),
      padding: EdgeInsets.zero,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0)),
      onPressed: onClick,
      color: Colors.transparent,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'Metropolis', fontSize: 16.0, color: ThemeColor.BLACK),
      ),
    );
  }
}

class SimpleButtonSmall extends StatelessWidget {
  final String text;
  final Function onClick;

  SimpleButtonSmall({@required this.onClick, @required this.text});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 30.0,
      child: OutlineButton(
        borderSide: BorderSide(color: ThemeColor.BLACK),
        padding: EdgeInsets.zero,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25.0)),
        onPressed: onClick,
        color: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 12.0,
              color: ThemeColor.BLACK),
        ),
      ),
    );
  }
}

class LikeButtonSimple extends StatelessWidget {
  final Function onClick;
  final bool isActive;

  LikeButtonSimple({@required this.onClick, @required this.isActive});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 50.0,
      child: RaisedButton(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        shape: CircleBorder(),
        onPressed: onClick,
        child: Icon(
          isActive ? Icons.favorite : Icons.favorite_border,
          size: 22,
          color: isActive ? ThemeColor.PRIMARY : ThemeColor.FILL,
        ),
      ),
    );
  }
}

class SimpleRectButton extends StatefulWidget {
  final String text;
  final Function onClick;
  final bool isActive;

  SimpleRectButton(
      {@required this.onClick, @required this.text, @required this.isActive});

  @override
  _SimpleRectButtonState createState() =>
      _SimpleRectButtonState(text: text, onClick: onClick, isActive: isActive);
}

class _SimpleRectButtonState extends State<SimpleRectButton> {
  final String text;
  final Function onClick;
  final bool isActive;

  _SimpleRectButtonState(
      {@required this.onClick, @required this.text, @required this.isActive});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide:
          BorderSide(color: isActive ? ThemeColor.PRIMARY : ThemeColor.FILL),
      padding: EdgeInsets.zero,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)),
      onPressed: onClick,
      color: Colors.transparent,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Metropolis',
          fontSize: 16.0,
          color: isActive ? ThemeColor.PRIMARY : ThemeColor.BLACK,
        ),
      ),
    );
  }
}
