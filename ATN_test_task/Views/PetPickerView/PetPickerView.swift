//
//  PetPickerView.swift
//  ATN_test_task
//
//  Created by Anna Kulaieva on 04.07.2021.
//


import UIKit

protocol PetTypePickerViewProtocol: AnyObject {
    var arrayPetTypes: [String] { set get }
    var selectedPetTypeIndex: Int? { set get }
}

protocol PetPickerViewDelegate {
    func petTypePickerViewCancelButtonClicked()
    func petTypePickerViewApplyButtonClicked(selectedType: PetType)
}

@IBDesignable class PetPickerView: UIView, PetTypePickerViewProtocol {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // MARK: - PetPickerViewProtocol
    var arrayPetTypes = PetType.petTypeArray

    var selectedPetTypeIndex: Int?
    var delegate: PetPickerViewDelegate?
    
    private let numberOfComponents = 1
    private let componentIndex = 0
    private let nibName = "PetPickerView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        let bundle = Bundle(for: PetPickerView.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.fixInView(self)
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
    }
    
    // MARK: - Action methods
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        selectedPetTypeIndex = 0
        pickerView.selectRow(0, inComponent: 0, animated: true)
        delegate?.petTypePickerViewCancelButtonClicked()
    }
    
    @IBAction func applyButtonClicked(_ sender: UIButton) {
        guard let index = selectedPetTypeIndex,
              let selectedPetType = PetType(rawValue: arrayPetTypes[index]) else { return }
        delegate?.petTypePickerViewApplyButtonClicked(selectedType: selectedPetType)
    }
}
    
extension PetPickerView: UIPickerViewDataSource, UIPickerViewDelegate {
    // MARK: - UIPickerView dataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayPetTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayPetTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPetTypeIndex = row
    }
}
