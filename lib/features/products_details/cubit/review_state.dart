abstract class ReviewState {}

class ReviewFormState extends ReviewState {
  final int rating;
  final String review;
  final bool submitted;

  ReviewFormState({
    this.rating = 0,
    this.review = '',
    this.submitted = false,
  });

  ReviewFormState copyWith({
    int? rating,
    String? review,
    bool? submitted,
  }) {
    return ReviewFormState(
      rating: rating ?? this.rating,
      review: review ?? this.review,
      submitted: submitted ?? this.submitted,
    );
  }
}
