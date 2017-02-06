//
//  ITunesPlayerInfo.m
//  iTunesDesktop
//
//  Created by Larusso on 27.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ITunesPlayerInfo.h"
#import "ITunesTrack.h"

//private interface
@interface ITunesPlayerInfo ()

@end

@implementation ITunesPlayerInfo
@synthesize playerState;
@synthesize currentTrack;
@synthesize isMuted;
@synthesize soundVolume;
@synthesize playerPosition;

- (id)init
{
    self = [super init];
    if (self) 
    {
        self.playerState = @"stopped";
        self.currentTrack = nil;
        self.isMuted = NO;
        self.soundVolume = 100;
        self.playerPosition = 0;
    }
    
    return self;
}

- (id)initWithPlayerState:(NSString *)thePlayerState
{
    self = [self init];
    if (self) 
    {
        self.playerState = thePlayerState;
    }
    return self;
}

- (id)initWithPlayerState:(NSString *)thePlayerState AndCurrentTrack:(ITunesTrack *)theCurrentTrack
{
    self = [self init];
    if (self) 
    {
        self.playerState = thePlayerState;
        self.currentTrack = theCurrentTrack;
    }
    return self;
}


- (void)dealloc
{
    [[self currentTrack] release];
    [[self playerState] release];
    [[self playerPosition] release];
    [super dealloc];
}

@end
