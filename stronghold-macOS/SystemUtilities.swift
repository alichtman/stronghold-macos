//
//  SystemUtilities.swift
//  stronghold-macOS
//
//  Created by Aaron Lichtman on 7/5/18.
//  Copyright © 2018 Aaron Lichtman. All rights reserved.
//

import Cocoa

class SystemUtilities {
    
    // MARK: Firewall Utilities
    
    func enableFirewall() {
        
    }
    
    func enableLogging() {
        
    }
    
    func enableStealthMode() {
        
    }
    
    // MARK: General System Protection
    
    func enableGatekeeper() {
        
    }
    func preventAutomaticSoftwareWhitelisting() {
        
    }
    
    func disableCaptivePortalAssistant() {
        
    }
    
    // MARK: User Metadata Storage
    
    func clearLanguageModelingMetadata() {
        
    }
    
    func disableLanguageModelingDataCollection() {
        
    }
    
    func clearQuickLookMetadata() {
        
    }
    
    func clearDownloadsMetadata() {
        
    }
    
    func disableDownloadsMetadataCollection() {
        
    }
    
    func clearSiriAnalyticsDatabase() {
        
    }
    
    // MARK: User Safety
    
    func lockMacWhenScreensaverStarts() {
        
    }
    
    func displayAllFileExtensions() {
        
    }
    
    func disableSavingDocsToCloudByDefault() {
        
    }
    
    func showHiddenFilesInFinder () {
        
    }
    
    
    func disablePrinterSharing() {
        
    }
    
    /// Run shell commands with bash
    func shell(command: String) -> Int32 {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = ["bash", "-c", command]
        task.launch()
        task.waitUntilExit()
        return task.terminationStatus
    }
}
