part of 'gallery_bloc.dart';

@Freezed(copyWith: true, equal: true)
class GalleryState with _$GalleryState {
  const factory GalleryState({
    @Default(Status.initial) Status status,
    @Default(<AlbumModel>[]) List<AlbumModel> albums,
    @Default(<String>[]) List<String> photos,
  }) = _GalleryState;
}
