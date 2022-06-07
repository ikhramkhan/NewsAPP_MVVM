//
//  CategoriesViewController.swift
//  NewsAssessment
//
//  Created by Mohamed Ikhram Khan on 06/06/2022.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var categoryTableView: UITableView!
    private var viewModel = CategoriesViewModel()
    private var selectedCategory:String = ""
    private var selectedCountry:String = "us"
    var bgColor = UIColor()
    var callBack: ((_ countryStr: String, _ categoryStr: String)-> Void)?
    private var categoriesArr = [CategoriesResponse](){
        didSet
        {
            if categoriesArr.count > 0 {
                // Bounce back to the main thread to update the UI
                DispatchQueue.main.async {
                    self.categoryTableView.reloadData()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getListOfCategoryAndCoutries()
        setupTable()
       
    }
    
    func setupTable() {
        viewModel.dataArray.bind { [weak self] (dataVal) in
            DispatchQueue.main.async {
                self?.categoryTableView.hideNoDataLabel()
                self?.categoriesArr.append(contentsOf: dataVal)
                self?.categoryTableView?.allowsMultipleSelection = true
                self?.categoryTableView.reloadData()
            }
        }

    }

}


//MARK: UITableViewDataSource, UITableViewDelegate

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (categoriesArr.count > 0) {
            if (section == 0) {
                return categoriesArr[0].category?.count ?? 0
            }
            return categoriesArr[0].country?.count ?? 0
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (categoriesArr.count > 0) {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoriesTableViewCell
        if (categoriesArr.count > 0) {
            cell.setUpCategory(categoryVal: categoriesArr[0], row: indexPath.row, section: indexPath.section)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
        return "Select Category"
        }
        return "Select Country"
    }
    
    
     func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        // Find any selected row in this section
        if let selectedIndexPath = tableView.indexPathsForSelectedRows?.first(where: {
            $0.section == indexPath.section
        }) {
            // Deselect the row
            tableView.deselectRow(at: selectedIndexPath, animated: false)
            tableView.cellForRow(at: selectedIndexPath)?.accessoryType = .none
        }
         
         if (indexPath.section == 0) {
             selectedCategory = categoriesArr[0].category?[indexPath.row] ?? ""
         } else {
             selectedCountry = categoriesArr[0].country?[indexPath.row].id ?? ""
         }
        return indexPath
    }

     func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        // Prevent deselection of a cell
        return nil
    }

   
    
}


//MARK: Button Actions
extension CategoriesViewController {
    @IBAction func submitBtnAction(_ sender: Any) {
        callBack?(selectedCountry,selectedCategory)
        self.dismiss(animated: true)
       
        
    }
}
