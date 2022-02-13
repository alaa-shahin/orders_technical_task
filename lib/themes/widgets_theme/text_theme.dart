// Create text theme to use it in app

import 'package:flutter/material.dart';
import 'package:orders_task/utils/constants.dart';

var textTheme = TextTheme(
  button: TextStyle(
    color: Constants.textButtonColor,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
  headline4: TextStyle(
    color: Constants.textColor,
    fontWeight: FontWeight.bold,
  ).copyWith(
    color: Constants.textButtonColor,
  ),
  headline5: TextStyle(
    color: Constants.textColor,
  ).copyWith(
    color: Constants.textButtonColor,
  ),
  headline6: TextStyle(
    color: Constants.textColor,
    fontWeight: FontWeight.bold,
  ).copyWith(
    color: Constants.textButtonColor,
  ),
  subtitle1: TextStyle(
    color: Constants.textColor,
  ).copyWith(
    color: Constants.textButtonColor,
  ),
  subtitle2: TextStyle(
    color: Constants.textColor,
  ).copyWith(
    color: Constants.textButtonColor,
  ),
  bodyText2: TextStyle(
    color: Constants.textColor,
  ).copyWith(
    color: Constants.textButtonColor,
  ),
);
