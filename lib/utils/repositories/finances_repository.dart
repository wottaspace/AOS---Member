import 'package:arcopen_employee/http/responses/download_invoice_response.dart';
import 'package:arcopen_employee/http/responses/finance_response.dart';
import 'package:arcopen_employee/utils/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class FinancesRepository extends BaseRepository {
  final String basePath = "/jobs/api";

  Future<FinanceResponse> getFinances() async {
    try {
      final Response response = await client.get(path: "$basePath/getFinances/");
      return FinanceResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<DownloadInvoiceResponse> downloadInvoice(int transactionId) async {
    try {
      Response response = await client.get(path: "$basePath/downloadInvoice/$transactionId/");
      return DownloadInvoiceResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }
}
