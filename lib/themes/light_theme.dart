// Create Light Theme to use it in app

import 'package:orders_task/themes/widgets_theme/text_theme.dart';
import 'package:orders_task/utils/constants.dart';

import '../index.dart';

var lightTheme = ThemeData(
  primaryColor: Constants.mainColor,
  brightness: Brightness.light,
  backgroundColor: Constants.mainColor,
  scaffoldBackgroundColor: Constants.mainColor,
  accentColor: Constants.textButtonColor,
  textTheme: textTheme,
);
