import 'package:shared/utils/utils.dart';
import '../../data/data_sources/error/failures.dart';
import '../../data/models/album_model.dart';

abstract class GalleryRepository {
  Future<Either<Failure, List<AlbumModel>>> albums();
}