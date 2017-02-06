//
//  ITunesPlayerInfo.h
//  iTunesDesktop
//
//  Created by Larusso on 27.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ITunesTrack;

@interface ITunesPlayerInfo : NSObject {
@private
    NSString *playerState;
    ITunesTrack *currentTrack;
    BOOL isMuted;
    NSInteger soundVolume;
    NSNumber *playerPosition;
}

@property (nonatomic, retain) NSString *playerState;
@property (nonatomic, retain) ITunesTrack *currentTrack;
@property (nonatomic) BOOL isMuted;
@property (nonatomic) NSInteger soundVolume;
@property (nonatomic, retain) NSNumber *playerPosition;

- (id)initWithPlayerState:(NSString *)thePlayerState;
- (id)initWithPlayerState:(NSString *)thePlayerState AndCurrentTrack:(ITunesTrack *)theCurrentTrack;

@end
