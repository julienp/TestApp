//
//  FontPreviewViewController.h
//  TestApp
//
//  Created by Julien Poissonnier on 12/20/11.
//  Copyright (c) 2011 caffeine.lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontPreviewViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)changeFontSize:(id)sender;

@property (nonatomic, strong) NSString *fontName;
@property (nonatomic, strong) NSString *text;
@end
