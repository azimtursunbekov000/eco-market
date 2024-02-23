part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetAllProductEvent extends ProductEvent {}