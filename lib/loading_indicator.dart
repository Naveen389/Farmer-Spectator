import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Padding(
          padding: const EdgeInsets.all(5.0),
          child: new Center(child: new CircularProgressIndicator())),
    );
  }
}
