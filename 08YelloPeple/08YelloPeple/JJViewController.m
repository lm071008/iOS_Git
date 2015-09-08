//
//  JJViewController.m
//  08YelloPeple
//
//  Created by JJ on 15-8-15.
//  Copyright (c) 2015年 apex. All rights reserved.
//

#import "JJViewController.h"
#import "JJYelloPepleView.h"

@interface JJViewController ()

@end

@implementation JJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    JJYelloPepleView *jjView = [[JJYelloPepleView alloc] init];
    self.view = jjView;
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//    [self.view addGestureRecognizer:tapGesture];
}

# pragma - mark tap
- (void)tapAction:(id)sender
{
    NSLog(@"sender: %@", sender);
}

@end
