//
//  MoreImagesTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 28/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class MoreImagesTableViewCell: UITableViewCell, KIImagePagerDelegate, KIImagePagerDataSource {
    
    @IBOutlet weak var imagePager: KIImagePager!
    
    var images = [UIImage]()
    
    var delegate: ParallaxDetailsViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.imagePager.delegate = self
        self.imagePager.dataSource = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func arrayWithImages(pager: KIImagePager!) -> [AnyObject]! {
        return self.images
    }
    
    func contentModeForImage(image: UInt, inPager pager: KIImagePager!) -> UIViewContentMode {
        return UIViewContentMode.ScaleToFill
    }
    
    func imagePager(imagePager: KIImagePager!, didSelectImageAtIndex index: UInt) {        
        if let delegate = self.delegate {
            delegate.imagePager(imagePager, didSelectImage: self.images[Int(index)])
        }
    }
    
    internal static func moreImagesCell() -> MoreImagesTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("MoreImagesTableViewCell", owner: self, options: nil)
        let cell: MoreImagesTableViewCell = nibs[0] as! MoreImagesTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
