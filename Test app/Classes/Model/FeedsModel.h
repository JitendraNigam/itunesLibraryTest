//
//  FeedsModel.h
//  HorizontolScroll
//
//  Created by Jitendra Nigam on 05/09/16.
//  Copyright © 2016 Jitendra Nigam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedsModel : NSObject

/*....Feeds Properties....*/
@property(nonatomic,retain)NSString* trackName;
@property(nonatomic,retain)NSString* previewUrl;
@property(nonatomic,retain)NSString* artworkUrl;
@property(nonatomic,retain)NSString* primaryGenreName;
@property(nonatomic,retain)NSString* trackPrice;

/*....Modelize....*/
+(NSMutableArray*)getFeedsData:(NSArray*)properties;
@end
