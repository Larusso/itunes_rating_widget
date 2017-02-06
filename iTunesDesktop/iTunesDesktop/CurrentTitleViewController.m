//
//  CurrentTitleViewController.m
//  iTunesDesktop
//
//  Created by Larusso on 25.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CurrentTitleViewController.h"
#import <Foundation/Foundation.h>
#import "ITunesPlayerConst.h"

@implementation CurrentTitleViewController
@synthesize trackCoverImage;
@synthesize trackTitleField;
@synthesize artistField;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)awakeFromNib
{
    //register to itunes updates
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iTunesTitleChanged:) name:NOTE_CURRENT_TITLE_CHANGED object:nil];
    //send notification so the itunes controller knowes a new instance wants input
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTE_ADD_ITUNES_TITLE_CHANGED_OBSERVER object:self];
}

-(void) iTunesTitleChanged:(NSNotification *)notification
{
    ITunesTrack *currentTrack = [[notification userInfo] objectForKey:@"currentTrack"];
    [self setCurrentiTunesTrack:currentTrack];
}

- (void) setCurrentiTunesTrack:(ITunesTrack *)theTrack
{
    if( theTrack != nil )
    {
        [[self trackCoverImage] setImage:[theTrack coverArt]];
        [[self trackTitleField] setStringValue:[theTrack title]];
        [[self artistField] setStringValue:[theTrack artist]];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [trackTitleField release];
    [artistField release];
    [trackCoverImage release];
    [super dealloc];
}

@end
