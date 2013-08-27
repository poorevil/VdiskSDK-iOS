//
//  ShareSearchViewController.m
//  VdiskSDKExample
//
//  Created by han chao on 13-8-24.
//
//

#import "ShareSearchViewController.h"

#import "VdiskRestClient.h"

#import "VdiskSharesMetadata.h"   

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
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"6",@"type",
                          @"epub",@"query",
                          @"count_download",@"sort_order",
                          nil];
    
//    [_vdiskRestClient searchPath:@"/" forKeyword:@"epub" params:dict];
    [_vdiskRestClient loadShareList:kVdiskShareListTypeShareSearch params:dict];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - VdiskRestClient delegate


- (void)restClient:(VdiskRestClient *)client loadedShareList:(NSArray *)shareList shareListType:(VdiskShareListType)shareListType // results is a list of VdiskSharesMetadata * objects
{
    for (VdiskSharesMetadata *metadata in shareList) {
        NSLog(@"%@------%@",metadata.name,metadata.url);
    }
}
- (void)restClient:(VdiskRestClient *)client loadShareListFailedWithError:(NSError *)error shareListType:(VdiskShareListType)shareListType
{
    
}


@end
