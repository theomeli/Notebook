//
//  AddNoteViewController.h
//  NoteBook
//
//  Created by totoros on 12/02/17.
//  Copyright © 2017 Theodosis ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Note;

@protocol AddNoteViewControllerDelegate <NSObject>

- (void)saveNote:(Note *)note;

@end

@interface AddNoteViewController : UIViewController

@property (weak, nonatomic) id<AddNoteViewControllerDelegate> delegate;

@end
