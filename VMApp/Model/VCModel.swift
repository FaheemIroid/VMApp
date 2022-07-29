//
//  VCModel.swift
//  VMApp
//
//  Created by Faheem Hussain on 28/07/22.
//

import Foundation

struct peopleModel : Decodable {
    let createdAt : String?
    let firstName : String?
    let avatar : String?
    let lastName : String?
    let email : String?
    let jobtitle : String?
    let favouriteColor : String?
    let id : String?
    let isOccupied : Bool?
    let maxOccupancy : Int?
}

