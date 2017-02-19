//
//  Note.h
//  NoteBook
//
//  Created by totoros on 10/02/17.
//  Copyright © 2017 Theodosis ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject <NSCoding>

@property (strong, nonatomic) NSString *noteText;

+ (BOOL)saveNotesToFile:(NSArray *) notes;
+ (NSArray *)readNotesFromFile;
+ (void)removeArchiveFile;

@end
