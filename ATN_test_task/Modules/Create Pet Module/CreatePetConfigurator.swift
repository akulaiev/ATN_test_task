//
//  CreatePetConfigurator.swift
//  ATN_test_task
//
//  Created by Anna Kulaieva on 05.07.2021.
//

import UIKit

class CreatePetConfigurator: CreatePetConfiguratorProtocol {
    
    func configure(with viewController: CreatePetViewController) {
        let presenter = CreatePetPresenter(view: viewController)
        let interactor = CreatePetInteractor(presenter: presenter)
        let router = CreatePetRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        presenter.petTypePickerView = viewController.petTypePickerView
        presenter.chosenPetView = viewController.chosenPetView
        presenter.customPetTypeTextField = viewController.customPetTypeTextField
        presenter.petNameTextField = viewController.petNameTextField
        
        viewController.petTypePickerView.delegate = presenter
        viewController.customPetTypeTextField.delegate = presenter
        viewController.petNameTextField.delegate = presenter
    }
}
