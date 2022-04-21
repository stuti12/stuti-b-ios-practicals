//
//  HomeViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 03/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var fruitTableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var searchItem: UISearchBar!
    @IBOutlet weak var fruitCollectionView: UICollectionView!
    var searching = false
    var fruitList = [FruitData]()
    var searchList = [FruitData]()
    var imageView = UIImageView()
    var size : CGFloat = 1
    
    //MARK: Life cycle methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        searchItem.delegate = self
        fillData()
        fruitTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil),forCellReuseIdentifier:"cell")
        imageView.backgroundColor = UIColor.red
        imageView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        imageView.image = UIImage(named: "apple")
        self.view.addSubview(imageView)
        
        fruitCollectionView.refreshControl = UIRefreshControl()
        fruitCollectionView.refreshControl?.addTarget(self, action: #selector(pullIt), for: .valueChanged)
        
    }
    
    @objc func pullIt() {
        self.fruitTableView.reloadData()
        self.fruitCollectionView.reloadData()
        fruitTableView.refreshControl?.endRefreshing()
        fruitCollectionView.refreshControl?.endRefreshing()
    }
    //MARK: IBActions
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == Constants.zero {
            self.fruitCollectionView.alpha = CGFloat(Constants.one)
            self.fruitTableView.alpha = CGFloat(Constants.zero)
        }
        else {
            self.fruitCollectionView.alpha = CGFloat(Constants.zero)
            self.fruitTableView.alpha = CGFloat(Constants.one)
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let value = sender.value
        imageView.frame = CGRect(x: Constants.zero, y: Constants.zero, width: Int(size*CGFloat(value)), height: Int(size*CGFloat(value)))
        imageView.center = view.center
        if sender.value > 0 {
            fruitCollectionView.isHidden = true
            fruitTableView.isHidden = true
        } else {
            fruitCollectionView.isHidden = false
            fruitTableView.isHidden = false
        }
    }
    
    //MARK: Extra Function
    private func fillData() {
        let fruit1 = FruitData(fruitname: "apple", fruitsImage: "apple")
        fruitList.append(fruit1)
        
        let fruit2 = FruitData(fruitname: "banana", fruitsImage: "bananas")
        fruitList.append(fruit2)
        let fruit3 = FruitData(fruitname: "strawberry", fruitsImage: "strawberry")
        fruitList.append(fruit3)
    }
}

//MARK: Extention for Collectionview Datasource and Delegate
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching == true
        {
            return searchList.count
        }
        else {
            return fruitList.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = fruitCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionCell, for: indexPath) as! MyCollectionViewCell
        if searching {
            cell.myImage.image = UIImage(named: searchList[indexPath.row].fruitImage)
            cell.labelName.text = searchList[indexPath.row].fruitName
        }
        else {
            cell.myImage.image = UIImage(named: fruitList[indexPath.row].fruitImage)
            cell.labelName.text = fruitList[indexPath.row].fruitName
        }
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = CGFloat(Constants.two)
        
        return cell
    }
    
    
}
//MARK: Extention for SearchBar
extension HomeViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searching = true
        searchList = searchText.isEmpty ? fruitList : fruitList.filter { (fruit: FruitData) in
            fruit.fruitName.lowercased().contains(searchText.lowercased())
        }
        self.fruitCollectionView.reloadData()
        self.fruitTableView.reloadData()
    }
    
}

//MARK: Extention for TableViewDelegate
extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching == true
        {
            return searchList.count
        }
        else {
            return fruitList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MyTableViewCell = (tableView.dequeueReusableCell(
            withIdentifier: Constants.tableCell) as? MyTableViewCell) else {
                return UITableViewCell()
                
            }
        if searching {
            cell.labelName.text = searchList[indexPath.row].fruitName
            cell.myImage.image = UIImage(named: searchList[indexPath.row].fruitImage)
        }
        else {
            cell.myImage.image = UIImage(named: fruitList[indexPath.row].fruitImage)
            cell.labelName.text = fruitList[indexPath.row].fruitName
        }
        return cell
    }
    
}
