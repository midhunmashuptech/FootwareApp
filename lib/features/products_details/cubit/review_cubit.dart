import 'package:flutter_bloc/flutter_bloc.dart';
import 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewFormState());

  void updateRating(int rating) {
    final state = this.state as ReviewFormState;
    if (!state.submitted) {
      emit(state.copyWith(rating: rating));
    }
  }

  void updateReview(String text) {
    final state = this.state as ReviewFormState;
    if (!state.submitted) {
      emit(state.copyWith(review: text));
    }
  }

  void submitReview() {
    final state = this.state as ReviewFormState;
    if (state.rating > 0 && state.review.isNotEmpty) {
      emit(state.copyWith(submitted: true));
    }
  }
}
