//
//  TableViewCellB.swift
//  Demo
//
//  Created by zzz on 2019/12/21.
//  Copyright © 2019 tester. All rights reserved.
//

import UIKit

class TableViewCellB: UITableViewCell {
    var appWidth: CGFloat{
       let bounds = UIApplication.shared.keyWindow?.bounds ?? UIScreen.main.bounds
        return bounds.size.width
    }
    @IBOutlet weak var tabListView: tagListView!
    var tagArray: NSArray = []

    
    func config(array: NSArray) {
        if tagArray == array {
            tabListView.maxWidth = appWidth - 24
            tabListView.reload()
            layoutIfNeeded()
        } else {
            tagArray = array
            tabListView.maxWidth = appWidth - 24
            tabListView.setTag(array: array)
            layoutIfNeeded()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        self.frame.size.height = 260
//        print("----------------------------------------")
//
//        setNeedsUpdateConstraints()
//        setNeedsLayout()
    }
}
