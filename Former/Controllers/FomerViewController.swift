//
//  FomerViewController.swift
//  Former-Demo
//
//  Created by Ryo Aoyama on 7/23/15.
//  Copyright © 2015 Ryo Aoyama. All rights reserved.
//

import UIKit

public class FormerViewController: UIViewController {
    
    public private(set) var tableView: UITableView = UITableView(frame: CGRect.zero, style: .Grouped)
    public lazy var former: Former = {
        
        return Former(tableView: self.tableView)
    }()
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private final func setup() {
        
        self.view.backgroundColor = .groupTableViewBackgroundColor()
        self.tableView.backgroundColor = .clearColor()
        self.tableView.sectionHeaderHeight = 0
        self.tableView.sectionFooterHeight = 0
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.01))
        self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.01))
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.insertSubview(self.tableView, atIndex: 0)
        let tableConstraints = [
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|-0-[table]-0-|",
                options: [],
                metrics: nil,
                views: ["table": self.tableView]
            ),
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|-0-[table]-0-|",
                options: [],
                metrics: nil,
                views: ["table": self.tableView]
            )
        ]
        self.view.addConstraints(tableConstraints.flatMap({ $0 }))
    }
}