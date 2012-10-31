#LXFoundation
##usage

drag any class pair into your xcode project, and complie.

LXMutableDictionary usage is same as NSMutableDictionary except it will not throw an exception if the value or key is nil object. This will make your code more robust and easy to debug. 

Beware, if some part of your code depends on default NSMutableDictionary exception to work, this should be handled more carefully. 

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
  	
  	NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Desktop/testDic.plist"];
  	[dic writeToFile:path atomically:NO];
    
	dic=[LXMutableDictionary dictionaryWithContentsOfFile:path];
      
      