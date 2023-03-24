// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:kwiz/classes/multiLineTextField.dart';

class aboutQuizCard extends StatefulWidget {
  const aboutQuizCard({super.key});

  @override
  State<aboutQuizCard> createState() => _aboutQuizCardState();
}

class _aboutQuizCardState extends State<aboutQuizCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Add Title',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Flexible(
              child: MultiLineTextField(
                  hintText: 'About', minLines: 3, maxLines: 3, labelText: ''),
            ),
            SizedBox(
              height: 6.0,
            ),
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Category',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 10.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
