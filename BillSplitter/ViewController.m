//
//  ViewController.m
//  BillSplitter
//
//  Created by Noor Alhoussari on 2017-06-10.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//
// Now you'll need to implement the actual calculation. Do this using the NSDecimalNumber class, in order to keep accuracy when dealing with currency. You will most likely find it handy to use an NSNumberFormatter object to create a number from the string in the text field, and to turn the number of the split amount back into text to display in the label.

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeople;
@property (weak, nonatomic) IBOutlet UILabel *amountForEachPerson;
@property (weak, nonatomic) IBOutlet UILabel *displayNumberOfPeople;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)peopleToSplit:(id)sender {
    NSString *numberOfPeopleString = [NSString stringWithFormat:@"%d", (int)self.numberOfPeople.value];
    self.displayNumberOfPeople.text = numberOfPeopleString;
}

- (IBAction)calculateSplitAmount:(id)sender{
    
    //converting billAmount to string then to NSDecimalNumber
    NSString *billAmountString = [self.billAmount text];
    NSDecimalNumber *billAmountDecimalNumber = [[NSDecimalNumber alloc] initWithString:billAmountString];
    
    //converting numberOfPeople to string then to NSDecimalNumber
    NSString *numberOfPeopleString = [NSString stringWithFormat:@"%d", (int)self.numberOfPeople.value];
    NSDecimalNumber *numberOfPeopleDecimalNumber = [[NSDecimalNumber alloc] initWithString:numberOfPeopleString];

    //doing the deision with NSDecimalNumber function
    NSNumber *result = [billAmountDecimalNumber decimalNumberByDividingBy:numberOfPeopleDecimalNumber];
    
    //converting back to string
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *billAmountForEach = [formatter stringFromNumber:result];

    self.amountForEachPerson.text = billAmountForEach;
    
    
    
    
//    * example:
//     - (NSString*)convertToLocalCurrencyFormat:(NSDecimalNumber*)result {
//         NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
//         formatter.numberStyle = NSNumberFormatterCurrencyStyle;
//         formatter.currencyCode = self.comparisonCurrency;
//         formatter.usesSignificantDigits = YES;
//         return [formatter stringFromNumber:result];
//     }]
//    formatter.minimumFractionDigits = 2;
    
//    ** example to set a percentage/discount of 5%:
//   
//    // Use strings to create NSDecimalNumber
//    NSDecimalNumber *ipa = [NSDecimalNumber decimalNumberWithString:@"6.99"];
//    
//    // Use decimal with mantissa to create NSDecimalNumber
//    NSDecimalNumber *happyHourDiscount = [NSDecimalNumber decimalNumberWithMantissa:95
//                        exponent:-2 isNegative:NO];
//    
//    NSDecimalNumber *stoutDiscount = [stout decimalNumberByMultiplyingBy:happyHourDiscount];
//    NSDecimalNumber *ipaDiscount = [ipa decimalNumberByMultiplyingBy:happyHourDiscount];
//
    
    
//    *** example two ways to define 199.08:
//    NSDecimalNumber *value1 = [NSDecimalNumber decimalNumberWithMantissa:19908
//                                                                exponent:-2
//                                                              isNegative:NO];
//    
//    NSDecimalNumber *value2 = [NSDecimalNumber decimalNumberWithString:@"199.08"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
