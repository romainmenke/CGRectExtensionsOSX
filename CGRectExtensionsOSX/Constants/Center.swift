//
//  Center.swift
//  CGRectExtensionsOSX
//
//  Created by Romain Menke on 09/10/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import Foundation

protocol CGRectCenter {
    
    var size : CGSize { get }
    var origin : CGPoint { get }
    var center : CGPoint { get }
    
}

extension CGRectCenter {
    
    var center : CGPoint {
        let x = (origin.x + size.width) / 2
        let y = (origin.y + size.height) / 2
        return CGPoint(x: x, y: y)
    }
}


extension CGRect : CGRectCenter {
}