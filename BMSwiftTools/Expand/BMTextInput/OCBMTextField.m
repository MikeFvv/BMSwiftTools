//
//  OCBMTextField.m
//  BMSwiftTools
//
//  Created by BLOM on 5/10/22.
//

#import "OCBMTextField.h"

@interface OCBMTextField ()<UITextFieldDelegate>
///
@property (nonatomic, strong) UITextField *textField;
@end

@implementation OCBMTextField

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.delegate = self;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFiledEditChanged:) name:UITextFieldTextDidChangeNotification object:nil];
}



#define kTextFieldMaxCount  9
#pragma mark -  输入字符判断
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // 敲删除键
    if ([string length] == 0) {
        return YES;
    }
    //当输入框当前的字符个数大于9的时候，就不让更改了（不能等于9，因为如果等于9，在输入框字符个数等于9的情况下就不能进行粘贴替换内容了）
    if ([textField.text length] >kTextFieldMaxCount)
        return NO;
    //获得当前输入框内的字符串
    NSMutableString *fieldText=[NSMutableString stringWithString:textField.text];
    //完成输入动作，包括输入字符，粘贴替换字符
    [fieldText replaceCharactersInRange:range withString:string];
    NSString *finalText=[fieldText copy];
    //如果字符个数大于18就要进行截取前边18个字符
    if ([finalText length]>kTextFieldMaxCount) {
        textField.text=[finalText substringToIndex:kTextFieldMaxCount];
        return NO;
    }
    return YES;
}


- (void)textFiledEditChanged:(NSNotification *)noti
{
    UITextField *infoText = noti.object;
    int kMaxLength = 20;
    NSString *toBeString = infoText.text;
    
    
    //    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    NSString *lang = [infoText.textInputMode primaryLanguage];
    
    
    if ([lang isEqualToString:@"zh-Hans"]) { // 中文输入
        UITextRange *selectedRange = [infoText markedTextRange];
        //获取高亮部分
        // 系统的UITextRange，有两个变量，一个是start，一个是end，这是对于的高亮区域
        UITextPosition *position = [infoText positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > kMaxLength) {
                infoText.text = [toBeString substringToIndex:kMaxLength];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    else{
        if (toBeString.length > kMaxLength) {// 表情之类的，中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
            infoText.text = [toBeString substringToIndex:kMaxLength];
        }
    }
}



@end
