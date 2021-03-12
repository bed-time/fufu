#import <Preferences/PSSliderTableCell.h>
#import <Preferences/PSSpecifier.h>

@interface LabelSlider : PSSliderTableCell
@end

@interface PSSpecifier (Private)
-(id)performGetter;
-(void)performSetterWithValue:(id)value;
@end

@interface UIView (Private)
-(UIViewController *)_viewControllerForAncestor;
@end