//
//  ViewController.h
//  DogeWallet
//
//  Created by Dysprosium on 1/17/14.
//  Copyright (c) 2014 Adorapuff. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController <UITextFieldDelegate>{
    IBOutlet UITextView *label;
    IBOutlet UITextField *APIKey;
    IBOutlet UITextField *amt;
    IBOutlet UITextField *addr;
    IBOutlet UITextField *lbl;
}
- (IBAction)bal:(id) sender;
- (IBAction)with:(id) sender;
- (IBAction)newa:(id) sender;
- (IBAction)my:(id) sender;
- (IBAction)diff:(id) sender;
- (IBAction)block:(id) sender;
- (IBAction)creds:(id) sender;
- (IBAction)price:(id) sender;

@end
