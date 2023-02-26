//
//  FeedNavigator.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /232/23.
//

import UIKit.UIViewController
import Swinject

final class FeedNavigator: Navigator {
    
    private var resolver: Resolver?
    var sourceViewController: UIViewController?
    
    enum Destination {
        case showDetailScreen(title: TitleData)
    }
    
    init(sourceViewController: UIViewController?, resolver: Resolver? ) {
        self.sourceViewController = sourceViewController
        self.resolver = resolver
    }
    
}

extension FeedNavigator {
    
    func navigate(to destination: Destination) {
        if let destinationVC = makeViewController(for: destination) {
            if let navigatonVC = sourceViewController?.navigationController {
                navigatonVC.pushViewController(destinationVC, animated: true)
            }
        }
    }
    
    func makeViewController(for destination: Destination) -> UIViewController? {
        switch destination {
        case .showDetailScreen(let title):
            if let vc = resolver?.resolve(DetailViewProtocol.self) as? DetailViewController {
                vc.presenter?.setData(title: title)
                return vc
            }
        }
        return nil
    
    }
}
