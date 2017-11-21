//
//  ViewController.swift
//  nstableheadercellbug
//
//  Created by omochimetaru on 2017/11/21.
//

import Cocoa

func addr(_ obj: AnyObject) -> UnsafeMutableRawPointer {
    return Unmanaged.passUnretained(obj).toOpaque()
}

class Cat {
    var name: String = "nyaa"
    
    init() {
        print("[Cat(\(addr(self)))::init]")
    }
    
    deinit {
        print("[Cat(\(addr(self)))::deinit]")
    }
}

class MyHeaderCell : NSTableHeaderCell {
    var cat: Cat = .init()

    required init(coder: NSCoder) {
        super.init(coder: coder)
        print("[MyHeaderCell(\(addr(self)))::init(coder:)]")
    }
    
    override init(textCell string: String) {
        super.init(textCell: string)
        print("[MyHeaderCell(\(addr(self)))::init(textCell:)]")
    }
    
    deinit {
        print("[MyHeaderCell(\(addr(self)))::deinit]")
    }
}

class ViewController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for column in tableView.tableColumns {
            let headerCell = MyHeaderCell.init(textCell: column.title)
            column.headerCell = headerCell
        }
    }
}

