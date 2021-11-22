import 'package:furniture_aggregator_app/data/gateway/nearby_shops/gateway.dart';
import 'package:furniture_aggregator_app/data/model/geolocation.dart';
import 'package:furniture_aggregator_app/data/model/product.dart';
import 'package:furniture_aggregator_app/data/model/shop.dart';

class MockNearbyShopsGateWay implements NearbyShopsGateWay {
  static final List<GeolocationDto> _geolocationSalt = <GeolocationDto>[
    GeolocationDto(longitude: 0.003456, latitude: 00.000715),
    GeolocationDto(longitude: 0.001456, latitude: 00.000015),
    GeolocationDto(longitude: 0.002456, latitude: 00.002755),
    GeolocationDto(longitude: 0.003056, latitude: 00.003755),
    GeolocationDto(longitude: 0.003416, latitude: 00.006710),
    GeolocationDto(longitude: 0.001256, latitude: 00.003712),
    GeolocationDto(longitude: 0.002156, latitude: 00.003755),
    GeolocationDto(longitude: 0.004456, latitude: 00.002705),
    GeolocationDto(longitude: 0.005676, latitude: 00.000015),
    GeolocationDto(longitude: 0.007476, latitude: 00.005015),
    GeolocationDto(longitude: 0.008456, latitude: 00.002715),
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
