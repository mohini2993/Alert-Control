//
//  ViewController.m
//  day10ios_alertcontrolasseignment
//
//  Created by Student 01 on 15/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.days=[[NSMutableArray alloc]initWithObjects:@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday", nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.days.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    UIButton *crossbtn=[[UIButton alloc]init];
    [crossbtn addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView=crossbtn;
    
    UIScrollView *scroll=[[UIScrollView alloc]init];
    cell.textLabel.text=[self.days objectAtIndex:indexPath.row];
    UIImage *image=[UIImage imageNamed:@"download.png"];
    cell.imageView.image=image;
    [scroll addSubview:cell];
    return cell;
}
-(void)pressButton:(UISwitch *)sender
{
   // UISwitch *localSwitch=sender;
   [self showAlertWithTitle:@"Delete Item" andMessage:@"Do you Want to Really Delete"];
}
-(void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message
{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *item ;
        [self.days removeObject:self.name];
        NSLog(@"deleted Item:%@",item);
        [self.dayTableView reloadData];
        
        
    }];
                                 
                                 
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:okAction];
    
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    NSString *selectedName=cell.textLabel.text;
     NSLog(@"Selected Name: %@",selectedName);
     self.name=cell.textLabel.text;
  
     NSString *deleteName=self.name;
   NSLog(@"Deleted name: %@",deleteName);
      [self showAlertWithTitle:@"Delete Item" andMessage:@"Do you Want to Really Delete"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
