//
//  ITDMainViewController.m
//  iTunesDesktop
//
//  Created by Larusso on 22.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ITDMainViewController.h"
#import "TSAppleScriptController.h"
#import "CurrentTitleWindowController.h"
#import "TSBorderlessWindow.h"
#import "ITunesConnectorController.h"

@implementation ITDMainViewController
@synthesize iTunesConnector;
@synthesize titleWIndowController;


- (id)init
{
    self = [super init];
    if (self) {
        iTunesConnector = [[ITunesConnectorController alloc] init];
    }
    
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSLog(@"applicationDidFinishLaunching");
       
}

- (void)applicationDidChangeScreenParameters:(NSNotification*)aNotification
{
    NSPoint p;
    p.x = 0;
    p.y = 0;
    [[titleWIndowController window] setFrameOrigin:p];
}

-(void) awakeFromNib
{
    //[TSBorderlessWindow foo];
    NSLog(@"awakeFromNib");
    titleWIndowController = [[CurrentTitleWindowController alloc]initWithWindowNibName:@"CurrentTitleWindowSmall"];
    [titleWIndowController showWindow:self];
}

- (void)dealloc
{
    [super dealloc];
    [titleWIndowController release];
    [iTunesConnector release];
}

@end
