//
//  itunesLibraryCustomCell.h
//  Test app
//
//  Created by Jitendra Nigam on 16/10/16.
//  Copyright © 2016 Jitendra Nigam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface itunesLibraryCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mSongsImageView;
@property (weak, nonatomic) IBOutlet UILabel *mSongsName;
@property (weak, nonatomic) IBOutlet UILabel *mSongsGenre;
@property (weak, nonatomic) IBOutlet UILabel *mSongPrice;

@end
