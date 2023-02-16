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
    
    var apiAnswer: ApiResponse! { get set }
    var titlesData: [TitleData] { get }
}
