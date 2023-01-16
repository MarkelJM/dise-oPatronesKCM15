//
//  HeroesListViewController.swift
//  DragonBallBase
//
//  Created by Markel Juaristi on 16/1/23.
//

import Foundation
import UIKit

class HeroesListViewController : UIViewController {
    var mainView: HeroesListView { self.view as! HeroesListView}
    var heroes:  [HeroModel] = []
    
    var viewModel : HeroListViewModel?
    
    var tableViewDataSource: HeroesListTableViewDataSource?
    
    override func loadView(){
        
        view = HeroesListView()
        
        tableViewDataSource = HeroesListTableViewDataSource(tableView: mainView.heroesTableView)
        
        mainView.heroesTableView.dataSource = tableViewDataSource
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HeroListViewModel()
        //PREPARANDOME PARA RECIBIR LOS DATOS QUE VIENE DEL VIEWMODEL
        viewModel?.updateUI = { [weak self] heroes in
            self?.heroes = heroes
            self?.tableViewDataSource?.heroes = heroes
        }
        /* traer los datos: CALL API TO GET HERO LIST*/
        viewModel?.fetchData()
    }
    
    /*func fetchData(){
        
        let myToken = "eyJhbGciOiJIUzI1NiIsImtpZCI6InByaXZhdGUiLCJ0eXAiOiJKV1QifQ.eyJpZGVudGlmeSI6IkUzNkM5REU4LUIxQ0QtNDM5NS04MkJGLTVFNTU3RThDQTRENyIsImVtYWlsIjoibWFya2p1YXJpc3RpQGdtYWlsLmNvbSIsImV4cGlyYXRpb24iOjY0MDkyMjExMjAwfQ.5-qOCbTIIllJry65kp0PKpI9CNDaAhUApD6xo7QyBOc"
        
        let apiClient = ApiClient(token: myToken)
        apiClient.getHeroes{[weak self] heroes, error in
            //debugPrint("PMG: \(heroes)")
            //debugPrint("PMG: ", error ??  "")
            self?.heroes = heroes
            self?.tableViewDataSource?.heroes = heroes
        }
        
    }*/
}
