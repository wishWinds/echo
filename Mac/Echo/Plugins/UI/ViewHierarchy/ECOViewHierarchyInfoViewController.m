//
//  ECOViewHierarchyInfoViewController.m
//  Echo
//
//  Created by 陈爱彬 on 2019/6/19. Maintain by 陈爱彬
//  Description 
//

#import "ECOViewHierarchyInfoViewController.h"
#import "YVRightCellViewClass.h"
#import "YVRightCellViewInfo.h"
#import "YVRightCellViewFrame.h"

@interface ECOViewHierarchyInfoViewController ()
<NSTableViewDataSource,
NSTableViewDelegate>

@property (weak) IBOutlet NSTableView *tableView;
@property (nonatomic, strong) NSDictionary *selectedNode;

@end

@implementation ECOViewHierarchyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

//刷新节点信息
- (void)refreshNodeInfo:(NSDictionary *)info {
    self.selectedNode = info;
    [self.tableView reloadData];
}

//视图修改数据
- (void)receivedViewEditInfo:(NSDictionary *)info {
    if ([_delegate respondsToSelector:@selector(viewDidEditedWithInfo:)]) {
        [_delegate viewDidEditedWithInfo:info];
    }
}
#pragma mark - NSTableViewDataSource Methods
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 4;
}
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    if (row == 0) {
        return 150;
    } else if (row == 1) {
        return 520;
    } else if (row == 2) {
        return 115;
    } else {
        return 500;
    }
}
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    YVRightCellBase * retView;
    if (row == 0) {
        retView = [YVRightCellViewInfo makeView:tableView owner:self identifer:@"YVRightCellViewClass"];
    }else if (row == 1) {
        retView = [YVRightCellViewInfo makeView:tableView owner:self identifer:@"YVRightCellViewInfo"];
    }else if (row == 2) {
        retView = [YVRightCellViewFrame makeView:tableView owner:self identifer:@"YVRightCellViewFrame"];
    } else if (row == 3) {
        retView = [YVRightCellBase makeView:tableView owner:self identifer:@"RightCellViewGestureRecognizers"];
    }
    __weak typeof(self) weakSelf = self;
    retView.editBlock = ^(NSDictionary *info) {
        [weakSelf receivedViewEditInfo:info];
    };
    [retView fillData:self.selectedNode];
    return retView;
}

@end
