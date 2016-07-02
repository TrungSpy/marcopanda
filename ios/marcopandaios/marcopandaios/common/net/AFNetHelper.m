//  AFNetHelper.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "AFNetHelper.h"


static NSString * const AFAppBaseURLString = @"https://talk-api.kanae.ne.jp/";
static NSString * const AFECBaseURLString = @"https://api.kanae.ne.jp/";

@implementation AFNetHelper

+ (instancetype)sharedClient {
    static AFNetHelper *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFNetHelper alloc] initWithBaseURL:[NSURL URLWithString:AFAppBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        //        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
    });
    
    return _sharedClient;
}


+(NSURLSessionDataTask *)requestPath:(NSString *)path withMethod:(_AFMethod) method withHeader:(NSDictionary *)headerParams withParms:(NSDictionary *)params withBlock:(void(^)(id result,NSError *error))block
{
    
    AFNetHelper *_sharedClient=[AFNetHelper sharedClient];
    if ((method&AFPOST) == AFPOST){
        return [_sharedClient POST:path parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            if (block) {
                block(responseObject, nil);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            if (block) {
                block(nil, error);
            }
        }];
        
    }
    return nil;
    
}

+(NSURLSessionDataTask *)uploadPath:(NSString *)path withMethod:(_AFMethod) method withHeader:(NSDictionary *)headerParams withParms:(NSDictionary *)params withFormdata:(NSDictionary *)fromParams withBlock:(void(^)(id result,NSError *error))block
{
    AFNetHelper *_sharedClient=[AFNetHelper sharedClient];
    if (method == AF_IMAGE){
        return [_sharedClient POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            for(NSString *key in fromParams)
            {
                [formData appendPartWithFileData:[fromParams objectForKey:key] name:key fileName:@"upload.png" mimeType:@"image/png"];
            }
        } success:^(NSURLSessionDataTask *task, id responseObject) {
            if (block) {
                block(responseObject, nil);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (block) {
                block(nil, error);
            }
        }];
    }
    return nil;
}

@end
