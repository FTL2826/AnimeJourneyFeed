//
//  DataManager.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import Foundation

protocol DataManagerProtocol: AnyObject {
    
    var apiAnswer: ApiResponse! { get set }
    var titlesData: [TitleData] { get }
    
    func getDocumentsDirectoryOnTap()
    func savePosterPictureTinyToDisk(id: String, pngData: Data)
    func checkPictureInCache(id: String) -> (flag: Bool, path: String)
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
    
    func savePosterPictureTinyToDisk(id: String, pngData: Data) {
        let picName = "PosterImageForCell\(id).png"
        let path = documentDirectoryPath().path.appending("/PosterImagesTiny/\(picName)")
        DispatchQueue.global().async {
            do {
                try pngData.write(to: URL(fileURLWithPath: path), options: .atomic)
            } catch {
                print("Write poster image data to disk error:", error)
            }
        }
        
    }
    
    func checkPictureInCache(id: String) -> (flag: Bool, path: String) {
        let picName = "PosterImageForCell\(id).png"
        let path = documentDirectoryPath().path.appending("/PosterImagesTiny/\(picName)")
        return (FileManager.default.fileExists(atPath: path), path)
    }
    
    func getDocumentsDirectoryOnTap() {
        print("documents path:", documentDirectoryPath())
    }
    
}
