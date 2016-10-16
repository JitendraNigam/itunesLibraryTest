//
//  AppDelegate.h
//  Test app
//
//  Created by Jitendra Nigam on 16/10/16.
//  Copyright © 2016 Jitendra Nigam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//Check Network
- (BOOL)Is_InternetAvailable;

//Loading Indicator
-(void)showLoadingAnimation;
-(void)hideLoadingAnimation;


@end

