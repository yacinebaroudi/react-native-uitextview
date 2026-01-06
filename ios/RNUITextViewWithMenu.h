#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// Custom UITextView subclass that adds "Capture Insight" to edit menu
@interface RNUITextViewWithMenu : UITextView

// Callback block for when "Capture Insight" is tapped
@property (nonatomic, copy, nullable) void (^onCaptureInsight)(NSString *selectedText, NSRange range);

@end

NS_ASSUME_NONNULL_END
