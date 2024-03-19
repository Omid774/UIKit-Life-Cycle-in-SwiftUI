//
//  UIKit_Life_Cycle_in_SwiftUIApp.swift
//  UIKit Life Cycle in SwiftUI
//
//  Created by Omid Heydarzadeh on 3/19/24.
//

import SwiftUI

@main
struct UIKit_Life_Cycle_in_SwiftUIApp: App {
    
    // for scene life cycle (built in SwiftUI)
    @Environment(\.scenePhase) private var scenePhase
    
    // for app life cycle ( scene delegate is inside this )
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // for scene
        .onChange(of: scenePhase) { phase in
            print("\(phase) - SwiftUI")
        }
    }
}




// Custom AppDelegate class conforming to UIApplicationDelegate
class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Perform any necessary setup when the application launches
        print("\(#function) - AppDelegate")
//        Thread.sleep(forTimeInterval: 5)
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called when the application is about to enter the foreground
        print("\(#function) - AppDelegate")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Called when the application enters the background
        print("\(#function) - AppDelegate")
    }
    
    
    // connect scene to app delegate
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
            let sceneConfig: UISceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
            sceneConfig.delegateClass = SceneDelegate.self
            return sceneConfig
        }
    
    // Add other methods of UIApplicationDelegate as needed
}


// App protocol = App Delegate -> iOS 14 +
// UIApplicationDelegateAdaptor -> property wrapper for implementing app delegate



class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        print("\(#function) - SceneDelegate")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("\(#function) - SceneDelegate")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("\(#function) - SceneDelegate")
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("\(#function) - SceneDelegate")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("\(#function) - SceneDelegate")
    }
    
    

    // Other methods of UIWindowSceneDelegate can be implemented as needed
}



/*
 
 in SwiftUI:
 > use built in SwiftUI Life Cycle
 > create AppDelegate Like UIKit
 > create SceneDelegate Like UIKit
 > test Life Cycles
 
 > create Launch Screen Like UIKit
 
 */
