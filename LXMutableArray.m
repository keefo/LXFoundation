//
//  LXMutableArray.m
//  Miao
//
//  Created by Xu Lian on 2012-11-03.
//  Copyright (c) 2012 Beyondcow. All rights reserved.
//

#import "LXMutableArray.h"

#ifdef NSMutableArray
#undef NSMutableArray
#endif

#if  !__has_feature(objc_arc)
#define __bridge 
#endif

@implementation LXMutableArray

- (id) init {
	return [self initWithCapacity:0];
}

- (id) initWithCapacity:(NSUInteger)numItems {
	if ((self = [super init]) == nil) return nil;
    array = CFArrayCreateMutable(kCFAllocatorDefault, numItems, &kCFTypeArrayCallBacks);
    if (array) {
        return self;
    }
	return nil;
}

- (void)dealloc {
	if(array)CFRelease(array);
    array = NULL;
#if  !__has_feature(objc_arc)
	[super dealloc];
#endif
}

#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState*)state
                                  objects:(id __unsafe_unretained [])stackbuf
                                    count:(NSUInteger)len
{
	return [super countByEnumeratingWithState:state objects:stackbuf count:len];
}


#pragma mark Querying Contents

- (NSUInteger)count
{
	return CFArrayGetCount(array);
}

- (NSEnumerator*)objectEnumerator
{
	return [(__bridge id)array objectEnumerator];
}

- (id)objectAtIndex:(NSUInteger)index
{
    if (index<[self count]) {
        return (__bridge id)CFArrayGetValueAtIndex(array, index);
    }
    return nil;
}

#pragma mark Modifying Contents

- (void)addObject:(id)anObject;
{
    if (anObject == nil){
        return;
    }
    CFArrayAppendValue(array, (__bridge const void*)anObject);
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
{
    if (anObject == nil){
        return;
    }
    if (index>[self count]) {
        index=[self count];
    }
    CFArrayInsertValueAtIndex(array, index, (__bridge const void*)anObject);
}

- (void)removeLastObject;
{
    NSUInteger n=[self count];
    if (n>0) {
        CFArrayRemoveValueAtIndex(array, n-1);
    }
}
- (void)removeObject:(id)anObject;
{
    if (anObject==nil) {
        return;
    }
    CFIndex idx = CFArrayGetFirstIndexOfValue(array, CFRangeMake(0, [self count]), (__bridge const void*)anObject);
    if (idx>=0) {
        CFArrayRemoveValueAtIndex(array, idx);
    }
}
- (void)removeObjectAtIndex:(NSUInteger)index;
{
    if (index<[self count]) {
        CFArrayRemoveValueAtIndex(array, index);
    }
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
{
    if (anObject==nil) {
        return;
    }
    if (index<[self count]) {
        CFArraySetValueAtIndex(array, index, (__bridge const void*)anObject);
    }
}

- (void)removeAllObjects;
{
    if(array)CFArrayRemoveAllValues(array);
}

@end
