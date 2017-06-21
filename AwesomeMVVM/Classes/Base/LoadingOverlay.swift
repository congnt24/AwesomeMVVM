//
//  LoadingOverlay.swift
//  Pods
//
//  Created by Cong on 6/20/17.
//
//

import UIKit
import Foundation

public class LoadingOverlay {
    var overlayView = UIView()
    lazy var loadingView: UIView = UIView()
    lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var startAnimatingCustomIndicator: (() -> Void)?
    var stopAnimatingCustomIndicator: (() -> Void)?
    weak var customIndicatorView: UIView?

    public class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    public func setCustomIndicator(view: UIView, startAnimation: @escaping () -> Void, stopAnimation: @escaping () -> Void) {
        customIndicatorView = view
        startAnimatingCustomIndicator = startAnimation
        stopAnimatingCustomIndicator = stopAnimation
    }
    
    public func showOverlay(view: UIView!, delayToHideInMillis: Int){
        showOverlay(view: view)
        let when = DispatchTime.now() + .milliseconds(delayToHideInMillis)
        DispatchQueue.main.asyncAfter(deadline: when) { [unowned self] in
            self.hideOverlayView()
        }
    }

    public func showOverlay(view: UIView!) {
        overlayView = UIView(frame: UIScreen.main.bounds)
        overlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)

        if let customIndicatorView = customIndicatorView {
            customIndicatorView.center = CGPoint(x: overlayView.frame.width / 2, y: overlayView.frame.height / 2)
            overlayView.addSubview(customIndicatorView)
            startAnimatingCustomIndicator!()
        } else {
            loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            loadingView.center = overlayView.center
            loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
            loadingView.clipsToBounds = true
            loadingView.layer.cornerRadius = 10
            let indicatorCenter = CGPoint(x: loadingView.frame.width / 2, y: loadingView.frame.height / 2)
            activityIndicator.center = indicatorCenter
            loadingView.addSubview(activityIndicator)
            overlayView.addSubview(loadingView)
            activityIndicator.startAnimating()
        }
        view.addSubview(overlayView)
    }

    public func hideOverlayView() {
        if customIndicatorView != nil {
            stopAnimatingCustomIndicator!()
        } else {
            activityIndicator.stopAnimating()
        }
        overlayView.removeFromSuperview()
    }
}
