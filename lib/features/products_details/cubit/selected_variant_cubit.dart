import 'package:bloc/bloc.dart';
import 'package:footware_app/features/products_details/model/selected_variant_model.dart';

class SelectedVariantCubit extends Cubit<SelectedVariantModel> {
  SelectedVariantCubit()
    : super(SelectedVariantModel(color: 0, image: 0, size: 0));

  void changeVariantColor(int colorIndex) => emit(
    SelectedVariantModel(
      color: colorIndex,
      image: 0,
      size: 0,
    ),
  );

  void changeImage(int imageIndex) => emit(
    SelectedVariantModel(
      color: state.color,
      image: imageIndex,
      size: state.size,
    ),
  );

  void changeSize(int sizeIndex) => emit(
    SelectedVariantModel(
      color: state.color,
      image: state.image,
      size: sizeIndex,
    ),
  );
}
