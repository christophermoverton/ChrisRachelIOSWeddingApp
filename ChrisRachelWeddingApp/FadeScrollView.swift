//
//  FadeScrollView.swift
//  ChrisRachelWeddingApp
//
//  Created by Christopher Martin Overton on 10/16/17.
//  Copyright © 2017 Christopher Martin Overton. All rights reserved.
//

import UIKit

class FadeScrollView: UIScrollView {
    let fadePercentage = 0.2
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let transparent = UIColor.clear.cgColor
        let opaque = UIColor.black.cgColor
        
        let maskLayer = CALayer()
        maskLayer.frame = self.bounds
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: self.bounds.origin.x, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        gradientLayer.colors = [transparent, opaque, opaque, transparent]
        gradientLayer.locations = [0, 0, 0.8, 1]
        
        maskLayer.addSublayer(gradientLayer)
        self.layer.mask = maskLayer
        
    }
    
    
    
}

class FadeScrollView2: UIScrollView {
    let fadePercentage = CGFloat(0.2)
    let fadePercentage2 = CGFloat(0.009)
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let transparent = UIColor.clear.cgColor
        let opaque = UIColor.black.cgColor
        
        let maskLayer = CALayer()
        maskLayer.frame = self.bounds
        
        let gradientLayer = CAGradientLayer()
        //self.bounds.origin.x
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        gradientLayer.colors = [transparent, opaque, opaque, transparent]
        gradientLayer.locations = [0, (CGFloat(0.0) + fadePercentage2) as NSNumber, (CGFloat(1.0) - fadePercentage) as NSNumber, 1]
        
        
        //gradientLayer.startPoint = CGPoint(x: self.contentOffset.x/self.bounds.size.width,y: 0.0)
        gradientLayer.startPoint = CGPoint(x: 0,y: 0.5)
        //gradientLayer.endPoint = CGPoint(x: self.contentOffset.x/self.bounds.size.width + 1.0,y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0,y: 0.5)
        gradientLayer.bounds = self.bounds;
        //gradientLayer.anchorPoint = CGPoint(x: self.contentOffset.x/self.bounds.size.width+0.5, y: 0.0)
        gradientLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        //gradientLayer.
        //gradientLayer.transform = CATransform3DMakeRotation(CGFloat(M_PI) / 2, 0, 0, 1)
        maskLayer.addSublayer(gradientLayer)
        self.layer.mask = maskLayer
        
    }
    
}
