part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();
  @override
  List<Object?> get props => [];
}

class FetchCategoriesEvent extends CategoryEvent {
  const FetchCategoriesEvent();
  @override
  List<Object?> get props => [];
}
class AddCategoryIdEvent extends CategoryEvent{
  final int id;
  const AddCategoryIdEvent(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
class RemoveCategoryIdEvent extends CategoryEvent{
  final int id;
  const RemoveCategoryIdEvent(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
