import 'package:in_app_review/in_app_review.dart';
import 'package:punycode_converter/application/core/app_strings.dart';
import 'package:punycode_converter/domain/stores/i_in_app_review.dart';

class InAppReviewImpl implements IInAppReview {
  @override
  Future<void> openStoreReviewForm() {
    return InAppReview.instance.openStoreListing(
      appStoreId: AppStrings.appStoreId,
    );
  }
}
