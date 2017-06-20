//
//  CGSizeExtension.swift
//  Pods
//
//  Created by Cong on 6/20/17.
//
//

import UIKit


// MARK: - Methods
public extension CGSize {
    
    /// Aspect fit CGSize.
    ///
    /// - Parameter boundingSize: bounding size to fit self to.
    /// - Returns: self fitted into given bounding size
    public func aspectFit(to boundingSize: CGSize) -> CGSize {
        let minRatio = min(boundingSize.width / width, boundingSize.height / height)
        return CGSize(width: width * minRatio, height: height * minRatio)
    }
    
    /// Aspect fill CGSize.
    ///
    /// - Parameter boundingSize: bounding size to fill self to.
    /// - Returns: self filled into given bounding size
    public func aspectFill(to boundingSize: CGSize) -> CGSize {
        let minRatio = max(boundingSize.width / width, boundingSize.height / height)
        let w = min(width * minRatio, boundingSize.width)
        let h = min(height * minRatio, boundingSize.height)
        return CGSize(width: w, height: h)
    }
    
}
