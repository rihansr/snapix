library utils;

import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared/utils/debug.dart';
export 'package:equatable/equatable.dart';
export 'package:collection/collection.dart';
export 'package:dartz/dartz.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
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

  Future<bool> requestPermission([bool doAction = true]) async {
    Permission permission = await _permissionType;
    if (await permission.request().isGranted ||
        await permission.request().isLimited) {
      return true;
    } else {
      if (doAction) {
        await openAppSettings().then((opened) {
          if (opened) requestPermission(false);
        });
      }
    }
    return false;
  }

  Future<void> fetchGallery() async {
    const MethodChannel channel = MethodChannel('gallery_images');
    final result = await channel.invokeMethod('getFoldersAndImages');
    debug.print(json.encode(result));
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
