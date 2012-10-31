#LXFoundation
##usage

drag any class pair into your xcode project, and complie.

LXMutableDictionary usage is same as NSMutableDictionary except it will not throw an exception if the value or key is nil object.

	LXMutableDictionary *dic=[LXMutableDictionary dictionary];
	[dic setObject:@"obj1" forKey:@"key1"];
	[dic setObject:@"obj2" forKey:@"key1"];
	[dic setObject:[LXMutableDictionary dictionaryWithObjectsAndKeys:
					@"obj11", @"key11",
					@"obj12", @"key12",
					nil]
			forKey:@"key1"];
			
	LXMutableDictionary *dic=[LXMutableDictionary dictionaryWithCapacity:10];
	[dic setObject:@"obj1" forKey:@"key1"];
	[dic setObject:@"obj2" forKey:@"key1"];

	LXMutableDictionary *dic=[[LXMutableDictionary alloc] init];
	[dic setObject:@"obj1" forKey:@"key1"];
	[dic setObject:@"obj2" forKey:@"key1"];
  	
  	[dic writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Desktop/testDic.plist"] atomically:NO];
    
	dic=[LXMutableDictionary dictionaryWithContentsOfFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Desktop/testDic.plist"]];
      
      