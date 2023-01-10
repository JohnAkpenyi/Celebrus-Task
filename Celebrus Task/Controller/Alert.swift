//
//  Alert.swift
//  Celebrus Task
//
//  Created by John Akpenyi on 10/01/2023.
//

import SwiftUI

struct Alert{
    
    /**Show message which requires a button press from user to dismiss**/
    static func showMessage(title: String, msg: String, view: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            view.present(alert, animated: true, completion: nil)
        }
    
    /**Shows loading pop up until is dismissed or operation is completed**/
    static func startLoading(view: UIViewController, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: nil, message: "Fetching News...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        view.present(alert, animated: true, completion: completion)
    }
    
}

