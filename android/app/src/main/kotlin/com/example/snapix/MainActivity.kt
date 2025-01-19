package com.example.snapix

import io.flutter.embedding.android.FlutterActivity
import com.example.snapix.helpers.GalleryHelper
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity(){
    private val channel = "gallery_images"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Gallery
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            if (call.method == "getFoldersAndImages") {
                val galleryHelper = GalleryHelper(this)
                val foldersAndImages = galleryHelper.getFoldersAndImages()
                result.success(foldersAndImages)
            } else {
                result.notImplemented()
            }
        }
    }
}
