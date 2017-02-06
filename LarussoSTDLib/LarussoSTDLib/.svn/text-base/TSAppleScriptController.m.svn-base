//
//  TSAppleScriptController.m
//  LarussoSTDLib
//
//  Created by Larusso on 22.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TSAppleScriptController.h"

//private interface
@interface TSAppleScriptController ()
- (NSDictionary *)dictionaryFromAppleEventDescriptor:(NSAppleEventDescriptor *)descriptor;
- (NSArray *)arrayFromAppleEventDescriptor:(NSAppleEventDescriptor *)descriptor;
- (id)objectFromAppleEventDescriptor:(NSAppleEventDescriptor *)descriptor;
@end

@implementation TSAppleScriptController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

//TODO check for garbage collection
-(id) executeScript:(NSAppleScript *)script andReturnError:(NSDictionary **)errorInfo
{
    NSAppleEventDescriptor *descriptor = [script executeAndReturnError:nil];
    NSLog(@"Raw Apple Event Result: %@", descriptor);
    return [self objectFromAppleEventDescriptor:descriptor];
}

-(id) executeAppleScriptEvent:(NSAppleScript *)script withEventName:(NSString*) andParams:(NSArray*) andReturnError:(NSDictionary **)errorInfo
{
    return nil;
}

- (NSDictionary *)dictionaryFromAppleEventDescriptor:(NSAppleEventDescriptor *)descriptor 
{ 
    if (![descriptor numberOfItems])
    {
        return nil;
    }
    
    descriptor = [descriptor descriptorAtIndex:1]; 
    NSInteger count = [descriptor numberOfItems]; 
    unsigned int i = 1; 
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:count]; 
    
    for (i = 1; i <= count; i += 2 ) { 
        NSString *key = [[descriptor descriptorAtIndex:i] stringValue];
        id value = [self objectFromAppleEventDescriptor:[descriptor descriptorAtIndex:(i + 1)]]; 
        if (key && value)
        {
            NSLog(@"kye: %@", key);
            NSLog(@"value: %@", value);
            [dict setObject:value forKey:key];
        }; 
    } 
    
    return dict; 
}

- (NSArray *)arrayFromAppleEventDescriptor:(NSAppleEventDescriptor *)descriptor 
{ 
    NSInteger count = [descriptor numberOfItems]; 
    unsigned int i = 1; 
    NSMutableArray *myList = [NSMutableArray arrayWithCapacity:count]; 
    
    
    for (i = 1; i <= count; i++ ) { 
        id value = [self objectFromAppleEventDescriptor:[descriptor descriptorAtIndex:i]]; 
        if (value) [myList addObject:value]; 
    } 
    
    return myList; 
} 

- (id)objectFromAppleEventDescriptor:(NSAppleEventDescriptor *)descriptor 
{
    switch ([descriptor descriptorType]) {
        case typeChar:
        case typeUnicodeText:
            return [descriptor stringValue];
        case typeAEList:
            return [self arrayFromAppleEventDescriptor:descriptor];
        case typeAERecord:
            return [self dictionaryFromAppleEventDescriptor:descriptor];
            
        case typeBoolean:
            return [NSNumber numberWithBool:(BOOL)[descriptor booleanValue]];
        case typeTrue:
            return [NSNumber numberWithBool:YES];
        case typeFalse:
            return [NSNumber numberWithBool:NO];
        case typeType:
            return [NSNumber numberWithUnsignedLong:(unsigned long)[descriptor typeCodeValue]];
        case typeEnumerated:
            return [NSNumber numberWithUnsignedLong:(unsigned long)[descriptor enumCodeValue]];
        case typeNull:
            return [NSNull null];
            
        case typeSInt16:
            return [NSNumber numberWithInt:(short)[descriptor int32Value]];
        case typeSInt32:
            return [NSNumber numberWithInt:(int)[descriptor int32Value]];
        case typeUInt32:
            return [NSNumber numberWithLong:(unsigned int)[descriptor int32Value]];
        case typeSInt64:
            return [NSNumber numberWithLong:(long)[descriptor int32Value]];
            //      case typeIEEE32BitFloatingPoint:
            //          return [NSNumber numberWithBytes:[[descriptor data] bytes] objCType:@encode(float)];
            //      case typeIEEE64BitFloatingPoint:
            //          return [NSNumber numberWithBytes:[[descriptor data] bytes] objCType:@encode(double)];
            //      case type128BitFloatingPoint:
            //      case typeDecimalStruct:
    }
    
    return [descriptor data];
}

- (void)dealloc
{
    [super dealloc];
}

@end
