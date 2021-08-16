//
//  UIView.swift
//  Salamtech-User
//
//  Created by Korashi on 11/05/2021.
//  Copyright © 2021 Amir. All rights reserved.
//

import UIKit


extension UIView {
    func shaked() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.4
        animation.values = [-5.0, 5.0, -2.5, 2.5, 0.0]
        layer.add(animation, forKey: "shake")
    }
    
    func addBorderLayer(color:UIColor,lineDashed:[NSNumber]){
        var dashedLayer : CAShapeLayer?
        if dashedLayer == nil {
            dashedLayer = CAShapeLayer()
        }
        dashedLayer?.strokeColor = color.cgColor
        dashedLayer?.lineDashPattern = lineDashed
        dashedLayer?.frame = self.bounds
        dashedLayer?.fillColor = nil
        dashedLayer?.path = UIBezierPath(rect: self.bounds).cgPath
        
        let addedLayer = self.layer.sublayers?.first(where: {$0 == dashedLayer})
        if addedLayer == nil {
            self.layer.addSublayer(dashedLayer!)
        }
    }
}


extension UIView {
    func setAnchor(top:NSLayoutYAxisAnchor? ,left:NSLayoutXAxisAnchor?,right:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,paddingBottom:CGFloat,paddingLeft:CGFloat,paddingRight:CGFloat, paddingTop :CGFloat,height:CGFloat,width:CGFloat ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}

