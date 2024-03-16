//
//  DetailViewController.swift
//  CosmeMemoA
//
//  Created by Apple Green on 2024/03/17.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    

    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!

    var item: CosmeItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredContentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height / 2)

        
        // CosmeItem オブジェクトが存在する場合に UI 要素に情報を表示する
        if let item = item {
            brandLabel.text = item.brand
            itemLabel.text = item.Item
            numberLabel.text = item.number
            
        }
        
    }

    // オプション: ユーザーがモーダルを閉じるためのアクション
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
