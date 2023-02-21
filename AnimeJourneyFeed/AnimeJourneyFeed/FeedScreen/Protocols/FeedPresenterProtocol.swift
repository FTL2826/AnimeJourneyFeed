//
//  FeedPresenterProtocol.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /132/23.
//
import Foundation

protocol FeedPresenterProtocol {
    func attach(view: FeedViewProtocol)
    func getDataFromApi(for link: String)
    func loadPoster(link: String, completion: @escaping (Data?) -> ()) -> Cancellable
    func rowsInTable() -> Int
    func refreshUI()
    func getTitle(index: Int) -> TitleData
    func getDataFromApiForNextPage()
    
    func dataBase() // load to db
    func fetchFromDataBase()
    
//    var apiAnswer: ApiResponse! { get }
//    var titlesData: [TitleData] { get }
}
