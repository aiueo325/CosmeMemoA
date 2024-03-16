//
//  ViewController.swift
//  CosmeMemoA
//
//  Created by Apple Green on 2024/03/15.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionViewFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet var shadowButton: UIButton!

    let realm = try! Realm()
    var items: Results<CosmeItem>!
    var notificationToken: NotificationToken?
    var sliderValue: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 角丸設定
                shadowButton.layer.cornerRadius = 10
                
                // 影の設定
                shadowButton.layer.shadowOpacity = 0.7
                shadowButton.layer.shadowRadius = 3
                shadowButton.layer.shadowColor = UIColor.black.cgColor
                shadowButton.layer.shadowOffset = CGSize(width: 5, height: 5)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "NewItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewItemCell")

        // Realmからデータを取得
        items = realm.objects(CosmeItem.self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewItemCell", for: indexPath) as! NewItemCollectionViewCell
        let item: CosmeItem = items[indexPath.row]
        cell.setCell(brand: item.brand, item: item.Item, number: item.number, sliderValue: sliderValue)

        // セルにスワイプジェスチャーを追加
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeToDelete(_:)))
        swipeGesture.direction = .left
        cell.addGestureRecognizer(swipeGesture)

        return cell
    }
    

    @objc func handleSwipeToDelete(_ gestureRecognizer: UISwipeGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? UICollectionViewCell else {
            return
        }
        // タップされたセルのインデックスを取得
        if let indexPath = collectionView.indexPath(for: cell) {
            let itemToDelete = items[indexPath.item]
            try! realm.write {
                realm.delete(itemToDelete)
            }
            collectionView.deleteItems(at: [indexPath])
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.row]

        // ハーフモーダルで詳細情報を表示するためのビューコントローラーを作成
        let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController

        // タップされたセルの情報をビューコントローラーに渡す
        detailViewController.item = selectedItem

        // ハーフモーダルとして表示
        detailViewController.modalPresentationStyle = .pageSheet
        present(detailViewController, animated: true, completion: nil)
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderValue = sender.value
        collectionView.reloadData()
    }

}
