import 'package:shared/di/service_locator.dart';
import 'package:shared/utils/utils.dart';
import '../../domain/repositories/gallery_repository.dart';
import '../data_sources/error/failures.dart';
import '../data_sources/gallery_api_impl.dart';
import '../models/album_model.dart';

@LazySingleton(as: GalleryRepository)
class GalleryRepositoryImpl extends GalleryRepository {
  final GalleryApiImpl projectsApi;

  GalleryRepositoryImpl(this.projectsApi);

  @override
  Future<Either<Failure, List<AlbumModel>>> albums() async {
    try {
      final result = await projectsApi.albums();
      return Right(result);
    } catch (e) {
      return Left(Failure('$e'));
    }
  }
}
