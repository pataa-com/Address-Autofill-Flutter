//
//  PAPataaDetails.h
//  PataaAutoFillSDK
//
//  Created by Tushar Thorat on 05/04/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PAResponse;
@class PAPataa;
@class PAUser;

@interface PAPataaDetail : NSObject
@property (nonatomic, nullable, strong) PAUser *user;
@property (nonatomic, nullable, strong) PAPataa *pataa;
//@property (nonatomic, nullable, copy)   NSArray *pcImg;
//@property (nonatomic, nullable, copy)   NSArray *landmarks;
//-(PAPataaDetail *)initWithDictionary:(NSDictionary *)dict;
@end

@interface PAPataa : NSObject
@property (nonatomic, nullable, copy) NSString *pataaCode;
@property (nonatomic, nullable, copy) NSString *address1;
@property (nonatomic, nullable, copy) NSString *address2;
@property (nonatomic, nullable, copy) NSString *address3;
@property (nonatomic, nullable, copy) NSString *address4;
@property (nonatomic, nullable, copy) NSString *zipcode;
@property (nonatomic, nullable, copy) NSString *cityName;
@property (nonatomic, nullable, copy) NSString *stateCode;
@property (nonatomic, nullable, copy) NSString *stateName;
@property (nonatomic, nullable, copy) NSString *countryCode;
@property (nonatomic, nullable, copy) NSString *countryName;
@property (nonatomic, nullable, copy) NSString *qrCode;
@end

@interface PAUser : NSObject
@property (nonatomic, nullable, copy) NSString *firstName;
@property (nonatomic, nullable, copy) NSString *lastName;
@property (nonatomic, nullable, copy) NSString *countryCode;
@property (nonatomic, nullable, copy) NSString *mobile;
@end



NS_ASSUME_NONNULL_END
