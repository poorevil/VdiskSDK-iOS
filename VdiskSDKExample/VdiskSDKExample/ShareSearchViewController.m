//
//  ShareSearchViewController.m
//  VdiskSDKExample
//
//  Created by han chao on 13-8-24.
//
//

#import "ShareSearchViewController.h"

#import "VdiskRestClient.h"

@interface ShareSearchViewController ()<VdiskRestClientDelegate>{
    VdiskRestClient *_vdiskRestClient;
}

@end

@implementation ShareSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _vdiskRestClient = [[VdiskRestClient alloc] initWithSession:[VdiskSession sharedSession]];
        [_vdiskRestClient setDelegate:self];
    }
    return self;
}

-(id)init
{
    return [self initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:6],@"type", nil];
    
    [_vdiskRestClient searchPath:@"/" forKeyword:@"epub" params:dict];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - VdiskRestClient delegate

- (void)restClient:(VdiskRestClient *)restClient loadedSearchResults:(NSArray *)results forPath:(NSString *)path keyword:(NSString *)keyword {
    
    NSLog(@"%@",results);
    
//    self.listData = [NSMutableArray arrayWithArray:results];
//    if ([self.listData count] == 0) {
//        
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"No results found" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
//        
//        [alertView show];
//        [alertView release];
//    }
//    [self.tableView reloadData];
}

- (void)restClient:(VdiskRestClient *)restClient searchFailedWithError:(NSError *)error {
    
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"ERROR!!" message:[NSString stringWithFormat:@"Error!\n----------------\nerrno:%d\n%@\%@\n----------------", error.code, error.localizedDescription, [error userInfo]] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
//    
//    [alertView show];
//    [alertView release];
}


@end
