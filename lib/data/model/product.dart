class ProductDto {
  final int discount;
  final int endDiscountTimestamp;
  final String imageUrl;

  ProductDto({
    required this.discount,
    required this.endDiscountTimestamp,
    required this.imageUrl,
  });
}
