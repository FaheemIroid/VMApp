//
//  TblRoomsCell.swift
//  VMApp
//
//  Created by Faheem Hussain on 29/07/22.
//

import UIKit

class TblRoomsCell: UITableViewCell {

    @IBOutlet weak var vwBG: UIView!
    
    @IBOutlet weak var ivphoto: UIImageView!
    
    @IBOutlet weak var lbOccupancy: UILabel!
    
    @IBOutlet weak var lbAvailability: UILabel!
    
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
        self.lbOccupancy.text = "maxOccupancy : " + String(peopleData?.maxOccupancy ?? 0)
        if peopleData?.isOccupied == true{
            self.lbAvailability.text = "Not Available"
            self.lbAvailability.textColor = Helper.colorFromHexString(hex: Helper.AppIndicatorColor)
        }else{
            self.lbAvailability.text = "Available"
            self.lbAvailability.textColor = Helper.colorFromHexString(hex: Helper.AppGreenColor)
        }
    }
}
