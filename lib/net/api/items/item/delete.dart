import 'package:http/http.dart' as http;
import 'package:mindfulguard/net/api/base.dart';

class ItemDeleteApi extends BaseApi<http.Response> {
  String apiUrl;
  String token;
  String safeId;
  String itemId;

  ItemDeleteApi(
    this.apiUrl,
    this.token,
    this.safeId,
    this.itemId,
  ) : super(ContentType.applicationJson);

  @override
  Future<http.Response?> execute() async {
    try {
      await init();
      this.setAuthTokenHeader(token);
      
      var response = await httpClient.delete(
        Uri.parse("$apiUrl/v1/safe/$safeId/item/$itemId"),
        headers: headers,
      );

      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}