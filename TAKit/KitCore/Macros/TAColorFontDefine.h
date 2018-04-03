//
//  TAColorFontDefine.h
//  TAKit
//
//  Created by 西安旺豆电子 on 2017/3/27.
//  Copyright © 2017年 TQ. All rights reserved.
//

#ifndef TAColorFontDefine_h
#define TAColorFontDefine_h


/**
 *  Color base define
 */
#define TA_RGBA(r,g,b,a)            ([UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a])
#define TA_RGB(r,g,b)               (TA_RGBA(r,g,b,1.0f))

#define TA_CG_RGBA(r,g,b,a)         ([TA_RGBA(r,g,b,a) CGColor])
#define TA_CG_RGB(r,g,b,a)          ([TA_RGBA(r,g,b,1.0f) CGColor])

#define TA_COLOR_FROM_RGBA(rgbValue,alphaValue)    ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue])
#define TA_COLOR_FROM_RGB(rgbValue)    (TA_COLOR_FROM_RGBA(rgbValue,1.0f))


/**
 *  Font base define
 */
#define TA_FONT(size)       [UIFont systemFontOfSize:size]
#define TA_BOLD_FONT(size)  [UIFont boldSystemFontOfSize:size]



//建议的默认字体定义
//导航栏标题
#define TA_FONT_DEF_NAV_TITLE         TA_FONT(17)
//常规按钮
#define TA_FONT_DEF_NORMAL_BUTTON     TA_FONT(17)
//表单头部
#define TA_FONT_DEF_FORM_HEADER       TA_FONT(17)
//TAB标签
#define TA_FONT_DEF_TAB_LABEL         TA_FONT(12)
//TAB工具条标签
#define TA_FONT_DEF_TAB_TOOL_LABEL    TA_FONT(11)



#endif /* TAColorFontDefine_h */
