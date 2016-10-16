//
//  FeedsModel.m
//  HorizontolScroll
//
//  Created by Jitendra Nigam on 05/09/16.
//  Copyright © 2016 Jitendra Nigam. All rights reserved.
//

#import "FeedsModel.h"

@implementation FeedsModel

#define kTrackName @"trackName"
#define kPropertyImagepath @"artworkUrl60"
#define kPrimaryGenre @"primaryGenreName"
#define kPreviewUrl @"previewUrl"
#define kTrackPrice @"trackPrice"

#pragma mark - Get Feeds Data in Model

+(NSMutableArray*)getFeedsData:(NSArray*)properties
{
    NSMutableArray* tempArray=[NSMutableArray new];
    
    [properties enumerateObjectsUsingBlock:^(id  _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        
        FeedsModel* mFeed=[[FeedsModel alloc]init];
        
        mFeed.trackName=[item valueForKey:kTrackName];
        mFeed.artworkUrl=[item valueForKey:kPropertyImagepath];
        mFeed.primaryGenreName=[item valueForKey:kPrimaryGenre];
        mFeed.previewUrl=[item valueForKey:kPreviewUrl];
        mFeed.trackPrice=[item valueForKey:kTrackPrice];
        
        [tempArray addObject:mFeed];

    }];
    
    return tempArray;
}

@end
