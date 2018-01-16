//
//  ExceptionRelay.m
//  ExceptionRelay
//
//  Created by Kota Nakano on 2017/05/12.
//  Copyright © 2017 Kota Nakano. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ExceptionRelay: NSObject
@end

@implementation ExceptionRelay
+(BOOL)relayExceptionAndReturnError:(NSError**)error try:(void(^)())block {
	@try {
		block();
		return YES;
	} @catch (const NSException * const exception) {
		NSMutableDictionary * userInfo = [NSMutableDictionary dictionaryWithDictionary:[exception userInfo]];
		[userInfo setObject:[exception reason] forKey:@"reason"];
		if ( error )
			*error = [NSError errorWithDomain:[exception name] code:0 userInfo:userInfo];
		return NO;
	} @catch (id const object) {
		if ( error )
			*error = [NSError errorWithDomain:@"genericObject" code:0 userInfo: [NSDictionary dictionaryWithObject:object forKey:@"object"]];
		return NO;
	} @catch (...) {
		if ( error )
			*error = [NSError errorWithDomain:@"unexpected" code:-1 userInfo:nil];
		return NO;
	}
}
@end

