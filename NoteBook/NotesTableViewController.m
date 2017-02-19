//
//  NotesTableViewController.m
//  NoteBook
//
//  Created by totoros on 10/02/17.
//  Copyright © 2017 Theodosis ltd. All rights reserved.
//

#import "NotesTableViewController.h"
#import "Note.h"
#import "AddNoteViewController.h"

@interface NotesTableViewController () <AddNoteViewControllerDelegate>

@property (copy, nonatomic) NSArray *notes;

@end

@implementation NotesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"NoteCell"];
    
    /*Note *note1 = [[Note alloc] init];
    note1.noteText = @"How are you";
    Note *note2 = [[Note alloc] init];
    note2.noteText = @"Hi teo";
    
    //self.notes = @[@"teo", @"john"];
    self.notes = @[note1, note2];*/
   
    if ([Note readNotesFromFile] == nil) {
        self.notes = @[];
    }
    else {
        self.notes = [Note readNotesFromFile];
    }
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
    
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteButtonTapped:)];
    
    self.navigationItem.leftBarButtonItem = addButton;
    self.navigationItem.rightBarButtonItem = deleteButton;
}

- (void)addButtonTapped:(id)sender {
    AddNoteViewController *addNoteVC = [[AddNoteViewController alloc] initWithNibName:@"AddNoteViewController" bundle:[NSBundle mainBundle]];
    addNoteVC.delegate = self;
    
    [self presentViewController:addNoteVC animated:YES completion:nil];
}

- (void)deleteButtonTapped:(id)sender {
    //delete archive
    [Note removeArchiveFile];
    
    self.notes = nil;
    [self.tableView reloadData];
}

- (void)saveNote:(Note *)note {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSMutableArray *mutableNotes = [[NSMutableArray alloc] initWithArray:self.notes];
    [mutableNotes addObject:note];
    self.notes = [mutableNotes copy];
    
    [Note saveNotesToFile:self.notes];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteCell" forIndexPath:indexPath];
    
    //einai lathos ..den anagnorizei to textNote
    //cell.textLabel.text = self.notes[indexPath.row].textNote;
    //auto pou mporei na anagnorisei einai:
    //cell.textLabel.text = [self.notes[indexPath.row] noteText];
    
    Note *note = self.notes[indexPath.row];
    cell.textLabel.text = note.noteText;
    
    return cell;
}
