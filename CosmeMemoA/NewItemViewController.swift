//
//  NewItemViewController.swift
//  CosmeMemoA
//
//  Created by Apple Green on 2024/03/15.
//

import UIKit
import RealmSwift

// ButtonState クラスと NewItemViewController クラスを同じスコープに配置する
class ButtonState: Object {
    @Persisted var isSelected: Bool
}

class NewItemViewController: UIViewController {
    
    @IBOutlet var brandTextField: UITextField!
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var slider: UISlider!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        let newItem = CosmeItem()
        newItem.brand = brandTextField.text ?? ""
        newItem.Item = itemTextField.text ?? ""
        newItem.number = numberTextField.text ?? ""
        
        createItem(item: newItem)
        self.dismiss(animated: true)
    }
    
    func createItem(item: CosmeItem) {
        try! realm.write {
            realm.add(item)
        }
    }
}
