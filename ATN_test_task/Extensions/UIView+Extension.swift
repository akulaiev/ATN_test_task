//
//  UIView+Extension.swift
//  ATN_test_task
//
//  Created by Anna Kulaieva on 05.07.2021.
//

import UIKit

extension UIView {
    func fixInView(_ container: UIView?) -> Void {
        guard let container = container else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = container.frame
        container.addSubview(self)
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: container, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: container, attribute: .height, multiplier: 1.0, constant: 0.92).isActive = true
    }
}
