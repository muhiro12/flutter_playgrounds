import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_item.freezed.dart';

@freezed
class SampleItem with _$SampleItem {
  const factory SampleItem({
    required String name,
    required bool isFavorited,
  }) = _SampleItem;
}
