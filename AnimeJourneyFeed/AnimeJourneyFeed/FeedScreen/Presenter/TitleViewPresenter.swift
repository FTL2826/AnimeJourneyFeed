//
//  TitleViewPresenter.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import Foundation

protocol TitleViewPresenterOutput: AnyObject {
    func buttonTapped()
}

protocol TitleViewPresenterInput: AnyObject {
    func showTitles(_ titles: [Title])
}

class TitleViewPresenter: TitleViewPresenterOutput {
    
    weak var view: TitleViewPresenterInput!
    var dataManager: DataManager!
    
    func buttonTapped() {
        let titles = dataManager.obtainTitles()
        view.showTitles(titles)
    }
    
}
