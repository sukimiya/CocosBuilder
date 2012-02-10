//
//  Inspector.m
//  CocosBuilder
//
//  Created by Viktor Lidholt on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InspectorValue.h"

@implementation InspectorValue

@synthesize displayName,view;

+ (id) inspectorOfType:(NSString*) t withSelection:(CCNode*)s andPropertyName:(NSString*)pn andDisplayName:(NSString*) dn
{
    NSString* inspectorClassName = [NSString stringWithFormat:@"Inspector%@",t];
    
    return [[[NSClassFromString(inspectorClassName) alloc] initWithSelection:s andPropertyName:pn andDisplayName:dn] autorelease];
}

- (id) initWithSelection:(CCNode*)s andPropertyName:(NSString*)pn andDisplayName:(NSString*) dn
{
    self = [super init];
    if (!self) return NULL;
    
    propertyName = [pn retain];
    displayName = [dn retain];
    selection = [s retain];
    
    return self;
}

- (id) propertyForSelection
{
    return [selection valueForKey:propertyName];
}

- (void) setPropertyForSelection:(id)value
{
    [selection setValue:value forKey:propertyName];
}

- (id) propertyForSelectionX
{
    return [selection valueForKey:[propertyName stringByAppendingString:@"X"]];
}

- (void) setPropertyForSelectionX:(id)value
{
    [selection setValue:value forKey:[propertyName stringByAppendingString:@"X"]];
}

- (id) propertyForSelectionY
{
    return [selection valueForKey:[propertyName stringByAppendingString:@"X"]];
}

- (void) setPropertyForSelectionY:(id)value
{
    [selection setValue:value forKey:[propertyName stringByAppendingString:@"X"]];
}

- (void)dealloc
{
    NSLog(@"DEALLOC");
    
    [selection release];
    [propertyName release];
    [displayName release];
    
    [super dealloc];
}

@end
