//
//  SignUpViewController.m
//  FeedApp
//
//  Created by pasyukevich on 29.09.17.
//  Copyright © 2017 pasyukevich. All rights reserved.
//

#import "SignUpViewController.h"
#import "FirstViewController.h"
@import Firebase;
@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    if ([self.emailText.text  isEqualToString: @""]||[self.passwordText.text  isEqualToString: @""]||[self.confrimPasswordText.text  isEqualToString: @""]) {
//        [self disableButton];
//    } else  [self enabledButton];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//-(void)disableButton {
//    _signinBotton.enabled = NO;
//}
//-(void)enabledButton {
//    _signinBotton.enabled = YES;
//}



-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.handle = [[FIRAuth auth]
                   addAuthStateDidChangeListener:^(FIRAuth *_Nonnull auth, FIRUser *_Nullable user) {
                   }];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // [START remove_auth_listener]
    [[FIRAuth auth] removeAuthStateDidChangeListener:_handle];
    // [END remove_auth_listener]
    
}



- (IBAction)signUpButton:(id)sender {
    
    //[self showTabBarcontroller];
    
    
    
    [[FIRAuth auth] createUserWithEmail:self.emailText.text
                               password:self.passwordText.text
                             completion:^(FIRUser *_Nullable user, NSError *_Nullable error) {
                                 
                                 if (user != nil) {
                                     [self showTabBarcontroller];
                                 } else { [self showErrorAlert:error controller:self];
                                     
                                 }
                                 
                                 // ...
                             }];
    
}

-(void)showTabBarcontroller {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [self presentViewController:[storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"] animated:NO completion:NULL];
    }

-(void)showErrorAlert:(NSError*)error controller:(UIViewController*)controller {
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"User or Email not found" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [controller presentViewController:alert animated:YES completion:nil];
}

@end
