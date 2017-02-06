//
//  ITunesTitle.h
//  iTunesDesktop
//
//  Created by Larusso on 25.09.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ITunesTrack : NSObject {
@private
    NSString * title;
    NSString * artist;
    NSString * album;
    NSInteger rating;
    BOOL ratingComputed;
    NSImage * coverArt;
}
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * artist;
@property (nonatomic, retain) NSString * album;
@property (nonatomic ) NSInteger rating;
@property (nonatomic ) BOOL ratingComputed;
@property (nonatomic, retain) NSImage * coverArt;

-(id) initWithTitle:(NSString *)theTitle AndArtist:(NSString *)theArtist AndAlbum:(NSString *)theAlbum AndCover:(NSImage *)theCover AndRating:(NSInteger)aRating isComputed:(BOOL)isRatingComputed;
- (BOOL)isEqualToTrack:(ITunesTrack *)theTrack;
@end
