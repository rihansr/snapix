import '../../data/models/album_model.dart';

abstract class GalleryApi {
  Future<List<AlbumModel>> albums();
}
