import 'package:flutter/material.dart';

import 'package:elisoft/core/constants/app_routes.dart';
import 'package:elisoft/features/image_grid/presentation/view/image_grid_page.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      AppRoutes.imageGridPath => MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ImageGridPage(),
        ),
      _ => MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ImageGridPage(),
        ),
    };
  }
}

