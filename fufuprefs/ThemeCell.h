#import <Preferences/PSTableCell.h>
#import <Preferences/PSSpecifier.h>
#import <Cephei/HBPreferences.h>
#import "../Utility/NSTask.h"
#import "../Utility/colorWithHex.h"

@interface ThemeCell : PSTableCell
@end
 
@interface PSSpecifier (PrivateMethods)
    -(void)performSetterWithValue:(id)value;
    -(id)performGetter;
@end