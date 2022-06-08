#import "PataaAutofillSdkPlugin.h"
#if __has_include(<pataa_autofill_view/pataa_autofill_view-Swift.h>)
#import <pataa_autofill_view/pataa_autofill_view-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "pataa_autofill_view-Swift.h"
#endif

@implementation PataaAutofillSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPataaAutofillSdkPlugin registerWithRegistrar:registrar];
}
@end
