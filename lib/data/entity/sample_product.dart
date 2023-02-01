import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_product.freezed.dart';

@freezed
class SampleProduct with _$SampleProduct {
  const factory SampleProduct({
    required int id,
    required String name,
    required bool isFavorited,
    int? price,
    String? description,
  }) = _SampleProduct;
}
