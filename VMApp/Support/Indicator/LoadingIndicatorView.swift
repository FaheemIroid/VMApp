//
//  LoadingIndicatorView.swift
//  VMApp
//
//  Created by Faheem Hussain on 29/07/22.
//


import UIKit

class LoadingIndicatorView {
    
    static var currentOverlay : UIView?
    static var currentOverlayTarget : UIView?
    static var currentLoadingText: String?
    
    static let spinnerView = JTMaterialSpinner()
    
    static func show() {
        
        guard let currentMainWindow = UIApplication.shared.keyWindow else {
            print("No main window.")
            return
        }

        show(currentMainWindow)
    }
    
    static func show(_ loadingText: String) {
        guard let currentMainWindow = UIApplication.shared.keyWindow else {
            print("No main window.")
            return
        }
        show(currentMainWindow, loadingText: loadingText)
    }
    
    static func show(_ overlayTarget : UIView) {
        show(overlayTarget, loadingText: nil)
    }
    
    static func show(_ overlayTarget : UIView, loadingText: String?) {
        // Clear it first in case it was already shown
        hide()
        
     
        
        // Create the overlay
        let overlay = UIView(frame: overlayTarget.frame)
        overlay.center = overlayTarget.center
        overlay.backgroundColor = UIColor.clear
        overlayTarget.addSubview(overlay)
        overlayTarget.bringSubviewToFront(overlay)
        
    
        
        
        overlay.addSubview(spinnerView)
        spinnerView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        spinnerView.center = overlay.center
            
        spinnerView.circleLayer.lineWidth = 2.0
        spinnerView.circleLayer.strokeColor = Helper.colorFromHexString(hex: Helper.AppIndicatorColor).cgColor
        spinnerView.beginRefreshing()

        
        currentOverlay = overlay
        currentOverlayTarget = overlayTarget
        currentLoadingText = loadingText
        
    }
    
    static func hide() {
        if currentOverlay != nil {
            

            
            spinnerView.endRefreshing()
            currentOverlay?.removeFromSuperview()
            currentOverlay =  nil
            currentLoadingText = nil
            currentOverlayTarget = nil
            
            
        }
    }
    
    @objc private static func rotated() {
        // handle device orientation change by reactivating the loading indicator
        if currentOverlay != nil {
            show(currentOverlayTarget!, loadingText: currentLoadingText)
        }
    }
}
