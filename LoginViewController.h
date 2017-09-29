//
//  LoginViewController.h
//  FeedApp
//
//  Created by pasyukevich on 29.09.17.
//  Copyright © 2017 pasyukevich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (weak, nonatomic) IBOutlet UITextField *passswordTextField;

- (IBAction)LoginButton:(id)sender;

- (IBAction)signUpBotton:(id)sender;

@end
