//
//  NewsDetailViewController.swift
//  NewsAssessment
//
//  Created by Mohamed Ikhram Khan on 05/06/2022.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var souceLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var headerTextLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var bgViewHeightConstraint: NSLayoutConstraint!
    var dataVal:Article?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInit()
        // Do any additional setup after loading the view.
    }
    
    func setupInit() {
        headerTextLabel.text = dataVal?.title
        daysLabel.text = getPastTime(for: formattedDate(dateStr: dataVal?.publishedAt ?? ""))
        souceLabel.text = dataVal?.source.name
        descLabel.text = dataVal?.description
        if let imageUrl = dataVal?.urlToImage {
            newsImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "NewsPlaceholder"))
        }
        headerView.dropShadow()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
