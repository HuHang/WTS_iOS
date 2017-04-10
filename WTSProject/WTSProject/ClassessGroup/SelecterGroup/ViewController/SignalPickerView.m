//
//  SignalPickerView.m
//  WTSProject
//
//  Created by Charlot on 2017/4/10.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "SignalPickerView.h"

@interface SignalPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@end
@implementation SignalPickerView

- (instancetype)initWithData:(NSArray *)dataArray
{
    self = [super init];
    if (self)
    {
        self.delegate = self;
        self.dataSource = self;
        self.dataArray = dataArray;
    }
    return self;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.dataArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.dataArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%@",self.dataArray[row]);
    [self.signalPickerViewDelegate signalPickerView:self finishPickDataStr:self.dataArray[row]];
    
}


@end
