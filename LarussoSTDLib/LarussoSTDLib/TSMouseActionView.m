//
//  TSMouseActionView.m
//  LarussoSTDLib
//
//  Created by Larusso on 07.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TSMouseActionView.h"
//private interface
@interface TSMouseActionView ()
- (void)initTrackingRect;
@end

@implementation TSMouseActionView
@synthesize delegate;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTrackingRect];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initTrackingRect];
    }
    
    return self;
}

- (void) initTrackingRect
{
    NSTrackingArea *trackArea = [[NSTrackingArea alloc] initWithRect:[self bounds] options:NSTrackingMouseMoved | NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways | NSTrackingInVisibleRect owner:self userInfo:nil];
    [self addTrackingArea:trackArea];
}

- (void)mouseDown:(NSEvent*)theEvent
{
    NSLog(@"mouseDown");
    [delegate mouseDown:theEvent];
}

- (void)mouseDragged:(NSEvent*)theEvent
{
    NSLog(@"mouseDragged");
    [delegate mouseDragged:theEvent];
}

- (void)mouseUp:(NSEvent*)theEvent
{
    NSLog(@"mouseUp");
    [delegate mouseUp:theEvent];
}

- (void)mouseMoved:(NSEvent*)theEvent
{
    NSLog(@"mouseMoved");
    [delegate mouseMoved:theEvent];
}

- (void)mouseEntered:(NSEvent*)theEvent
{
    NSLog(@"---> mouseEntered");
    [delegate mouseMoved:theEvent];
}

- (void)mouseExited:(NSEvent*)theEvent
{
    NSLog(@"<--- mouseExited");
    [delegate mouseExited:theEvent];
}


- (void)dealloc
{
    [super dealloc];
}
@end
