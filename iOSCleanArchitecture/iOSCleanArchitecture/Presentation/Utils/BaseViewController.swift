//
//  BaseViewController.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 17/11/22.
//

import UIKit

class BaseViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}
