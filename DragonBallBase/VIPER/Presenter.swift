//
//  Presenter.swift
//  DragonBallBase
//
//  Created by Markel Juaristi on 17/1/23.
//

import Foundation


//object
//protocol
//reference interactor, router and view

protocol AnyPresenter {
    var router: AnyRouter? { get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidFetchHeroes(with results: Result<[Hero], Error>)
}


class HeroPresenter: AnyPresenter {
    var interactor: AnyInteractor? {
        didSet{
            interactor?.getHeroes()
        }
    }
    
    var router: AnyRouter?
    
    
    var view: AnyView?
    
    func interactorDidFetchHeroes(with result: Result<[Hero], Error>) {
        switch result {
        case .success(let heroes):
            debugPrint("success")
            view?.update(with: heroes)
        case .failure(let error):
            debugPrint("error")
            view?.update(with: error.localizedDescription)
        }
    }
    
}
