//
//  ITunesPlayerInfoObserver.h
//  iTunesDesktop
//
//  Created by Larusso on 27.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITunesPlayerInfo.h"
#import "ITunesTrack.h"

@protocol ITunesPlayerInfoObserver <NSObject>
@optional
- (void) setCurrentiTunesPlayerinfo:(ITunesPlayerInfo *)thePlayerInfo;
- (void) setCurrentiTunesTrack:(ITunesTrack *)theTrack;
@end
