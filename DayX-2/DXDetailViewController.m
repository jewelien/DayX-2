//
//  DXDetailViewController.m
//  DayX-2
//
//  Created by Julien Guanzon on 2/10/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "DXDetailViewController.h"
#import "EntryController.h"


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
    self.textField.text = self.entry.title;
    self.textField.placeholder = @"Title/Subject";
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(40, 150, 300, 400)];
    self.textView.backgroundColor = [UIColor grayColor];
    self.textView.text = self.entry.text;
    [self.view addSubview:self.textView];
    
    self.clearButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 100, 75, 30)];
    self.clearButton.backgroundColor = [UIColor grayColor];
    [self.clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [self.view addSubview:self.clearButton];
    [self.clearButton addTarget:self action:@selector(clearButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButtonAction:)];
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

-(void)saveButtonAction:(id)sender {
    
    Entry *entry = [[Entry alloc] initWithDictionary:@{titleKey: self.textField.text, textKey: self.textView.text}];
    
    if(self.entry) {
        [[EntryController sharedInstance] replaceEntry:self.entry withEntry:entry];
    } else {
        [[EntryController sharedInstance] addEntry:entry];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)updateWithDictionary:(NSDictionary *) dictionary {
    self.textField.text = dictionary[titleKey];
    self.textView.text = dictionary[textKey];
}

-(void) updateWithEntry:(Entry *)entry {
    self.entry = entry;
    self.textField.text = entry.title;
    self.textView.text = entry.text;
    
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
