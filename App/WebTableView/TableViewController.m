//
//  TableViewController.m
//  WebTableView
//
//  Created by Joseph Hoffman on 12/23/13.
//  Modified by Marcelino Llano on 24/05/14.
//
//  Copyright (c) 2013 NSCookbook. All rights reserved.
//

#import "TableViewController.h"
#import "AFNetworking.h"

@interface TableViewController ()

@property (strong, nonatomic) NSArray *thingsArrayFromAFNetworking;

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self makeRequest];
    
    [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(makeRequest) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)makeRequest
{
    NSURL *url = [NSURL URLWithString:@"http://0.0.0.0:3000/things.json"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //AFNetworking asynchronous url request
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.thingsArrayFromAFNetworking = responseObject;
        
        [self.tableView reloadData];
        
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Request Failed: %@, %@", error, error.userInfo);
        
    }];
    
    [operation start];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.thingsArrayFromAFNetworking count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *tempDictionary= [self.thingsArrayFromAFNetworking objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [tempDictionary objectForKey:@"name"];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ kWh / %@ €",[tempDictionary objectForKey:@"energy"], [tempDictionary objectForKey:@"cost"]];
    
    return cell;
}

@end
