//
//  JoinToClassViewController.m
//  EduStudent
//
//  Created by Andrew Kochulab on 01.02.16.
//  Copyright © 2016 Andrew Kochulab. All rights reserved.
//

#import "JoinToClassViewController.h"

@interface JoinToClassViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@end


@implementation JoinToClassViewController

#pragma mark - UIViewController methods

- (void) viewDidLoad {
    [super viewDidLoad];
    self.codeTextField.delegate=self;
    
}

- (IBAction)connectAction:(UIButton *)sender {
}
#pragma mark-UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if([self isEmpty])
    {
        return NO;
    }
    else
    {
        //to other view controler
    }
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string   // return NO to not change text
//call when we write some charackter in text field
{
    NSCharacterSet *includeSet = [NSCharacterSet decimalDigitCharacterSet];
    if ([[string stringByTrimmingCharactersInSet:includeSet] length] > 0||self.codeTextField.text.length>7)
    {
        return NO;
    }
    return YES;
}

#pragma mark-private method
-(BOOL)isEmpty
{
    if (self.codeTextField.text.length == 0) {
        
        UIAlertController * alert = [UIAlertController alertControllerWithTitle: @"Code"
                                                                        message: @"Please enter a code."
                                                                 preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction* okButton = [UIAlertAction actionWithTitle: @"Ok"
                                                           style: UIAlertActionStyleDefault
                                                         handler: ^(UIAlertAction * action) {
                                                             
                                                             [alert dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        
        [alert addAction:okButton];
        
        [self presentViewController:alert animated:YES completion:nil];
        return YES;
    }
    return NO;
}
@end