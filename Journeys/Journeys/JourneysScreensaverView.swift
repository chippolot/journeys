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
        
        let url = URL(string: "https://www.youtube.com/embed/1Z_YV_gwAro?version=3&autoplay=1&controls=0&disablekb=1&loop=1&modestbranding=1&showinfo=0&rel=0&hd=1")
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
