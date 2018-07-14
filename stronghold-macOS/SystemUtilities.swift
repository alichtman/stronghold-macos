//
//  SystemUtilities.swift
//  stronghold-macOS
//
//  Created by Aaron Lichtman on 7/5/18.
//  Copyright © 2018 Aaron Lichtman. All rights reserved.
//

import Cocoa

class SystemUtilities {
    
    // MARK: Networking
    
    // Firewalls
    
    func enableFirewall() {
        _ = shell("sudo launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plist")
        _ = shell("sudo launchctl load /System/Library/LaunchAgents/com.apple.alf.useragent.plist")
        _ = shell("sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on")
    }
    
    func disableFirewall() {
        
    }
    
    func enableLogging() {
        _ = shell("sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on")
    }
    
    func disableLogging() {
        _ = shell("sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode off")
    }
    
    func enableStealthMode() {
        _ = shell("sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on")
    }
    
    func disableStealthMode() {
        _ = shell("sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode off")
    }
    
    // Captive Portal
    
    func disableCaptivePortalAssistant() {
        _ = shell("sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false")
    }
    
    func enableCaptivePortalAssistant() {
        
    }
    
    // MARK: User Data Storage
    
    func clearSiriAnalyticsDatabase() {
        
    }
    
    func clearLanguageModelingDatabase() {
        _ = shell("rm -rfv \"~/Library/LanguageModeling/*\" \"~/Library/Spelling/*\" \"~/Library/Suggestions/*\"")
    }
    
    func disableLanguageModelingDataCollection() {
        _ = shell("sudo chmod -R 000 ~/Library/LanguageModeling ~/Library/Spelling ~/Library/Suggestions")
        _ = shell("sudo chflags -R uchg ~/Library/LanguageModeling ~/Library/Spelling ~/Library/Suggestions")
    }
    
    func clearQuickLookMetadata() {
        _ = shell("rm -rfv \"~/Library/Application Support/Quick Look/*\"")
    }
    
    func clearDownloadsMetadata() {
        
    }
    
    func disableDownloadsMetadataCollection() {
        
    }
    
    // MARK: System Behavior
    
    func enableGatekeeper() {
        _ = shell("sudo spctl --master-enable")
        _ = shell("sudo spctl --enable --label \"Developer ID\"")
    }
    
    func disableGatekeeper() {
        
    }
    
    func disableAutomaticSoftwareWhitelisting() {
        _ = shell("sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off")
        _ = shell("sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off")
    }
    
    func enableAutomaticSoftwareWhitelisting() {
        
    }
    
    func lockMacWhenScreensaverStarts() {
        
    }
    
    func enableShowAllFileExtensions() {
        
    }
    
    func disableShowAllFileExtensions() {
        
    }
    
    func disableSavingDocsToCloudByDefault() {
        
    }
    
    func enableSavingDocsToCloudByDefault() {
        
    }
    
    func showHiddenFilesInFinder () {
        
    }
    
    func hideHiddenFilesInFinder () {
        
    }
    
    func disablePrinterSharing() {
        
    }
    
    func enablePrinterSharing() {
        
    }
    
    /// Run shell commands with bash
    func shell(_ command: String) -> Int32 {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = ["bash", "-c", command]
        task.launch()
        task.waitUntilExit()
        return task.terminationStatus
    }
}
