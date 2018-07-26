//
//  ViewController.swift
//  parallax
//
//  Created by nic on 13/10/2016.
//  Copyright © 2016 nicksdev. All rights reserved.
//

import UIKit

class ParallaxVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var titles = ["headshots", "portraits", "lifestyle", "graduation", "Couples", "Professional", "Image 7", "Image 8", "Image 9", "Image 10"]
    
    var parallaxOffsetSpeed: CGFloat = 70
    var cellHeight: CGFloat = 250
    
    
    var image: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
        UIImage(named: "7")!,
        UIImage(named: "8")!,
        UIImage(named: "9")!,
        UIImage(named: "10")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    var parallaxImageHeight: CGFloat {
        
        let maxoffset = (sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed * self.tableView.frame.height) - cellHeight) / 2
        return maxoffset + self.cellHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell  = tableView.dequeueReusableCell(withIdentifier: "imageCell") as? ImageCell{
            
            cell.configureCell(title: titles[indexPath.row], image: image[indexPath.row])
            cell.parallaxImageHeight.constant = self.parallaxImageHeight
            cell.parallaxTopConstraint.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
            return cell
        }else {
         return ImageCell()   
        }
        
    }
    func parallaxOffset(newOffsetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        return (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [ImageCell]{
            cell.parallaxTopConstraint.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
        }

    }

}

