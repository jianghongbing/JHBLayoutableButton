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
@end

@implementation JHBLayoutableButton
- (instancetype)initWithLayoutStyle:(JHBLayoutableButtonStyle)style space:(CGFloat)space {
    self = [super init];
    if(self) {
        _style = style;
        _space = space;
        _titleLabelFont = self.titleLabel.font;
        [self.titleLabel addObserver:self forKeyPath:@"font" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)dealloc {
    [self.titleLabel removeObserver:self forKeyPath:@"font"];
}

#pragma mark KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (object == self.titleLabel && [keyPath isEqualToString:@"font"]) {
        self.titleLabelFont = change[NSKeyValueChangeNewKey];
    }
}

#pragma mark override
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageX = [self p_imageX:self.style];
    CGFloat imageY = [self p_imageY:self.style];
    CGSize imageSize = [self p_imageSize];
    CGFloat imageWidth = imageSize.width;
    CGFloat imageHeight = imageSize.height;
    NSLog(@"imageX:%f, imageY:%f, imageWidth:%f, imageHeight:%f", imageX, imageY, imageHeight, imageWidth);
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = [self p_titleLabelX:self.style];
    CGFloat titleY = [self p_titleLabelY:self.style];
    CGSize titleLabelSize = [self p_titleLabelSize:self.style];
    CGFloat titleWidth = titleLabelSize.width;
    CGFloat titleHeight = titleLabelSize.height;
    NSLog(@"titleX:%f,titleY:%f,titleWidth:%f,titleHeight:%f", titleX, titleY, titleWidth, titleHeight);
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

