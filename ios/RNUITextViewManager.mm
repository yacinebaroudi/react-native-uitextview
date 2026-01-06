#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>

// ============================================================================
// REVERTABLE: RNUITextViewEventBridge - Bridge NSNotificationCenter to React Native
// ============================================================================
#import <React/RCTEventEmitter.h>

@interface RNUITextViewEventBridge : RCTEventEmitter
@end

@implementation RNUITextViewEventBridge
{
  bool _hasListeners;
}

RCT_EXPORT_MODULE()

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

- (instancetype)init
{
  if (self = [super init]) {
    _hasListeners = NO;

    // Listen for capture insight notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleCaptureInsightNotification:)
                                                 name:@"RNUITextViewCaptureInsight"
                                               object:nil];

    // Note: Verse press notifications are registered in startObserving
    // to ensure they're only active when JavaScript listeners are ready
  }
  return self;
}

- (void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// Required: Specify which events this module can emit
- (NSArray<NSString *> *)supportedEvents
{
  return @[@"RNUITextViewCaptureInsight", @"RNUITextViewVersePress"];
}

// Track whether JavaScript is listening (optimization)
- (void)startObserving
{
  _hasListeners = YES;

#if DEBUG
  NSLog(@"[RNUITextViewEventBridge] 🎧 Started observing - listeners enabled");
#endif

  // Register for verse press notifications
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(handleVersePressNotification:)
                                               name:@"RNUITextViewVersePress"
                                             object:nil];

#if DEBUG
  NSLog(@"[RNUITextViewEventBridge] ✅ Registered for verse press notifications");
#endif
}

- (void)stopObserving
{
  _hasListeners = NO;

#if DEBUG
  NSLog(@"[RNUITextViewEventBridge] 🔇 Stopped observing - listeners disabled");
#endif

  // Unregister from notifications
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                   name:@"RNUITextViewVersePress"
                                                 object:nil];
}

// Handle capture insight notifications from native
- (void)handleCaptureInsightNotification:(NSNotification *)notification
{
  if (!_hasListeners) return;

  NSDictionary *userInfo = notification.userInfo;
  [self sendEventWithName:@"RNUITextViewCaptureInsight" body:userInfo];
}

// Handle verse press notifications from native
- (void)handleVersePressNotification:(NSNotification *)notification
{
#if DEBUG
  NSLog(@"[RNUITextViewEventBridge] 📥 Received verse press notification: %@", notification.userInfo);
  NSLog(@"[RNUITextViewEventBridge] Has listeners: %d", _hasListeners);
#endif

  if (!_hasListeners) {
#if DEBUG
    NSLog(@"[RNUITextViewEventBridge] ❌ No listeners registered - dropping event");
#endif
    return;
  }

  NSDictionary *userInfo = notification.userInfo;
  [self sendEventWithName:@"RNUITextViewVersePress" body:userInfo];

#if DEBUG
  NSLog(@"[RNUITextViewEventBridge] ✅ Forwarded to React Native: %@", userInfo);
#endif
}

@end
// ============================================================================
// END REVERTABLE: RNUITextViewEventBridge
// ============================================================================

@interface RNUITextViewManager : RCTViewManager
@end

@implementation RNUITextViewManager

RCT_EXPORT_MODULE(RNUITextView)

- (UIView *)view
{
  return [[UIView alloc] init];
}

RCT_CUSTOM_VIEW_PROPERTY(color, NSString, UIView)
{
}

@end

@interface RNUITextViewChildManager : RCTViewManager
@end

@implementation RNUITextViewChildManager

RCT_EXPORT_MODULE(RNUITextViewChild)

- (UIView *)view
{
  return nil;
}

@end
