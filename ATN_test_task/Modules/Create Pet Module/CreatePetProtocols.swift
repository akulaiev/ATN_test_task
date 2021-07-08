//
//  CreatePetProtocols.swift
//  ATN_test_task
//
//  Created by Anna Kulaieva on 05.07.2021.
//

import UIKit

protocol CreatePetViewProtocol: AnyObject {
    func showCreatePetButton()
}

protocol CreatePetPresenterProtocol: AnyObject {
    var router: CreatePetRouterProtocol? { set get }
    func createPetButtonClicked()
}

protocol CreatePetInteractorProtocol: AnyObject {
    var petName: String? { set get }
    var petType: String? { set get }
}

protocol CreatePetRouterProtocol: AnyObject {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

protocol CreatePetConfiguratorProtocol: AnyObject {
    func configure(with viewController: CreatePetViewController)
}
