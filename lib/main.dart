import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa_1/blocs/product/product_bloc.dart';
import 'package:vazifa_1/data/repositores/product_repozitores.dart';
import 'package:vazifa_1/services/product_services.dart';

import 'app.dart';

void main() {
  final dioProductService = DioProductsService();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) {
          return ProductsRepository(dioProductsService: dioProductService);
        }),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return ProductsBloc(
                productsRepository: context.read<ProductsRepository>(),
              );
            },
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
