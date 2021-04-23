import 'package:flutter/material.dart';

class MenueInfo {
  final int position;
  final String name;
  final String image;
 final String action;
  final String description;



  MenueInfo(
      this.position, {
        this.name,
        this.image,
        this.description,
        this.action

      });
}

List<MenueInfo> menue = [
  MenueInfo(1,
      name: 'Examination',

      description:
  'Breast self-exam (BSE), or regularly examining your breasts on your own, can be an important way to find breast cancer early when it’s more likely to be treated successfully. ',
    image: 'images/test.png',
    action: '/examination',
    ),
  MenueInfo(2,
      name: 'Prediction',

      description:
     'If you have some doubts, we will assist you in confirming or denying them through medical reports,and some questions we will predict the results',
    image: 'images/9.jpeg',
    action: '/'
  ),
];
