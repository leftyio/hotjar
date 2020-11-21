import 'package:hotjar/hotjar.dart' as hotjar;

Future<void> main() async {
  hotjar.trigger('my-poll-1');
  hotjar.tagRecording(['tag1']);

  // await hotjar.loadHotjar('SITE_ID');

  // hotjar.trigger("my-poll-2");
  // hotjar.tagRecording(["tag2"]);
}
