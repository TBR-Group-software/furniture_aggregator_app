import 'package:furniture_aggregator_app/assembly/factory.dart';
import 'package:furniture_aggregator_app/data/model/geolocation.dart';
import 'package:furniture_aggregator_app/data/model/product.dart';
import 'package:furniture_aggregator_app/data/model/shop.dart';
import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';
import 'package:furniture_aggregator_app/domain/entity/product.dart';
import 'package:furniture_aggregator_app/domain/entity/shop.dart';

class ShopFromDtoFactory extends Factory<Shop, ShopDto> {
  final Factory<Geolocation, GeolocationDto> _geolocationFromDotFactory;
  final Factory<Product, ProductDto> _productFromDtoFactory;

  ShopFromDtoFactory(
    this._geolocationFromDotFactory,
    this._productFromDtoFactory,
  );

  @override
  Shop create(ShopDto arg) => Shop(
        id: arg.id,
        title: arg.title,
        geolocation: _geolocationFromDotFactory.create(arg.geolocationDto),
        products: arg.productsDto
            .map((ProductDto productDto) =>
                _productFromDtoFactory.create(productDto))
            .toList(),
      );
}
