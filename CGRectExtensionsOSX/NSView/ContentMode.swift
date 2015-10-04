//
//  ContentMode.swift
//  CGRectExtensionsOSX
//
//  Created by Romain Menke on 04/10/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import Foundation
import Cocoa

public protocol ContentMode {
    
    var frame : CGRect { get set }
    
    func addSubview(aView: NSView)
    func addSubview(aView: NSView, contentMode: NSViewContentMode)
    
}

public extension ContentMode {
    
    public func addSubview(aView: NSView, contentMode: NSViewContentMode) {
        
        switch contentMode {
            
        case .ScaleToFill:
            aView.frame = scaleToFill()
            addSubview(aView)
        case .ScaleAspectFit:
            aView.frame = scaleAspectFit(aView.frame)
            addSubview(aView)
        case .ScaleAspectFill:
            aView.frame = scaleAspectFill(aView.frame)
            addSubview(aView)
        case .Center:
            aView.frame = center(aView.frame)
            addSubview(aView)
        case .Top:
            aView.frame = top(aView.frame)
            addSubview(aView)
        case .Bottom:
            aView.frame = bottom(aView.frame)
            addSubview(aView)
        case .Left:
            aView.frame = left(aView.frame)
            addSubview(aView)
        case .Right:
            aView.frame = right(aView.frame)
            addSubview(aView)
        case .TopLeft:
            aView.frame = topLeft(aView.frame)
            addSubview(aView)
        case .TopRight:
            aView.frame = topRight(aView.frame)
            addSubview(aView)
        case .BottomLeft:
            aView.frame = bottomLeft(aView.frame)
            addSubview(aView)
        case .BottomRight:
            aView.frame = bottomRight(aView.frame)
            addSubview(aView)
        }
        
    }
    
    
    private func center(subviewFrame: CGRect) -> CGRect {
        
        let xMargin = (frame.width - subviewFrame.width) / 2
        let yMargin = (frame.height - subviewFrame.height) / 2
        
        let newOrigin = CGPoint(x: xMargin, y: yMargin)
        
        var newRect = subviewFrame
        newRect.origin = newOrigin
        return newRect
        
    }
    
    private func topLeft(subviewFrame: CGRect) -> CGRect {
        
        let heightDifference = frame.height - subviewFrame.height
        
        let newOrigin = CGPoint(x: 0, y: heightDifference)
        
        var newRect = subviewFrame
        newRect.origin = newOrigin
        return newRect
        
    }
    
    private func topRight(subviewFrame: CGRect) -> CGRect {
        
        let widthDifference = frame.width - subviewFrame.width
        let heightDifference = frame.height - subviewFrame.height
        
        let newOrigin = CGPoint(x: widthDifference, y: heightDifference)
        
        var newRect = subviewFrame
        newRect.origin = newOrigin
        return newRect
        
    }
    
    private func bottomLeft(subviewFrame: CGRect) -> CGRect {
        
        let newOrigin = CGPointZero
        
        var newRect = subviewFrame
        newRect.origin = newOrigin
        return newRect
        
    }
    
    private func bottomRight(subviewFrame: CGRect) -> CGRect {
        
        let widthDifference = frame.width - subviewFrame.width
        let newOrigin = CGPoint(x: widthDifference, y: 0)
        
        var newRect = subviewFrame
        newRect.origin = newOrigin
        return newRect
        
    }
    
    private func top(subviewFrame: CGRect) -> CGRect {
        
        let xMargin = (frame.width - subviewFrame.width) / 2
        let heightDifference = frame.height - subviewFrame.height
        
        let newOrigin = CGPoint(x: xMargin, y: heightDifference)
        
        var newRect = subviewFrame
        newRect.origin = newOrigin
        return newRect
        
    }
    
    private func bottom(subviewFrame: CGRect) -> CGRect {
        
        let xMargin = (frame.width - subviewFrame.width) / 2
        let newOrigin = CGPoint(x: xMargin, y: 0)
        
        var newRect = subviewFrame
        newRect.origin = newOrigin
        return newRect
        
    }
    
    private func left(subviewFrame: CGRect) -> CGRect {
        
        let yMargin = (frame.height - subviewFrame.height) / 2
        let newOrigin = CGPoint(x: 0, y: yMargin)
        
        var newRect = subviewFrame
        newRect.origin = newOrigin
        return newRect
        
    }
    
    private func right(subviewFrame: CGRect) -> CGRect {
        
        let yMargin = (frame.height - subviewFrame.height) / 2
        let widthDifference = frame.width - subviewFrame.width
        
        let newOrigin = CGPoint(x: widthDifference, y: yMargin)
        
        var newRect = subviewFrame
        newRect.origin = newOrigin
        return newRect
        
    }
    
    private func scaleToFill() -> CGRect {
        
        return CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
    }
    
    
    private func scaleAspectFill(subviewFrame: CGRect) -> CGRect {
        
        let fromSize = subviewFrame.size
        let toSize = frame.size
        
        var newSize : CGSize = CGSizeZero
        var newOrigin : CGPoint = CGPointZero
        
        let aspectOne = fromSize.height / fromSize.width
        let aspectTwo = toSize.height / toSize.width
        
        if aspectOne < aspectTwo {
            let scale = fromSize.height / toSize.height
            let newHeight = fromSize.height / scale
            let newWidth = fromSize.width / scale
            newSize = CGSize(width: newWidth, height: newHeight)
        } else {
            let scale = fromSize.width / toSize.width
            let newHeight = fromSize.height / scale
            let newWidth = fromSize.width / scale
            newSize = CGSize(width: newWidth, height: newHeight)
        }
        
        if newSize.width == toSize.width {
            newOrigin.x = 0
            newOrigin.y = (toSize.height - newSize.height) / 2
        } else {
            newOrigin.x = (toSize.width - newSize.width) / 2
            newOrigin.y = 0
        }
        
        var newRect = CGRectZero
        newRect.origin = newOrigin
        newRect.size = newSize
        
        return newRect
        
    }
    
    private func scaleAspectFit(subviewFrame: CGRect) -> CGRect {
        
        let fromSize = subviewFrame.size
        let toSize = frame.size
        
        var newSize : CGSize = CGSizeZero
        var newOrigin : CGPoint = CGPointZero
        
        let aspectOne = fromSize.height / fromSize.width
        let aspectTwo = toSize.height / toSize.width
        
        if aspectOne > aspectTwo {
            let scale = fromSize.height / toSize.height
            let newHeight = fromSize.height / scale
            let newWidth = fromSize.width / scale
            newSize = CGSize(width: newWidth, height: newHeight)
        } else {
            let scale = fromSize.width / toSize.width
            let newHeight = fromSize.height / scale
            let newWidth = fromSize.width / scale
            newSize = CGSize(width: newWidth, height: newHeight)
        }
        
        if newSize.width == toSize.width {
            newOrigin.x = 0
            newOrigin.y = (toSize.height - newSize.height) / 2
        } else {
            newOrigin.x = (toSize.width - newSize.width) / 2
            newOrigin.y = 0
        }
        
        var newRect = CGRectZero
        newRect.origin = newOrigin
        newRect.size = newSize
        
        return newRect
        
    }
    
}

extension NSView: ContentMode {
    
}