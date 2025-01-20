import Foundation
import Photos

class GalleryHelper {

    func getFoldersAndImages() -> [[String: Any]] {
        var folders: [String: [String]] = [:]
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        
        fetchResult.enumerateObjects { asset, _, _ in
            if let folderName = asset.value(forKey: "filename") as? String {
                let folderKey = folderName.components(separatedBy: "/").first ?? "Unknown"
                
                if folders[folderKey] == nil {
                    folders[folderKey] = []
                }
                
                // Add asset's local identifier as a reference to the image
                let imagePath = "ph://\(asset.localIdentifier)"
                folders[folderKey]?.append(imagePath)
            }
        }
        
        // Convert to array of dictionaries
        return folders.map { (folderName, images) in
            ["folderName": folderName, "images": images]
        }
    }
}
