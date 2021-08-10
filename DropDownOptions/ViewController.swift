//
//  ViewController.swift
//  DropDownOptions
//
//  Created by Larry Allen on 8/5/21.
//

import UIKit

// tutorial: https://www.youtube.com/watch?v=b1LiBiLjca4

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var btnDropDown: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnShow: UIButton!
    @IBOutlet weak var showLabel: UILabel!
    
    var fruitList = ["Orange", "Banana", "Apple", "Mango", "Grapes", "Cherries", "Blueberries"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        showLabel.isHidden = true
    }

    @IBAction func onClickDropDown(_ sender: UIButton) {
        if self.tableView.isHidden == false {
            animate(toggle: true, type: btnDropDown)
        } else {
            animate(toggle: false, type: btnDropDown)
        }
    }
    
    func animate(toggle: Bool, type: UIButton) {
        if toggle {
            UIView.animate(withDuration: 0.3) {
                if type == self.btnDropDown {
                    self.tableView.isHidden = true
                } else {
                    self.showLabel.isHidden = true
                }
               
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                if type == self.btnDropDown {
                    self.tableView.isHidden = false
                } else {
                    self.showLabel.isHidden = false
                }
            }
        }
    }
    
    
    @IBAction func onClickShow(_ sender: UIButton) {
        self.showLabel.text = "This is some random text"
        if self.showLabel.isHidden == false {
            animate(toggle: true, type: btnShow)
        } else {
            animate(toggle: false, type: btnShow)
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fruitList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btnDropDown.setTitle("\(fruitList[indexPath.row])", for: .normal)
        animate(toggle: true, type: btnDropDown)
    }
    
}
