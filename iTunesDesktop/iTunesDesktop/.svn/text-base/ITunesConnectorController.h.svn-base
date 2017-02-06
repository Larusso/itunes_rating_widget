//
//  ITunesConnector.h
//  iTunesDesktop
//
//  Created by Larusso on 25.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSAppleScriptController.h"
@class ITunesPlayerInfo;
@class ITunesTrack;

@interface ITunesConnectorController : NSObject {
@private
    TSAppleScriptController *scriptController;
    NSAppleScript *currentTitleScript;
    ITunesPlayerInfo *playerInfo;
    ITunesTrack *currentTrack;
}

@property (nonatomic, retain) TSAppleScriptController *scriptController;
@property (nonatomic, retain) NSAppleScript *currentTitleScript;
@property (nonatomic, retain) ITunesPlayerInfo *playerInfo;
@property (nonatomic, retain) ITunesTrack *currentTrack;

- (void)updateITunesInformation;


@end
