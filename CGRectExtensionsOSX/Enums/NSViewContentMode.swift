//
//  NSViewContentMode.swift
//  CGRectExtensionsOSX
//
//  Created by Romain Menke on 04/10/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import Foundation
import Cocoa


public enum NSViewContentMode : Int {
    case ScaleToFill
    case ScaleAspectFit
    case ScaleAspectFill
    case Center
    case Top
    case Bottom
    case Left
    case Right
    case TopLeft
    case TopRight
    case BottomLeft
    case BottomRight
}


/*
switch NSViewContentMode {
    
case .ScaleToFill:
case .ScaleAspectFit:
case .ScaleAspectFill:
case .Center:
case .Top:
case .Bottom:
case .Left:
case .Right:
case .TopLeft:
case .TopRight:
case .BottomLeft:
case .BottomRight:
    
}
*/