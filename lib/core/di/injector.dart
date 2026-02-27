import 'package:elisoft/features/image_grid/data/repositories/image_repository_impl.dart';
import 'package:elisoft/features/image_grid/domain/repositories/image_repository.dart';
import 'package:get_it/get_it.dart';

/// Global service locator instance.
final GetIt sl = GetIt.instance;

/// Registers app dependencies used across features.
Future<void> configureDependencies() async {
  if (sl.isRegistered<ImageRepository>()) {
    return;
  }

  sl.registerLazySingleton<ImageRepository>(ImageRepositoryImpl.new);
}
