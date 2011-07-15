//
//  InfoViewController.h
//  TestApp
//
//  Created by Julien Poissonnier on 7/15/11.
//  Copyright 2011 Julien Poissonnier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController {
    UITextView *textView;
}


- (IBAction)done:(id)sender;

@property (nonatomic, strong) IBOutlet UITextView *textView;

@end
