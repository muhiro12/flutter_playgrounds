import 'package:hooks_riverpod/hooks_riverpod.dart';

final scrollItemListProvider =
    StateNotifierProvider.autoDispose<ScrollItemListNotifier, List<int>>(
        (ref) =>
            ScrollItemListNotifier(List.generate(20, (index) => 100 + index)));

class ScrollItemListNotifier extends StateNotifier<List<int>> {
  ScrollItemListNotifier(super.state);

  Future<void> loadPrevious() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    state = [
      ...List.generate(10, (index) => state.first - 10 + index),
      ...state,
    ];
  }

  Future<void> loadNext() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    state = [
      ...state,
      ...List.generate(10, (index) => state.last + 1 + index),
    ];
  }
}
