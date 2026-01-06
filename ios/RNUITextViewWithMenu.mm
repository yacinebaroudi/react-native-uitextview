#import "RNUITextViewWithMenu.h"

@implementation RNUITextViewWithMenu

// Override editMenu method (iOS 16+) to add custom "Capture Insight" action
- (UIMenu *)editMenuForTextRange:(UITextRange *)textRange suggestedActions:(NSArray<UIMenuElement *> *)suggestedActions API_AVAILABLE(ios(16.0)) {
    // Only add custom action if callback is set
    if (!self.onCaptureInsight) {
        return [UIMenu menuWithChildren:suggestedActions];
    }

    // Create "Insight" action
    UIAction *captureAction = [UIAction actionWithTitle:@"Insight"
                                                  image:[UIImage systemImageNamed:@"lightbulb.fill"]
                                             identifier:nil
                                                handler:^(__kindof UIAction * _Nonnull action) {
        // Get selected text and range
        UITextRange *selectedRange = self.selectedTextRange;

        if (selectedRange && !selectedRange.empty) {
            NSString *selectedText = [self textInRange:selectedRange];

            // Calculate NSRange
            NSInteger startOffset = [self offsetFromPosition:self.beginningOfDocument toPosition:selectedRange.start];
            NSInteger endOffset = [self offsetFromPosition:self.beginningOfDocument toPosition:selectedRange.end];
            NSRange range = NSMakeRange(startOffset, endOffset - startOffset);

            // Call callback
            if (self.onCaptureInsight) {
                self.onCaptureInsight(selectedText, range);
            }
        }
    }];

    // Insert custom action at the beginning
    NSMutableArray<UIMenuElement *> *menuElements = [suggestedActions mutableCopy];
    [menuElements insertObject:captureAction atIndex:0];

    return [UIMenu menuWithChildren:menuElements];
}

@end
