//
//  LoginViewController.m
//  FeedApp
//
//  Created by pasyukevich on 29.09.17.
//  Copyright © 2017 pasyukevich. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    // Do any additional setup after loading the view.
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

- (IBAction)LoginButton:(id)sender {
    
    [[FIRAuth auth] signInWithEmail:self.emailTextField.text
                           password:self.passswordTextField.text
                         completion:^(FIRUser *user, NSError *error) {
                             // ...
                             if (user != nil) {
                                 [self showTabBarcontroller];
                             } else { [self showErrorAlert:error controller:self];
                                 
                             }
                         }];
}

-(void)showTabBarcontroller {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [self presentViewController:[storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"] animated:NO completion:NULL];
}

-(void)showErrorAlert:(NSError*)error controller:(UIViewController*)controller {
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Incorrect login or password" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [controller presentViewController:alert animated:YES completion:nil];
}



- (IBAction)signUpBotton:(id)sender {
}
@end
