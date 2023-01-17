//
//  Interactor.swift
//  DragonBallBase
//
//  Created by Markel Juaristi on 17/1/23.
//

import Foundation


//object
//protocol
//reference to presenter
//api calls


protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    
    func getHeroes()
}

class HeroInteractor: AnyInteractor{
    var presenter: AnyPresenter?
    
    func getHeroes() {
        let myToken = "eyJhbGciOiJIUzI1NiIsImtpZCI6InByaXZhdGUiLCJ0eXAiOiJKV1QifQ.eyJpZGVudGlmeSI6IkUzNkM5REU4LUIxQ0QtNDM5NS04MkJGLTVFNTU3RThDQTRENyIsImVtYWlsIjoibWFya2p1YXJpc3RpQGdtYWlsLmNvbSIsImV4cGlyYXRpb24iOjY0MDkyMjExMjAwfQ.5-qOCbTIIllJry65kp0PKpI9CNDaAhUApD6xo7QyBOc"
        
        ApiClient(token: myToken).getHeroes { [weak self ] heroes, error in
            if (error != nil){
                self?.presenter?.interactorDidFetchHeroes(with: .failure(error!))
                return
            }
            
            self?.presenter?.interactorDidFetchHeroes(with: .success(heroes))
        }
    }
}
