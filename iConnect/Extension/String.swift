//
//  String.swift
//  iConnect
//
//  Created by Chris Min on 26/03/2024.
//

import UIKit


extension String {
    
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: NSStringDrawingOptions.usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font : font],
            context: nil)
        
        return ceil(boundingBox.height)
    }
    
    
    
}
