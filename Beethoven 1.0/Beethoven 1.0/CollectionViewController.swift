//
//  CollectionViewController.swift
//  Beethoven 1.0
//
//  Created by Alina on 12.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

struct CellData {
    var cellText: String
    var cellImage: UIImage
    var cellTextNext:String
    var cellTextPast:String
    
    init(text: String, image: UIImage, textNext:String, textPast:String) {
        cellText = text
        cellImage = image
        cellTextNext = textNext
        cellTextPast = textPast
    }
}


class CollectionViewController: UICollectionViewController {
    
    var alphabet:[String] = ["А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы", "Ь", "Э", "Ю", "Я"]
    var countImage = 0
    var cellDataArray:[CellData] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        
        //заполнение массива CellDataAraay
        for i in 0..<33 {
            var cellData: CellData!
        
            if ( i != 32)&&(i != 0){
                cellData = CellData(text:"\(alphabet[i])" , image: UIImage(named: "\(countImage)")!, textNext: "\(alphabet[i+1]) >",textPast: "< \(alphabet[i-1])")
            }
            if i == 32 {
                cellData = CellData(text:"\(alphabet[i])" , image: UIImage(named: "\(countImage)")!, textNext: "\(alphabet[0]) >", textPast: "< \(alphabet[i-1])")
            }
            if i == 0{
                cellData = CellData(text:"\(alphabet[i])" , image: UIImage(named: "\(countImage)")!, textNext: "\(alphabet[1]) >", textPast: "< \(alphabet[32])")

            }
            cellDataArray.append(cellData)
            countImage+=1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 33
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let labelView = UILabel()
        
        labelView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        labelView.text = alphabet[indexPath.item]
    
    
        cell.backgroundView = labelView
        
        // Configure the cell
    
        return cell
    }
   
    //задаем кнопке действие
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "jump", sender: indexPath.row)
        
    }
    //push на ViewControllerForCollection
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "jump" && sender != nil {
            
            let destinationVC = segue.destination as! ViewControllerForCollectionViewController
            destinationVC.models = cellDataArray
            destinationVC.indexOfCurrentChar = sender as! Int
            
        }
    }
    
    


}
