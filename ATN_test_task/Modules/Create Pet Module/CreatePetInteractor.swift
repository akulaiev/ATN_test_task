//
//  CreatePetInteractor.swift
//  ATN_test_task
//
//  Created by Anna Kulaieva on 05.07.2021.
//

import Foundation

class CreatePetInteractor: CreatePetInteractorProtocol {
    weak var presenter: CreatePetPresenterProtocol?
    
    var petName: String?
    var petType: String?

    required init(presenter: CreatePetPresenterProtocol) {
        self.presenter = presenter
    }
    
}
