//
//  Overlap.swift
//  CGRectExtensionsOSX
//
//  Created by Romain Menke on 09/10/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import Foundation


infix operator >< {  }
func >< (lhs:CGRect,rhs:CGRect) -> Bool {
    
    if lhs == rhs {
        return true
    }
    
    var xOverlap : Bool = false
    var yOverlap : Bool = false
    
    if lhs.origin.x < rhs.origin.x && (lhs.origin.x + lhs.size.width) > rhs.origin.x {
        xOverlap = true
    }
    
    if lhs.origin.y < rhs.origin.y && (lhs.origin.y + lhs.size.height) > rhs.origin.y {
        yOverlap = true
    }
    
    if rhs.origin.x < lhs.origin.x && (rhs.origin.x + rhs.size.width) > lhs.origin.x {
        xOverlap = true
    }
    
    if rhs.origin.y < lhs.origin.y && (rhs.origin.y + rhs.size.height) > lhs.origin.y {
        yOverlap = true
    }
    
    if lhs.origin == rhs.origin {
        
        if (rhs.size.width * lhs.size.width) > 0 {
            xOverlap = true
        }
        if (rhs.size.height * lhs.size.height) > 0 {
            yOverlap = true
        }
        
    }
    
    
    if yOverlap && xOverlap {
        return true
    } else {
        return false
    }
}

/*
infix operator +- {  }
func +- (lhs:CGRect,rhs:CGRect) -> CGFloat {
    
    if lhs == rhs {
        return 1
    }
    
    var equality : CGFloat = 0
    
    if lhs.width == rhs.width {
        equality += 1
    }
    if lhs.height == rhs.height {
        equality += 1
    }
    if lhs.aspectRatio == rhs.aspectRatio {
        equality += 1
    }
    if lhs.area == rhs.area {
        equality += 1
    }
    
    if lhs.minX == rhs.minX {
        equality += 1
    }
    if lhs.minY == rhs.minY {
        equality += 1
    }
    if lhs.maxX == rhs.maxX {
        equality += 1
    }
    if lhs.maxY == rhs.maxY {
        equality += 1
    }
    
    return equality / 5
    
}
*/