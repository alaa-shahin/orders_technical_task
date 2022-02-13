part of 'app_pages.dart';

/// All Routes and Paths in app
abstract class Routes {
  static const ORDER = _Paths.ORDER;
  static const STATISTICS = _Paths.STATISTICS;
}

abstract class _Paths {
  static const ORDER = '/orders';
  static const STATISTICS = '/statistics';
}
