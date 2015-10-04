//
//  Fitt.swift
//  CGRectExtensionsOSX
//
//  Created by Romain Menke on 04/10/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import Foundation
import Cocoa

func resizeFit(fromSize: CGSize, toSize: CGSize) -> CGSize {
    
    let aspectOne = fromSize.height / fromSize.width
    let aspectTwo = toSize.height / toSize.width
    
    if aspectOne > aspectTwo {
        let scale = fromSize.height / toSize.height
        let newHeight = fromSize.height / scale
        let newWidth = fromSize.width / scale
        return CGSize(width: newWidth, height: newHeight)
    } else {
        let scale = fromSize.width / toSize.width
        let newHeight = fromSize.height / scale
        let newWidth = fromSize.width / scale
        return CGSize(width: newWidth, height: newHeight)
    }
    
}

func resizeFill(fromSize: CGSize, toSize: CGSize) -> CGSize {
    
    let aspectOne = fromSize.height / fromSize.width
    let aspectTwo = toSize.height / toSize.width
    
    if aspectOne < aspectTwo {
        let scale = fromSize.height / toSize.height
        let newHeight = fromSize.height / scale
        let newWidth = fromSize.width / scale
        return CGSize(width: newWidth, height: newHeight)
    } else {
        let scale = fromSize.width / toSize.width
        let newHeight = fromSize.height / scale
        let newWidth = fromSize.width / scale
        return CGSize(width: newWidth, height: newHeight)
    }
    
}

