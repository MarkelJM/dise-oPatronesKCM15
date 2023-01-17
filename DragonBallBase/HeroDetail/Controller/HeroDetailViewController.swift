//
//  HeroDetailViewController.swift
//  DragonBallBase
//
//  Created by Markel Juaristi on 17/1/23.
//

import Foundation
import UIKit

class HeroDetailViewController: UIViewController {
    var mainView: HeroDetailView { self.view as! HeroDetailView}
    
    init(heroDetailModel: HeroModel){
        super.init(nibName: nil, bundle: nil)
        mainView.configure(heroDetailModel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = HeroDetailView()
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
}
