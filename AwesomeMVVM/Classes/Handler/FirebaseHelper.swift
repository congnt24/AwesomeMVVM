//
//  FirebaseHelper.swift
//  iOSToDoApp
//
//  Created by Cong on 6/9/17.
//  Copyright © 2017 apple. All rights reserved.
//
/*
import Foundation
import Firebase
import GoogleSignIn

/**
 Handle login by google
 */
class FirebaseHelper: NSObject, GIDSignInDelegate {
    var onLoginEvent = PublishSubject<User?>()
    private static var _instance: FirebaseHelper? = nil
    static func instance() -> FirebaseHelper {
        return _instance!
    }

    static func configure() {
        _instance = FirebaseHelper()
    }

    override init() {
        super.init()
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {

    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            onLoginEvent.onError(error)
            return
        }

        guard let authen = user.authentication else {
            onLoginEvent.onError(error)
            return
        }

        let credential = GoogleAuthProvider.credential(withIDToken: authen.idToken, accessToken: authen.accessToken)
        //authen firebase
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                self.onLoginEvent.onError(error)
                return
            }
            //success
            self.onLoginEvent.onNext(user)
        }

    }
}
*/
