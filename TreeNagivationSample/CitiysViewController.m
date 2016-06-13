//
//  CitiysViewController.m
//  TreeNagivationSample
//
//  Created by Sirius on 16/6/6.
//  Copyright © 2016年 Sirius. All rights reserved.
//

#import "CitiysViewController.h"
#import "DetailViewController.h"

@interface CitiysViewController ()

@end

@implementation CitiysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    NSDictionary *dict = [self.listData objectAtIndex:row];
    
    cell.textLabel.text = [dict objectForKey:@"name"];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowSelectedCity"]) {
        DetailViewController *detailViewController = segue.destinationViewController;
        
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        NSDictionary* dict = [self.listData objectAtIndex:selectedIndex];
        
        detailViewController.url = [dict objectForKey:@"url"];
        detailViewController.title = [dict objectForKey:@"name"];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
