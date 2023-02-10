//
//  FeedVC.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import UIKit

class FeedVC: UIViewController, TitleViewPresenterInput, FeedViewOutput {
    
    var output: TitleViewPresenterOutput!
    let feedView = FeedView()
    
    override func loadView() {
        view = feedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedView.delegate = self
    }
    
    func actionOnButton() {
        output.buttonTapped()
    }
    
    func showTitles(_ titles: [Title]) {
        let title = titles.randomElement()!
        feedView.titleLabel.text = "\(title.name) \(title.rating)%"
    }


}

