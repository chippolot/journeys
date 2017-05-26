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
    
    static var webViews: [WKWebView] = [WKWebView]()
    var webView: WKWebView?
    
    static var sharingViews: Bool {
        // TODO: Have this check prefs
        return false
    }
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        
        // if there are no current web views or we don't want to share, create a new view
        if JourneysScreensaverView.webViews.count == 0 || !JourneysScreensaverView.sharingViews {
            createWebView(frame: self.bounds)
        }
        
        if JourneysScreensaverView.sharingViews {
            webView = JourneysScreensaverView.webViews[0]
        } else {
            webView = JourneysScreensaverView.webViews.last
        }
        addSubview(webView!)
        
        // don't draw the webview bg
        if NSAppKitVersionNumber > 1500 {
            webView!.setValue(false, forKey: "drawsBackground")
        }
        else {
            webView!.setValue(true, forKey: "drawsTransparentBackground")
        }
        
    }
    
    func createWebView(frame: NSRect) {
        let webView = WKWebView(frame: frame)
        let cacheBuster = Int(arc4random_uniform(999999999) + 1)
        let urlString = String(format: "http://sweat.forbidden.tv/?%d", cacheBuster)
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        JourneysScreensaverView.webViews.append(webView)
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
