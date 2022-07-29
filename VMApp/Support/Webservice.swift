//
//  Webservice.swift
//  VMApp
//
//  Created by Faheem Hussain on 28/07/22.
//

import Foundation

import Alamofire

import UIKit

class Webservice {
    static let sharedApiInstance = Webservice()
    
    //MARK: - GET API's
    //MARK: - People Api Call
    func  peopleAPI(url:String,completion: @escaping (Result<[peopleModel],Error>) -> ()) {
            LoadingIndicatorView.show()
        AF.request(url, method: .get,parameters: nil,encoding: URLEncoding.httpBody, headers: nil).responseJSON { [self] (response) in
                 LoadingIndicatorView.hide()
                if response.response?.statusCode == 200 {
                    guard let data = response.data else {return}
                    do {
                    let modeldata = try JSONDecoder().decode([peopleModel].self, from: data)
                    completion(.success(modeldata))
                    } catch let err {
                        completion(.failure(err))
                    }
                } else {
                    if response.response?.statusCode == 400{
                        self.showAlertMessage(message: Helper.Api400Message)
                    }else if response.response?.statusCode == 401{
                        self.showAlertMessage(message: Helper.Api401Message)
                    }else if response.response?.statusCode == 403{
                        self.showAlertMessage(message: Helper.Api403Message)
                    }else if response.response?.statusCode == 404{
                        self.showAlertMessage(message: Helper.Api404Message)
                    }else if response.response?.statusCode == 500{
                        self.showAlertMessage(message: Helper.Api500Message)
                    }else if response.response?.statusCode == 503{
                        self.showAlertMessage(message: Helper.Api503Message)
                    }else{
                        self.showAlertMessage(message: Helper.ApiCommomErrorMessage)
                    }
                }
             }
        }
    //MARK: - Message Box
    func showAlertMessage(message: String){
        let alert = UIAlertController(title: Helper.ApiErrorMessage, message: message as String, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

