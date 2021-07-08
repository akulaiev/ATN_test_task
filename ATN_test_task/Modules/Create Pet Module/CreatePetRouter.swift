//
//  CreatePetRouter.swift
//  ATN_test_task
//
//  Created by Anna Kulaieva on 05.07.2021.
//

import UIKit

class CreatePetRouter: CreatePetRouterProtocol {
    weak var viewController: CreatePetViewController!
    
    init(viewController: CreatePetViewController) {
        self.viewController = viewController
    }
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
