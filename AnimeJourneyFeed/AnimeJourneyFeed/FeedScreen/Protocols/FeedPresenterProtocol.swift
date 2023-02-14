//
//  FeedPresenterProtocol.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /132/23.
//

protocol FeedPresenterProtocol {
    func attach(view: FeedViewProtocol)
    func getDataFromFile()
    
    var apiAnswer: ApiAnswer? { get set}
}
