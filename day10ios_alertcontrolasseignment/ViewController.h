//
//  ViewController.h
//  day10ios_alertcontrolasseignment
//
//  Created by Student 01 on 15/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property NSMutableArray *days;
@property NSString *name;

@property (weak, nonatomic) IBOutlet UITableView *dayTableView;



@end

