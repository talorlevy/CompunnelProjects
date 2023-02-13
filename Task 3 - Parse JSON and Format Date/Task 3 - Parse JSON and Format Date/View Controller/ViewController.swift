//
//  ViewController.swift
//  JsonDataExample
//
//  Created by Talor Levy on 2/8/23.
//

import UIKit

class ViewController: UIViewController {
    
// MARK: @IBOutlet
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    
    var viewModel: LukeSkywalkerViewModel?
    var lukeSkywalker: LukeSkywalkerModel = LukeSkywalkerModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LukeSkywalkerViewModel()
        viewModel?.fetchUsersData {
            DispatchQueue.main.async {
                self.lukeSkywalker = self.viewModel?.lukeSkywalker ?? LukeSkywalkerModel()
                self.nameLabel.text = self.lukeSkywalker.name
                self.heightLabel.text = self.lukeSkywalker.height
                self.createdLabel.text = self.formatDate(stringToFormat: self.lukeSkywalker.created ?? "")
            }
        }
    }
    
    func formatDate(stringToFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        let date = dateFormatter.date(from: stringToFormat)!
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}
