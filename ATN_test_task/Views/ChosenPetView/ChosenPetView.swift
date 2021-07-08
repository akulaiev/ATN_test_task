//
//  ChosenPetView.swift
//  ATN_test_task
//
//  Created by Anna Kulaieva on 06.07.2021.
//

import UIKit

protocol ChosenPetViewProtocol: AnyObject {
    var petName: String? { set get }
    var petType: String? { set get }
    
    func clearPetImage()
    func clearAllInput()
}

@IBDesignable class ChosenPetView: UIView, ChosenPetViewProtocol {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petTypeLabel: UILabel!
    
    private let nibName = "ChosenPetView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        let bundle = Bundle(for: ChosenPetView.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.fixInView(self)
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
    }
    
    //MARK: - ChosenPetViewProtocol
    var petName: String? {
        didSet {
            guard let petName = petName else { return }
            petNameLabel.text = petName
        }
    }
    
    var petType: String? {
        didSet {
            guard let petType = petType else { return }
            let image = UIImage(named: petType)
            petTypeLabel.text = petType
            petImageView.image = image ?? UIImage(named: "QuestionMark")
        }
    }
    
    func clearPetImage() {
        petImageView.image = nil
    }
    
    func clearAllInput() {
        petImageView.image = UIImage(named: "QuestionMark")
        petTypeLabel.text = ""
        petNameLabel.text = ""
    }
}
