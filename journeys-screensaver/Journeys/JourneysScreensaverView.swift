//
//  JourneysScreensaverView.swift
//  Journeys
//
//  Created by Ben Smith on 5/25/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import Cocoa
import ScreenSaver
import Dispatch
import WebKit

class JourneysScreensaverView: ScreenSaverView {

    var webView: WKWebView!
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        webView = WKWebView(frame: frame)
        
        let url = URL(string: "http://journeys.forbidden.tv/")
        let request = URLRequest(url: url!)
        webView.load(request)
        addSubview(webView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func startAnimation() {
        super.startAnimation()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
    }
    
    override func draw(_ rect: NSRect) {
        super.draw(rect)
    }
    
    override func animateOneFrame() {
        
    }
    
    override func hasConfigureSheet() -> Bool {
        return false
    }
    
    override func configureSheet() -> NSWindow? {
        return nil
    }
}
