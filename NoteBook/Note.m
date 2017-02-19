//
//  Note.m
//  NoteBook
//
//  Created by totoros on 10/02/17.
//  Copyright © 2017 Theodosis ltd. All rights reserved.
//

#import "Note.h"

@implementation Note

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.noteText = [aDecoder decodeObjectForKey:@"noteText"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.noteText forKey:@"noteText"];
}

+ (NSString *)pathToNotesArchive {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths[0] stringByAppendingString:@"notes.archive"];
}

+ (BOOL)saveNotesToFile:(NSArray *)notes {
    NSLog(@"saved! notes: %@", notes);
    return [NSKeyedArchiver archiveRootObject:notes toFile:[Note pathToNotesArchive]];
}

+ (NSArray *)readNotesFromFile {
    NSArray *notes = [NSKeyedUnarchiver unarchiveObjectWithFile:[Note pathToNotesArchive]];
    return notes;
}

+ (void)removeArchiveFile {
    NSError *removeError;
    [[NSFileManager defaultManager] removeItemAtPath:[Note pathToNotesArchive] error:&removeError];
    if (removeError) {
        NSLog(@"error removing file: %@", removeError.localizedDescription);
    }
    else {
        NSLog(@"file deleted");
    }
}

@end
