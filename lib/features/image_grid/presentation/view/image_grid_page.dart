import 'package:elisoft/features/image_grid/presentation/controller/image_grid_controller.dart';
import 'package:elisoft/features/image_grid/presentation/controller/image_grid_providers.dart';
import 'package:elisoft/features/image_grid/presentation/controller/image_grid_state.dart';
import 'package:elisoft/features/image_grid/presentation/view/widgets/image_tile.dart';
import 'package:elisoft/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageGridPage extends ConsumerStatefulWidget {
  const ImageGridPage({super.key});

  @override
  ConsumerState<ImageGridPage> createState() => _ImageGridPageState();
}

class _ImageGridPageState extends ConsumerState<ImageGridPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final ImageGridState state = ref.watch(imageGridControllerProvider);
    final int pageCount = (state.items.length / pageItemCount).ceil().clamp(
      1,
      1000000,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.gridTitle),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              ref.read(imageGridControllerProvider.notifier).addOne();
            },
            tooltip: l10n.addImageTooltip,
            icon: const Icon(Icons.add),
          ),
          TextButton(
            onPressed: state.isReloading
                ? null
                : () {
                    ref.read(imageGridControllerProvider.notifier).reloadAll();
                  },
            child: Text(l10n.reloadAll),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: pageCount,
        itemBuilder: (BuildContext context, int pageIndex) {
          final int start = pageIndex * pageItemCount;
          final int end = (start + pageItemCount).clamp(0, state.items.length);
          final List<String> urls = state.items
              .sublist(start, end)
              .map((item) => item.url)
              .toList(growable: false);

          return Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              key: PageStorageKey<String>('grid_page_$pageIndex'),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: urls.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return RepaintBoundary(child: ImageTile(imageUrl: urls[index]));
              },
            ),
          );
        },
      ),
    );
  }
}
