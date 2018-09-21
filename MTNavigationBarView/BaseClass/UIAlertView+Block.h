//
//  UIAlertView+Block.h
//  MTLab
//
//  Created by Pham Minh Tien on 10/11/16.
//  Copyright © 2016 Minh Tien. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^UIAlertViewBlock) (UIAlertView *  alertView);
typedef void (^UIAlertViewCompletionBlock) (UIAlertView *  alertView, NSInteger buttonIndex);


@interface UIAlertView (Block)

+ ( instancetype)showWithTitle:( NSString *)title
                       message:( NSString *)message
                         style:(UIAlertViewStyle)style
             cancelButtonTitle:( NSString *)cancelButtonTitle
             otherButtonTitles:( NSArray *)otherButtonTitles
                      tapBlock:( UIAlertViewCompletionBlock)tapBlock;

+ ( instancetype)showWithTitle:( NSString *)title
                       message:( NSString *)message
             cancelButtonTitle:( NSString *)cancelButtonTitle
             otherButtonTitles:( NSArray *)otherButtonTitles
                      tapBlock:( UIAlertViewCompletionBlock)tapBlock;

@property (copy, nonatomic, ) UIAlertViewCompletionBlock tapBlock;
@property (copy, nonatomic, ) UIAlertViewCompletionBlock willDismissBlock;
@property (copy, nonatomic, ) UIAlertViewCompletionBlock didDismissBlock;

@property (copy, nonatomic, ) UIAlertViewBlock willPresentBlock;
@property (copy, nonatomic, ) UIAlertViewBlock didPresentBlock;
@property (copy, nonatomic, ) UIAlertViewBlock cancelBlock;

@property (copy, nonatomic, ) BOOL(^shouldEnableFirstOtherButtonBlock)(UIAlertView * __alertView);

@end
