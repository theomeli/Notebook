//
//  AddNoteViewController.m
//  NoteBook
//
//  Created by totoros on 12/02/17.
//  Copyright © 2017 Theodosis ltd. All rights reserved.
//

#import "AddNoteViewController.h"
#import "Note.h"

@interface AddNoteViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AddNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    Note *note = [[Note alloc] init];
    note.noteText = textField.text;
    
    [self.delegate saveNote:note];
    
    return YES;
}

@end
