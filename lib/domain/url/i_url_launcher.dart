abstract class IUrlLauncher {
  /// Returns whether or not the URL launch was successful.
  Future<bool> launchUrl(String url);
}
