//
//  ViewController.swift
//  Amplify2
//
//  Created by Shravya Machanna on 6/25/19.
//  Copyright © 2019 Shravya Machanna. All rights reserved.
//

import UIKit
import AWSMobileClient
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AWSMobileClient.sharedInstance().initialize { (userState, error) in
            if let userState = userState {
                switch(userState){
                case .signedIn:
                    DispatchQueue.main.async {
                        print("Logged In")

                        //self.signInStateLabel.text = "Logged In"
                    }
                case .signedOut:
//                    AWSMobileClient.sharedInstance().showSignIn(navigationController: self.navigationController!, { (userState, error) in
//                        if(error == nil){       //Successful signin
//                            DispatchQueue.main.async {
//                                print("Logged In")
//                                //self.signInStateLabel.text = "Logged In"
//                            }
//                        }
//                    })
                    let facebookComponent = FBSDKLoginButton()
                    facebookComponent.center = self.view.center
                    facebookComponent.delegate = self // set delegate to respond to user actions
                    facebookComponent.readPermissions = ["public_profile","email"]
                    self.view.addSubview(facebookComponent)
                default:
                    AWSMobileClient.sharedInstance().signOut()
                }

            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        
    }

    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error == nil{
            if let token = FBSDKAccessToken.current().tokenString {
                AWSMobileClient.sharedInstance().federatedSignIn(providerName: IdentityProvider.facebook.rawValue, token: token) { (userState, error)  in
                    if let error = error {
                        print("Federated Sign In failed: \(error.localizedDescription)")
                    }else{
                        print(AWSMobileClient.sharedInstance().identityId)
                    }
                }
            }
        }else{
            print(error as Any)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }

}

