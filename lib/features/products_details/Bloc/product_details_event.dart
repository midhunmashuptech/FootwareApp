abstract class ProductDetailsEvent {}

/// Load product details
class LoadProductDetails extends ProductDetailsEvent {}

/// Review events
class UpdateRating extends ProductDetailsEvent {
  final int rating;
  UpdateRating(this.rating);
}

class UpdateReview extends ProductDetailsEvent {
  final String review;
  UpdateReview(this.review);
}

class SubmitReview extends ProductDetailsEvent {}
