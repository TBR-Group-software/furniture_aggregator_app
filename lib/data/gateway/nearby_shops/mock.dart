import 'package:furniture_aggregator_app/data/gateway/nearby_shops/gateway.dart';
import 'package:furniture_aggregator_app/data/model/geolocation.dart';
import 'package:furniture_aggregator_app/data/model/product.dart';
import 'package:furniture_aggregator_app/data/model/shop.dart';

class MockNearbyShopsGateWay implements NearbyShopsGateWay {
  static final List<GeolocationDto> _geolocationSalt = <GeolocationDto>[
    GeolocationDto(longitude: 0.008456, latitude: 00.006715),
    GeolocationDto(longitude: -0.006456, latitude: 00.004015),
    GeolocationDto(longitude: -0.011456, latitude: -00.009755),
    GeolocationDto(longitude: 0.030056, latitude: -00.012755),
    GeolocationDto(longitude: 0.020416, latitude: 00.008710),
    GeolocationDto(longitude: -0.009256, latitude: 00.003712),
    GeolocationDto(longitude: -0.002156, latitude: -00.003755),
    GeolocationDto(longitude: 0.004456, latitude: -00.012705),
    GeolocationDto(longitude: 0.005676, latitude: 00.000015),
    GeolocationDto(longitude: 0.010476, latitude: -00.005015),
    GeolocationDto(longitude: -0.008456, latitude: 00.012715),
  ];

  @override
  Future<List<ShopDto>> getNearbyShops(GeolocationDto geolocationDto) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final List<ShopDto> shops = <ShopDto>[
      for (int i = 0; i < _geolocationSalt.length; i++)
        ShopDto(
          id: 'shop-$i',
          title: 'Joe’s  Furniture',
          geolocationDto: GeolocationDto(
            longitude: geolocationDto.longitude + _geolocationSalt[i].longitude,
            latitude: geolocationDto.latitude + _geolocationSalt[i].latitude,
          ),
          productsDto: <ProductDto>[
            for (int i = 0; i < 5; i++)
              ProductDto(
                discount: 10,
                endDiscountTimestamp: DateTime.now()
                    .add(const Duration(days: 30))
                    .millisecondsSinceEpoch,
                imageUrl: 'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80',
              ),
          ],
        ),
    ];
    return shops;
  }
}
