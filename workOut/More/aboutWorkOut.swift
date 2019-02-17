//
//  aboutWorkOut.swift
//  workOut
//
//  Created by 笹倉一也 on 2019/02/09.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import GoogleMobileAds

class aboutWorkOut: UIViewController {

    // 広告ユニットID
    let AdMobID = "ca-app-pub-5047644305890156~6475028767"
    // テスト用広告ユニットID
    let TEST_ID = "ca-app-pub-3940256099942544/2934735716"
    
    // true:テスト
    let AdMobTest:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        
        var admobView = GADBannerView()
        
        admobView = GADBannerView(adSize:kGADAdSizeBanner)
        // iPhone X のポートレート決め打ちです
        admobView.frame.origin = CGPoint(x:0, y:self.view.frame.size.height - admobView.frame.height - 84)
        admobView.frame.size = CGSize(width:self.view.frame.width, height:admobView.frame.height)
        
        if AdMobTest {
            admobView.adUnitID = TEST_ID
        }
        else{
            admobView.adUnitID = AdMobID
        }
        
        admobView.rootViewController = self
        admobView.load(GADRequest())
        
        self.view.addSubview(admobView)
   
        let request = GADRequest()
        request.testDevices = [ "df56ac05a8a407ee6135f68cdc669f28" ]
        admobView.load(request)
        
      

        }



}
