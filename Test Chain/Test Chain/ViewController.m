//
//  ViewController.m
//  Test Chain
//
//  Created by CC on 2016/11/6.
//  Copyright © 2016年 CC. All rights reserved.
//

#import "ViewController.h"
#import "CCKeychain.h"

@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic ,strong) UITextField *field;

@end

@implementation ViewController

static NSString *KEY_USERNAME_PASSWORD = @"com.user.dictionaryKey";
static NSString *KEY_PASSWORD = @"com.pasword.keychainKey";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self layoutUI];
}

#pragma mark -- UITextField 代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -- 按钮点击方法
- (void)saveBtn {
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:_field.text forKey:KEY_PASSWORD];
    [CCKeychain save:KEY_USERNAME_PASSWORD data:usernamepasswordKVPairs];
}

- (void)deleteBtn {
    [CCKeychain delete:KEY_USERNAME_PASSWORD];
}

- (void)readBtn {
    NSMutableDictionary *usernamepasswordKVPairs = (NSMutableDictionary *)[CCKeychain load:KEY_USERNAME_PASSWORD];
    NSLog(@"%@",[usernamepasswordKVPairs objectForKey:KEY_PASSWORD]);
}

#pragma mark -- 构建 UI
- (void)layoutUI {
    
    _field = [[UITextField alloc]initWithFrame:CGRectMake(50, 50, 100, 30)];
    _field.delegate = self;
    [self.view addSubview:_field];
    _field.backgroundColor = [UIColor redColor];
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    saveBtn.frame = CGRectMake(50, 150, 50, 50);
    [self.view addSubview:saveBtn];
    [saveBtn setTitle:@"save" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    deleteBtn.frame = CGRectMake(50, 250, 50, 50);
    [self.view addSubview:deleteBtn];
    [deleteBtn setTitle:@"delete" forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(deleteBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *readBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [readBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    readBtn.frame = CGRectMake(50, 350, 50, 50);
    [self.view addSubview:readBtn];
    [readBtn setTitle:@"read" forState:UIControlStateNormal];
    [readBtn addTarget:self action:@selector(readBtn) forControlEvents:UIControlEventTouchUpInside];
}

@end
