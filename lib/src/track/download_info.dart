import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:xml/xml.dart';

import 'package:yandex_music_api/src/request_client.dart';

import '../client.dart';

String _getTextNodeData(Iterable<XmlElement> elements) {
  for (final element in elements) {
    for (final node in element.nodes) {
      if (node.nodeType == XmlNodeType.TEXT) {
        return node.text;
      }
    }
  }
  throw Exception("No Data");
}

class DownloadInfo {
  final String codec;
  final int bitrate; // kbps
  final bool gain;
  final bool preview;
  final String downloadInfoUrl;
  final bool direct;

  final RequestClient requestClient;

  DownloadInfo({
    required this.requestClient,
    required this.codec,
    required this.bitrate,
    required this.gain,
    required this.preview,
    required this.downloadInfoUrl,
    required this.direct,
  });

  String? _directLink;
  DateTime? _directLinkDate;

  Future<String> get directLink async {
    if (_directLink != null &&
        _directLinkDate != null &&
        _directLinkDate!.difference(DateTime.now()) < Duration(minutes: 1)) {
      return _directLink!;
    } else {
      final response = await requestClient.retrieve(downloadInfoUrl);
      final document = XmlDocument.parse(response.body);
      final host = _getTextNodeData(document.findAllElements('host'));
      final path = _getTextNodeData(document.findAllElements('path'));
      final ts = _getTextNodeData(document.findAllElements('ts'));
      final s = _getTextNodeData(document.findAllElements('s'));

      final sign = md5.convert(
        utf8.encode('XGRlBW9FXlekgbPrRHuSiA' + path.substring(1) + s),
      );

      return _directLink = 'https://$host/get-mp3/$sign/$ts$path';
    }
  }

  factory DownloadInfo.fromMap(
    Map<String, dynamic> map,
    RequestClient requestClient,
  ) {
    return DownloadInfo(
      codec: map['codec'],
      bitrate: map['bitrateInKbps'],
      gain: map['gain'],
      preview: map['preview'],
      downloadInfoUrl: map['downloadInfoUrl'],
      direct: map['direct'],
      requestClient: requestClient,
    );
  }

  factory DownloadInfo.fromJson(
    String source,
    RequestClient requestClient,
  ) =>
      DownloadInfo.fromMap(json.decode(source), requestClient);
}
