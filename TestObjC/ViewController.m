//
//  ViewController.m
//  TestObjC
//
//  Created by Ulat Bulu on 27/02/25.
//

#import "ViewController.h"
#import "ListViewModel.h"
#import "ListCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ListViewModel *viewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[ListViewModel alloc] init];
    [self setupTableView];
}

-(void) setupTableView {
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [_tableView registerNib:[UINib nibWithNibName:@"ListCell" bundle:nil] forCellReuseIdentifier: @"ListCell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    [cell bindModel:self.viewModel.posts[indexPath.row]];
    return  [[UITableViewCell alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.posts.count;
}

@end
