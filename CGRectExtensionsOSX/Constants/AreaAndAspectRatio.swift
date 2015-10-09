//
//  AreaAndAspectRatio.swift
//  CGRectExtensionsOSX
//
//  Created by Romain Menke on 09/10/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import Foundation


protocol CGRectAreaAndAspectRatio {
    
    var size : CGSize { get }
    var origin : CGPoint { get }
    var aspectRatio : CGFloat { get }
    var area : CGFloat { get }
    
}

extension CGRectAreaAndAspectRatio {
    
    var aspectRatio : CGFloat {
        return size.width / size.height
    }
    
    var area : CGFloat {
        return size.width * size.height
    }
}


extension CGRect : CGRectAreaAndAspectRatio {
}