#import "ThemeCell.h"
#import <Preferences/PSSpecifier.h>
#import <Foundation/NSUserDefaults.h>

@implementation ThemeCell {
	UIImageView *DisplayImage;
    NSString *Name;
    NSString *Type;
    NSMutableDictionary *Specifiers;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
    if (self) {
        [specifier setProperty:@50 forKey:@"height"];
        Specifiers = specifier.properties;

        Name = specifier.properties[@"Name"];
        Type = specifier.properties[@"Type"];

        UIView *CardView = [[UIView alloc] initWithFrame:self.bounds];
        CardView.userInteractionEnabled = YES;
    
        [self addSubview: CardView];
        


        /* 
        UIImageView *themeImage = [[UIImageView alloc] initWithImage:specifier.properties[@"DisplayImage"]];
        themeImage.frame = CGRectMake(0 - inset, 0 - inset, self.bounds.size.height + (inset*4), self.bounds.size.height + (inset*4));
        themeImage.contentMode = UIViewContentModeScaleAspectFill;
        themeImage.userInteractionEnabled = NO;
        */

        //gesture to enable

        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(saveThemePreferences:)];
        tapGesture.numberOfTapsRequired = 1;
        [CardView addGestureRecognizer:tapGesture];
    }
    return self;
}

-(void)saveThemePreferences:(UITapGestureRecognizer *)tap {
    //thee path'eth

    NSMutableDictionary *SavedTheme;
    NSString *Path;
    NSString *Plist = @"/var/mobile/Library/Preferences/luv.bedtime.FufuPrefs.plist";
    Path = [NSString stringWithFormat:@"/Library/Application Support/Fufu/%@.fufu/batt", Name];

    SavedTheme = [[NSMutableDictionary alloc] initWithContentsOfFile:Plist];
    [SavedTheme setObject:Path forKey:@"battthemepath"];

    [SavedTheme writeToFile:@"/var/mobile/Library/Preferences/luv.bedtime.FufuPrefs.plist" atomically:YES];
    
}


@end