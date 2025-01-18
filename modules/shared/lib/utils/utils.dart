library utils;

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
export 'constants.dart';
export 'debug.dart';
export 'enums.dart';

final utils = _Utils.instance;

class _Utils {
  static _Utils get instance => _Utils._();
  _Utils._();

  Future<bool> isPermissionGranted() async {
    Permission permission = await _permissionType;
    return !(await permission.isDenied || await permission.isPermanentlyDenied);
  }

  Future<bool> requestPermission() async {
    Permission permission = await _permissionType;
    return await permission.request().isDenied ||
            await permission.request().isPermanentlyDenied
        ? await openAppSettings()
        : true;
  }

  Future<Permission> get _permissionType async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin plugin = DeviceInfoPlugin();
      AndroidDeviceInfo android = await plugin.androidInfo;
      return android.version.sdkInt < 33
          ? Permission.storage
          : Permission.photos;
    } else {
      return Permission.photos;
    }
  }
}
