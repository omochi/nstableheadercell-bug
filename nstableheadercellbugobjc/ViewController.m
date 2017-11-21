//
//  ViewController.m
//  nstableheadercellbugobjc
//
//  Created by omochimetaru on 2017/11/21.
//  Copyright © 2017年 omochimetaru. All rights reserved.
//

#import "ViewController.h"

@interface MyHeaderCell : NSTableHeaderCell {}

@end

@implementation MyHeaderCell

- (void)dealloc {
    NSLog(@"dealloc %p", self);
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSTableColumn * column in _tableView.tableColumns) {
        MyHeaderCell * cell = [[MyHeaderCell alloc] initTextCell:column.title];
        column.headerCell = cell;
    }

}

@end
