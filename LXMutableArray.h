//
//  LXMutableArray.h
//  Miao
//
//  Created by Xu Lian on 2012-11-03.
//  Copyright (c) 2012 Beyondcow. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef NSMutableArray
#undef NSMutableArray
#endif

@interface LXMutableArray : NSMutableArray
{
    CFMutableArrayRef array;
}

- (id) initWithCapacity:(NSUInteger)numItems;

- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;

- (void)addObject:(id)anObject;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObject:(id)anObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)removeAllObjects;

@end
