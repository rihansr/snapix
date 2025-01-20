import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      // Gallery
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
              let galleryChannel = FlutterMethodChannel(name: "gallery_images", binaryMessenger: controller.binaryMessenger)
      
      galleryChannel.setMethodCallHandler { (call, result) in
                  if call.method == "getFoldersAndImages" {
                      let galleryHelper = GalleryHelper()
                      let foldersAndImages = galleryHelper.getFoldersAndImages()
                      result(foldersAndImages)
                  } else {
                      result(FlutterMethodNotImplemented)
                  }
              }
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
