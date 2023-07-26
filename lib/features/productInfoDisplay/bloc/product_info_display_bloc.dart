import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_app_using_blc/data/productInfoDisplayData.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';

part 'product_info_display_event.dart';
part 'product_info_display_state.dart';

class ProductInfoDisplayBloc
    extends Bloc<ProductInfoDisplayEvent, ProductInfoDisplayState> {
  ProductInfoDisplayBloc() : super(ProductInfoDisplayInitial()) {
    on<ProductInfoDisplayInitialEvent>(productInfoDisplayInitialEvent);
  }

  FutureOr<void> productInfoDisplayInitialEvent(
      ProductInfoDisplayInitialEvent event,
      Emitter<ProductInfoDisplayState> emit) {
    emit(ProductInfoDisplayLoadedSuccessState(
        productInfoDisplayProduct: productInfoDisplayData));
  }
}
