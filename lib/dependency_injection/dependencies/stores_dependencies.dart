import 'package:punycode_converter/dependency_injection/toor.dart';
import 'package:punycode_converter/domain/stores/i_in_app_review.dart';
import 'package:punycode_converter/infrastructure/stores/in_app_review_impl.dart';

final inAppReviewLocator = toor.registerFactory<IInAppReview>(InAppReviewImpl.new);
