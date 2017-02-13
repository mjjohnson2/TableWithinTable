//
//  ViewController.swift
//  TableWithinTable
//
//  Created by Matthew Johnson on 2/12/17.
//  Copyright © 2017 Matthew Johnson. All rights reserved.
//

import UIKit


class TableViewControllerWithEditableSections: UITableViewController {
    
    @IBOutlet var editButton: UIBarButtonItem!
    
    var data = [AnyHashable: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.data = [IndexPath(row: 0, section: 0): ["One", "Two", "Three"], IndexPath(row: 1, section: 0): ["Red", "Yellow", "Green", "Blue"], IndexPath(row: 2, section: 0): ["On", "Off"]]
        self.tableView.isEditing = false
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let innerData: [Any] = self.data[indexPath] as! [Any]
        let frame: CGRect = "A".boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: CGFloat(UIFont.systemFontSize))], context: nil)
        return CGFloat(innerData.count + 1) * frame.size.height
        // the one is for the label
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "reuuseIdentifier"
        let cell: CellWithTableView? = (tableView.dequeueReusableCell(withIdentifier: identifier) as? CellWithTableView)
        cell?.data = self.data[indexPath] as! [Any]
        var headerText: String = ""
        switch indexPath.row {
        case 0:
            headerText = "Numbers"
        case 1:
            headerText = "Colors"
        case 2:
            headerText = "Switches"
        default:
            break
        }
        
        let frame: CGRect = headerText.boundingRect(with: CGSize(width: CGFloat(self.view.frame.size.width), height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: CGFloat(UIFont.systemFontSize))], context: nil)
        cell?.label.text = headerText
        cell?.label.font = UIFont.systemFont(ofSize: CGFloat(UIFont.systemFontSize))
        cell?.label.frame = frame
        cell?.label.backgroundColor = UIColor.lightGray
        return cell!
    }
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp: [Any] = self.data[sourceIndexPath] as! [Any]
        self.data[sourceIndexPath] = self.data[destinationIndexPath]
        self.data[destinationIndexPath] = temp
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    @IBAction func editClicked(_ sender: Any) {
        if (self.tableView?.isEditing)! {
            editButton.title = "Edit"
            self.tableView?.isEditing = false
        }
        else {
            editButton.title = "Done"
            self.tableView?.isEditing = true
            self.tableView?.allowsSelectionDuringEditing = true
        }

    }
    
}

