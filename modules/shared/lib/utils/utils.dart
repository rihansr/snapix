library utils;
export 'constants.dart';
export 'debug.dart';
export 'enums.dart';

final utils = _Utils.instance;

class _Utils {
  static _Utils get instance => _Utils._();
  _Utils._();
}
