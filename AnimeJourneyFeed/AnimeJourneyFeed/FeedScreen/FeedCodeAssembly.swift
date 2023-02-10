//
//  FeedCodeAssembly.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import Foundation
import UIKit

class FeedCodeAssembly {
    
    class func configureModule() -> UIViewController {
        
        let view = FeedVC()
        let presenter = TitleViewPresenter()
        let dataManager = DataManagerImplementation()
        
        view.output = presenter
        presenter.view = view
        presenter.dataManager = dataManager
        
        return view
    }
}
