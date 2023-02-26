//
//  DetailPresenterProtocol.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /212/23.
//

import Foundation

protocol DetailPresenterProtocol {
    func attach(view: DetailViewProtocol)
    func setData(title: TitleData)
    
    func getTitle() -> String
    
    var titleData: TitleData? { get }
    
    func loadPoster(link: String, completion: @escaping (Data?) -> ()) -> Cancellable
    func savePosterPictureToDisk(id: String, pngData: Data)
    func checkPictureInCache(id: String) -> (flag: Bool, path: String)
}
