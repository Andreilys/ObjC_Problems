//
//  BNRImageStore.m
//  HomePwner
//
//  Created by Andrei on 6/15/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

-(NSString *) imagePathForKey:(NSString *)key;

@end

@implementation BNRImageStore

-(NSString *) imagePathForKey:(NSString *)key{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:key];
}

+ (instancetype)sharedStore
{
    static BNRImageStore *sharedStore;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{sharedStore = [[self alloc] initPrivate];
    });

    return sharedStore;
}

// No one should call init
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRImageStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

// Secret designated initializer
- (instancetype)initPrivate
{
    self = [super init];

    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(clearCache:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }

    return self;
}

-(void)clearCache:(NSNotification *)note
{
    NSLog(@"flushing %2 images out of the cache", [self.dictionary count]);
    [self.dictionary removeAllObjects];
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    self.dictionary[key] = image;
    
    //create a full path for image
    NSString *imagePath = [self imagePathForKey:key];
    
    //turn image into jpeg data
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    
    //write it to the full path
    [data writeToFile:imagePath atomically:YES];
}

- (UIImage *)imageForKey:(NSString *)key
{
    //if possible get it from the dictionary
    UIImage *result = self.dictionary[key];
    if(!result) {
        NSString *imagePath = [self imagePathForKey:key];
        
        //create UIImage object from file
        result = [UIImage imageWithContentsOfFile:imagePath];
        
        //if we found an image on the file system, place it into the cache
        if (result) {
            self.dictionary[key] = result;
        } else{
            NSLog(@"Error: unable to find %@", [self imagePathForKey:key]);
        }
    }
    return result;
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
    
    NSString *imagePath = [self imagePathForKey:key];
    [[NSFileManager defaultManager] removeItemAtPath:imagePath error:nil];
}

@end
