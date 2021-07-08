//
//  CreatePetPresenter.swift
//  ATN_test_task
//
//  Created by Anna Kulaieva on 05.07.2021.
//

import UIKit

class CreatePetPresenter: CreatePetPresenterProtocol {
    var interactor: CreatePetInteractorProtocol?
    var router: CreatePetRouterProtocol?
    
    weak var petTypePickerView: PetTypePickerViewProtocol?
    weak var chosenPetView: ChosenPetViewProtocol?
    weak var petNameTextField: TextfieldWithDoneView?
    weak var customPetTypeTextField: TextfieldWithDoneView?
    weak var view: CreatePetViewProtocol?
    
    required init(view: CreatePetViewProtocol) {
        self.view = view
    }
    
    func createPetButtonClicked() {
    }
}

extension CreatePetPresenter: PetPickerViewDelegate {
    func petTypePickerViewCancelButtonClicked() {
        chosenPetView?.clearAllInput()
        interactor?.petName = ""
        interactor?.petType = ""
    }
    
    func petTypePickerViewApplyButtonClicked(selectedType: PetType) {
        chosenPetView?.clearPetImage()
        if selectedType != .unknown {
            chosenPetView?.petType = selectedType.rawValue
            customPetTypeTextField?.manageViewElementsState(isEnabled: false)
        } else {
            customPetTypeTextField?.manageViewElementsState(isEnabled: true)
        }
    }
}

extension CreatePetPresenter: TextfieldWithDoneViewDelegate {
    func doneButtonClicked(inputText: String, dataType: TextfieldDataType) {
        switch dataType {
        case .petName:
            interactor?.petName = inputText
            chosenPetView?.petName = inputText
        case .petType:
            interactor?.petType = inputText
            chosenPetView?.petType = inputText
        }
    }
}
