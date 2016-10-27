//
//  ViewController.m
//  拉伸图片
//
//  Created by 杭州移领 on 16/10/27.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import "ViewController.h"
#import "ContentButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    NSArray *contentArray = @[@"0全中文版",
                              @"1大全中文版 我想很多程序员应该记得 GitHub 上有一个Awesome - XXX 系列的资源整理。awesome-ios 就是 vsouza 发起维护的 iOS 资源列表，内容包括……论坛和讨论列表教程和 Keynotes原型 Twitter Facebook 群组 播客（Podcasts） 书籍 其他优秀的列表",
                              @"2大全中文版 我想很多程序员应该记得 GitHub"];
   UIImage *normal = [UIImage imageNamed:@"chatto_bg_normal"];
    normal = [normal resizableImageWithCapInsets:UIEdgeInsetsMake(40, 30, 20, 60) resizingMode:UIImageResizingModeStretch];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 200, 300)];
//    imageView.backgroundColor = [UIColor redColor];
//    imageView.image = normal;
//    [self.view addSubview:imageView];
//    UIImageView *maskImageView = [[UIImageView alloc] initWithImage:normal];
//    maskImageView.frame = imageView.bounds;
//    imageView.layer.mask = maskImageView.layer;
    
    CGFloat Y = 0;
    for (NSInteger i = 0; i < contentArray.count; i++) {
        CGRect contentframe = [contentArray[i] boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]} context:nil];
        contentframe.size.height += 20;
        contentframe.size.width  += 30;
        ContentButton *button = [[ContentButton alloc] initWithFrame: CGRectMake(20, 80+ Y, contentframe.size.width, contentframe.size.height)];

        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        button.titleLabel.numberOfLines = 0;
        if (i == 1) {
            [button setTitle:contentArray[i] forState:UIControlStateNormal];
            button.backImageView.hidden = YES;
        } else{
            button.backImageView.hidden = NO;
        }
        [button setBackgroundImage:normal forState:UIControlStateNormal];
        button.backgroundColor = [UIColor yellowColor];
        button.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 20);
        [self makeMaskView:button.backImageView withImage:normal];

        [self.view addSubview:button];
        [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        Y += contentframe.size.height + 10;
        
    }
}


- (void)click {
    NSLog(@"[=[;l;ll");
}



- (void)makeMaskView:(UIView *)view withImage:(UIImage *)image
{
    //将图片的边缘和气泡图片的边缘重合
    UIImageView *imageViewMask = [[UIImageView alloc] initWithImage:image];
    imageViewMask.frame = view.bounds;
    view.layer.mask = imageViewMask.layer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
