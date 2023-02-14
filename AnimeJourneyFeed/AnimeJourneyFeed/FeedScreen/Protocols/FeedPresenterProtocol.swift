//
//  FeedPresenterProtocol.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /132/23.
//
import Foundation

protocol FeedPresenterProtocol {
    func attach(view: FeedViewProtocol)
    func getDataFromFile()
    func loadPoster() -> Data
    
    var apiAnswer: ApiAnswer? { get set }
}
