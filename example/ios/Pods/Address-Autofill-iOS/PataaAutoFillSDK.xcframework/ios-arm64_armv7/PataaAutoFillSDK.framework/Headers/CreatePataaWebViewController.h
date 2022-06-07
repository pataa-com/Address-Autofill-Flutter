//
//  CreatePataaWebViewController.h
//  PataaAutofillSDK
//
//  Created by Tushar Thorat on 04/04/22.
//

#import <UIKit/UIKit.h>
#import <Webkit/Webkit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CreatePataaWebDelegate <NSObject>
- (void)back;
- (void)successWithPataaCode:(NSString*)pc;
@end

@interface CreatePataaWebViewController : UIViewController<WKNavigationDelegate, WKScriptMessageHandler>

@property (weak, nonatomic, nullable) id<CreatePataaWebDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
