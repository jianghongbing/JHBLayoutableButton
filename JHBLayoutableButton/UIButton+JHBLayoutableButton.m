//
//  UIButton+JHBLayoutableButton.m
//  JHBLayoutableButton
//
//  Created by pantosoft on 2018/3/22.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "UIButton+JHBLayoutableButton.h"
@interface JHBLayoutableButton : UIButton
@property (nonatomic) JHBLayoutableButtonStyle style;
@property (nonatomic) CGFloat space;
@property (nonatomic, strong) UIFont *titleLabelFont;
@property (nonatomic) NSInteger titleLabelNumberOfLines;
@end

static NSString * const kJHBTitleLabelFontKeyPath = @"font";
static NSString * const kJHBTitleLabelNumberOfLinesKeyPath = @"numberOfLines";

@implementation JHBLayoutableButton
#pragma mark initializer
- (instancetype)initWithLayoutStyle:(JHBLayoutableButtonStyle)style space:(CGFloat)space {
    self = [super init];
    if(self) {
        _style = style;
        _space = space;
        _titleLabelFont = self.titleLabel.font;
        _titleLabelNumberOfLines = 1;
        [self.titleLabel addObserver:self forKeyPath:kJHBTitleLabelFontKeyPath options:NSKeyValueObservingOptionNew context:nil];
        [self.titleLabel addObserver:self forKeyPath:kJHBTitleLabelNumberOfLinesKeyPath options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

#pragma mark dealloc
- (void)dealloc {
    [self.titleLabel removeObserver:self forKeyPath:kJHBTitleLabelFontKeyPath];
    [self.titleLabel removeObserver:self forKeyPath:kJHBTitleLabelNumberOfLinesKeyPath];
}

#pragma mark KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (object == self.titleLabel && [keyPath isEqualToString:kJHBTitleLabelFontKeyPath]) {
        self.titleLabelFont = change[NSKeyValueChangeNewKey];
    }else if (object == self.titleLabel && [keyPath isEqualToString:kJHBTitleLabelNumberOfLinesKeyPath]) {
        self.titleLabelNumberOfLines = [change[NSKeyValueChangeNewKey] integerValue];
    }
}

#pragma mark override
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageX = [self p_imageX];
    CGFloat imageY = [self p_imageY];
    CGSize imageSize = [self p_imageSize];
    CGFloat imageWidth = imageSize.width;
    CGFloat imageHeight = imageSize.height;
    NSLog(@"imageX:%f, imageY:%f, imageWidth:%f, imageHeight:%f", imageX, imageY, imageWidth, imageHeight);
    NSLog(@"bounds:%@,contentRect:%@", NSStringFromCGRect(self.bounds), NSStringFromCGRect(contentRect));
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = [self p_titleLabelX];
    CGFloat titleY = [self p_titleLabelY];
    CGSize titleLabelSize = [self p_titleLabelSize];
    CGFloat titleWidth = titleLabelSize.width;
    CGFloat titleHeight = titleLabelSize.height;
    NSLog(@"titleX:%f,titleY:%f,titleWidth:%f,titleHeight:%f", titleX, titleY, titleWidth, titleHeight);
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

- (CGSize)intrinsicContentSize {
    CGFloat width = [super intrinsicContentSize].width;
    CGFloat height = [super intrinsicContentSize].height;
    UIEdgeInsets imageEdgeInsets = [self p_imageEdgeInsets];
    UIEdgeInsets titleEdgeInsets = [self p_titleEdgeInsets];
    CGFloat space = [self p_spaceBetweenImageViewAndTitleLabel];
    CGSize imageViewIntrinsicContentSize = self.imageView.intrinsicContentSize;
    CGSize titleLabelIntrinsicContentSize = self.titleLabel.intrinsicContentSize;
    switch (self.style) {
        case JHBLayoutableButtonStyleILTR:
        case JHBLayoutableButtonStyleIRTL: {
            width = self.contentEdgeInsets.left + imageEdgeInsets.left + imageViewIntrinsicContentSize.width + imageEdgeInsets.right + space + titleEdgeInsets.left + titleLabelIntrinsicContentSize.width + titleEdgeInsets.right + self.contentEdgeInsets.right;
            height = MAX(imageViewIntrinsicContentSize.height + imageEdgeInsets.top + imageEdgeInsets.bottom, titleLabelIntrinsicContentSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom) + self.contentEdgeInsets.top + self.contentEdgeInsets.bottom;
        }
            break;
        case JHBLayoutableButtonStyleITTB:
        case JHBLayoutableButtonStyleIBTT: {
            width = MAX(imageViewIntrinsicContentSize.width + imageEdgeInsets.left + imageEdgeInsets.right, titleLabelIntrinsicContentSize.width + titleEdgeInsets.left + titleEdgeInsets.right) + self.contentEdgeInsets.left + self.contentEdgeInsets.left;
            height = self.contentEdgeInsets.top + imageEdgeInsets.top + imageViewIntrinsicContentSize.height + imageEdgeInsets.bottom + space + titleEdgeInsets.top + titleLabelIntrinsicContentSize.height + titleEdgeInsets.bottom + self.contentEdgeInsets.bottom;
        }
            break;
        default:
            break;
    }
    return CGSizeMake(width, height);
}


#pragma mark helper
- (BOOL)p_imageIsValid {
    UIImage *image = [self imageForState:self.state];
    return image != nil && image.size.width > 0 && image.size.height > 0;
}

- (BOOL)p_titleIsValid {
    NSAttributedString *attributeTitle = [self attributedTitleForState:self.state];
    NSString *title = [self titleForState:self.state];
    return (attributeTitle != nil && attributeTitle.length > 0) || (title != nil && title.length > 0);
}

- (CGSize)p_imageSize {
    if (![self p_imageIsValid]) {
        return CGSizeZero;
    }
    UIImage *image = [self imageForState:self.state];
    CGFloat buttonWidth = self.bounds.size.width;
    CGFloat buttonHeight = self.bounds.size.height;
    CGFloat imageWidth =  MIN(image.size.width, buttonWidth - self.contentEdgeInsets.left - self.contentEdgeInsets.right - self.imageEdgeInsets.left - self.imageEdgeInsets.right);
    CGFloat imageHeight = MIN(image.size.height, buttonHeight - self.contentEdgeInsets.top - self.contentEdgeInsets.bottom - self.imageEdgeInsets.top - self.imageEdgeInsets.bottom);
    return CGSizeMake(imageWidth, imageHeight);
}

- (CGFloat)p_imageX {
    if (![self p_imageIsValid]) return 0.0;
    CGFloat buttonWidth = self.bounds.size.width;
    CGFloat imageWidth = [self p_imageSize].width;
    CGFloat imageX = 0;
    if (![self p_titleIsValid]) {
        imageX = (buttonWidth - imageWidth + self.contentEdgeInsets.left - self.contentEdgeInsets.right + self.imageEdgeInsets.left - self.imageEdgeInsets.right) * 0.5;
    }else {
        switch (self.style) {
            case JHBLayoutableButtonStyleILTR:
                imageX = MAX(self.contentEdgeInsets.left,[self p_centerHorizonalContentMargin])  + self.imageEdgeInsets.left - self.imageEdgeInsets.right;
                break;
            case JHBLayoutableButtonStyleIRTL:
                imageX = buttonWidth - imageWidth - MAX(self.contentEdgeInsets.right, [self p_centerHorizonalContentMargin])  + self.imageEdgeInsets.left - self.imageEdgeInsets.right;
                break;
            case JHBLayoutableButtonStyleITTB:
            case JHBLayoutableButtonStyleIBTT:
                imageX = (buttonWidth - imageWidth + self.contentEdgeInsets.left - self.contentEdgeInsets.right + self.imageEdgeInsets.left - self.contentEdgeInsets.right) * 0.5;
                break;
            default:
                break;
        }
    }
    return imageX;
}



- (CGFloat)p_imageY {
    if (![self p_imageIsValid]) return 0.0;
    if (![self p_imageIsValid]) return 0.0;
    CGFloat buttonHeight = self.bounds.size.height;
    CGFloat imageHeight = [self p_imageSize].height;
    CGFloat imageY = 0;
    if (![self p_titleIsValid]) {
        imageY = (buttonHeight - imageHeight + self.contentEdgeInsets.top - self.contentEdgeInsets.bottom + self.imageEdgeInsets.top - self.imageEdgeInsets.bottom) * 0.5;
    }else {
        switch (self.style) {
            case JHBLayoutableButtonStyleILTR:
            case JHBLayoutableButtonStyleIRTL:
                imageY = (buttonHeight - imageHeight + self.contentEdgeInsets.top - self.contentEdgeInsets.bottom + self.imageEdgeInsets.top - self.imageEdgeInsets.bottom) * 0.5;
                break;
            case JHBLayoutableButtonStyleITTB:
                imageY = MAX(self.contentEdgeInsets.top, [self p_centerVerticalContentMargin]) + self.imageEdgeInsets.top - self.imageEdgeInsets.bottom;
                break;
            case JHBLayoutableButtonStyleIBTT:
                imageY = buttonHeight - imageHeight - MAX(self.contentEdgeInsets.bottom, [self p_centerVerticalContentMargin]) + self.imageEdgeInsets.top - self.imageEdgeInsets.bottom;
                break;
            default:
                break;
        }
    }
    return imageY;
}


- (CGSize)p_titleLabelSize {
    if (![self p_titleIsValid]) return CGSizeZero;
    CGFloat maxWidth = [self p_titleLabelMaxWidth];
    CGFloat maxHeight = [self p_titleLabelMaxHeight];
    if (maxWidth <= 0 || maxHeight <= 0) {
        return CGSizeZero;
    }
    CGSize size = CGSizeZero;
    NSStringDrawingOptions options = self.titleLabelNumberOfLines == 1 ? NSStringDrawingUsesFontLeading :  NSStringDrawingUsesLineFragmentOrigin;
    
    NSAttributedString *attributeTitle = [self attributedTitleForState:self.state];
    if (attributeTitle != nil) {
        size = [attributeTitle boundingRectWithSize:CGSizeMake(maxWidth, maxHeight) options:options context:nil].size;
    }else {
        NSString *title = [self titleForState:self.state];
        if (title != nil) {
            size = [title boundingRectWithSize:CGSizeMake(maxWidth, maxHeight) options:options attributes:@{NSFontAttributeName: self.titleLabelFont} context:nil].size;
        }
    }
    return size;
}

- (CGFloat)p_titleLabelX{
    if (![self p_titleIsValid]) return 0.0;
    CGFloat titleLabelX = 0;
    CGFloat buttonWidth = self.bounds.size.width;
    CGFloat labelWidth = [self p_titleLabelSize].width;
    if (![self p_imageIsValid]) {
        titleLabelX = (buttonWidth - labelWidth + self.contentEdgeInsets.left - self.contentEdgeInsets.right + self.titleEdgeInsets.left - self.titleEdgeInsets.right) * 0.5;
    }else {
        CGFloat imageX = [self p_imageX];
        CGFloat imageWidth = [self p_imageSize].width;
        switch (self.style) {
            case JHBLayoutableButtonStyleILTR:
                titleLabelX = imageX + imageWidth  + self.space + self.titleEdgeInsets.left - self.titleEdgeInsets.right;
                break;
            case JHBLayoutableButtonStyleIRTL:
                titleLabelX = imageX - labelWidth - self.space + self.titleEdgeInsets.left - self.titleEdgeInsets.right;
                break;
            case JHBLayoutableButtonStyleITTB:
            case JHBLayoutableButtonStyleIBTT:
                titleLabelX = (buttonWidth - labelWidth + self.contentEdgeInsets.left - self.contentEdgeInsets.right + self.titleEdgeInsets.left - self.titleEdgeInsets.right) * 0.5;
                break;
                
            default:
                break;
        }
    }
    return titleLabelX;
}


- (CGFloat)p_titleLabelY {
    if (![self p_titleIsValid]) return 0.0;
    CGFloat titleLabelY = 0;
    CGFloat buttonHeight = self.bounds.size.height;
    CGFloat labelHeight = [self p_titleLabelSize].height;
    if (![self p_imageIsValid]) {
        titleLabelY = (buttonHeight - labelHeight + self.contentEdgeInsets.top - self.contentEdgeInsets.bottom + self.titleEdgeInsets.top - self.titleEdgeInsets.bottom) * 0.5;
    }else {
        CGFloat imageY = [self p_imageY];
        CGFloat imageHeight = [self p_imageSize].height;
        switch (self.style) {
            case JHBLayoutableButtonStyleILTR:
            case JHBLayoutableButtonStyleIRTL:
                titleLabelY = (buttonHeight - labelHeight + self.contentEdgeInsets.top - self.contentEdgeInsets.bottom + self.titleEdgeInsets.top - self.titleEdgeInsets.bottom) * 0.5;
                break;
            case JHBLayoutableButtonStyleITTB:
                titleLabelY = imageY + imageHeight + self.space + self.titleEdgeInsets.top - self.titleEdgeInsets.bottom;
                break;
            case JHBLayoutableButtonStyleIBTT:
                titleLabelY = imageY - labelHeight - self.space + self.titleEdgeInsets.top - self.titleEdgeInsets.bottom;
                break;
            default:
                break;
        }
    }
    return titleLabelY;
}

- (CGFloat)p_titleLabelMaxWidth {
    if (![self p_titleIsValid]) return 0;
    UIEdgeInsets imageEdgeInsets = [self p_imageEdgeInsets];
    UIEdgeInsets titleEdgeInsets = [self p_titleEdgeInsets];
    CGFloat space = [self p_spaceBetweenImageViewAndTitleLabel];
    CGFloat maxWidth = 0;
    CGFloat imageWidth = [self p_imageSize].width;
    if (self.style == JHBLayoutableButtonStyleILTR || self.style == JHBLayoutableButtonStyleIRTL) {
        maxWidth = self.bounds.size.width - imageWidth - self.contentEdgeInsets.left - self.contentEdgeInsets.right - space - imageEdgeInsets.left - imageEdgeInsets.right - titleEdgeInsets.left - titleEdgeInsets.right;
    }else if (self.style == JHBLayoutableButtonStyleITTB || self.style == JHBLayoutableButtonStyleIBTT) {
        maxWidth = self.bounds.size.width - self.contentEdgeInsets.left - self.contentEdgeInsets.right - titleEdgeInsets.left - titleEdgeInsets.right;
    }
    return MAX(maxWidth, 0);
}

- (CGFloat)p_titleLabelMaxHeight {
    if (![self p_titleIsValid]) return 0;
    UIEdgeInsets imageEdgeInsets = [self p_imageEdgeInsets];
    UIEdgeInsets titleEdgeInsets = [self p_titleEdgeInsets];
    CGFloat space = [self p_spaceBetweenImageViewAndTitleLabel];
    CGFloat imageHeight = [self p_imageSize].height;
    CGFloat maxHeight = 0;
    if (self.style == JHBLayoutableButtonStyleILTR || self.style == JHBLayoutableButtonStyleIRTL) {
        maxHeight = self.bounds.size.height - self.contentEdgeInsets.top - self.contentEdgeInsets.bottom - titleEdgeInsets.top - titleEdgeInsets.bottom;
    }else if (self.style == JHBLayoutableButtonStyleITTB || self.style == JHBLayoutableButtonStyleIBTT) {
        maxHeight = self.bounds.size.height - self.contentEdgeInsets.top - self.contentEdgeInsets.bottom - imageHeight -imageEdgeInsets.top - imageEdgeInsets.bottom - space - titleEdgeInsets.top - titleEdgeInsets.bottom;
    }
    return MAX(maxHeight, 0);
}


- (CGFloat)p_centerHorizonalContentMargin {
    CGFloat buttonWidth = self.bounds.size.width;
    CGFloat imageWidth = [self p_imageSize].width;
    CGFloat labelWidth = [self p_titleLabelSize].width;
    CGFloat space = [self p_spaceBetweenImageViewAndTitleLabel];
    CGFloat margin = (buttonWidth - space - imageWidth - labelWidth) * 0.5;
    return MAX(margin, 0);
}

- (CGFloat)p_centerVerticalContentMargin{
    CGFloat buttonHeight = self.bounds.size.height;
    CGFloat imageHeight = [self p_imageSize].height;
    CGFloat labelHeight = [self p_titleLabelSize].height;
    CGFloat space = [self p_spaceBetweenImageViewAndTitleLabel];
    CGFloat margin = (buttonHeight - space - imageHeight - labelHeight) * 0.5;
    return MAX(margin, 0);
}


- (UIEdgeInsets)p_contentEdgeInsets {
    return self.contentEdgeInsets;
}

- (UIEdgeInsets)p_imageEdgeInsets {
    return [self p_imageIsValid] ? self.imageEdgeInsets : UIEdgeInsetsZero;
}

- (UIEdgeInsets)p_titleEdgeInsets {
    return [self p_titleIsValid] ? self.titleEdgeInsets : UIEdgeInsetsZero;
}

- (CGFloat)p_spaceBetweenImageViewAndTitleLabel {
    return [self p_imageIsValid] && [self p_titleIsValid] ? self.space : 0;
}

//- (CGSize)p_imageViewIntrinsicContentSize {
//    return self.imageView.intrinsicContentSize;
//}
//
//
//- (CGSize)p_titleLabelIntrisicContentSize {
//    return self.titleLabel.intrinsicContentSize;
//}

@end

@implementation UIButton (JHBLayoutableButton)
+ (UIButton *)buttonWithLayoutStyle:(JHBLayoutableButtonStyle)layoutStyle spaceBetweenImageAndTitle:(CGFloat)space {
    return [[JHBLayoutableButton alloc] initWithLayoutStyle:layoutStyle space:space];
}
@end
