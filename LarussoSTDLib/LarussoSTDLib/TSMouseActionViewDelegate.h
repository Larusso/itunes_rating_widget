//
//  MouseActionControllerDelegate.h
//  LarussoSTDLib
//
//  Created by Larusso on 07.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol TSMouseActionViewDelegate <NSObject>

- (void)mouseDown:(NSEvent*)theEvent;
- (void)mouseDragged:(NSEvent*)theEvent;
- (void)mouseUp:(NSEvent*)theEvent;
- (void)mouseMoved:(NSEvent*)theEvent;
- (void)mouseEntered:(NSEvent*)theEvent;
- (void)mouseExited:(NSEvent*)theEvent;

@end
