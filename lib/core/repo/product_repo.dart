import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/sevcice_failure.dart';
import 'package:e_commerce/features/home/domain/entites/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failuer, List<ProductEntity>>> getProduct();
  Future<Either<Failuer, List<ProductEntity>>> getBestSelling();
}
