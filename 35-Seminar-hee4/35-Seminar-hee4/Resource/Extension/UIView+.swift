//
//  UIView.swift
//  35-Seminar-hee4
//
//  Created by 김희은 on 11/8/24.
//
import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}
