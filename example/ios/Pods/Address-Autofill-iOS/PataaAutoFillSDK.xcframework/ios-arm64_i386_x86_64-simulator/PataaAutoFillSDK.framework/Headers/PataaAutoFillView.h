//
//  PataaAutoFillView.h
//  PataaAutoFillSDK
//
//  Created by JaiPrakash on 01/04/22.
//

#import <UIKit/UIKit.h>
#import "UITextField+UITextFieldExtension.h"
#import "UIColorExtension.h"
#import "CreatePataaWebViewController.h"
#import "PAPataaDetails.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PataaAutoFillDelegate <NSObject>
@required
- (void)didReceivedPataaDetails:(nullable PAPataaDetail *)pataaDetails withError:(nullable NSError *)error;
@optional
- (void)textFieldDidBeginEditing;
- (void)textFieldDiEndEditing;
- (BOOL)textFieldShouldReturn;
- (void)startFetchingPataaDetails;

//@objc optional func floatingTextFieldDidBeginEditing(_ textField: UITextField) // became first responder
//
//@objc optional func floatingTextFieldDidEndEditing(_ textField: UITextField)
@end

@class PAWhatIsPataaPopupViewController;
@interface PataaAutoFillView : UIView
@property (weak, nonatomic, nullable) id<PataaAutoFillDelegate> delegate;
-(NSString *)getPataaAutoFillText;
-(void)initializeSDKWithKey:(NSString *)key withAppPrefix:(NSString *)appPrefix;
-(NSString *)getAPIKey;
-(void)textFieldBecomeFirstResponder;
-(void)textFieldResignFirstResponder;
@end

NS_ASSUME_NONNULL_END
