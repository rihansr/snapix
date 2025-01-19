import 'package:flutter/services.dart';
import 'package:shared/di/service_locator.dart';
import '../models/album_model.dart';
import 'gallery_api.dart';

@LazySingleton()
class GalleryApiImpl extends GalleryApi {
  GalleryApiImpl();

  @override
  Future<List<AlbumModel>> albums() async {
    const MethodChannel channel = MethodChannel('gallery_images');
    final result = await channel.invokeMethod('getFoldersAndImages');
    return AlbumModel.fromJsonList(result ?? []);
  }
}
