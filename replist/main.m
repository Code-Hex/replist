//
//  main.m
//  replist
//
//  Created by CodeHex on 2015/08/13.
//  Copyright (c) 2015年 CodeHex. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argc < 2) {
            printf("replist <plist>\n");
            return 0;
        }
        NSString *file = [NSString stringWithUTF8String:argv[1]];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithContentsOfFile:file];
        NSArray *keys = [dic allKeys];
        NSMutableDictionary *new_plist = [[NSMutableDictionary alloc] init];
        for (NSString *key in keys) {
            new_plist[dic[key]] = key;
        }
        [new_plist writeToFile:file atomically:YES];
        printf("Complete\n");
    }
    return 0;
}
