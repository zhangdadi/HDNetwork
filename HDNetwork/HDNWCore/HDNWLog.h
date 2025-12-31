//
//  HDNWLog.h
//  HDNetwork
//
//  Created by zhangdadi on 2021/9/6.
//

#ifndef HDNWLog_h
#define HDNWLog_h

#if TARGET_IPHONE_SIMULATOR  //模拟器
#define HDNWLog(FORMAT, ...) fprintf(stderr,"\n%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define NSLog(FORMAT, ...) fprintf(stderr,"\n%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#elif TARGET_OS_IPHONE //手机
#ifdef DEBUG  //DEBUG编译
#define HDNWLog(FORMAT, ...) fprintf(stderr,"\n%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define NSLog(FORMAT, ...) fprintf(stderr,"\n%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define HDNWLog(FORMAT, ...)
#define HDNWLog(FORMAT, ...)

#endif
#else //非手机非模拟器
#define HDNWLog(FORMAT, ...) fprintf(stderr,"\n%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define NSLog(FORMAT, ...) fprintf(stderr,"\n%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#endif


#endif /* HDNWLog_h */
