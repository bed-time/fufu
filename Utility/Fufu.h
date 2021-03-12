@interface _UIBatteryView: UIView
    @property (nonatomic, assign, readwrite) UIColor *fillColor;
    @property (nonatomic, assign, readwrite) UIColor *bodyColor;
    @property (nonatomic, assign, readwrite) UIColor *pinColor;
    @property (nonatomic, assign, readwrite) UIColor *boltColor;
    @property CGFloat chargePercent;
    @property(nonatomic, retain, strong) UILabel *percentLabel;
@end

UIImageView *FufuView;

@interface SBCoverSheetPrimarySlidingViewController : UIViewController
-(void)viewDidDisappear:(BOOL)arg1;
-(void)viewDidAppear:(BOOL)arg1;
@end

