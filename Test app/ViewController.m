//
//  ViewController.m
//  Test app
//
//  Created by Jitendra Nigam on 16/10/16.
//  Copyright © 2016 Jitendra Nigam. All rights reserved.
//

#import "ViewController.h"
#import "itunesLibraryCustomCell.h"
#import "SharedParsing.h"
#import "FeedsModel.h"
#import "AppDelegate.h"
#import "UIViewController+Alert.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

#define kSharedParsing [SharedParsing sharedSharedParsing]
# define kAppdelegate  (AppDelegate*) [[UIApplication sharedApplication] delegate]
#define kWINDOW_SIZE [[UIScreen mainScreen]bounds].size

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *mFeedsTableView;
@property(strong,nonatomic) NSArray *arrayFeeds;

@end

static NSString * const reuseIdentifier = @"itunesLibraryCellID";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_mFeedsTableView setTableFooterView:[UIView new]];
    [self wsCallForFeeds];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WEBSERVICE CALL -

-(void)wsCallForFeeds{
    if([kAppdelegate Is_InternetAvailable]){
        [kAppdelegate showLoadingAnimation];
        [kSharedParsing assignSender:self];
        [kSharedParsing wsCallToGetItunesLibrary :^(BOOL succeeded, NSArray *resultArray) {
            if ([[resultArray valueForKey:@"results"] isKindOfClass:[NSArray class]]) {
                /*....Add Objects Through Model....*/
                self.arrayFeeds=[FeedsModel getFeedsData:[resultArray valueForKey:@"results"]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.mFeedsTableView reloadData];
                    [kAppdelegate hideLoadingAnimation];
                });
            }
            else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.mFeedsTableView reloadData];
                    [kAppdelegate hideLoadingAnimation];
                });
                
            }
        }
                                     failureBlock:^(BOOL succeeded, NSArray *failureArray) {
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             [kAppdelegate hideLoadingAnimation];
                                             [self showAlertViewWithTitle:@"Error" message:@"Something went wrong."];
                                         });
                                     }];
    }
    else{
        [self showAlertViewWithTitle:@"No Internet!" message:@"Please check your Internet Connection."];
    }
}

# pragma mark : TableView Methods -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_arrayFeeds count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    itunesLibraryCustomCell *cell = (itunesLibraryCustomCell*)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = (itunesLibraryCustomCell*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    /*....Get Model from Array....*/
    FeedsModel *property = (FeedsModel*)[self.arrayFeeds objectAtIndex:indexPath.row];
    cell.mSongsName.text=property.trackName;
    cell.mSongsGenre.text=[NSString stringWithFormat:@"Genre: %@",property.primaryGenreName];
    cell.mSongPrice.text=[NSString stringWithFormat:@"Price: %d $",[property.trackPrice intValue]];
    [cell.mSongsImageView setImageWithURL:[NSURL URLWithString:property.artworkUrl] placeholderImage:[UIImage imageNamed:@""] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FeedsModel *property = (FeedsModel*)[self.arrayFeeds objectAtIndex:indexPath.row];
    NSURL *movieURL = [NSURL URLWithString:property.previewUrl];
    AVPlayer *player = [AVPlayer playerWithURL:movieURL];
    AVPlayerViewController * movieController = [[AVPlayerViewController alloc] init];
    [self presentViewController:movieController animated:YES completion:nil];
    movieController.player = player;
    [player play];
}

@end
