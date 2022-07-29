//
//  VCViewModel.swift
//  VMApp
//
//  Created by Faheem Hussain on 28/07/22.
//

import Foundation

import UIKit

class VCViewModel{
    var itemsDidChange: ((Any?) -> Void)?
    
    var itemsRoomsDidChange: ((Any?) -> Void)?
    
    var peopleData: [peopleModel]? {
        didSet { itemsDidChange?(peopleData) }
    }
    
    var roomsData: [peopleModel]? {
        didSet { itemsRoomsDidChange?(roomsData) }
    }
    //MARK: - People list api
    func peopleList(){
        Webservice.sharedApiInstance.peopleAPI(url: Helper.App_Base_Url+"people") { (result) in
            switch result {
            case .success(let result):
                self.peopleData = result
               // completion(result)
            case .failure(let err):
                let alert = UIAlertController(title: Helper.ApiErrorMessage, message: err.localizedDescription as String, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                break
            }
        }
    }
    //MARK: - Rooms list api
    func roomsList(){
        Webservice.sharedApiInstance.peopleAPI(url: Helper.App_Base_Url+"rooms") { (result) in
            switch result {
            case .success(let result):
                self.roomsData = result
               // completion(result)
            case .failure(let err):
                let alert = UIAlertController(title: Helper.ApiErrorMessage, message: err.localizedDescription as String, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                break
            }
        }
    }
}
