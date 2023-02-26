//
//  DataManager.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import Foundation

enum PosterImageSize {
    case tiny, medium
}

protocol DataManagerProtocol: AnyObject {
    
    var apiAnswer: ApiResponse! { get set }
    var titlesData: [TitleData] { get }
    
    func getDocumentsDirectoryOnTap()
    func getDocDirString() -> String
    func checkPictureInCache(id: String, posterSize: PosterImageSize) -> (flag: Bool, path: String)
    func savePosterPictureToDisk(id: String, pngData: Data, posterSize: PosterImageSize)
}

class DataManager: DataManagerProtocol {
    
    var apiAnswer: ApiResponse! {
        didSet {
            titlesData += apiAnswer.data
        }
    }
    var titlesData: [TitleData] = []
    
    
    private func documentDirectoryPath() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func savePosterPictureToDisk(id: String, pngData: Data, posterSize: PosterImageSize) {
//        switch posterSize {
//        case .tiny:
//            let picName = "PosterImageForCell\(id).png"
//            let path = documentDirectoryPath().path.appending("/PosterImagesTiny/\(picName)")
//            DispatchQueue.global().async {
//                do {
//                    try pngData.write(to: URL(fileURLWithPath: path), options: .atomic)
//                } catch {
//                    print("Write poster image data to disk error:", error)
//                }
//            }
//        case .medium:
//            let picName = "PosterImageForCell\(id).png"
//            let path = documentDirectoryPath().path.appending("/PosterImagesMedium/\(picName)")
//            DispatchQueue.global().async {
//                do {
//                    try pngData.write(to: URL(fileURLWithPath: path), options: .atomic)
//                } catch {
//                    print("Write poster image data to disk error:", error)
//                }
//            }
//        }
        let picName = "PosterImageForCell\(id).png"
        var path: String
        switch posterSize {
        case .tiny:
            path = documentDirectoryPath().path.appending("/PosterImagesTiny/\(picName)")
        case .medium:
            path = documentDirectoryPath().path.appending("/PosterImagesMedium/\(picName)")
        }
        DispatchQueue.global().async {
            do {
                try pngData.write(to: URL(fileURLWithPath: path), options: .atomic)
            } catch {
                print("Write poster image data to disk error:", error)
            }
        }
        
    }
    
    func checkPictureInCache(id: String, posterSize: PosterImageSize) -> (flag: Bool, path: String) {
        let picName = "PosterImageForCell\(id).png"
        var path: String
        switch posterSize {
        case .tiny:
            path = documentDirectoryPath().path.appending("/PosterImagesTiny/\(picName)")
        case .medium:
            path = documentDirectoryPath().path.appending("/PosterImagesMedium/\(picName)")
        }
        return (FileManager.default.fileExists(atPath: path), path)
    }
    
    func getDocumentsDirectoryOnTap() {
        print("documents path:", documentDirectoryPath())
    }
    
    func getDocDirString() -> String {
        return documentDirectoryPath().absoluteString
    }
    
}
