# ObjcBlock
一个简单的库，给UILabel、UIButtton、 UIImageview、UIView的基础属性添加block语法，可以实现链式设置，可以将长串的设置集中到一个block中，
实现类似masonry的效果。当前设置的属性并不多，不过模版已经打好，可以根据自己需要自行添加。
demo：
UIView * new = [UIView gd_view:^(UIView *view) {
     view.gd_frame(CGRectMake(0, 0, 100, 100)).gd_backgroundColor([UIColor greenColor]);
     view.gd_addTapgesture(self,@selector(playGo:));
 }];
[self.window addSubview:new];
