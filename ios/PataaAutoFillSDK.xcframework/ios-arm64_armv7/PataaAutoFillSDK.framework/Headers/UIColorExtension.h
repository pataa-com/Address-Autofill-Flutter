//
//  UIColor+UIColor.h
//  PataaAutofillSDK
//
//  Created by Tushar Thorat on 04/04/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ColorExtension)
+ (UIColor *)colorFromHexString:(NSString *)hexString;
@end

NS_ASSUME_NONNULL_END
