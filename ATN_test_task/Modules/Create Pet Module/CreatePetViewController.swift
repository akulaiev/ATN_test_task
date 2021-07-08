//
//  CreatePetViewController.swift
//  ATN_test_task
//
//  Created by Anna Kulaieva on 05.07.2021.
//

import UIKit

class CreatePetViewController: UIViewController {

    @IBOutlet weak var petTypePickerView: PetPickerView!
    @IBOutlet weak var chosenPetView: ChosenPetView!
    @IBOutlet weak var createPetButton: UIButton!
    @IBOutlet weak var petNameTextField: TextfieldWithDoneView!
    @IBOutlet weak var customPetTypeTextField: TextfieldWithDoneView!
    
    var presenter: CreatePetPresenterProtocol!
    var configurator: CreatePetConfiguratorProtocol = CreatePetConfigurator()
    
    private let notificationCenter = NotificationCenter.default
    
    deinit {
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if customPetTypeTextField.textfield.isFirstResponder {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func createPetButtonTapped(_ sender: UIButton) {
        presenter.createPetButtonClicked()
    }
}

extension CreatePetViewController: CreatePetViewProtocol {

    func showCreatePetButton() {
        
    }
}
