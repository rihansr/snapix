import 'package:shared/di/service_locator.dart';
import 'package:shared/utils/utils.dart';
import '../../data/data_sources/error/failures.dart';
import '../../data/models/album_model.dart';
import '../repositories/gallery_repository.dart';

@LazySingleton()
class AlbumsUseCase {
  final GalleryRepository repository;

  AlbumsUseCase(this.repository);

  Future<Either<Failure, List<AlbumModel>>> invoke() async {
    final result = await repository.albums();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
