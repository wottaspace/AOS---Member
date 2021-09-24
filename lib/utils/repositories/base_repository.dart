import 'package:arcopen_employee/http/network/clients/dio_client.dart';
import 'package:arcopen_employee/utils/mixins/response_extractor_mixin.dart';

abstract class BaseRepository with ResponseExtractorMixin {
  final DioClient client = DioClient();
}
