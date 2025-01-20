package com.example.snapix.helpers

import android.content.Context
import android.provider.MediaStore

class GalleryHelper(private val context: Context) {

    fun getFoldersAndImages(): List<Map<String, Any>> {
        val folders = mutableMapOf<String, MutableList<String>>()

        val projection = arrayOf(
            MediaStore.Images.Media.BUCKET_DISPLAY_NAME,
            MediaStore.Images.Media.DATA
        )
        val uri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI
        val cursor = context.contentResolver.query(uri, projection, null, null, null)

        cursor?.use {
            val folderIndex = it.getColumnIndexOrThrow(MediaStore.Images.Media.BUCKET_DISPLAY_NAME)
            val dataIndex = it.getColumnIndexOrThrow(MediaStore.Images.Media.DATA)

            while (it.moveToNext()) {
                val folderName = it.getString(folderIndex) ?: "Unknown"
                val filePath = it.getString(dataIndex)

                if (!folders.containsKey(folderName)) {
                    folders[folderName] = mutableListOf()
                }
                folders[folderName]?.add(filePath)
            }
        }

        return folders.map { (folderName, images) ->
            mapOf(
                "folderName" to folderName,
                "images" to images
            )
        }
    }
}