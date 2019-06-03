一个简单的库，给UILabel、UIButtton、 UIImageview、UIView的基础属性添加block语法，可以实现类似masonry链式效果，
可以将控件设置集中到一个block中。不过当前设置的属性并不多，可根据模版自行添加。
使用举例：

UIView * new = [UIView gd_view:^(UIView *view) {
     view.gd_frame(CGRectMake(0, 0, 100, 100)).gd_backgroundColor([UIColor greenColor]);
     view.gd_addTapgesture(self,@selector(playGo:));
 }];
 
[self.window addSubview:new];
