//
//  ViewController.m
//  TreeNagivationSample
//
//  Created by Sirius on 16/6/6.
//  Copyright © 2016年 Sirius. All rights reserved.
//

#import "ViewController.h"
#import "CitiysViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"provinces_cities" ofType:@"plist"];
    
    self.dirData = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    self.listData = [self.dirData allKeys];
    self.title = @"省份信息";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 实现表视图数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    cell.textLabel.text = [self.listData objectAtIndex:row];
    return cell;
}

// 选择表视图行时触发
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowSelectedProvince"])
    {
        CitiysViewController *citiesViewController = segue.destinationViewController;
        NSInteger seletedIndex = [[self.tableView indexPathForSelectedRow] row];
        
        NSString *seleteName = [self.listData objectAtIndex:seletedIndex];
        citiesViewController.listData = [self.dirData objectForKey:seleteName];
        citiesViewController.title = seleteName;
    }
}

@end
