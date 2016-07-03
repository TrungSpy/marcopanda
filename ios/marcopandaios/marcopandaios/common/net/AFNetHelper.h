//  AFNetHelper.h
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

typedef enum _AFMethod {
    AFGET = 0x0001,
    AFPOST = 0x0010,
    AF_IMAGE=0x00100,
} _AFMethod;

@interface AFNetHelper : AFHTTPSessionManager
+ (instancetype)sharedClient;

+(NSURLSessionDataTask *)requestPath:(NSString *)path withMethod:(_AFMethod) method withParms:(NSDictionary *)params withBlock:(void(^)(id result,NSError *error))block;

+(NSURLSessionDataTask *)uploadPath:(NSString *)path withMethod:(_AFMethod) method withParms:(NSDictionary *)params withFormdata:(NSDictionary *)fromParams withBlock:(void(^)(id result,NSError *error))block;

@end
