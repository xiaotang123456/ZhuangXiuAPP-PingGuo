//
//  Header.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/3.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#ifndef Header_h
#define Header_h

/****************  本地保存的常用数据 ********************/
//引导状态
#define fristGuide [[NSUserDefaults standardUserDefaults] objectForKey:@"fristGuide"]
//登录状态
#define LOGINSTATE   [[NSUserDefaults standardUserDefaults] objectForKey:@"loginState"]
//用户名称
#define USERNAME   [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"]
//用户头像Icon
#define USERICON   [[NSUserDefaults standardUserDefaults] objectForKey:@"userIcon"]
//APP请求数据标识
#define APPIDENTIFICATION   [[NSUserDefaults standardUserDefaults] objectForKey:@"APPIdentification"]
//用户Code
#define USERCODE   [[NSUserDefaults standardUserDefaults] objectForKey:@"Code"]
//会员
#define USEVIP   [[NSUserDefaults standardUserDefaults] objectForKey:@"Vip"]
/****************  本地保存的常用数据 ********************/


/****************  常用define ********************/

/** 颜色设置 */
#define TLRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

//屏幕的宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕的高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/****************  常用define ********************/

/**********************  打印及URL ****************************/

#ifdef DEBUG

#define APP_URL  @"http://47.104.83.143:8087/forms/"
//#define APP_URL  @"http://192.168.1.162:8081/forms/"
#define TLNSLog(...)  NSLog(__VA_ARGS__)

#else

#define APP_URL  @"http://47.104.83.143:8087/forms/"
//#define APP_URL  @"http://192.168.1.162:8081/forms/"
#define TLNSLog(...)  NSLog(__VA_ARGS__)

#endif
/**********************  打印及URL ****************************/


/*--------------------------- 相关接口 -------------------------*/
//********接口

//上传注册手机类型
#define UPLODAPHONETYPE  APP_URL@"FrmIfc.appType"

//登录
#define LOGIN_URL  APP_URL@"FrmIfc.appLogin"
//注册
#define Register_URL   APP_URL@"FrmPhoneRegist"
/****  首页的相关接口 *****/
//轮播图
#define LOOP_URL  APP_URL@"FrmIfc.lunbo"
//热门作品
#define WORKS_URL   APP_URL@"FrmIfc.hotProductQuery"
//精选
#define SELE_URL   APP_URL@"FrmIfc.dataQuery"
//推荐团队
#define TEAMS_URL  APP_URL@"FrmIfc.teamQuery"
//资讯动态接口
#define INFORMATION_URL  APP_URL@"FrmIfc.dynamicQuery"
//图片接口
#define IMAGE_URL  APP_URL@"FrmIfc.findAllImg"
//点赞
#define DianZanURL  APP_URL@"FrmIfc.addAgree"
//团队详情
#define TeamDetail  APP_URL@"FrmTeam.queryById"
//动态详情
#define DongtaiDetail  APP_URL@"FrmInformation.details"
//我的作品：FrmWorksQuery
#define MyWorker  APP_URL@"FrmWorksQuery"
//关于我们
#define AboutMy  APP_URL@"FrmMy.aboutUs"
//意见反馈
#define SugtionBack  APP_URL@"FrmMy.yjfk"
//我的邀请码
#define MyInviteCode  APP_URL@"FrmShare"
//我的积分
#define MyJiFen  APP_URL@"FrmMy.myJifen"
//搜索FrmIndex.search
#define MySearch  APP_URL@"FrmIndex.search"
//编辑信息FrmMy.updateInfo
#define MyEditURL  APP_URL@"FrmMy.updateInfo"
//忘记密码FrmLossPassword
#define ForgetPW  APP_URL@"FrmLossPassword"

/*--------------------------- 相关接口 ------------------------*/


#endif /* Header_h */
#import "UIImageView+WebCache.h"
#import <SDAutoLayout.h>
#import "UIFont+TLMyFont.h"
#import "TLNetworking.h"
#import <YYModel.h>
#import "MBProgressHUD.h"