- (CGSize)intrinsicContentSize {
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    switch (self.style) {
        case JHBLayoutableButtonStyleILTR:
        case JHBLayoutableButtonStyleIRTL: {
            width = self.contentEdgeInsets.left + self.imageEdgeInsets.left + self.imageView.intrinsicContentSize.width + self.imageEdgeInsets.right + self.space + self.titleEdgeInsets.left + self.titleLabel.intrinsicContentSize.width + self.titleEdgeInsets.right + self.contentEdgeInsets.right;
            height = MAX(self.imageView.intrinsicContentSize.height + self.imageEdgeInsets.top + self.imageEdgeInsets.bottom, self.titleLabel.intrinsicContentSize.height + self.titleEdgeInsets.top + self.titleEdgeInsets.bottom) + self.contentEdgeInsets.top + self.contentEdgeInsets.bottom;
        }
            break;
        case JHBLayoutableButtonStyleITTB:
        case JHBLayoutableButtonStyleIBTT: {
            width = MAX(self.imageView.intrinsicContentSize.width + self.imageEdgeInsets.left + self.imageEdgeInsets.right, self.titleLabel.intrinsicContentSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right) + self.contentEdgeInsets.left + self.contentEdgeInsets.left;
            height = self.contentEdgeInsets.top + self.imageEdgeInsets.top + self.imageView.intrinsicContentSize.height + self.imageEdgeInsets.bottom + self.space + self.titleEdgeInsets.top + self.titleLabel.intrinsicContentSize.height + self.titleEdgeInsets.bottom + self.contentEdgeInsets.bottom;
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

- (CGFloat)p_imageX:(JHBLayoutableButtonStyle)buttonLayoutStyle {
    if (![self p_imageIsValid]) return 0.0;
    CGFloat buttonWidth = self.bounds.size.width;
    CGFloat imageWidth = [self p_imageSize].width;
    CGFloat imageX = 0;
    if (![self p_titleIsValid]) {
        imageX = (buttonWidth - imageWidth + self.contentEdgeInsets.left - self.contentEdgeInsets.right + self.imageEdgeInsets.left - self.contentEdgeInsets.right) * 0.5;
    }else {
        switch (buttonLayoutStyle) {
            case JHBLayoutableButtonStyleILTR:
                imageX = self.contentEdgeInsets.left - [self p_centerHorizonalContentMargin:self.style]  + self.imageEdgeInsets.left - self.imageEdgeInsets.right;
                break;
            case JHBLayoutableButtonStyleIRTL:
                imageX = buttonWidth - imageWidth - self.contentEdgeInsets.right + [self p_centerHorizonalContentMargin:self.style]  + self.imageEdgeInsets.left - self.imageEdgeInsets.right;
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



- (CGFloat)p_imageY:(JHBLayoutableButtonStyle)buttonLayoutStyle {
    if (![self p_imageIsValid]) return 0.0;
    if (![self p_imageIsValid]) return 0.0;
    CGFloat buttonHeight = self.bounds.size.height;
    CGFloat imageHeight = [self p_imageSize].height;
    CGFloat imageY = 0;
    if (![self p_titleIsValid]) {
        imageY = (buttonHeight - imageHeight + self.contentEdgeInsets.top - self.contentEdgeInsets.bottom + self.imageEdgeInsets.top - self.contentEdgeInsets.bottom) * 0.5;
    }else {
        switch (buttonLayoutStyle) {
            case JHBLayoutableButtonStyleILTR:
            case JHBLayoutableButtonStyleIRTL:
                imageY = (buttonHeight - imageHeight + self.contentEdgeInsets.top - self.contentEdgeInsets.bottom + self.imageEdgeInsets.top - self.contentEdgeInsets.bottom) * 0.5;
                break;
            case JHBLayoutableButtonStyleITTB:
                imageY = self.contentEdgeInsets.top - [self p_centerVerticalContentMargin:self.style] + self.imageEdgeInsets.top - self.imageEdgeInsets.bottom;
                break;
            case JHBLayoutableButtonStyleIBTT:
                imageY = buttonHeight - imageHeight - self.contentEdgeInsets.bottom + [self p_centerVerticalContentMargin:self.style] + self.imageEdgeInsets.top - self.imageEdgeInsets.bottom;
                break;
            default:
                break;
        }
    }
    return imageY;
}


- (CGSize)p_titleLabelSize:(JHBLayoutableButtonStyle)buttonLayoutStyle {
    if (![self p_titleIsValid]) return CGSizeZero;
    CGFloat maxWidth = [self p_titleLabelMaxWidth:buttonLayoutStyle];
    CGFloat maxHeight = [self p_titleLabelMaxHeight:buttonLayoutStyle];
    if (maxWidth <= 0 || maxHeight <= 0) {
        return CGSizeZero;
    }
    CGSize size = CGSizeZero;
    NSAttributedString *attributeTitle = [self attributedTitleForState:self.state];
    if (attributeTitle != nil) {
        size = [attributeTitle boundingRectWithSize:CGSizeMake(maxWidth, maxHeight) options:NSStringDrawingUsesFontLeading context:nil].size;
    }else {
        NSString *title = [self titleForState:self.state];
        if (title != nil) {
            size = [title boundingRectWithSize:CGSizeMake(maxWidth, maxHeight) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: self.titleLabelFont} context:nil].size;
        }
    }
    return size;
}

- (CGFloat)p_titleLabelX:(JHBLayoutableButtonStyle)buttonLayoutStyle {
    if (![self p_titleIsValid]) return 0.0;
    CGFloat titleLabelX = 0;
    CGFloat buttonWidth = self.bounds.size.width;
    CGFloat labelWidth = [self p_titleLabelSize: buttonLayoutStyle].width;
    if (![self p_imageIsValid]) {
        titleLabelX = (buttonWidth - labelWidth + self.contentEdgeInsets.left - self.contentEdgeInsets.right + self.imageEdgeInsets.left - self.contentEdgeInsets.right) * 0.5;
    }else {
        CGFloat imageX = [self p_imageX:buttonLayoutStyle];
        CGFloat imageWidth = [self p_imageSize].width;
        switch (buttonLayoutStyle) {
            case JHBLayoutableButtonStyleILTR:
                titleLabelX = imageX + imageWidth  + self.space + self.titleEdgeInsets.left - self.titleEdgeInsets.right;
                break;
            case JHBLayoutableButtonStyleIRTL:
                titleLabelX = imageX + imageWidth - self.space + self.titleEdgeInsets.left - self.titleEdgeInsets.right;
                break;
            case JHBLayoutableButtonStyleITTB:
            case JHBLayoutableButtonStyleIBTT:
                titleLabelX = (buttonWidth - labelWidth + self.contentEdgeInsets.left - self.contentEdgeInsets.right + self.imageEdgeInsets.left - self.contentEdgeInsets.right) * 0.5;
                break;
                
            default:
                break;
        }
    }
    return titleLabelX;
}


- (CGFloat)p_titleLabelY:(JHBLayoutableButtonStyle)buttonLayoutStyle {
    if (![self p_titleIsValid]) return 0.0;
    CGFloat titleLabelY = 0;
    CGFloat buttonHeight = self.bounds.size.height;
    CGFloat labelHeight = [self p_titleLabelSize: buttonLayoutStyle].height;
    if (![self p_imageIsValid]) {
        titleLabelY = (buttonHeight - labelHeight + self.contentEdgeInsets.top - self.contentEdgeInsets.bottom + self.imageEdgeInsets.top - self.contentEdgeInsets.bottom) * 0.5;
    }else {
        CGFloat imageY = [self p_imageY:buttonLayoutStyle];
        CGFloat imageHeight = [self p_imageSize].height;
        switch (buttonLayoutStyle) {
            case JHBLayoutableButtonStyleILTR:
            case JHBLayoutableButtonStyleIRTL:
                titleLabelY = (buttonHeight - labelHeight + self.contentEdgeInsets.top - self.contentEdgeInsets.bottom + self.imageEdgeInsets.top - self.contentEdgeInsets.bottom) * 0.5;
                break;
            case JHBLayoutableButtonStyleITTB:
                titleLabelY = imageY + imageHeight + self.space + self.titleEdgeInsets.top - self.titleEdgeInsets.bottom;
                break;
            case JHBLayoutableButtonStyleIBTT:
                titleLabelY = imageY + imageHeight - self.space + self.titleEdgeInsets.top - self.titleEdgeInsets.bottom;
                break;
            default:
                break;
        }
    }
    return titleLabelY;
}




- (CGFloat)p_titleLabelMaxWidth:(JHBLayoutableButtonStyle)buttonLayoutStyle {
    if (![self p_titleIsValid]) return 0;
    UIEdgeInsets imageEdgeInsets = self.imageEdgeInsets;
    CGFloat space = self.space;
    if (![self p_imageIsValid]) {
        imageEdgeInsets = UIEdgeInsetsZero;
        space = 0;
    }
    CGFloat maxWidth = 0;
    CGFloat imageWidth = [self p_imageSize].width;
    if (buttonLayoutStyle == JHBLayoutableButtonStyleILTR || buttonLayoutStyle == JHBLayoutableButtonStyleIRTL) {
        maxWidth = self.bounds.size.width - imageWidth - self.contentEdgeInsets.left - self.contentEdgeInsets.right - space - imageEdgeInsets.left - imageEdgeInsets.right - self.titleEdgeInsets.left - self.imageEdgeInsets.right;
    }else if (buttonLayoutStyle == JHBLayoutableButtonStyleITTB || buttonLayoutStyle == JHBLayoutableButtonStyleIBTT) {
        maxWidth = self.bounds.size.width - self.contentEdgeInsets.left - self.contentEdgeInsets.right - self.titleEdgeInsets.left - self.titleEdgeInsets.right;
    }
    return MAX(maxWidth, 0);
}

- (CGFloat)p_titleLabelMaxHeight:(JHBLayoutableButtonStyle)buttonLayoutStyle {
    if (![self p_titleIsValid]) return 0;
    UIEdgeInsets imageEdgeInsets = self.imageEdgeInsets;
    CGFloat space = self.space;
    if (![self p_imageIsValid]) {
        imageEdgeInsets = UIEdgeInsetsZero;
        space = 0;
    }
    CGFloat imageHeight = [self p_imageSize].height;
    CGFloat maxHeight = 0;
    if (buttonLayoutStyle == JHBLayoutableButtonStyleILTR || buttonLayoutStyle == JHBLayoutableButtonStyleIRTL) {
        maxHeight = self.bounds.size.height - self.contentEdgeInsets.top - self.contentEdgeInsets.bottom - self.titleEdgeInsets.top - self.titleEdgeInsets.bottom;
    }else if (buttonLayoutStyle == JHBLayoutableButtonStyleITTB || buttonLayoutStyle == JHBLayoutableButtonStyleIBTT) {
        maxHeight = self.bounds.size.height - self.contentEdgeInsets.top - self.contentEdgeInsets.bottom - imageHeight -imageEdgeInsets.top - imageEdgeInsets.bottom - space - self.titleEdgeInsets.left - self.titleEdgeInsets.right;
    }
    return MAX(maxHeight, 0);
}


- (CGFloat)p_centerHorizonalContentMargin:(JHBLayoutableButtonStyle)buttonLayoutStyle {
    CGFloat buttonWidth = self.bounds.size.width;
    CGFloat imageWidth = [self p_imageSize].width;
    CGFloat labelWidth = [self p_titleLabelSize:buttonLayoutStyle].width;
    CGFloat margin = (buttonWidth - self.contentEdgeInsets.left - self.contentEdgeInsets.right - self.space - imageWidth - labelWidth) * 0.5;
    
    return MAX(margin, 0);
}

- (CGFloat)p_centerVerticalContentMargin:(JHBLayoutableButtonStyle)buttonLayoutStyle {
    CGFloat buttonHeight = self.bounds.size.height;
    CGFloat imageHeight = [self p_imageSize].height;
    CGFloat labelHeight = [self p_titleLabelSize:buttonLayoutStyle].height;
    CGFloat margin = (buttonHeight - self.contentEdgeInsets.top - self.contentEdgeInsets.bottom - self.space - imageHeight - labelHeight) * 0.5;
    return MAX(margin, 0);
}




@end

@implementation UIButton (JHBLayoutableButton)
+ (UIButton *)buttonWithLayoutStyle:(JHBLayoutableButtonStyle)layoutStyle spaceBetweenImageAndTitle:(CGFloat)space {
    return [[JHBLayoutableButton alloc] initWithLayoutStyle:layoutStyle space:space];
}
@end
