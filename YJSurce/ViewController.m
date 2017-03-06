//
//  ViewController.m
//  YJSurce
//
//  Created by Macintosh HD on 2017/3/6.
//  Copyright © 2017年 Macintosh HD. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Hash.h"
#import "RSA.h"
#import "RSAEncryptor.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TX1;
@property (weak, nonatomic) IBOutlet UITextField *TX2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //公
    
    //私
//    NSString *privateKeyFilePath = [[NSBundle mainBundle] pathForResource:@"rsa_private_key.pem" ofType:nil];
    
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"zh"] != nil) {
        _TX1.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"zh"];
        _TX2.text = [YJKeychain readKeychainValue:@"pp"];//a31dce88633f3393f6c475525ff48301
    }
    
}
- (IBAction)queding:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:_TX1.text forKey:@"zh"];
    [NSUserDefaults standardUserDefaults];
    
    NSString *psd = [_TX2.text hmacMD5StringWithKey:@"123"];
    NSLog(@"psd  :%@",psd);
    

    
    
    NSString *publicKeyFilePath = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI2bvVLVYrb4B0raZgFP60VXY\ncvRmk9q56QiTmEm9HXlSPq1zyhyPQHGti5FokYJMzNcKm0bwL1q6ioJuD4EFI56D\na+70XdRz1CjQPQE3yXrXXVvOsmq9LsdxTFWsVBTehdCmrapKZVVx6PKl7myh0cfX\nQmyveT/eqyZK1gYjvQIDAQAB\n-----END PUBLIC KEY-----";

    NSString *encWithPubKey = [RSA encryptString:_TX2.text publicKey:publicKeyFilePath];

    NSLog(@"公钥:%@",encWithPubKey);

    
    [YJKeychain saveKeychainValue:_TX2.text key:@"pp"];
    
    //私
    NSString *privateKeyFilePath = @"-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMMjZu9UtVitvgHS\ntpmAU/rRVdhy9GaT2rnpCJOYSb0deVI+rXPKHI9Aca2LkWiRgkzM1wqbRvAvWrqK\ngm4PgQUjnoNr7vRd1HPUKNA9ATfJetddW86yar0ux3FMVaxUFN6F0KatqkplVXHo\n8qXubKHRx9dCbK95P96rJkrWBiO9AgMBAAECgYBO1UKEdYg9pxMX0XSLVtiWf3Na\n2jX6Ksk2Sfp5BhDkIcAdhcy09nXLOZGzNqsrv30QYcCOPGTQK5FPwx0mMYVBRAdo\nOLYp7NzxW/File//169O3ZFpkZ7MF0I2oQcNGTpMCUpaY6xMmxqN22INgi8SHp3w\nVU+2bRMLDXEc/MOmAQJBAP+Sv6JdkrY+7WGuQN5O5PjsB15lOGcr4vcfz4vAQ/uy\nEGYZh6IO2Eu0lW6sw2x6uRg0c6hMiFEJcO89qlH/B10CQQDDdtGrzXWVG457vA27\nkpduDpM6BQWTX6wYV9zRlcYYMFHwAQkE0BTvIYde2il6DKGyzokgI6zQyhgtRJ1x\nL6fhAkB9NvvW4/uWeLw7CHHVuVersZBmqjb5LWJU62v3L2rfbT1lmIqAVr+YT9CK\n2fAhPPtkpYYo5d4/vd1sCY1iAQ4tAkEAm2yPrJzjMn2G/ry57rzRzKGqUChOFrGs\nlm7HF6CQtAs4HC+2jC0peDyg97th37rLmPLB9txnPl50ewpkZuwOAQJBAM/eJnFw\nF5QAcL4CYDbfBKocx82VX/pFXng50T7FODiWbbL4UnxICE0UBFInNNiWJxNEb6jL\n5xd0pcy9O2DOeso=\n-----END PRIVATE KEY-----";
    
    NSString * decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privateKeyFilePath];
    NSLog(@"私钥解密:%@",decWithPrivKey);
    
    
    // by PHP
//    encWithPubKey = @"CKiZsP8wfKlELNfWNC2G4iLv0RtwmGeHgzHec6aor4HnuOMcYVkxRovNj2r0Iu3ybPxKwiH2EswgBWsi65FOzQJa01uDVcJImU5vLrx1ihJ/PADUVxAMFjVzA3+Clbr2fwyJXW6dbbbymupYpkxRSfF5Gq9KyT+tsAhiSNfU6akgNGh4DENoA2AoKoWhpMEawyIubBSsTdFXtsHK0Ze0Cyde7oI2oh8ePOVHRuce6xYELYzmZY5yhSUoEb4+/44fbVouOCTl66ppUgnR5KjmIvBVEJLBq0SgoZfrGiA3cB08q4hb5EJRW72yPPQNqJxcQTPs8SxXa9js8ZryeSxyrw==";
//    decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privkey];
//    NSLog(@"(PHP enc)Decrypted with private key: %@", decWithPrivKey);
//    
//    // Demo: encrypt with private key
//    // TODO: encryption with private key currently NOT WORKING YET!
//    //encWithPrivKey = [RSA encryptString:originString privateKey:privkey];
//    //NSLog(@"Enctypted with private key: %@", encWithPrivKey);
//    
//    // Demo: decrypt with public key
//    encWithPrivKey = @"aQkSJwaYppc2dOGEOtgPnzLYX1+1apwqJga2Z0k0cVCo7vCqOY58PyVuhp49Z+jHyIEmIyRLsU9WOWYNtPLg8XDnt1WLSst5VNyDlJJehbvm7gbXewxrPrG+ukZgo11GYJyU42DqNr59D3pQak7P2Ho6zFvN0XJ+lnVXJ1NTmgQFQYeFksTZFmJmQ5peHxpJy5XBvqjfYOEdlkeiiPKTnTQaQWKJfC9CRtWfTTYM2VKMBSTB0eNWto5XAu5BvgEgTXzndHGzsWW7pOHLqxVagr0xhNPPCB2DRE5PClE2FD9qNv0JcSMnUJ8bLvk6Yeh7mMDObJ4kBif5G9VnHjTqTg==";
//    decWithPublicKey = [RSA decryptString:encWithPrivKey publicKey:pubkey];
//    NSLog(@"(PHP enc)Decrypted with public key: %@", decWithPublicKey);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
