//
//  SelectItem.h
//  marcopandaios
//
//  Created by kawa on 2016/07/03.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectItem : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
{
    void (^ _selectHandler) (NSInteger index);
}

@property (nonatomic,strong)NSString *value;
@property (nonatomic, strong) UIColor *pickerViewBgColor;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, copy) NSString *placeholder;

- (void)setSelectHandler:(void(^)(NSInteger index))selectHandler dataSource:(NSArray *)filters;
- (void)updateDataSource:(NSArray *)newSource;
- (void)setPickerViewBgColor:(UIColor *)bgColor;
- (void)selectItem:(NSString *)item;

@property (nonatomic, copy) void(^showKindSelect)();

@end
