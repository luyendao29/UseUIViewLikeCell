//
//  UIView + Extension.swift
//  UseUIViewLikeCell
//
//  Created by Boss on 3/24/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    static func nibName() -> String {
        let nameSpaceClassName = NSStringFromClass(self)
        let className = nameSpaceClassName.components(separatedBy: ".").last! as String
        return className
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.nibName(), bundle: nil)
    }
    
    static func loadFromNib<T: UIView>() -> T {
        let nameStr = "\(self)"
        let arrName = nameStr.split { $0 == "." }
        let nibName = arrName.map(String.init).last!
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! T
    }
    
    func startRotating(duration: Double = 3) {
        let kAnimationKey = "rotation"
        if self.layer.animation(forKey: kAnimationKey) == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = duration
            animate.repeatCount = Float.infinity
            animate.fromValue = 0.0
            animate.toValue = Float(.pi * 2.0)
            self.layer.add(animate, forKey: kAnimationKey)
        }
    }
    
    func stopRotating() {
        let kAnimationKey = "rotation"
        if self.layer.animation(forKey: kAnimationKey) != nil {
            self.layer.removeAnimation(forKey: kAnimationKey)
        }
    }
    
    func setConerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func circle() {
        self.setConerRadius(self.frame.size.width / 2)
    }
    
    func ellipse() {
        self.setConerRadius(self.frame.size.height / 2)
    }
    
    func setBorder(_ border: Double, withColor color: UIColor?) {
        self.layer.borderWidth = CGFloat(border)
        self.layer.borderColor = color?.cgColor
    }
    
    //Shadow
    func shadow() {
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
    }
    
    func drawShadow(shadowColor: UIColor = UIColor.black, opacity: Float =
        0.3, offset: CGSize, radius: CGFloat = 5, shouldRasterize : Bool = false) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shouldRasterize = shouldRasterize
    }
    
    //GradientView
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func shadow(_ height: CGFloat, cornerRadius: CGFloat) {
        self.layer.shadowOffset = CGSize(width: 0, height: height)
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = UIColor(named: "bec5bb")?.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.6
        self.layer.masksToBounds = false
        let path = UIBezierPath(roundedRect: bounds,
                                cornerRadius: cornerRadius)
        self.layer.shadowPath = path.cgPath
    }
    
    func shouldUpdateViewFrame() -> Bool {
        var newHeight:CGFloat = 0
        var oldHeight = self.bounds.size.height
        self.layoutIfNeeded()
        for view in self.subviews {
            newHeight = newHeight + view.bounds.size.height
        }
        if newHeight != oldHeight {
            oldHeight = newHeight
            return true
        }
        return false
    }
}
