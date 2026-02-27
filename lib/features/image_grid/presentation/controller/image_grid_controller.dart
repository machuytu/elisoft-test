import 'dart:math';

import 'package:elisoft/features/image_grid/domain/entities/image_item.dart';
import 'package:elisoft/features/image_grid/domain/repositories/image_repository.dart';
import 'package:elisoft/features/image_grid/presentation/controller/image_grid_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Number of items displayed per page (7 columns x 10 rows).
const int pageItemCount = 70;

/// Number of items generated when the user taps "Reload All".
const int reloadItemCount = 140;

/// Manages image grid state and user actions (reload and add image).
class ImageGridController extends StateNotifier<ImageGridState> {
  ImageGridController(this._repository) : super(ImageGridState.initial());

  final ImageRepository _repository;
  final Random _random = Random();

  /// Replaces the current grid content with [reloadItemCount] new images.
  ///
  /// URLs are generated from random seeds to avoid startup blocking.
  Future<void> reloadAll() async {
    state = state.copyWith(isReloading: true);

    final List<ImageItem> generated = List<ImageItem>.generate(
      reloadItemCount,
      (int index) {
        final int seed = _random.nextInt(1 << 31);
        final String url = _repository.createImageUrlFromSeed(seed);
        return ImageItem(id: index, url: url);
      },
      growable: false,
    );

    state = state.copyWith(items: generated, isReloading: false);
  }

  /// Appends a single new image item to the end of the current list.
  Future<void> addOne() async {
    final int nextId = state.items.length;
    final int seed = _random.nextInt(1 << 31);
    final String url = _repository.createImageUrlFromSeed(seed);
    final ImageItem item = ImageItem(id: nextId, url: url);

    state = state.copyWith(items: <ImageItem>[...state.items, item]);
  }
}
