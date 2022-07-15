#import "JwtsonPlugin.h"
#if __has_include(<jwtson/jwtson-Swift.h>)
#import <jwtson/jwtson-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "jwtson-Swift.h"
#endif

@implementation JwtsonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftJwtsonPlugin registerWithRegistrar:registrar];
}
@end
