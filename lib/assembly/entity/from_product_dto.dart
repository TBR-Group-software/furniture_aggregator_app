import 'package:furniture_aggregator_app/assembly/factory.dart';
import 'package:furniture_aggregator_app/data/model/product.dart';
import 'package:furniture_aggregator_app/domain/entity/product.dart';

class ProductFromDtoFactory implements Factory<Product, ProductDto> {
  @override
  Product create(ProductDto arg) => Product(
        discount: arg.discount,
        imageUrl: arg.imageUrl,
        endDiscount:
            DateTime.fromMillisecondsSinceEpoch(arg.endDiscountTimestamp),
      );
}
