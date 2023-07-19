//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2023/07/19.
//  ~/Library/Caches/org.swift.swiftpm/
//  file:///Users/william/Desktop/WWAppInstallSource

import UIKit
import WWPrint
import WWAppInstallSource

final class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = WWAppInstallSource.shared.detect()?.rawValue
    }
}

