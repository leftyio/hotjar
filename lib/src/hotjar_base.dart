@JS()
library hotjar.base;

import 'package:js/js.dart';
import 'package:dart_browser_loader/dart_browser_loader.dart';

@JS("hj")
external void _hj(String action, [arguments]);

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

/// Hotjar main function
/// used by
///   - [tagRecording]
///   - [trigger]
void hj(String action, [arguments]) {
  eval(_hJBaseScript);
  _hj(action, arguments);
}

bool _loaded = false;

/// Load hotjar javascript
loadHotjar(String siteId) {
  if (_loaded == false) {
    eval(_hjScript(siteId));
    _loaded = true;
  }
}

/// Hotjar tag recording
/// https://help.hotjar.com/hc/en-us/articles/115011819488-How-to-Tag-your-Hotjar-Recordings
void tagRecording(List<String> tags) {
  hj('tagRecording', tags);
}

/// Hotjar trigger
/// https://help.hotjar.com/hc/en-us/articles/115011867948-Using-JavaScript-to-Trigger-Heatmaps
void trigger(String name) {
  hj('trigger', name);
}
