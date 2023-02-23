//
//  DetailAssembly.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /232/23.
//

import Swinject

final class DetailAssembly: Assembly {
    
    func assemble(container: Swinject.Container) {
        container.register(DetailViewProtocol.self) { _ in
            DetailViewController()
        }.initCompleted { (resolver: Resolver, view: DetailViewProtocol) in
            guard let presenter = resolver.resolve(DetailPresenterProtocol.self, argument: view) as? DetailPresenter else { return }
            presenter.attach(view: view)
            view.set(presenter: presenter)
        }
        
        container.register(DetailPresenterProtocol.self) { (resolver: Resolver, view: DetailViewProtocol) in
            DetailPresenter()
        }
    }
    
    
}
