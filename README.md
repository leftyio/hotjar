# hotjar

Hotjar Javascript interop for dart

## Usage

### Hotjar integrated using Tag Manager

```dart
import "package:hotjar/hotjar.dart";

main() {
  hj("trigger", "my-poll");
  hj("tagRecording",  ["tag1", "tag2"]);

  // or

  trigger("my-poll");
  tagRecording(["tag1", "tag2"]);
}
```

### Hotjar manual install

import "package:hotjar/hotjar.dart";

main() async {
  await loadHotjar("SITE_ID");

  hj("trigger", "my-poll");
  hj("tagRecording",  ["tag1", "tag2"]);

  // or

  trigger("my-poll");
  tagRecording(["tag1", "tag2"]);
}