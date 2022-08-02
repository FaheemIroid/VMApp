//
//  Helper.swift
//  VMApp
//
//  Created by Faheem Hussain on 28/07/22.
//

import Foundation

import UIKit

class Helper {
    static var ApiErrorMessage : String = "Error"
    static var Api400Message : String = "The request was invalid!"
    static var Api401Message : String = "Unauthorized!"
    static var Api403Message : String =  "The client did not have permission to access the requested resource!"
    static var Api404Message : String =  "No data available!"
    static var Api500Message : String =  "Internal Server Error!"
    static var Api503Message : String =  "The server was unavailable!"
    static var ApiCommomErrorMessage : String =  "Somthing Went Wrong!"
    static var AppIndicatorColor : String = "#C40202"
    static var AppGreenColor : String = "#006400"
    static var App_Base_Url : String =  "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
    //MARK: - Colour code change From hex to string
    static func colorFromHexString (hex:String) -> UIColor {
       var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
       if (cString.hasPrefix("#")) {
               cString.remove(at: cString.startIndex)
                   }
                   if ((cString.count) != 6) {
                       return UIColor.gray
                   }
                   var rgbValue:UInt64 = 0
                   Scanner(string: cString).scanHexInt64(&rgbValue)
                   return UIColor(
                       red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                       green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                       blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                       alpha: CGFloat(1.0)
                   )
       }
    //MARK: - Status Bar Colour
    static func StatusBarColor(view:UIView){
            if #available(iOS 13.0, *) {
                    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
             //   let window = UIApplication.shared.connectedScenes
                let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
                   let statusbarView = UIView()
                    statusbarView.backgroundColor = self.colorFromHexString(hex: self.AppIndicatorColor)
                   view.addSubview(statusbarView)
                   statusbarView.translatesAutoresizingMaskIntoConstraints = false
                   statusbarView.heightAnchor
                       .constraint(equalToConstant: statusBarHeight).isActive = true
                   statusbarView.widthAnchor
                       .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
                   statusbarView.topAnchor
                       .constraint(equalTo: view.topAnchor).isActive = true
                   statusbarView.centerXAnchor
                       .constraint(equalTo: view.centerXAnchor).isActive = true
               } else {
                   let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
                   let statusBar = UIView(frame: (window?.windowScene?.statusBarManager?.statusBarFrame)!)
                   statusBar.backgroundColor = Helper.colorFromHexString(hex: Helper.AppIndicatorColor)
                   window?.addSubview(statusBar)
            }
    }
    //MARK: - InterNet Checking
    static func checkConnectivity() -> Bool {
        do {
            let reachability = try Reachability()
                if reachability.connection != .unavailable {
                    return true
                } else {
                    return false
                }
        }catch let err {
                print(err)
            }
        return false
    }
    static func showAlert(message: String) {
       let alert = UIAlertController(title: Helper.ApiErrorMessage, message: message as String, preferredStyle: UIAlertController.Style.alert)
       alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
       UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
     }
    
    //MARK: - View Corner Radious , Shadow
    static func shadoweSetView(view:UIView){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.5
        view.layer.masksToBounds = false
    }
    static func cornerSetView(view:UIView,radiousValue:CGFloat){
        view.layer.cornerRadius = radiousValue
        view.layer.masksToBounds = true
    }
    static func cornerSetImageView(image:UIImageView,radiousValue:CGFloat){
        image.layer.cornerRadius = radiousValue
        image.layer.masksToBounds = true
    }
}

extension UIImage {
    static var imagePlaceholder: UIImage? {
        UIImage(named: "ic.placeholder.image")
    }
}
