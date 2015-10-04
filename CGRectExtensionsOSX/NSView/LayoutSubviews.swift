//
//  LayoutSubviews.swift
//  CGRectExtensionsOSX
//
//  Created by Romain Menke on 04/10/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import Foundation

public protocol NSViewLayoutSubviews {
    
    var frame:CGRect { get }
    
    var subviews:[NSView] { get }
    
    func addSubview(aView:NSView)
    
    func addSubviewsWithLayout(subviews:[NSView],layout:NSViewLayoutForSubviews,margin:CGFloat)

}

public extension NSViewLayoutSubviews {
    
    public func addSubviewsWithLayout(subviews:[NSView],layout:NSViewLayoutForSubviews,margin:CGFloat) {
        
        switch layout {
            
        case .columns:
            columns(subviews: subviews,margin: margin)
        case .rows:
            rows(subviews: subviews,margin: margin)
//        case .grid:
//            columns(subviews,margin: margin)
//        case .unordered:
//            columns(subviews,margin: margin)
        }
        
    }
    
    private func columns(subviews subviews_I:[NSView],margin:CGFloat) {
        
        for i in 0..<subviews_I.count {
            self.addSubview(subviews_I[i])
        }
        
        let superWidth = frame.size.width // available width
        var subWidth : CGFloat = margin // width of subviews
        
        var numberOfColumns : Int = 0 // number of columns
        
        // calculate number of columns
        while numberOfColumns < self.subviews.count {
            
            let tempWidth = subWidth + self.subviews[numberOfColumns].frame.width + margin
            
            if tempWidth < superWidth {
                subWidth = tempWidth
            } else {
                break
            }
            numberOfColumns += 1
            
        }
        
        if numberOfColumns == 0 {
            numberOfColumns = 1
        }
        
        // get column origins
        var columns : [CGPoint] = []
        var lastXPoint = CGPoint(x: margin, y: margin)
        
        for i in 0..<numberOfColumns {
            columns.append(lastXPoint)
            lastXPoint = CGPoint(x: lastXPoint.x + self.subviews[i].frame.width + margin, y: margin)
        }
        
        
        var subViewOrigins : [CGPoint] = []
        var columnCounter : Int = 0 {
            didSet {
                if columnCounter >= numberOfColumns {
                    columnCounter = 0
                }
            }
        }
        
        var lastYPoints : [CGPoint] = columns
        
        for i in 0..<self.subviews.count {
            subViewOrigins.append(lastYPoints[columnCounter])
            lastYPoints[columnCounter].y += self.subviews[i].frame.height + margin
            columnCounter += 1
        }
        
        for i in 0..<self.subviews.count {
            self.subviews[i].frame.origin = subViewOrigins[i]
        }
        
    }
    
    private func rows(subviews subviews_I:[NSView],margin:CGFloat) {
        
        for i in 0..<subviews_I.count {
            self.addSubview(subviews_I[i])
        }
        
        let superHeight = frame.size.height // available height
        var subHeight : CGFloat = margin // height of subviews
        
        var numberOfRows : Int = 0 // number of rows
        
        // calculate number of rows
        while numberOfRows < self.subviews.count {
            
            let tempHeight = subHeight + self.subviews[numberOfRows].frame.height + margin
            
            if tempHeight < superHeight {
                subHeight = tempHeight
            } else {
                break
            }
            numberOfRows += 1
            
        }
        
        if numberOfRows == 0 {
            numberOfRows = 1
        }
        
        // get row origins
        var rows : [CGPoint] = []
        var lastYPoint = CGPoint(x: margin, y: margin)
        
        for i in 0..<numberOfRows {
            rows.append(lastYPoint)
            lastYPoint = CGPoint(x: margin, y: lastYPoint.y + self.subviews[i].frame.height + margin)
        }
        
        
        var subViewOrigins : [CGPoint] = []
        var rowCounter : Int = 0 {
            didSet {
                if rowCounter >= numberOfRows {
                    rowCounter = 0
                }
            }
        }
        
        var lastXPoints : [CGPoint] = rows
        
        for i in 0..<self.subviews.count {
            subViewOrigins.append(lastXPoints[rowCounter])
            lastXPoints[rowCounter].x += self.subviews[i].frame.width + margin
            rowCounter += 1
        }
        
        for i in 0..<self.subviews.count {
            self.subviews[i].frame.origin = subViewOrigins[i]
        }
        
    }
}

extension NSView : NSViewLayoutSubviews {
}