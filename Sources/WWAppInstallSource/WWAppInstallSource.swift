//
//  WWAppInstallSource.swift
//  WWAppInstallSource
//
//  Created by William.Weng on 2023/4/24.
//

import UIKit

// MARK: - WWAppInstallSource (單例)
open class WWAppInstallSource: NSObject {
    
    /// App是從哪裡安裝的
    public enum AppInstallSource: String {
        
        case Simulator = "Simulator"    // 使用模擬器安裝
        case TestFlight = "TestFlight"  // 使用TestFlight or 實機安裝 (ipa)
        case AppStore = "AppStore"      // 使用AppStore安裝
        
        /// 文字訊息
        /// - Returns: String
        func message() -> String {
            
            switch self {
            case .Simulator: return "模擬器"
            case .TestFlight: return "實機"
            case .AppStore: return "App商店"
            }
        }
    }
    
    public static let shared = WWAppInstallSource()
    
    private override init() {}
}

// MARK: - 小工具
public extension WWAppInstallSource {
    
    /// [檢測App是從哪裡安裝的](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/從零開始開發-ios-app-的-in-app-purchase-iap-45250cf2174)
    /// - Returns: Constant.AppInstallSource?
    func detect(bundle: Bundle = .main) -> AppInstallSource? {
        
        guard let receiptPath = bundle.appStoreReceiptURL?.path else { return .none }
        
        if receiptPath.contains("CoreSimulator") { return .Simulator }
        if receiptPath.contains("sandboxReceipt") { return .TestFlight }
        return .AppStore
    }
}
