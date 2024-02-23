part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetAllProductEvent extends ProductEvent {
  final String? categoryName;
  final String? searchText;

  GetAllProductEvent({this.categoryName, this.searchText});
}
