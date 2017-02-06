//
//  ITunesTitle.m
//  iTunesDesktop
//
//  Created by Larusso on 25.09.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ITunesTrack.h"


@implementation ITunesTrack
@synthesize title;
@synthesize artist;
@synthesize album;
@synthesize rating;
@synthesize ratingComputed;
@synthesize coverArt;

- (id)init
{
    self = [super init];
    if (self) 
    {
        title = @"unknown";
        artist = @"unknown";
        album = @"unknown";
    }
    
    return self;
}

-(id) initWithTitle:(NSString *)theTitle AndArtist:(NSString *)theArtist AndAlbum:(NSString *)theAlbum AndCover:(NSImage *)theCover AndRating:(NSInteger)aRating isComputed:(BOOL)isRatingComputed
{
    self = [super init];
    if( self )
    {
        title = theTitle;
        artist = theArtist; 
        album = theAlbum;
        coverArt = theCover;

        rating = aRating;
        ratingComputed = isRatingComputed;
    }
    return self;
}

- (BOOL)isEqualToTrack:(ITunesTrack *)theTrack
{
    if( [[self title] isEqualToString:[theTrack title]] != YES )
    {
        return NO;
    }
    
    if( [[self artist] isEqualToString:[theTrack artist]] != YES )
    {
        return NO;
    }
    
    if( [[self album] isEqualToString:[theTrack album]] != YES )
    {
        return NO;
    }
    
    if( [self rating] != [theTrack rating] )
    {
        return NO;
    }
    
    if( [self ratingComputed] != [theTrack ratingComputed] )
    {
        return NO;
    }
    
    return YES;
}

- (void)dealloc
{
    [title release];
    [artist release];
    [album release];
    [coverArt release];
    
    [super dealloc];
}

@end
