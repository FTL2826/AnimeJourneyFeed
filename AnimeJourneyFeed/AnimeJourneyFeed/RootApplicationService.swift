//
//  RootApplicationService.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /132/23.
//

import Foundation
import Swinject
import UIKit.UIViewController

final class RootApplicationService {
    private let assembler = Assembler([])
    private let assemblies: [Assembly] = [
        ServicesAssembly(),
        FeedAssembly(),
        DetailAssembly(),
    ]
    
    func assemblyProject() {
        assembler.apply(assemblies: assemblies)
    }
    
    func load() -> UIViewController {
        var rootVC = UIViewController()
        rootVC.view.backgroundColor = .red
        
        if let vc = assembler.resolver.resolve(FeedViewProtocol.self) as? FeedViewController {
            let navigationController = UINavigationController(rootViewController: vc)
            rootVC = navigationController
        }
        return rootVC
        
    }
}
