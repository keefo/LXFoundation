//
//  LXMutableDictionary.h
//  LXFoundation
//
//  Created by Xu Lian on 2012-10-29.
//  Copyright (c) 2012 Beyondcow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXMutableDictionary : NSMutableDictionary{
	CFMutableDictionaryRef dictionary;
}

- (id) initWithCapacity:(NSUInteger)numItems;

- (NSUInteger)count;
- (NSEnumerator*)keyEnumerator;
- (void)setObject:(id)anObject forKey:(id)aKey;
- (id)objectForKey:(id)aKey;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)aKey;

@end
