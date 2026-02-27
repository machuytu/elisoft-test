import 'package:elisoft/features/image_grid/domain/entities/image_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_grid_state.freezed.dart';

@freezed
class ImageGridState with _$ImageGridState {
  const factory ImageGridState({
    required List<ImageItem> items,
    required bool isReloading,
  }) = _ImageGridState;

  factory ImageGridState.initial() {
    return const ImageGridState(items: <ImageItem>[], isReloading: false);
  }
}
