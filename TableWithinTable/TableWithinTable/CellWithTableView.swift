//
//  CellWithTableView.swift
//  TableWithinTable
//
//  Created by Matthew Johnson on 2/12/17.
//  Copyright © 2017 Matthew Johnson. All rights reserved.
//

import Foundation
import UIKit

class CellWithTableView: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var label: UILabel!
    
    var data = [Any]()
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let frame: CGRect = (self.data[indexPath.row] as AnyObject).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: CGFloat(UIFont.systemFontSize))], context: nil)
        return frame.size.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        cell?.textLabel?.text = self.data[indexPath.row] as! String
        cell?.textLabel?.font = UIFont.systemFont(ofSize: CGFloat(UIFont.systemFontSize))
        return cell!
    }
 
}
