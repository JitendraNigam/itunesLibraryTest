//
//  UIViewController+Alert.h
//  HorizontolScroll
//
//  Created by Jitendra Nigam on 05/09/16.
//  Copyright © 2016 Jitendra Nigam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alert)
- (void)showAlertViewWithError:(NSError *)error;
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message;
@end
