//
//  ViewController.m
//  TestObjC
//
//  Created by Ulat Bulu on 27/02/25.
//

#import "ViewController.h"
#import "ListViewModel.h"
#import "ListCell.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ListViewModel *viewModel;
@property (nonatomic, strong) NSArray<Post *> *filteredPosts;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Posts"];
    self.filteredPosts = @[];
        
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
    
    [self setupViewModel];
    [self setupTableView];
}


-(void)setupViewModel {
    self.viewModel = [[ListViewModel alloc] init];
    [self.viewModel fetchDataWithCompletion:^(NSError *error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.filteredPosts = self.viewModel.posts;
                [self.tableView reloadData];
            });
        }
    }];
}

-(void) setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ListCell" bundle:nil] forCellReuseIdentifier:@"listCellId"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCellId"];
    [cell bindModel:self.filteredPosts[indexPath.row]];
    return  cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.filteredPosts count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Post *post = [[Post alloc] init];
    post = self.filteredPosts[indexPath.row];
    DetailViewController *detailVC = [[DetailViewController alloc] initWithModel:post];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length == 0) {
        self.filteredPosts = self.viewModel.posts;
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title CONTAINS[c] %@", searchText];
        self.filteredPosts = [self.viewModel.posts filteredArrayUsingPredicate:predicate];
    }
    [self.tableView reloadData];
}
@end
