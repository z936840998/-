//
//  ViewController.m
//  CoreData(5.14)
//
//  Created by lanouhn on 16/5/14.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "GTMBase64.h"
#import "Account.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (nonatomic,strong) AppDelegate *myApp;
@end

@implementation ViewController
- (IBAction)login:(id)sender {
    //查询数据并且按照加密后的账号进行查找
    //1.创建查询请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Account"];//查询哪张表
    //2.设置查询条件(也就是谓词);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"username = %@",[GTMBase64 md5_base64:self.username.text]];
    //给请求对象设置谓词
    request.predicate = predicate;
//    request.sortDescriptors  排序
    //3.执行请求
    NSArray *result = [self.myApp.managedObjectContext executeFetchRequest:request error:nil];
    
    if (result.count == 0) {
        NSLog(@"此账号不存在");
        return;
    }
    
    //只有一个数据
    Account *tempAccount = [result firstObject];
    
    
}
- (IBAction)regist:(id)sender {
    if (self.username.text.length == 0 || self.password.text.length == 0) {
        NSLog(@"完整填写信息");
        return;
    }else{
        //创建模型 进行存储
        Account *oneAccount = [NSEntityDescription insertNewObjectForEntityForName:@"Account" inManagedObjectContext:self.myApp.managedObjectContext];
        //给模型的属性赋值(加密后的值)
        oneAccount.username = [GTMBase64 md5_base64:self.username.text];
        oneAccount.password = [GTMBase64 md5_base64:self.password.text];
        //进行存储
        [self.myApp saveContext];
        
        
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myApp = [UIApplication sharedApplication].delegate;
    /*
     需要注意:
     1.点击注册,将账号密码加密储存
     2.点击登陆,在数据库查询此账号是否存在,如果存在对比密码是否正确
     */
    /*
     
     
     
     
     
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
