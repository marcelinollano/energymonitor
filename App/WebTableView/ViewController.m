//
//  ViewController.m
//  WebTableView
//
//  Created by joseph hoffman on 12/23/13.
//  Copyright (c) 2013 NSCookbook. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *restuarantNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *restuarantImageView;
@property (weak, nonatomic) IBOutlet UILabel *restuarantAddressLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.restuarantNameLabel.text = [self.restuarantDetail objectForKey:@"name"];
    [self.restuarantImageView setImageWithURL:[NSURL URLWithString:[self.restuarantDetail objectForKey:@"icon"]]];
    self.restuarantAddressLabel.text = [self.restuarantDetail objectForKey:@"formatted_address"];
    
    
}

@end
