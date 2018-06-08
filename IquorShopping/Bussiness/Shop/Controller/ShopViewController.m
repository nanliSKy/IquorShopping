//
//  ShopViewController.m
//  IquorShopping
//
//  Created by nanli5 on 2018/5/9.
//  Copyright © 2018年 Hefei elevation network technology co. LTD. All rights reserved.
//

#import "ShopViewController.h"
#import "PlayerViewController.h"
#import "ShopConfigCell.h"
#import "ShopVideoCell.h"
#import "ShopHotCell.h"
#import "ShopNewCell.h"
@interface ShopViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *shopTableView;
@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.shopTableView];
}

- (void)startPlayer {
    PlayerViewController *playerVC = [[PlayerViewController alloc]init];
    playerVC.viderStr = @"";
    [self presentViewController:playerVC animated:YES completion:nil];
}

#pragma mark UITableViewDataSource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 240;
    }else if (indexPath.section == 1) {
        return 270;
    }else if (indexPath.section == 2) {
        return 270;
    }else {
        return 800;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ShopConfigCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ShopConfigCell class])];
        cell.configBlock = ^{
            [self startPlayer];
        };
        return cell;
    }else if (indexPath.section == 1) {
        ShopVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ShopVideoCell class])];
        return cell;
    }else if (indexPath.section == 2) {
        ShopHotCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ShopHotCell class])];
        return cell;
    }else {
        ShopNewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ShopNewCell class])];
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        
    }else if (indexPath.section == 1) {
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark set & get
- (UITableView *)shopTableView {
    if (!_shopTableView) {
        _shopTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _shopTableView.dataSource = self;
        _shopTableView.delegate = self;
        _shopTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _shopTableView.estimatedSectionHeaderHeight = 0;
        _shopTableView.estimatedSectionFooterHeight = 5;
        _shopTableView.estimatedRowHeight = 270;
//        [_shopTableView registerClass:[ShopConfigCell class] forCellReuseIdentifier:NSStringFromClass([ShopConfigCell class])];
        [_shopTableView registerNib:[UINib nibWithNibName:@"ShopConfigCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([ShopConfigCell class])];
        [_shopTableView registerNib:[UINib nibWithNibName:@"ShopVideoCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([ShopVideoCell class])];
        [_shopTableView registerNib:[UINib nibWithNibName:@"ShopHotCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([ShopHotCell class])];
        [_shopTableView registerNib:[UINib nibWithNibName:@"ShopNewCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([ShopNewCell class])];
        
    }
    return _shopTableView;
}
@end
