//
//  SceneDelegate.swift
//  Kiliaro
//
//  Created by Boaz James on 03/10/2022.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let vc = PhotoVC()
        let nc = MainNavigationVC(rootViewController: vc)
        
        // Create the window. Be sure to use this initializer and not the frame one.
        let win = UIWindow(windowScene: windowScene)
        win.rootViewController = nc
        win.makeKeyAndVisible()
        window = win
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

@available(iOS 13.0, *)
extension SceneDelegate {
    func makeRootVC(_ vc: UIViewController) {
//        let sceneDelegate = UIApplication.shared.connectedScenes
//            .first!.delegate as! SceneDelegate
        self.window?.rootViewController = vc
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.6
        UIView.transition(with: self.window!, duration: duration, options: options, animations: {}, completion: nil)
    }
    
    func makeRootVC(_ vc: UINavigationController) {
        self.window?.rootViewController = vc
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 1
        UIView.transition(with: self.window!, duration: duration, options: options, animations: {}, completion: nil)
    }
}

@available(iOS 13.0, *)
extension SceneDelegate {
    static var shared: SceneDelegate {
        return UIApplication.shared.connectedScenes
            .first!.delegate as! SceneDelegate
    }
}

