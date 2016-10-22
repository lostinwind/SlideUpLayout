//
//  BottomSlideLayout.m
//  SlideUpLayout
//
//  Created by 史一峰 on 16/10/21.
//  Copyright © 2016年 史一峰. All rights reserved.
//

#import "BottomSlideLayout.h"

@implementation BottomSlideLayout

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(24, 40, screenWidth-48, 40)];
        label.textColor = [UIColor whiteColor];
        label.text = @"为什么说锤子这样第三阵营手机厂商难过寒冬？";
        label.font = [UIFont fontWithName:UIFontSlantTrait size:24];
        [self addSubview:label];
        
        UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(24, 80, screenWidth-48, screenHeight-100)];
        textView.textColor = [UIColor whiteColor];
        textView.text = @"随着国产手机厂商的崛起，目前国内手机市场已经呈现出“国货已自强”的态势。但就算国产手机已经在国内横行无忌，还是得分为三六九等。市场调研公司赛诺Sino发布的《2016年上半年中国智能手机销量TOP20报告》显示，以华为、小米、OPPO、VIVO、魅族等为代表的是一线厂商，在今年上半年处于国内智能手机市场销量Top10的位置。而联想、中兴、360等则位于Top11-20的位置，属于第二阵营。至于其他的，只能是划分到第三阵营中。这部分在销量统计中被划分到“其他”类的第三阵营手机厂商，目前活得非常艰难，普遍面对很多问题：资金不足、开发能力受制约、外观趋于相似、对上下游企业没有掌控能力、安装有山寨无授权应用……在2016年年末之际，不妨看看这些第三阵营手机厂商，遭遇到的困难及未来发展态势。困难重重 第三阵营厂商泪奔ing.首先必须要说的是，之所以被划分为第三阵营厂商，并不在于人气差、关注低，仅仅是因为销量太差。相反，某些第三阵营厂商从不缺乏关注度。比如锤子手机，因为“相声演员”罗永浩的存在，一直保持着较高的热度。但人气高却并没有转化为实际的销量，从第一代锤子手机发布至今，锤子手机出货量累计仅在百万台左右。相比动辄年销量破千万、数千万的一线阵营厂商来说，几乎是可以忽略不计的数字。第三阵营手机厂商面对的问题很多，最重要的就是大多为创业企业，独自在手机市场闯荡，各方面能力都有所欠缺。比如今年6月份发布一加3的时候，一加CEO刘作虎提前放话“坚决不做PPT手机”。然而，最终还是被羸弱的产能来了一个狠狠的教训。对此刘作虎表示，“虽然每天被人骂PPT手机，但也没办法。市场反馈比预期好很多，加量的时候又遇到行业性的关键资源紧张，所以目前产能还是没法完全满足市场需求。”第三阵营手机厂商对上下游企业的掌控能力之弱，由此可见一斑。第三阵营厂商普遍资金不足，导致在开发上缩手缩脚。为了节约成本，只能是多方借鉴。从锤子新发布的M系列手机来看，就像是iPhone乃至魅族手机进行了小幅“整容”而已。而没有自己原创的特色，如何能够吸引对手机设计、颜值要求愈来愈高的消费者？而除了这些尚属新锐的第三阵营厂商以外，更多的是那些山寨手机厂商。抛开毫无创意的山寨公模外形不谈，内置无法卸载的山寨应用已经成为他们的“吸金利器”。虽然此前已经出现成效，能够牟取暴利，但却失去了消费者的信赖。在一线阵营厂商旗下的手机价格不断下探的情况下，山寨手机厂商又将能存在多久？";
        textView.font = [UIFont fontWithName:UIFontSlantTrait size:16];
        textView.backgroundColor = [UIColor grayColor];
        [self addSubview:textView];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

@end
