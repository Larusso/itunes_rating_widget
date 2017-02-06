//
//  CurrentTitleViewController.h
//  iTunesDesktop
//
//  Created by Larusso on 25.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITunesPlayerInfoObserver.h"

@interface CurrentTitleViewController : NSObject<ITunesPlayerInfoObserver> {
@private
    
    NSTextField *artistField;
    NSTextField *trackTitleField;
    NSImageView *trackCoverImage;
}
@property (assign) IBOutlet NSImageView *trackCoverImage;
@property (assign) IBOutlet NSTextField *trackTitleField;
@property (assign) IBOutlet NSTextField *artistField;

-(void)iTunesTitleChanged:(NSNotification *)notification;
- (void) setCurrentiTunesTrack:(ITunesTrack *)theTrack;
@end
