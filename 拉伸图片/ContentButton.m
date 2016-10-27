//
//  ContentButton.m
//  拉伸图片
//
//  Created by 杭州移领 on 16/10/27.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import "ContentButton.h"

@implementation ContentButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}


- (void)setUI {
    
    self.backImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    self.backImageView.image = [UIImage imageNamed:@"0.jpeg"];
    self.backImageView.userInteractionEnabled = NO;
    self.backImageView.layer.cornerRadius = 5;
    self.backImageView.layer.masksToBounds  = YES;
    self.backImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.backImageView.hidden = YES;
    self.backImageView.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.backImageView];
    
}

@end
