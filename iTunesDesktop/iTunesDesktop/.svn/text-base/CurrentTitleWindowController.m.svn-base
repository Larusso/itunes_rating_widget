//
//  CurrentTitleWindowController.m
//  iTunesDesktop
//
//  Created by Larusso on 24.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CurrentTitleWindowController.h"


@implementation CurrentTitleWindowController


- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)awakeFromNib
{
    NSLog(@"awake from Nib");
    [[self window] setLevel:CGWindowLevelForKey(kCGDesktopWindowLevelKey) + 1];
}

- (void)windowDidLoad
{
    NSLog(@"windowDidLoad");
    [super windowDidLoad];
}

- (void) mouseUp:(NSEvent *)theEvent
{
    NSLog(@"MouseUp here : %@", self);
}

@end
