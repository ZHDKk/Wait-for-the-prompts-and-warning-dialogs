//
//  ViewController.m
//  等待提示器和警告对话框
//
//  Created by zh dk on 2017/8/22.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize _acitivtyIndicator=_activityIndicator;
@synthesize  _alertView= _alertView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for(int i=0;i<2;i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(100, 100+100*i, 100, 40);
        if (i==0) {
            [btn setTitle:@"警告提示框" forState:UIControlStateNormal];
        }
        else if (i==1){
            [btn setTitle:@"等待提示框" forState:UIControlStateNormal];
        }
        btn.tag = 101+i;
        
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
    }
}

-(void) pressBtn:(UIButton*) btn{
    if (btn.tag == 101) {
        _alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"你的手机电量过低，即将关机，请保存好数据" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"ok",@"11",nil];
        [_alertView show];
    }
    else if(btn.tag == 102){
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 300, 80, 80)];
        _activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;  //设定提示风格：灰、白、大白
        [self.view addSubview:_activityIndicator];
        
        //启动动画并显示
        [_activityIndicator startAnimating];
        
        
    }
}
//点击对话框的按钮时，调用此函数
//参数一：对话框对象本身。  参数二：按钮索引
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"index = %ld\n",buttonIndex);
}

-(void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"对话框即将消失");
}
-(void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"对话框已经消失");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
