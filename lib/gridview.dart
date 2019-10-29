import 'package:flutter/material.dart';

class MyGridView {
  Card getStructuredGridCell(name, image) {
    return Card(
        elevation: 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.up,
          children: <Widget>[

            Center(
              child: Text(name),
            )
          ],
        ));
  }

  GridView build() {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        getStructuredGridCell("Facebook", "data_repo/img/social/facebook.png"),
        getStructuredGridCell("Twitter", "data_repo/img/social/twitter.png"),
        getStructuredGridCell("Instagram", "data_repo/img/social/instagram.png"),
        getStructuredGridCell("Linkedin", "data_repo/img/social/linkedin.png"),
        getStructuredGridCell("Google Plus", "data_repo/img/social/google_plus.png"),
       ],
    );
  }
}
