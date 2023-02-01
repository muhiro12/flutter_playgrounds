import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_product_list_item.freezed.dart';

@freezed
class SampleProductListItem with _$SampleProductListItem {
  const factory SampleProductListItem({
    required int id,
    required String name,
    required bool isFavorited,
  }) = _SampleProductListItem;
}
