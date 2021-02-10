@interface _UIBatteryView: UIView
    @property (nonatomic, retain, strong) UIView *linearBar;
    @property (nonatomic, retain, strong) UIView *fillBar;
    @property (nonatomic, retain, strong) UILabel *linearText;
    @property (nonatomic, assign, readwrite) UIColor *fillColor;
    @property (nonatomic, assign, readwrite) UIColor *bodyColor;
    @property (nonatomic, assign, readwrite) UIColor *pinColor;
    @property CGFloat chargePercent;
    @property(nonatomic, retain, strong) UILabel *percentLabel;
@end

UIImageView *FufuView;