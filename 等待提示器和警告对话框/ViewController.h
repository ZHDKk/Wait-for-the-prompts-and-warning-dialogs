//
//  ViewController.h
//  等待提示器和警告对话框
//
//  Created by zh dk on 2017/8/22.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>
{
    //定义警告对话框视图对象
    UIAlertView *_alertView;
    
    //等待提示对象
    //当下载，或加载比较大的文件，可以显示此控件，处于提示等待状态
    UIActivityIndicatorView *_activityIndicator;
}

@property(retain,nonatomic) UIAlertView *_alertView;
@property(retain,nonatomic) UIActivityIndicatorView *_acitivtyIndicator;

@end

