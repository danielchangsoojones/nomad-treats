//
//  SettingsViewController.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit
import Former

class SettingsViewController: UIViewController {
    let tableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    lazy var former: Former = Former(tableView: self.tableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        setupRefreshDataRow()
    }
    
    func tableViewSetup() {
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
    }
    
    private func setupRefreshDataRow() {
        addTappableLabelRow(title: "Refresh Data Cache", onSelected: {
            DataCache().updateCaches()
        })
    }
}

//MARK: Former Helpers
extension SettingsViewController {
    func append(rows: RowFormer..., headerTitle: String) -> SectionFormer? {
        let header = LabelViewFormer<FormLabelHeaderView>()
        header.text = headerTitle
        let section = SectionFormer(rowFormers: rows)
            .set(headerViewFormer: header)
        former.append(sectionFormer: section)
        return section
    }
    
    func addTappableLabelRow(title: String, onSelected: @escaping () -> Void) {
        let labelRow = LabelRowFormer<FormLabelCell>()
        
        labelRow.configure { (row) in
            row.text = title
        }
        
        labelRow.onSelected { _ in
            onSelected()
        }
        
        _ = append(rows: labelRow, headerTitle: "")
    }
}
