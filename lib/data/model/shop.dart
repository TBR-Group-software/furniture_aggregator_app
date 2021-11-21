import 'package:furniture_aggregator_app/data/model/geolocation.dart';
import 'package:furniture_aggregator_app/data/model/product.dart';

class ShopDto {
  final String title;
  final GeolocationDto geolocationDto;
  final List<ProductDto> productsDto;

  ShopDto({
    required this.title,
    required this.geolocationDto,
    required this.productsDto,
  });
}
