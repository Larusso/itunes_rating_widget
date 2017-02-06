//
//  ITunesConnector.m
//  iTunesDesktop
//
//  Created by Larusso on 25.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ITunesConnectorController.h"
#import "ITunesPlayerInfoObserver.h"
#import "ITunesTrack.h"
#import "ITunesPlayerInfo.h"
#import "ITunesPlayerConst.h"

//private interface
@interface ITunesConnectorController ()
- (void)receivediTunesNotification:(NSNotification *)notification;
- (void)receivedAddiTunesObserverNotification:(NSNotification *)notification;
- (void)parseAppleScriptDictionaryResult:(NSDictionary *)theResult;
@end
@implementation ITunesConnectorController

@synthesize currentTitleScript;
@synthesize scriptController;
@synthesize currentTrack;
@synthesize playerInfo;

- (id)init
{
    self = [super init];
    if (self) 
    {
        //add observer for iTunes playerInfo notifications
        [[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(receivediTunesNotification:) name:@"com.apple.iTunes.playerInfo" object:nil];
        
        //add observer for add oberserver calls
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedAddiTunesObserverNotification:) name:NOTE_ADD_ITUNES_PLAYER_INFO_CHANGED_OBSERVER object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedAddiTunesObserverNotification:) name:NOTE_ADD_ITUNES_TITLE_CHANGED_OBSERVER object:nil];
        
        scriptController = [[TSAppleScriptController alloc] init];
        
        //load initial itunes informations
        [self updateITunesInformation];
    }
    
    return self;
}

- (void)receivediTunesNotification:(NSNotification *)notification
{
    NSLog(@"receivediTunesNotification: %@", notification);
    
    //check for player state change
    [self updateITunesInformation];
}
         
- (void)receivedAddiTunesObserverNotification:(NSNotification *)notification
{
    NSLog(@"receivedAddiTunesObserverNotification: %@", notification);
    
    //send itunes information back to sender
    if( [notification object] != nil && [[notification object] conformsToProtocol:@protocol(ITunesPlayerInfoObserver)] )
    {
        if( [[notification name] compare:NOTE_ADD_ITUNES_TITLE_CHANGED_OBSERVER] == NSOrderedSame && [[notification object] respondsToSelector:@selector(setCurrentiTunesTrack:)] )
        {
            [[notification object] setCurrentiTunesTrack: currentTrack];
        }
        
        else if( [[notification name] compare:NOTE_ADD_ITUNES_PLAYER_INFO_CHANGED_OBSERVER] && [[notification object] respondsToSelector:@selector(setCurrentiTunesPlayerinfo:)] )
        {
            [[notification object] setCurrentiTunesPlayerinfo: playerInfo];
        }
        
        else
        {
            
        }
    }
    else
    {
        NSLog(@"notification object: %@ is nil or does not conform to protocol ITunesPlayerInfoObserver", [notification object]);
    }
}

- (void)updateITunesInformation
{
    if( !currentTitleScript )
    {
        NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"iTunesGetPlayerInfo" ofType:@"scpt" inDirectory:@"Scripts"];
        currentTitleScript = [[NSAppleScript alloc] initWithContentsOfURL:[NSURL fileURLWithPath:scriptPath] error:nil];
    }
    
    
    id scriptReturn = [scriptController executeScript:currentTitleScript andReturnError:nil];

    if( [ scriptReturn isKindOfClass: [ NSDictionary class] ] )
    {
        [self parseAppleScriptDictionaryResult:scriptReturn];
    }
}

- (void)parseAppleScriptDictionaryResult:(NSDictionary *)theResult
{
    //check if title is set;
    BOOL currentTrackChanged = NO;
    NSDictionary *currentTrackResult = [theResult objectForKey:@"currentTrack"];
    if( currentTrackResult )
    {
        ITunesTrack *newTrack = [[ITunesTrack alloc] init];
        
        [newTrack setTitle: [currentTrackResult objectForKey:@"track_Name"]];    
        [newTrack setAlbum: [currentTrackResult objectForKey:@"track_Album"]];
        [newTrack setArtist: [currentTrackResult objectForKey:@"track_Artist"]];
        [newTrack setRating: [[currentTrackResult objectForKey:@"track_Rating"] integerValue]];
        [newTrack setRatingComputed: [[currentTrackResult objectForKey:@"track_Rating_Computed"] boolValue]];
        
        NSImage *coverArtworkRaw = [[NSImage alloc] initWithData:[currentTrackResult valueForKey:@"track_Cover"]];
        [newTrack setCoverArt: coverArtworkRaw];
        [coverArtworkRaw release];
        
        if (!self.currentTrack ) 
        {
            self.currentTrack = [[ITunesTrack alloc] init];
        }
        
        if( [self.currentTrack isEqualToTrack:newTrack] == NO )
        {
            currentTrackChanged = YES;
            self.currentTrack = newTrack;
        }
        
    }
    
    if( [ self playerInfo ] == nil )
    {
        self.playerInfo = [[ITunesPlayerInfo alloc] initWithPlayerState:[theResult objectForKey:@"playerState"] AndCurrentTrack:currentTrack];
    }
    
    [self.playerInfo setPlayerState:[theResult objectForKey:@"playerState"]];
    [self.playerInfo setCurrentTrack: currentTrack];
    [self.playerInfo setIsMuted: [[theResult objectForKey:@"isMuted"] boolValue]];
    [self.playerInfo setSoundVolume: [[theResult objectForKey:@"soundVolume"] integerValue]];
    [self.playerInfo setPlayerPosition: [theResult objectForKey:@"playerPosition"]];
    
    if( currentTrackChanged )
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTE_CURRENT_TITLE_CHANGED object:self userInfo:[NSDictionary dictionaryWithObject:currentTrack forKey:@"currentTrack"]];
    }
    
}


- (void)dealloc
{
    [[NSDistributedNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [scriptController release];
    
    [currentTitleScript release];
    [playerInfo release];
    [currentTrack release];
        
    [super dealloc];
}

@end
