import "package:hotjar/hotjar.dart" as hotjar;

main() async {
  await hotjar.loadHotjar('SITE_ID');

  hotjar.trigger("my-poll");
  hotjar.tagRecording(["tag1", "tag2"]);
}
