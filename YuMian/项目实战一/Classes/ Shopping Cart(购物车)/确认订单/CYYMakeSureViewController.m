//
//  CYYMakeSureViewController.m
//  项目实战一
//
//  Created by ma c on 16/5/4.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYMakeSureViewController.h"
#import "CYYMakeSureView.h"
#import "CYYPayView.h"
#import "NSMutableAttributedString+Extension.h"

#import <AlipaySDK/AlipaySDK.h>
#import "Order.h"
#import "DataSigner.h"

@interface CYYMakeSureViewController ()
/**  订单列表*/
@property (nonatomic, strong) CYYMakeSureView *sureView;

/**  支付view*/
@property (nonatomic, strong) CYYPayView *payView;
@end

@implementation CYYMakeSureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"确认订单";
    self.navigationItem.hidesBackButton = YES;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ButtonReturn"] forState:UIControlStateNormal];
    backButton.size = backButton.currentBackgroundImage.size;
    [backButton addTarget:self action:@selector(backCLick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    [self.view addSubview:self.sureView];
    [self.view addSubview:self.payView];
    //添加约束
    WS(weakSelf);
    [_sureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 49, 0));
    }];
    [_payView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.and.right.and.left.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.sureView.mas_bottom);
    }];
    
}

- (CYYMakeSureView *)sureView{
    if (!_sureView) {
        _sureView = [[CYYMakeSureView alloc] init];
        _sureView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 49);
        _sureView.orderDataArray = self.makeSureArray;
    }
    return _sureView;
}

- (CYYPayView *)payView{
    if (!_payView) {
        _payView = [[CYYPayView alloc] init];
        _payView.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
        _payView.backgroundColor = RGB(245, 245, 245);
        _payView.payMoneyString = [NSMutableAttributedString makeOrderPriceText:self.totalMoney];
        WS(weakSelf);
        _payView.payBlock = ^{
            [weakSelf payMethod];
        };
    }
    return _payView;
}
- (void)backCLick:(UIButton *)backButton{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)payMethod{
    /*
     *商户的唯一的parnter和seller。
     *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
     */
    
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *partner = @"2088811244629885";
    NSString *seller = @"2088811244629885";
    NSString *privateKey = @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMMtWTF/ZNrWvKTVBnKQnamD1GgTvGjm7gLxgWe9pGos/rLYZXQnAuNkQRPgnITwtCOclWMYHvTyufYWoCQgl6mYmL4UEccFwk7ehf8c+pJ3Tm0XTS6//ohcR/B8qD+jiQOxpU33A+UoplCRohlZv5Z2S+0xt/I5QLi0Nb8J0xY3AgMBAAECgYBONJmMr9MlrO2hzonq1e+WwPAXU/Emx4GPRF3px59du/HCj9r3E7qgisdYw6Nz0U8dBd0F++BLngbNiHtafoTGCO6bKJY6Wdiv7zbhC1YuOKAvFbPRKj6pDShZ0lGbIubE6fBtZ5u6nSwh6tr28Y7TLkfX04cYlHFq7u779EBIgQJBAOGg/rRROUwrpf9bMV8z7KMOFlE7EXtg/o0tinJYBd+lvtfAkdpgzQ5JOxfywmfcI33U+RXyFoMLSTuBtfDTb6cCQQDdcwJB/FfBb5HTrOMqshUXsEukT+SWs2vS6TKAlvyd2XGwJ/fP9mdyxtinTNJRpGM0uI+gF6EHfj6blbViMHbxAkA4Pbk/mT9/DSJDlKep43eI7WoCtYaWCodpCYEJH4fXR6laflXc6WQzu21PeuOan/T42K1+GuohoB6RBrQjY5DhAkEAwppmyYXvuFVLWTD9EHAeiQqr7mEnCCf0AQxdDROiOzTy61K0O1TV489KZPrleEl1xMbLsGwTXnpamm8dToQ4gQJBANjWYtsLAxbxgNF9zAKj+B38r0AInsxbY6TV77iejVGhL9wbnJtN5QHQ6yXTlvS6Cb5hmPDcbsM0rSrCyXpD38o=";
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少partner或者seller或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = [self generateTradeNO]; //订单ID（由商家自行制定）
    order.productName = @"有面儿"; //商品标题
    order.productDescription = @"好用"; //商品描述
    //	order.amount = [NSString stringWithFormat:@"%.2f",product.price]; //商品价格
    order.amount = [NSString stringWithFormat:@"0.01"];
    order.notifyURL =  @"http://www.xxx.com"; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"YouMian";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
    }

}



//生成订单号
- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
