import 'package:arcopen_employee/http/responses/active_plan_response.dart';
import 'package:arcopen_employee/http/responses/subscriptions_response.dart';
import 'package:arcopen_employee/utils/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class SubscriptionsRepository extends BaseRepository {
  final String basePath = "/subscriptions/api";

  Future<SubscriptionsResponse> getSubscriptionPlans() async {
    try {
      final Response response = await client.get(path: "$basePath/getPlans/");
      return SubscriptionsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<ActivePlanResponse> getActivePlan() async {
    try {
      final Response response = await client.get(path: "$basePath/getActivePlan/");
      return ActivePlanResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }
}
