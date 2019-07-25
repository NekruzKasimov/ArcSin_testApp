//
//  Extensions.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/23/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import SystemConfiguration

extension BaseRepository {
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
}

import UIKit

extension UIView {
    @discardableResult
    func top(to anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> UIView {
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func leading(to anchor: NSLayoutXAxisAnchor, constant: CGFloat) -> UIView {
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailing(to anchor: NSLayoutXAxisAnchor, constant: CGFloat) -> UIView {
        trailingAnchor.constraint(equalTo: anchor, constant: -constant).isActive = true
        return self
    }
    @discardableResult
    func bottom(to anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> UIView {
        bottomAnchor.constraint(equalTo: anchor, constant: -constant).isActive = true
        return self
    }
    @discardableResult
    func centerX(to anchor: NSLayoutXAxisAnchor) -> UIView {
        centerXAnchor.constraint(equalTo: anchor).isActive = true
        return self
    }
    @discardableResult
    func centerY(to anchor: NSLayoutYAxisAnchor) -> UIView {
        centerYAnchor.constraint(equalTo: anchor).isActive = true
        return self
    }
    
    @discardableResult
    func width(constant: CGFloat) -> UIView {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    @discardableResult
    func height(constant: CGFloat) -> UIView {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func height(to anchor: NSLayoutDimension, multiplier: CGFloat) -> UIView {
        heightAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
        return self
    }
    
    @discardableResult
    func width(to anchor: NSLayoutDimension, multiplier: CGFloat) -> UIView {
        widthAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
        return self
    }
    
    func fillSuperView(_ padding: CGFloat = 0) {
        guard let superview = superview else {
            return
        }
        top(to: superview.topAnchor, constant: padding)
            .bottom(to: superview.bottomAnchor, constant: padding)
            .trailing(to: superview.trailingAnchor, constant: padding)
            .leading(to: superview.leadingAnchor, constant: padding)
    }
    
    func addSubViews(_ views: [UIView]) {
        views.forEach { (view) in
            self.addSubview(view)
        }
    }
}
