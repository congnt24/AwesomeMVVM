//
//  LoadingOverlay.swift
//  Pods
//
//  Created by Cong on 6/20/17.
//
//

import UIKit
import Foundation


public enum LoadingOverlayAnimation {
    case NONE
    case FADE
}


open class LoadingOverlayOption {
    public static var overlayColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    public static var overlayAnimation = LoadingOverlayAnimation.FADE
    public static var overlayAnimationDuration = 0.5
    /// 2 loading option only use for default indicator, it does not affect to custom indicator
    public static var loadingColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    public static var loadingSize = CGRect(x: 0, y: 0, width: 80, height: 80)
}

/// Sometime you need to process a task that may take many second, you need to show a loading over the screen. So, your user can't do any action til the task is finished. That is what you need.
/// For simple use, you only need to call LoadingOverlay.shared.showOverlay(view:)
/// For custom indicator, your create a view file (xxx.xib) and instantiate it as UIView, then you initialize that customview for LoadingOverlay by call LoadingOverlay.setCustomIndicator(view:startAnimation:stopAnimation)
open class LoadingOverlay {
    var overlayView = UIView()
    lazy var loadingView: UIView = UIView()
    lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var startAnimatingCustomIndicator: (() -> Void)?
    var stopAnimatingCustomIndicator: (() -> Void)?
    var isShow = false
    
    weak var customIndicatorView: UIView?
    
    public class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    /// For custom activity indicator
    public func setCustomIndicator(view: UIView, startAnimation: @escaping () -> Void, stopAnimation: (() -> Void)? = nil) {
        customIndicatorView = view
        startAnimatingCustomIndicator = startAnimation
        stopAnimatingCustomIndicator = stopAnimation
    }
    
    /// Show loading, then close after xxx milliseconds
    public func showOverlay(view: UIView!, delayToHideInMillis: Int) {
        showOverlay(view: view)
        let when = DispatchTime.now() + .milliseconds(delayToHideInMillis)
        DispatchQueue.main.asyncAfter(deadline: when) { [unowned self] in
            self.hideOverlayView()
        }
    }
    
    public func showOverlay(view: UIView!){
        show(view: view)
        overlayView.alpha = 0
        switch LoadingOverlayOption.overlayAnimation {
        case .FADE:
            overlayView.fadeIn(duration: LoadingOverlayOption.overlayAnimationDuration, completion: nil)
            break;
        default:
            overlayView.alpha = 1
            break;
        }
    }
    
    private func show(view: UIView!) {
        if isShow {
            hideOverlayView()
        }
        overlayView = UIView(frame: UIScreen.main.bounds)
        overlayView.backgroundColor = LoadingOverlayOption.overlayColor
        if let customIndicatorView = customIndicatorView {
            customIndicatorView.center = CGPoint(x: overlayView.frame.width / 2, y: overlayView.frame.height / 2)
            overlayView.addSubview(customIndicatorView)
            startAnimatingCustomIndicator!()
        } else {
            loadingView.frame = LoadingOverlayOption.loadingSize
            loadingView.center = overlayView.center
            loadingView.backgroundColor = LoadingOverlayOption.loadingColor
            loadingView.clipsToBounds = true
            loadingView.layer.cornerRadius = 10
            let indicatorCenter = CGPoint(x: loadingView.frame.width / 2, y: loadingView.frame.height / 2)
            activityIndicator.center = indicatorCenter
            loadingView.addSubview(activityIndicator)
            overlayView.addSubview(loadingView)
            activityIndicator.startAnimating()
        }
        view.addSubview(overlayView)
        isShow = true
    }
    
    public func hideOverlayView() {
        isShow = false
        switch LoadingOverlayOption.overlayAnimation {
        case .FADE:
            overlayView.fadeOut(duration: LoadingOverlayOption.overlayAnimationDuration, completion: { t in
                self.overlayView.removeFromSuperview()
            })
            break;
        default:
            self.overlayView.removeFromSuperview()
            break;
        }
        //Don't need stop animating because we remove wrapper view
        //        if customIndicatorView != nil {
        //            stopAnimatingCustomIndicator!()
        //        } else {
        //            activityIndicator.stopAnimating()
        //        }
    }
}
