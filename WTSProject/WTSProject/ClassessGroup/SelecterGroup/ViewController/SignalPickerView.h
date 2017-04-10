//
//  SignalPickerView.h
//  WTSProject
//
//  Created by Charlot on 2017/4/10.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SignalPickerView;
@protocol SignalPickerViewDelegate <NSObject>


- (void)signalPickerView:(SignalPickerView *_Nullable)picker
    finishPickDataStr:(NSString *_Nullable)dataStr;
@end

@interface SignalPickerView : UIPickerView
@property (nonatomic,strong)NSArray * _Nullable dataArray;
- (instancetype _Nullable )initWithData:(NSArray *_Nullable)dataArray;

@property (nonatomic, weak, nullable) id<SignalPickerViewDelegate> signalPickerViewDelegate;
@end
