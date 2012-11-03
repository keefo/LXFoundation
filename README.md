#LXFoundation

LXFoundation is a set of basic container classes mean to replace Cocoa NS prefix containers such as NSMutableArray, NSMutableDictionary. It will handle invalid value silently rather than throw an exception to make your app crash.

##About performance

LXFoundation builds on top of Core Foundation Classes, their performance are almost identical to NS-Containers. 

##Basic usage

Drag LXFoundation into your xcode project, and compile. If you don't want to change your exist project code. Then you can simply do this. Add following lines to your project prefix.pch:

```objective-c
#import "LXFoundation.h"
#define NSMutableArray LXMutableArray
#define NSMutableDictionary LXMutableDictionary
```
You can simply comment these line and fallback to NS-containers.

###LXMutableDictionary

LXMutableDictionary is same as NSMutableDictionary except it will not throw an exception if the value or key is nil object. This will make your code more robust and easy to debug. 

Beware, if some part of your code depends on default NSMutableDictionary exception to work, this should be handled more carefully. 

```objective-c
//Init LXMutableDictionary
LXMutableDictionary *dic=[LXMutableDictionary dictionary];
LXMutableDictionary *dic=[LXMutableDictionary dictionaryWithCapacity:10];
LXMutableDictionary *dic=[[LXMutableDictionary alloc] init];
LXMutableDictionary *dic=[[LXMutableDictionary alloc] initWithCapacity:10];

//Add Object
[dic setObject:@"obj1" forKey:@"key1"];
[dic setObject:@"obj2" forKey:@"key1"];
[dic setObject:[LXMutableDictionary dictionaryWithObjectsAndKeys:
				@"obj11", @"key11",
				@"obj12", @"key12",
				nil]
		forKey:@"key1"];
		
//Save and read LXMutableDictionary
NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Desktop/testDic.plist"];
[dic writeToFile:path atomically:NO];
dic=[LXMutableDictionary dictionaryWithContentsOfFile:path];

NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Desktop/testDic.dat"];
[NSKeyedArchiver archiveRootObject:dic toFile:path];
dic=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
```

###LXMutableArray

LXMutableArray is same as NSMutableArray except it will not throw an exception if the value is nil object. This will make your code more robust and easy to debug. 

Beware, if some part of your code depends on default NSMutableArray exception to work, this should be handled more carefully. 

```objective-c
//Init LXMutableArray
LXMutableArray *array=[LXMutableArray array];
LXMutableArray *array=[LXMutableArray arrayWithCapacity:10];
LXMutableArray *array=[[LXMutableArray alloc] init];
LXMutableArray *array=[[LXMutableArray alloc] initWithCapacity:10];

//Add Object
[array addObject:@"obj1"];
[array addObject:[NSNumber numberWithInteger:123]];
[array addObject:[LXMutableDictionary dictionaryWithObjectsAndKeys:
				  @"obj11", @"key11",
				  @"obj12", @"key12",
				  nil]];
				  
		
//Save and read LXMutableArray
NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Desktop/array.plist"];
[array writeToFile:path atomically:NO];
array = [LXMutableArray arrayWithContentsOfFile:path];

NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Desktop/array.dat"];
[NSKeyedArchiver archiveRootObject:array toFile:path];
array=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
```
