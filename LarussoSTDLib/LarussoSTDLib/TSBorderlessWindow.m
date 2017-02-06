//
//  TSBorderlessWindow.m
//  LarussoSTDLib
//
//  Created by Larusso on 25.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TSBorderlessWindow.h"


@implementation TSBorderlessWindow

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    // Using NSBorderlessWindowMask results in a window without a title bar.
    self = [super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO];
    if (self != nil) 
    {
        [self setOpaque:NO];
        NSColor *windowColor = [NSColor colorWithCalibratedRed:0.000 green:0.639 blue:0.098 alpha:0];
        [self setBackgroundColor:windowColor];
    }
    return self;

}

-(BOOL) canBecomeKeyWindow
{
    return YES;
}

- (void)dealloc
{
    [super dealloc];
}

@end
