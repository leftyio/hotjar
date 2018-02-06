@JS()
library hotjar.base;

import 'dart:async';
import "dart:html";
import 'package:js/js.dart';
import 'package:dart_browser_loader/dart_browser_loader.dart';

@JS("hj")
external void _hj(String action, [List<String> arguments]);

String _hjScript(String siteId) => '''
(function(h,o,t,j,a,r){
    h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
    h._hjSettings={hjid:$siteId,hjsv:6};
    a=o.getElementsByTagName('head')[0];
    r=o.createElement('script');r.async=1;
    r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
    a.appendChild(r);
})(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
''';

const _hJBaseScript =
    "window.hj=window.hj||function(){(hj.q=hj.q||[]).push(arguments)};";

const _scriptId = "jssdk-hj";

Future<ScriptElement> _loaded;

Future<Null> hj(String action, [arguments]) async {
  _loaded ??= loadInlineScript(_hJBaseScript, _scriptId);
  await _loaded;
  _hj(action, arguments);
}

Future<ScriptElement> loadHotjar(String siteId) {
  _loaded ??= loadInlineScript(_hjScript(siteId), _scriptId);
  return _loaded;
}

void tagRecording(List<String> tags) {
  hj('tagRecording', tags);
}

void trigger(String name) {
  hj('trigger', name);
}
