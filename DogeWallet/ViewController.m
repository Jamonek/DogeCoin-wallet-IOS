//
//  ViewController.m
//  DogeWallet
//
//  Created by Dysprosium on 1/17/14.
//  Copyright (c) 2014 Adorapuff. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [APIKey resignFirstResponder];
    [amt resignFirstResponder];
    [lbl resignFirstResponder];
    [addr resignFirstResponder];

    return YES;
}
- (IBAction)creds:(id) sender{
    NSString *lineBreak = @"https://DogeAPI.com\nApp Developer: Ryan Shtirmer - http://www.reddit.com/r/theredditgod";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Credits" message:lineBreak delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}
- (IBAction)bal:(id) sender{
    NSString *api=APIKey.text;
    NSString *url = [NSString stringWithFormat: @"https://dogeapi.com/wow/?api_key=%@&a=get_balance", api];
    NSString *imageUrlString = url;
    NSURL *URL = [NSURL URLWithString:imageUrlString];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    NSString *string = [NSString stringWithUTF8String:[data bytes]];
    NSString *someText = [NSString stringWithFormat: @"%@ DogeCoins!", string];
    if ([string rangeOfString:@"Invalid"].location == NSNotFound) {
        label.text = someText;
    } else {
        label.text = @"Invalid API Key!";
    }}
- (IBAction)with:(id) sender{
    NSString *api=APIKey.text;
    NSString *amount=amt.text;
    NSString *address=addr.text;
    NSString *url = [NSString stringWithFormat: @"https://dogeapi.com/wow/?api_key=%@&a=withdraw&amount=%@&payment_address=%@",api, amount, address];
    NSString *imageUrlString = url;
    NSURL *URL = [NSURL URLWithString:imageUrlString];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    NSString *string = [NSString stringWithUTF8String:[data bytes]];
    if ([string rangeOfString:@"Not Enough Doge"].location == NSNotFound && [string rangeOfString:@"Invalid"].location == NSNotFound) {
    label.text = @"Sent!";
    }
    if ([string rangeOfString:@"Invalid"].location != NSNotFound) {
    label.text = @"Invalid API Key!";
    }
    if ([string rangeOfString:@"Not Enough Doge"].location != NSNotFound) {
        label.text = @"Not Enough Doge!";
    }
}

- (IBAction)newa:(id) sender{
    NSString *api=APIKey.text;
    NSString *lb=lbl.text;
    NSString *url = [NSString stringWithFormat: @"https://www.dogeapi.com/wow/?api_key=%@&a=get_new_address&address_label=%@", api, lb];
    NSString *imageUrlString = url;
    NSURL *URL = [NSURL URLWithString:imageUrlString];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    NSString *string = [NSString stringWithUTF8String:[data bytes]];
    label.text = string;}
- (IBAction)my:(id) sender{
    NSString *api=APIKey.text;
    NSString *url = [NSString stringWithFormat: @"https://dogeapi.com/wow/?api_key=%@&a=get_my_addresses", api];
    NSString *imageUrlString = url;
    NSURL *URL = [NSURL URLWithString:imageUrlString];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    NSString *string = [NSString stringWithUTF8String:[data bytes]];
    label.text = string;}
- (IBAction)diff:(id) sender{
    NSString *imageUrlString = @"https://dogeapi.com/wow/?a=get_difficulty";
    NSURL *URL = [NSURL URLWithString:imageUrlString];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    NSString *string = [NSString stringWithUTF8String:[data bytes]];
    label.text = string;
}
- (IBAction)block:(id) sender{
    NSString *imageUrlString = @"https://dogeapi.com/wow/?a=get_current_block";
    NSURL *URL = [NSURL URLWithString:imageUrlString];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    NSString *string = [NSString stringWithUTF8String:[data bytes]];
    label.text = string;
}
- (IBAction)price:(id) sender{
    NSString *imageUrlString = @"https://dogeapi.com/wow/?a=get_current_price";
    NSURL *URL = [NSURL URLWithString:imageUrlString];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    NSString *string = [NSString stringWithUTF8String:[data bytes]];
    label.text = string;
}


- (void)viewDidLoad
{
    APIKey.delegate = self;
    amt.delegate = self;
    lbl.delegate = self;
    addr.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
