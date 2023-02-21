//
//  FeedAssembly.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//
import Swinject

final class FeedAssembly: Assembly {
    func assemble(container: Container) {
        
        //inject view to presenter, presenter to view
        container.register(FeedViewProtocol.self) { _ in
            FeedViewController()
        }.initCompleted { (resolver: Resolver, view: FeedViewProtocol) in
            guard let presenter = resolver.resolve(FeedPresenterProtocol.self, argument: view) as? FeedPresenter else { return }
            presenter.attach(view: view)
            view.set(presenter: presenter)
        }
        
        
        
        container.register(FeedPresenterProtocol.self) { (resolver, view: FeedViewProtocol) in
            FeedPresenter(
                dataManager: resolver.resolve(DataManagerProtocol.self),
                posterLoader: resolver.resolve(PosterLoaderProtocol.self),
                feedLoader: resolver.resolve(FeedLoaderProtocol.self),
                persistentProvider: resolver.resolve(PersistentProviderProtocol.self)
            )
        }
    }
    
    
}

