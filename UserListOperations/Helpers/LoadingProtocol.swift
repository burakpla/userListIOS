//
//  LoadingProtocol.swift
//  UserListOperations
//
//  Created by PortalGrup on 26.01.2025.
//

import UIKit

protocol LoadingProtocol: AnyObject {
    func showLoading()
    func hideLoading()
}

extension LoadingProtocol where Self: UIViewController {
    func showLoading() {
        DispatchQueue.main.async {
            let loadingIndicator = UIActivityIndicatorView(style: .large)
            loadingIndicator.center = self.view.center
            loadingIndicator.tag = 999
            self.view.addSubview(loadingIndicator)
            loadingIndicator.startAnimating()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            if let loadingIndicator = self.view.viewWithTag(999) as? UIActivityIndicatorView {
                loadingIndicator.stopAnimating()
                loadingIndicator.removeFromSuperview()
            }
        }
    }
}
