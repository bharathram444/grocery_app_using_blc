import 'package:flutter/material.dart';
import 'package:shopping_app_using_blc/features/home/bloc/home_bloc.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';
import 'package:shopping_app_using_blc/features/home/ui/product_tile_widget.dart';

class ProductCategoryRowBilder extends StatefulWidget {
  const ProductCategoryRowBilder({
    Key? key,
    required this.homeBloc,
    required this.itemCount,
    required this.productDataModelList,
    this.categoryrowName = defaultCategoryrowName,
  }) : super(key: key);

  final HomeBloc homeBloc;
  final String? categoryrowName;
  final int itemCount;
  final List<ProductDataModel> productDataModelList;

  // Constant default value for categoryrowName
  static const String defaultCategoryrowName = 'Default Category';

  @override
  State<ProductCategoryRowBilder> createState() =>
      _ProductCategoryRowBilderState();
}

class _ProductCategoryRowBilderState extends State<ProductCategoryRowBilder> {
  @override
  Widget build(BuildContext context) {
    final String categoryRowName = widget.categoryrowName ??
        ProductCategoryRowBilder.defaultCategoryrowName;

    return Container(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Container(
            color: Colors.teal[200],
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            width: double.maxFinite,
            margin: const EdgeInsets.only(top: 6),
            child: Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(categoryRowName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800)),
            ),
          ),
          SizedBox(
            height: 430,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.itemCount,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    productDataModel: widget.productDataModelList[index],
                    homeBloc: widget.homeBloc,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
