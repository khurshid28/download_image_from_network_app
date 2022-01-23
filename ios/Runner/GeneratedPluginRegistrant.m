//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<gallery_saver/GallerySaverPlugin.h>)
#import <gallery_saver/GallerySaverPlugin.h>
#else
@import gallery_saver;
#endif

#if __has_include(<path_provider_ios/FLTPathProviderPlugin.h>)
#import <path_provider_ios/FLTPathProviderPlugin.h>
#else
@import path_provider_ios;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [GallerySaverPlugin registerWithRegistrar:[registry registrarForPlugin:@"GallerySaverPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
}

@end
