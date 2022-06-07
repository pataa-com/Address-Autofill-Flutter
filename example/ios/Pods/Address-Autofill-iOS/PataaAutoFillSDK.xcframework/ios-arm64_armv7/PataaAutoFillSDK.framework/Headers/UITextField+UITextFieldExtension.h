//
//  UITextField+UITextFieldExtension.h
//  PataaAutofillSDK
//
//  Created by Tushar Thorat on 02/04/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (UITextFieldExtension)
- (BOOL)managePataaNameValidation:(NSRange)range withReplacementString:(NSString *)string;
@end

NS_ASSUME_NONNULL_END
