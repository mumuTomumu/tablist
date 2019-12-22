//
//  TableViewCellA.swift
//  Demo
//
//  Created by zzz on 2019/12/21.
//  Copyright © 2019 tester. All rights reserved.
//

import UIKit

class TableViewCellA: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    func configCell(title: String?) {
        guard let title = title else {
            titleLabel.text = "qwwqwqww"
            return
        }
        titleLabel.text = title
    }
}
