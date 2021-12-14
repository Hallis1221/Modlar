import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  FirebaseAnalytics analyticsInstance;
  late FirebaseAnalyticsObserver analyticsObserver = FirebaseAnalyticsObserver(
    analytics: analyticsInstance,
  );

  AnalyticsService({
    required this.analyticsInstance,
  });
}
