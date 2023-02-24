//
//  DetailPresenter.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /212/23.
//

import Foundation

class DetailPresenter {
    
    private weak var view: DetailViewProtocol?
    
    var titleData: TitleData?
    
}

extension DetailPresenter: DetailPresenterProtocol {
    
    func attach(view: DetailViewProtocol) {
        self.view = view
    }
    
    func setData(title: TitleData) {
        self.titleData = title
    }
    
    func getTitle() -> String {
        return titleData?.attributes.canonicalTitle ?? "Unknown title"
    }
    
    
}
