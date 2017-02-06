//
//  TSAppleScriptController.h
//  LarussoSTDLib
//
//  Created by Larusso on 22.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TSAppleScriptController : NSObject 
{
@private
    
}

- (id) executeScript:(NSAppleScript *)script andReturnError:(NSDictionary **)errorInfo;
- (id) executeAppleScriptEvent:(NSAppleScript *)script withEventName:(NSString*) andParams:(NSArray*) andReturnError:(NSDictionary **)errorInfo;
@end
