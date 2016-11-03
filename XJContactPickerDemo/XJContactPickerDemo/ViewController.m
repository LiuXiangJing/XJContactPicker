//
//  ViewController.m
//  XJContactPickerDemo
//
//  Created by 刘向晶 on 2016/11/3.
//  Copyright © 2016年 Tintin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
#ifdef DEBUG
#define XJLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else
#define XJLog(...)
#endif
#import "XJContactManager.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
}
- (IBAction)showPicker:(id)sender {
    
    [[XJContactManager shareManager] presentContactsViewOnController:self chooseComplete:^(XJContact *contact) {
        XJLog(@"联系人==%@",contact.description);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
