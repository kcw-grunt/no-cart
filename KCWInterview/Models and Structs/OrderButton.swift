//
//  OrderButton.swift
//  KCWInterview
//
//  Created by Kerry Washington on 8/30/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit

public class OrderButton: UIButton {
  
    // MARK: Public interface
    /// Corner radius of the background rectangle
    public var roundRectCornerRadius: CGFloat = 20 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    /// Color of the background rectangle
    public var roundRectColor: UIColor =  #colorLiteral(red: 0.431372549, green: 0.6470588235, blue: 0.3490196078, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        layoutRoundRectLayer()
    }
    
    // MARK: Private
    private var roundRectLayer: CAShapeLayer?
    
    private func layoutRoundRectLayer() {
        if let existingLayer = roundRectLayer {
            existingLayer.removeFromSuperlayer()
        }
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: roundRectCornerRadius).cgPath
        shapeLayer.fillColor = roundRectColor.cgColor
        self.layer.insertSublayer(shapeLayer, at: 0)
        self.roundRectLayer = shapeLayer
    }
}
