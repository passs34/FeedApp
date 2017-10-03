//
//  SignUpViewController.h
//  FeedApp
//
//  Created by pasyukevich on 29.09.17.
//  Copyright © 2017 pasyukevich. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;

@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailText;

@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@property (weak, nonatomic) IBOutlet UITextField *confrimPasswordText;
- (IBAction)signUpButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *signinBotton;


@property (weak, nonatomic) IBOutlet UIButton *logInBotton;

@property(strong, nonatomic) FIRAuthStateDidChangeListenerHandle handle;



@end
