//
//  TextfieldWithDoneView.swift
//  ATN_test_task
//
//  Created by Anna Kulaieva on 07.07.2021.
//

import UIKit

enum TextfieldDataType: Int {
    case petName = 1
    case petType = 2
}

protocol TextfieldWithDoneViewProtocol: AnyObject {
//    var inputText: String? { set get }
    
    func manageViewElementsState(isEnabled: Bool)
}

protocol TextfieldWithDoneViewDelegate {
    func doneButtonClicked(inputText: String, dataType: TextfieldDataType)
}

@IBDesignable class TextfieldWithDoneView: UIView, TextfieldWithDoneViewProtocol {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    private let nibName = "TextfieldWithDoneView"
    
    var delegate: TextfieldWithDoneViewDelegate?
    
    //MARK: - TextfieldWithDoneViewProtocol
    var inputText: String?
    
    func manageViewElementsState(isEnabled: Bool) {
        textfield.isEnabled = isEnabled
        doneButton.isEnabled = isEnabled
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        let bundle = Bundle(for: TextfieldWithDoneView.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.fixInView(self)
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
        textfield.delegate = self
        configure()
    }
    
    private func configure() {
        manageViewElementsState(isEnabled: tag == 1 ? true : false)
        textfield.text = tag == 1 ? "Enter your pets name" : "Enter your pets type"
        textfield.textColor = .lightGray
    }
    
    // MARK: - Action methods
    @IBAction func doneButtonClicked(_ sender: UIButton) {
        textfield.resignFirstResponder()
        if let textFieldType = TextfieldDataType(rawValue: self.tag),
           let inputText = inputText,
           !inputText.isEmpty {
            delegate?.doneButtonClicked(inputText: inputText, dataType: textFieldType)
        } else {
            //TODO: present alert
        }
    }
}

extension TextfieldWithDoneView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textfield.text = ""
        if textfield.textColor == .lightGray { textfield.textColor = .darkGray }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        inputText = textfield.text
    }
}
