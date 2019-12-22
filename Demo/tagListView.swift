//
//  tagListView.swift
//  Demo
//
//  Created by zzz on 2019/12/21.
//  Copyright © 2019 tester. All rights reserved.
//

import UIKit

class tagListView: UIView {
    var maxWidth: CGFloat = 0
    var lastMaxY: CGFloat = 0
    let space: CGFloat = 5.0
    
    //code
    override init(frame: CGRect) {
            super.init(frame: frame)
        
        }
    //xib
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    
    func setTag(array: NSArray) {
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        array.forEach { (title) in
            let label = getLabel()
            label.text = title as? String ?? "wedejikcnvx"
            addSubview(label)
        }
        reload()
    }
    
    
    
    // props
    var currentX: CGFloat = 0.0
    var currentY: CGFloat = 0.0
    var currentLineHeight: CGFloat = 0.0
    var lastMaxLineHeight: CGFloat = 0.0
    
    func reload() {
        guard subviews.count != 0 else {
            return
        }
        var lastMaxX:CGFloat = 0
        lastMaxY = 0
        
        currentX = space
        currentY = 0
        
        let l = subviews[1] as? UILabel
        l?.font = UIFont.systemFont(ofSize: 28)
        
        subviews.forEach { ( view) in
            guard let label = view as? UILabel else {
                return
            }
            
            label.sizeToFit()
            
            // huan hang
            if currentX + label.frame.size.width > maxWidth {
                currentX = space
                currentY = currentY + currentLineHeight + space
                currentLineHeight = label.frame.size.height
            }

            if(label.frame.size.height > currentLineHeight){
                currentLineHeight = label.frame.size.height
            }

            label.frame.origin.x = currentX
            label.frame.origin.y = currentY

            currentX += label.frame.size.width + space
            
            
            
            
            // 此行容不下，换行显示
//            if lastMaxX + space + label.frame.size.width + space > maxWidth {
//                lastMaxX = 0
//                lastMaxY += lastMaxLineHeight + space
//                lastMaxLineHeight = label.frame.size.height
//
//            }
//
//            lastMaxLineHeight = max(lastMaxLineHeight, label.frame.size.height)
//
//            label.frame.origin.x = lastMaxX + space
//            label.frame.origin.y = lastMaxY + space
//
//            label.frame.size.width = min(label.frame.size.width, maxWidth - space - space)
//            lastMaxX = label.frame.maxX
        }
        invalidateIntrinsicContentSize()
    }
    override var intrinsicContentSize: CGSize {
        // mistake
        // ok 100
        // no 60
//        var h = 60;
//        if(1/3){
//            h = 100
//        } else if(2/3)
//        {
//            h = 80
//        }
        let size = CGSize(width: maxWidth, height: currentY + space + currentLineHeight)
        print("[intrinsicContentSize] >>> \(size)")
        return size
    }
    func getLabel() -> UILabel {
        let label: UILabel = UILabel(frame: CGRect.zero)
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 1
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16)
        label.lineBreakMode = .byTruncatingTail
        label.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
        return label
    }
    
    
}
