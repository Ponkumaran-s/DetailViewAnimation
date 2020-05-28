//
//  ViewController.swift
//  PresentTransitionAnimation
//
//  Created by Ponkumar's Mac on 27/05/20.
//  Copyright © 2020 Ponkumar's Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
                self.tableView.reloadData()
    }
    
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell?
        switch indexPath.row {
        case 0:
            cell?.backgroundColor = UIColor.red
            return cell!
        case 1:
            cell?.backgroundColor = UIColor.green
            return cell!
        case 2:
            cell?.backgroundColor = UIColor.blue
            return cell!
        default:
            cell?.backgroundColor = UIColor.black
            return cell!
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let rectOfCell = tableView.rectForRow(at: indexPath)
        let rectOfCellInSuperview = tableView.convert(rectOfCell, to: tableView.superview)
        ScaleSegue.startFrameToAnimate = CGRect(x: rectOfCellInSuperview.minX, y: rectOfCellInSuperview.minY, width:rectOfCell.width, height: rectOfCell.height)
        
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyBoard.instantiateViewController(withIdentifier: "screen2") as! DescriptionViewController
        controller.view.backgroundColor = UIColor.red
        
        performSegue(withIdentifier: "show", sender: self)
        
    }
    
    
    
    
    
    
    
}



