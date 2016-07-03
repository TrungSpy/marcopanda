//
//  SelectItem.m
//  marcopandaios
//
//  Created by kawa on 2016/07/03.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "SelectItem.h"

@implementation SelectItem{
    UITextField *_textLabel;
    UIPickerView *_picker;
    NSMutableArray *_filtersArr;
    UIView  *_pickerContainer;
}
@synthesize value,selectedIndex,placeholder;

//- (id)initWithFrame:(CGRect)frame{
//    if(self = [super initWithFrame:frame]){
//        _filtersArr = [[NSMutableArray alloc]init];
//        
//        _textLabel = [[UITextField alloc]initWithFrame:CGRectMake(5*ScreenFit, 0, CGRectGetWidth(frame)-10*ScreenFit, CGRectGetHeight(frame))];
//        _textLabel.userInteractionEnabled = NO;
//        _textLabel.backgroundColor = [UIColor clearColor];
//        
//        selectedIndex = 0;
//        
//        _picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 30*ScreenFit, __SCREEN_WIDTH__, 130*ScreenFit)];
//        UIColor *color = self.pickerViewBgColor ? self.pickerViewBgColor : [UIColor whiteColor];
//        [_picker setBackgroundColor:color];
//        _picker.delegate = self;
//        _picker.dataSource = self;
//        _picker.layer.frame = CGRectMake(0, 30*ScreenFit, __SCREEN_WIDTH__, 130*ScreenFit);
//        [_picker reloadAllComponents];
//        
//        self.backgroundColor = [UIColor whiteColor];
//        self.layer.borderColor = UIColor(191, 191, 191, 1.0f).CGColor;
//        self.layer.borderWidth = 1.0f;
//        [self addSubview:_textLabel];
//        
//        UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(frame)-21*ScreenFit-2*ScreenFit, (CGRectGetHeight(frame)-28*ScreenFit)/2.0f, 21*ScreenFit, 28*ScreenFit)];
//        [icon setImage:[UIImage imageNamed:@"ec_feature_icon-arrow"]];
//        [self addSubview:icon];
//        
//        UIButton *backgroundBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
//        [backgroundBtn addTarget:self action:@selector(showPicker:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:backgroundBtn];
//    }
//    return self;
//}
//
//- (void)clickDoneButton:(UIButton *)sender{
//    [self setSelectedIndex:[_picker selectedRowInComponent:0]+1];
//    
//    [[KGModal sharedInstance]hideAnimated:YES];
//    if(_selectHandler){
//        _selectHandler(self.selectedIndex-1);
//    }
//}
//
//- (void)showPicker:(id)sender{
//    
//    for (id view in self.superview.subviews) {
//        if([view isKindOfClass:[UITextField class]])
//        {
//            [view resignFirstResponder];
//        }
//        if([view isKindOfClass:[UILimitTextfield class]])
//        {
//            [((UILimitTextfield*)view) limitResignFirstResponder];
//        }
//    }
//    if (self.showKindSelect) {
//        self.showKindSelect();
//        return;
//    }
//    
//    UIResponder *firstResponder = [XHYScrollingNavBarViewController firstResponder];
//    if(firstResponder){
//        [firstResponder resignFirstResponder];
//    }
//    
//    if(!_pickerContainer){
//        _pickerContainer = [[UIView alloc]initWithFrame:CGRectMake(0, __SCREEN_HEIGHT__ - 160 * ScreenFit, __SCREEN_WIDTH__, 160*ScreenFit)];
//        _pickerContainer.backgroundColor = UIColor(52, 191, 121, 1.0f);
//        
//        UIButton *doneBtn = [[UIButton alloc]initWithFrame:CGRectMake(__SCREEN_WIDTH__-50*ScreenFit, 5*ScreenFit, 45*ScreenFit, 20*ScreenFit)];
//        doneBtn.layer.cornerRadius = 3.*ScreenFit;
//        doneBtn.backgroundColor = [UIColor whiteColor];
//        doneBtn.layer.masksToBounds = YES;
//        [doneBtn addTarget:self action:@selector(clickDoneButton:) forControlEvents:UIControlEventTouchUpInside];
//        [doneBtn setTitleColor:UIColor(91, 169, 255, 1.0f) forState:UIControlStateNormal];
//        doneBtn.titleLabel.font = W3FONT(11.0);
//        [doneBtn setTitle:@"完了" forState:UIControlStateNormal];
//        [_pickerContainer addSubview:doneBtn];
//        [_pickerContainer addSubview:_picker];
//    }
//    
//    [self setSelectedIndex:self.selectedIndex];
//    
//    _pickerContainer.frame = CGRectMake(0, __SCREEN_HEIGHT__ - 160 * ScreenFit, __SCREEN_WIDTH__, 160*ScreenFit);
//    [[KGModal sharedInstance] setCloseButtonType:KGModalCloseButtonTypeRight];
//    [[KGModal sharedInstance] showWithContentViewplus:_pickerContainer andAnimated:YES];
//}
//
//- (void)selectItem:(NSString *)item{
//    if([_filtersArr containsObject:item]){
//        NSInteger index = [_filtersArr indexOfObject:item];
//        self.selectedIndex = index+1;
//        
//        [_picker selectRow:index inComponent:0 animated:NO];
//        _textLabel.text = item;
//    }else{
//        _textLabel.text = item;
//        self.selectedIndex = NSNotFound;
//    }
//}
//
//- (void)setSelectedIndex:(NSInteger)seIndex{
//    
//    
//    if(seIndex == 0) seIndex++;
//    if(seIndex < 1 || seIndex > [_filtersArr count]) return;
//    
//    
//    selectedIndex = seIndex;
//    
//    seIndex -= 1;
//    if(seIndex < [_filtersArr count] && seIndex >= 0){
//        [_picker selectRow:seIndex inComponent:0 animated:NO];
//        NSString *item = [_filtersArr objectAtIndex:seIndex];
//        _textLabel.text = item;
//        self.value = item;
//    }
//}
//
//- (void)setSelectHandler:(void (^)(NSInteger index))selectHandler dataSource:(NSArray *)filters{
//    _selectHandler = [selectHandler copy];
//    if(filters){
//        [_filtersArr addObjectsFromArray:filters];
//    }
//}
//
//- (void)updateDataSource:(NSArray *)newSource{
//    if(newSource){
//        [_filtersArr removeAllObjects];
//        [_filtersArr addObjectsFromArray:newSource];
//        [_picker reloadAllComponents];
//        
//        if(![_filtersArr containsObject:_textLabel.text]){
//            _textLabel.text = @"--";
//        }
//    }
//}
//
//-(void)setPlaceholder:(NSString *)pl{
//    _textLabel.placeholder = pl;
//}
//
//#pragma mark - UIPickerView Delegate
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//    return 1;
//}
//
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
//    return [_filtersArr count];
//}
//
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    return [_filtersArr objectAtIndex:row];
//}
//
//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
//    return 25*ScreenFit;
//}

@end
