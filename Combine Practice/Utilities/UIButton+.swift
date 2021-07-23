//
//  UIButton+.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/23.
//

import UIKit

extension UIButton {
    
    func setbackgroundColor(color: UIColor, for state: UIControl.State) {
        
        let minimumSize: CGSize = CGSize(width: 1.0, height: 1.0)

        UIGraphicsBeginImageContext(minimumSize)
        
        if let context = UIGraphicsGetCurrentContext() {
            
            context.setFillColor(color.cgColor)
            
            context.fill(CGRect(origin: .zero, size: minimumSize))
            
        }
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.clipsToBounds = true
        
        self.setBackgroundImage(colorImage, for: state)
        
    }
}
