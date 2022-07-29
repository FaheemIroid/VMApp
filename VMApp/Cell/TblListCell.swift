//
//  TblListCell.swift
//  VMApp
//
//  Created by Faheem Hussain on 29/07/22.
//

import UIKit
import SDWebImage

class TblListCell: UITableViewCell {

    @IBOutlet weak var vwBG: UIView!
    
    @IBOutlet weak var ivphoto: UIImageView!
    
    @IBOutlet weak var lbName: UILabel!
    
    @IBOutlet weak var lbEmail: UILabel!
    
    @IBOutlet weak var lbJob: UILabel!
    
    var peopleData : peopleModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func setupUI(){
        Helper.cornerSetView(view: self.vwBG, radiousValue: 10)
        Helper.shadoweSetView(view: self.vwBG)
        Helper.cornerSetImageView(image: self.ivphoto, radiousValue: 10)
    }
    func setupData(){
        let fileUrl = URL(string: peopleData?.avatar ?? "")
        self.ivphoto.sd_setImage(with: fileUrl, placeholderImage: .imagePlaceholder)
        self.lbName.text = (peopleData?.firstName ?? "") + " " + (peopleData?.lastName ?? "")
        self.lbEmail.text = peopleData?.email
        self.lbJob.text = peopleData?.jobtitle
    }
}
