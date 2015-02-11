//
//  DXDetailViewController.m
//  DayX-2
//
//  Created by Julien Guanzon on 2/10/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "DXDetailViewController.h"
#import "Entry.h"

@interface DXDetailViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *clearButton;
@property (nonatomic, strong) Entry *entry;

@end

@implementation DXDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, 200, 40)];
//    self.textField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.textField];
    self.textField.placeholder = @"Title/Subject";
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(40, 150, 300, 400)];
    self.textView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.textView];
    
    self.clearButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 100, 75, 30)];
    self.clearButton.backgroundColor = [UIColor grayColor];
    [self.clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [self.view addSubview:self.clearButton];
    [self.clearButton addTarget:self action:@selector(clearButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveButtonAction)];
    self.navigationItem.rightBarButtonItem = saveButton;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clearButtonPressed {
    self.textField.text = @"";
    self.textView.text = @"";
}

-(void)saveButtonAction {
    if (self.entry == nil) {
        self.entry = [[Entry alloc] init];
        self.entry.title = self.textField.text;
        self.entry.text = self.textView.text;
    }
    
    NSMutableArray *entries = [Entry loadEntriesFromDefaults];
    [entries addObject:self.entry];
    
    [Entry storeEntriesInDefaults:entries];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
