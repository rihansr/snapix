import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/data/models/album_model.dart';
import 'package:shared/utils/utils.dart';
import '../../domain/usecases/albums_usecase.dart';
part 'gallery_event.dart';
part 'gallery_state.dart';
part 'gallery_bloc.freezed.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  late final AlbumsUseCase _albumsUseCase;

  GalleryBloc(
    this._albumsUseCase,
  ) : super(const _GalleryState()) {
    on<GalleryEvent>((events, emit) async {
      await events.map(
        albums: (event) async => await _albums(event, emit),
        photos: (event) => _photos(event, emit),
      );
    });
  }

  _albums(_Albums event, Emitter<GalleryState> emitter) async {
    emitter(state.copyWith(status: Status.loading));
    final result = await _albumsUseCase.invoke();
    result.fold(
      (failure) => emitter(
          state.copyWith(status: Status.failure, albums: [], photos: [])),
      (albums) => emitter(
        state.copyWith(
          status: Status.success,
          albums: albums,
          photos: [],
        ),
      ),
    );
  }

  _photos(_Photos event, Emitter<GalleryState> emitter) {
    final photos =
        state.albums.firstWhereOrNull((e) => e.folder == event.id)?.photos ??
            [];
    emitter(
      state.copyWith(photos: photos),
    );
  }
}
