export 'package:flutter_svg/svg.dart';

final drawable = _Drawable.value;

class _Drawable {
  static _Drawable get value => _Drawable._();
  _Drawable._();

  final icLogo = 'assets/icons/ic_logo.svg';
  final icFolder = 'assets/icons/ic_folder.svg';

  /// Other
  final loading = 'assets/animations/loading.json';
  final empty = 'assets/animations/empty.json';
}
