//
//  Expand.swift
//  CGRectExtensionsOSX
//
//  Created by Romain Menke on 04/10/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import Foundation
import Cocoa

public protocol CGRectExpand {
    
    var origin : CGPoint { get set }
    var size : CGSize { get set }
    mutating func expand(amount amount_I: CGFloat)
    
}

public extension CGRectExpand {
    
    public mutating func expand(amount amount_I:CGFloat) {
        
        var amount : CGFloat = amount_I
        
        if (amount_I * 2) < -size.width || (amount_I * 2) < -size.height {
            amount = (max(-size.width, -size.height)) / 2
        }
        
        origin.x = origin.x - amount
        origin.y = origin.y - amount
        
        size.width = size.width + (amount * 2)
        size.height = size.height + (amount * 2)
        
    }
    
}

extension CGRect: CGRectExpand {
    
}
