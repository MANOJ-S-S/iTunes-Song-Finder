import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class PinnedHttpClient extends http.BaseClient {
  final HttpClient _httpClient;
  final String _pinnedPublicKeyBase64;

  PinnedHttpClient(this._pinnedPublicKeyBase64) : _httpClient = HttpClient();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    _httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
      final publicKey = base64.encode(cert.der);
      return publicKey == _pinnedPublicKeyBase64;
    };

    final ioRequest = await _httpClient.openUrl(
      request.method == 'POST' ? 'POST' : 'GET',
      request.url,
    );

    request.headers.forEach((name, value) {
      ioRequest.headers.set(name, value);
    });

    if (request is http.Request) {
      if (request.bodyBytes.isNotEmpty) {
        ioRequest.add(request.bodyBytes);
      }
    }

    final ioResponse = await ioRequest.close();


    final responseHeaders = <String, String>{};
    ioResponse.headers.forEach((name, values) {
      responseHeaders[name] = values.join(', ');
    });

    return http.StreamedResponse(
      ioResponse,
      ioResponse.statusCode,
      contentLength: ioResponse.contentLength,
      request: request,
      headers: responseHeaders
    );
  }

  @override
  void close() {
    _httpClient.close();
  }
}



