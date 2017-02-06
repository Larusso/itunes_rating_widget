//
//  ITDMainViewController.h
//  iTunesDesktop
//
//  Created by Larusso on 22.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ITunesConnectorController;
@class TSAppleScriptController;
@class CurrentTitleWindowController;

@interface ITDMainViewController : NSObject <NSApplicationDelegate> {
@private
    ITunesConnectorController *iTunesConnector;
    CurrentTitleWindowController *titleWIndowController;
}

@property (nonatomic, retain) ITunesConnectorController * iTunesConnector;
@property (nonatomic, retain) CurrentTitleWindowController * titleWIndowController;

@end
