import 'package:elisoft/core/di/injector.dart';
import 'package:elisoft/features/image_grid/domain/repositories/image_repository.dart';
import 'package:elisoft/features/image_grid/presentation/controller/image_grid_controller.dart';
import 'package:elisoft/features/image_grid/presentation/controller/image_grid_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides the [ImageRepository] instance from the global service locator.
final imageRepositoryProvider = Provider<ImageRepository>((Ref ref) {
  return sl<ImageRepository>();
});

/// Provides [ImageGridController] and triggers initial grid loading.
final imageGridControllerProvider =
    StateNotifierProvider<ImageGridController, ImageGridState>((Ref ref) {
      final ImageRepository repository = ref.watch(imageRepositoryProvider);
      return ImageGridController(repository)..reloadAll();
    });
