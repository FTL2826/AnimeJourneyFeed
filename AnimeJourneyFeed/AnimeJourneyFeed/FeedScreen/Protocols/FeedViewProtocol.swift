//
//  FeedViewProtocol.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /122/23.
//

protocol FeedViewProtocol: AnyObject {
    func set(presenter: FeedPresenterProtocol)
    func update(collection: [Title])
}
