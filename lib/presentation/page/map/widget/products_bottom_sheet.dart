import 'package:flutter/material.dart';
import 'package:furniture_aggregator_app/domain/entity/shop.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_palette.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_text_styles.dart';
import 'package:intl/intl.dart';

class ProductsBottomSheet extends StatelessWidget {
  final Shop _shop;

  const ProductsBottomSheet({
    required Shop shop,
    Key? key,
  })  : _shop = shop,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: const BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.horizontal,
        itemCount: _shop.products.length,
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 16,
          );
        },
        itemBuilder: (_, int index) {
          return Container(
            width: 300,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Image.network(
                    _shop.products[index].imageUrl,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 33,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _shop.title,
                        style: AppTextStyles.montserratDarkW600NormalS16,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Ends ',
                              style: AppTextStyles.montserratGreyW500NormalS12,
                            ),
                            TextSpan(
                              text: DateFormat.yMMMMd()
                                  .format(_shop.products[index].endDiscount),
                              style: AppTextStyles.montserratGreyW600NormalS12,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: _shop.products[index].discount.toString(),
                              style: AppTextStyles.montserratDarkW700NormalS18,
                            ),
                            const TextSpan(
                              text: '% ',
                              style: AppTextStyles.montserratDarkW500NormalS16,
                            ),
                            const TextSpan(
                              text: 'off chairs',
                              style: AppTextStyles.montserratDarkW500NormalS14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
