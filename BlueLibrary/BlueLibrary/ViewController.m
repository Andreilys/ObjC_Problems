//
//  ViewController.m
//  BlueLibrary
//
//  Created by Eli Ganem on 31/7/13.
//  Copyright (c) 2013 Eli Ganem. All rights reserved.
//

#import "ViewController.h"
#import "LibraryAPI.h"
#import "Album+TableRepresentation.h"
#import "HorizontalScroller.h"
#import "Album.h"
#import "AlbumView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, HorizontalScrollerDelegate>{
    NSArray *allAlbums;
    NSDictionary *currentAlbumData;
    int currentAlbumIndex;
    UITableView *dataTable;
    HorizontalScroller *scroller;
}


@end

@implementation ViewController

-(void)horizontalScroller:(HorizontalScroller *)scroller clickedViewAtIndex:(int)index
{
    currentAlbumIndex = index;
    [self showDataForAlbumAtIndex:index];
}

-(NSInteger)numberOfViewForHorizontalScroller:(HorizontalScroller *)scroller
{
    return allAlbums.count;
}

-(UIView *)horizontalScroller:(HorizontalScroller *)scroller viewAtIndex:(int)index
{
    Album *album = allAlbums[index];
    return [[AlbumView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) albumCover:album.coverUrl];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [currentAlbumData[@"titles"] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = currentAlbumData[@"titles"][indexPath.row];
    cell.detailTextLabel.text = currentAlbumData[@"values"][indexPath.row];
    
    return cell;
}

-(void)reloadScroller
{
    allAlbums = [[LibraryAPI sharedInstance] getAlbums];
    if (currentAlbumIndex <0) currentAlbumIndex = 0;
    else if (currentAlbumIndex >= allAlbums.count) currentAlbumIndex = allAlbums.count - 1;
    [scroller reload];
    [self showDataForAlbumAtIndex:currentAlbumIndex];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.76f green:0.81f blue:0.86f alpha:1];
    currentAlbumIndex = 0;
    allAlbums = [[LibraryAPI sharedInstance] getAlbums];
    
    //uitable presents the album data
    dataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height - 120) style:UITableViewStyleGrouped];
    dataTable.delegate = self;
    dataTable.dataSource = self;
    dataTable.backgroundView = nil;
    [self.view addSubview:dataTable];
    scroller = [[HorizontalScroller alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    scroller.backgroundColor = [UIColor colorWithRed:0.24f green:0.35f blue:0.49f alpha:1];
    scroller.delegate = self;
    [self.view addSubview:scroller];
    
    [self reloadScroller];

    
    [self showDataForAlbumAtIndex:currentAlbumIndex];
    
    
    
}

-(void)showDataForAlbumAtIndex:(int)albumIndex
{
    if (albumIndex < allAlbums.count) {
        Album *album = allAlbums[albumIndex];
        //save albums data to present later
        currentAlbumData = [album tr_tableRepresentation];
    }
    else{
        currentAlbumData = nil;
    }
    [dataTable reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
