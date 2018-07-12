Screen.backgroundColor = "#FFF"
n = Screen.width/750
{countup} = require "npm"

#主架构

BottomBarData = [{src:"images/home/iconBottomNor01.svg",name:"首页",current:"images/home/iconBottomSel01.svg";},{src:"images/home/iconBottomNor02.svg",name:"推广",current:"images/home/iconBottomSel02.svg";},{src:"images/home/iconBottomNor03.svg",name:"资讯",current:"images/home/iconBottomSel03.svg";},{src:"images/home/iconBottomNor04.svg",name:"我的",current:"images/home/iconBottomSel04.svg";}]

primaryColor = "#3c3c3c"
defaultColor = "#9e9e9e"


MainPageArr = []
for i in [0...BottomBarData.length]
	Page = new Layer
		width: Screen.width
		height: Screen.height
		backgroundColor: null
		visible: false
# 	StatusBar = new StatusBar	
	MainPageArr.push(Page)
BottomBar = new Layer
	width: Screen.width
	height: 96*n
	y: Align.bottom
	backgroundColor: "#FFF"
	opacity: 0.8
	shadowY: -1
	shadowColor: "rgba(0,0,0,0.12)"

BottomBarNavArr = []
BottomBarNavIconArr = []
BottomBarNavIconCurArr = []
BottomBarNavNamesArr = []
for i in [0...BottomBarData.length]
	BottomBarNav = new Layer
		parent: BottomBar
		width: Screen.width/BottomBarData.length
		x: Screen.width/BottomBarData.length*i
		backgroundColor: "#FFF"
	
	BottomBarNavIconCurrent = new Layer
		parent: BottomBarNav
		width: 48*n
		height: 48*n
		x: Align.center
		y: 12
		backgroundColor: null
		image: 	BottomBarData[i].current
		opacity: 0
		
	BottomBarNavIcon = new Layer
		parent: BottomBarNav
		width: 48*n
		height: 48*n
		x: Align.center
		y: 12
		backgroundColor: null
		image: 	BottomBarData[i].src
		
	NavName = new TextLayer
		parent: BottomBarNav
		y: 60*n
		width: Screen.width/BottomBarData.length
		fontSize: 22*n
		textAlign: "center"
		color: defaultColor
		text: BottomBarData[i].name			
	BottomBarNavArr.push(BottomBarNav)
	BottomBarNavIconArr.push(BottomBarNavIcon)
	BottomBarNavIconCurArr.push(BottomBarNavIconCurrent)
	BottomBarNavNamesArr.push(NavName)
	
	
# 初始化导航样式	
BottomBarNavIconArr[0].opacity = 0	
BottomBarNavIconCurArr[0].opacity = 1
BottomBarNavIconCurArr[0].scale = 1
BottomBarNavNamesArr[0].color = primaryColor
MainPageArr[0].visible = true
# 底部交互	
# BottomBarNavArr[2].onTap ->
for i in [0...BottomBarData.length]
	BottomBarNavArr[i].onTap ->
		for i in [0...BottomBarData.length]
			BottomBarNavIconArr[i].opacity = 1
			BottomBarNavIconArr[i].scale = 1
			BottomBarNavIconCurArr[i].opacity = 0
			BottomBarNavNamesArr[i].color = defaultColor		
# 			MainPageArr[i].opacity = 0
			MainPageArr[i].visible = false
# 		print @children[2]
		@children[2].color = primaryColor
		@children[1].opacity = 0
		@children[0].opacity = 1
		MainPageArr[@index-1].visible = true
		

# Springs缓动预定义
iOSAppLaunch = "spring(320,40,0)"
iOSKeyboard = "spring(280,33,10)"
iOSSlideView = "spring(220,28,0)"
iOSRetreat = "spring(220,28,0)"
iOSActionSheet = "spring(280,33,10)"

materialAppLaunch = "spring(260,32,16)"
materialKeyboard = "spring(220,35,25)"
materialSlideView = "spring(220,35,25)"
materialRetreat = "spring(160,30,10)"
materialActionSheet = "spring(250,37,20)"

floaty = "spring(160,40,10)"
hello = "spring(400,22,20)"
retreat = "spring(160,30,10)"
pop = "spring(280,13,10)"
bigPop = "spring(370,8,0)"
dramatic = "spring(120,140,0)"
slow = "spring(100,50,0)"
quick = "spring(400,20,10)"
loose = "spring(240,18,28)"


#微信头部
{StatusBar} = require "StatusBar"
StatusBar = new StatusBar
StatusBar.pageTitle.text = "金榕家"
StatusBar.topbarLeftIcon01.image = "images/close.svg"
StatusBar.topbarRightIcon01.image = "images/more.svg"
StatusBar.topbar.shadowY = 1
StatusBar.topbar.shadowColor = "rgba(0,0,0,0.12)"
StatusBar.z = 4


#home

#导航图标数据
{IconsNavBar} = require "IconsNavBar"

navIconsData = [{src:"images/home/nav_icon01.svg",name:"平台介绍";},{src:"images/home/nav_icon02.svg",name:"奖励规则";},{src:"images/home/nav_icon03.svg",name:"提现说明";},{src:"images/home/nav_icon04.svg",name:"帮助中心";}]

navIcons = []

homeScroll = new ScrollComponent
	parent: MainPageArr[0]
	size: Screen.size
	scrollHorizontal: false
	
homeScroll.contentInset =
    right: 0
    bottom: 48*n
    left: 0	

topBan = new Layer
	parent: homeScroll.content
	width: Screen.width
	height: 320*n
	y: StatusBar.height+StatusBar.topbar.height
	image: "images/home/topBan01.png"		
		
iconNavGroup = new Layer
	parent: homeScroll.content
	width: Screen.width
	height: 160*n
	y: topBan.y+topBan.height
	shadowY: 1
	shadowColor: "#e0e0e0"
	backgroundColor: "#FFF"
	
for i in [0...navIconsData.length]
	iconsNavBar = new IconsNavBar
# 	iconsNavBar.height = 160*n
	iconsNavBar.parent = iconNavGroup
	#载入导航图标组件
	navIcons.push(iconsNavBar)
	iconsNavBar.width = Screen.width/navIconsData.length
	iconsNavBar.x = Screen.width/navIconsData.length*i
	iconsNavBar.navIconPic.x = Align.center
	iconsNavBar.navIconPic.image = navIconsData[i].src
	iconsNavBar.navIconName.text = navIconsData[i].name
	iconsNavBar.navIconName.x = Align.center
	
#我的收益
myBft = new Layer
	parent: homeScroll.content
	x: Align.center
	y: iconNavGroup.y+iconNavGroup.height+32*n
	backgroundColor: "transparent"
	width: Screen.width-64*n
	height: 290*n
	shadowY: 0
	shadowBlur: 24
	shadowColor:"rgba(221,226,238,0.8)"

mask = new Layer
	parent: myBft
	x: 0
	y: 0
	width: 686
	height: 290
	backgroundColor: "rgba(255,255,255,1)"

bftTotalTxt = new TextLayer
	parent: myBft
	x: Align.center
	y: Align.center
	text: "累计返现(元)"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 500
	textAlign: "center"
	color: "rgba(66,66,66,1)"

line = new Layer
	parent: myBft
	x: Align.center
	y: 208*n
	width: 1
	height: 42*n

bftTotalNum = new TextLayer
	parent: myBft
	x: Align.center
	y: 40*n
	width: myBft.width/2
# 	text: "100.00"
	fontSize: 80*n
	fontFamily: "DIN Alternate"
	fontWeight: 700
	textAlign: "center"
	color: "rgba(255,87,34,1)"
	html: "<div id='TC' style='height: 120px;text-align:center;'>0</div>"
	

LimNumber = new countup("TC", 0.00, 28.80,2,0.4)
# LimNumberBack = new countup("TC", 15000, 0,0,1)
LimNumber.start()			

tdyNum = new TextLayer
	parent: myBft
	x: Align.left(140*n)
	y: 172*n
	text: "12"
	fontSize: 48*n
	fontFamily: "DIN Alternate"
	fontWeight: 700
	textAlign: "center"
	color: "rgba(79,79,79,1)"

tdyTxt = new TextLayer
	parent: myBft
	x: Align.center(-180*n)
	y: tdyNum.y+64*n
	text: "今日推广(人)"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	textAlign: "left"
	color: "rgba(158,158,158,1)"

pplNum = new TextLayer
	parent: myBft
	x: Align.right(-140*n)
	y: 172*n
	text: "32"
	fontSize: 48*n
	fontFamily: "DIN Alternate"
	fontWeight: 700
	textAlign: "center"
	color: "rgba(79,79,79,1)"

pplTotalTxt = new TextLayer
	parent: myBft
	x: Align.center(180*n)
	y: pplNum.y+64*n
	text: "累计推广(人)"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	textAlign: "center"
	color: "rgba(158,158,158,1)"

tag = new Layer
	parent: myBft
	x: 0
	y: 0
	width: 130*n
	height: 40*n
	image: "images/home/tag.svg"
	
BottomBarNavArr[0].onTap ->
	LimNumber.reset()
	LimNumber.start()
	
#banner

banArr= ["images/home/ban01.png","images/home/ban02.png","images/home/ban03.png","images/home/ban04.png",]

bottomTxt = new TextLayer
	parent: homeScroll.content
	x: Align.center
	y: 1800*n
	text: "没有更多内容"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	letterSpacing: 0.0
	textAlign: "center"
	color: "rgba(189,189,189,1)"



for i in [0...banArr.length]
	banner = new Layer
		parent: homeScroll.content
		width: Screen.width-64*n
		height: 176*n
		x: Align.center
		y: (176+32)*n*i+myBft.y+myBft.height+32*n
		image: banArr[i]

#popularize

TabNameData = ["我的收益","我的团队"]	
TabLayerArr = []
RetlistArr = [{name:"胡**",phone:"138****4509",date:"2018/07/11",action:"理财",value:"¥40"};{name:"杨**",phone:"138****4509",date:"2018/07/11",action:"理财",value:"¥20"};{name:"杨**",phone:"138****4509",date:"2018/07/11",action:"信用卡",value:"¥40"};{name:"张**",phone:"138****4509",date:"2018/07/11",action:"理财",value:"¥10"};{name:"杨**",phone:"138****4509",date:"2018/07/11",action:"贷款",value:"¥40"};{name:"李**",phone:"138****4509",date:"2018/07/11",action:"理财",value:"¥30"};{name:"刘**",phone:"138****4509",date:"2018/07/11",action:"贷款",value:"¥10"};{name:"盛**",phone:"138****4509",date:"2018/07/11",action:"理财",value:"¥20"};{name:"李**",phone:"138****4509",date:"2018/07/11",action:"保险",value:"¥40"};{name:"刘**",phone:"138****4509",date:"2018/07/11",action:"保险",value:"¥40"};{name:"常**",phone:"138****4509",date:"2018/07/11",action:"保险",value:"¥40"};{name:"李**",phone:"138****4509",date:"2018/07/11",action:"保险",value:"¥40"};{name:"盛**",phone:"138****4509",date:"2018/07/11",action:"保险",value:"¥40"};{name:"盛**",phone:"138****4509",date:"2018/07/11",action:"保险",value:"¥40"};]

TeamlistArr = [{father:"true";lvl:"1级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"true";lvl:"1级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"true";lvl:"1级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"true";lvl:"1级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};{father:"false";lvl:"•2级用户",name:"胡**",phone:"138****4509",date:"2018/07/11"};]

TopBanBlueBg = new VideoLayer
	parent: MainPageArr[1]
	y: StatusBar.topbar.height+StatusBar.topbar.y
	width: Screen.width
	height: 296*n
	html: "<div style='background: linear-gradient(45deg, #512FFF,#33B5FF);height:500px;filter:hue-rotate(0deg);'></div>"
	backgroundColor: null
	opacity: 1

TopBanRedBg = new VideoLayer
	parent: MainPageArr[1]
	y: StatusBar.topbar.height+StatusBar.topbar.y
	width: Screen.width
	height: 296*n
	html: "<div style='background: linear-gradient(45deg, #EA3C35,#FF9743);height:500px;filter:hue-rotate(0deg);'></div>"
	backgroundColor: null
	opacity: 1


# popScroll = new ScrollComponent
# 	parent: MainPageArr[1]
# 	width: Screen.width
# 	height: Screen.height-128*n-296*n
# 	scrollHorizontal: false
# 	y: 128*n+296*n
# 	
# popScroll.contentInset =
# # 	top: 128*n+296*n
# 	right: 0
# 	bottom: 40
# 	left: 0	
# 
# popScroll.scroll = false

	


popTab = new Layer
	parent: MainPageArr[1]
	height: 64*n
	width: 288*n
	backgroundColor: null
	x: Align.center
	y: StatusBar.height+StatusBar.topbar.height
	
bftData = new Layer
	parent: MainPageArr[1]
	x: Align.center
	y: popTab.y+120*n
	backgroundColor: "transparent"
	width: Screen.width
	height: 102*n
	opacity: 1

myBftTxt01 = new TextLayer
	width: Screen.width/2
	parent: bftData
	x: 0
	y: 88*n
	text: "今日返现金额(元)"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "center"
	color: "rgba(255,255,255,1)"

BFT01 = new TextLayer
	parent: bftData
	width: Screen.width/2
	x: 0
	y: 0
	fontSize: 64*n
	fontFamily: "DIN Alternate"
	fontWeight: 700
	textAlign: "center"
	color: "rgba(255,255,255,1)"
	html: "<div id='BFT01' style='height: 120px;text-align:center;'>-.--</div>"

myBftTxt02 = new TextLayer
	parent: bftData
	width: Screen.width/2
	x:Screen.width/2
	y: 88*n
	text: "累计返现金额(元)"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "center"
	color: "rgba(255,255,255,1)"

BFT02 = new TextLayer
	parent: bftData
	width: Screen.width/2
	x: Align.right(-10*n)
	y: 0
	fontSize: 64*n
	fontFamily: "DIN Alternate"
	fontWeight: 700
	textAlign: "center"
	color: "rgba(255,255,255,1)"
	html: "<div id='BFT02' style='height: 120px;text-align:center;'>-.--</div>"

line = new Layer
	parent: bftData
	x: Align.center
	y: 28
	width: 1
	height: 56
	opacity: 0.4000000059604645
	backgroundColor: "#FFF"


teamData = new Layer
	parent: MainPageArr[1]
	x: Align.center
	y: popTab.y+120*n
	backgroundColor: "transparent"
	width: Screen.width
	height: 102*n
	opacity: 0

teamTxt01 = new TextLayer
	width: Screen.width/2
	parent: teamData
	x: 0
	y: 88*n
	text: "今日推广人数(人)"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "center"
	color: "rgba(255,255,255,1)"

TEAM01 = new TextLayer
	parent: teamData
	width: Screen.width/2
	x: 0
	y: 0
	fontSize: 64*n
	fontFamily: "DIN Alternate"
	fontWeight: 700
	textAlign: "center"
	color: "rgba(255,255,255,1)"
	html: "<div id='TEAM01' style='height: 120px;text-align:center;'>-</div>"

teamTxt02 = new TextLayer
	parent: teamData
	width: Screen.width/2
	x:Screen.width/2
	y: 88*n
	text: "累计推广人数(人)"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "center"
	color: "rgba(255,255,255,1)"

TEAM02 = new TextLayer
	parent: teamData
	width: Screen.width/2
	x: Align.right(-10*n)
	y: 0
	fontSize: 64*n
	fontFamily: "DIN Alternate"
	fontWeight: 700
	textAlign: "center"
	color: "rgba(255,255,255,1)"
	html: "<div id='TEAM02' style='height: 120px;text-align:center;'>-</div>"

line = new Layer
	parent: teamData
	x: Align.center
	y: 28
	width: 1
	height: 56
	opacity: 0.4000000059604645
	backgroundColor: "#FFF"
	
for i in [0...TabNameData.length]	
	TabLayer = new TextLayer
		parent: popTab
		width: 144*n
		height: 88*n
		textAlign: "center"
		fontWeight: 300
		lineHeight: 3
		color: "#FFF"
		x: 144*i*n
		fontSize: 28*n
		backgroundColor: null
		text: TabNameData[i]
	TabLayerArr.push(TabLayer)	

#countJS
bftNum01 = new countup("BFT01", 0.00, 8.80,2,0.3)
bftNum02 = new countup("BFT02", 0.00, 28.80,2,0.3)
teamNum01 = new countup("TEAM01", 0, 12,0,1)
teamNum02 = new countup("TEAM02", 0, 32,0,1)
		
gutter = 0
# print TabLayerArr
TabunderLineLayer = new Layer
	parent: MainPageArr[1]
	height: 6*n
	width: 60*n
# 	originX: 0
	scaleX: 1
	x: TabLayer.midX+60*n
	y: popTab.height+popTab.y+2*n
	backgroundColor: "#FFF"

TabLayerArr[0].fontWeight = 800
# Create PageComponent
pageScroller = new PageComponent
	y: 0
	parent: MainPageArr[1]
	point: Align.center
	width: Screen.width
	height: Screen.height*1.5
	scrollVertical: false
	clip: false
pageScroller.content.draggable.bounceOptions =
	friction: 100,
	tension:10,
	tolerance:1
	
pageScroller.contentInset =
    top: 128*n+296*n+64*n+64*n
# Loop to create pages
for index in [0...TabNameData.length]
	page = new Layer
		size: pageScroller.size
		x: (pageScroller.width + gutter) * index
		backgroundColor: "#F5F5F5"
		hueRotate: index * 20
		parent: pageScroller.content


page01Scroll = new ScrollComponent
	parent: pageScroller.content.children[0]
	width: Screen.width
	height: Screen.height
	scrollHorizontal: false

page02Scroll = new ScrollComponent
	parent: pageScroller.content.children[1]
	width: Screen.width
	height: Screen.height
	scrollHorizontal: false	

page01Scroll.contentInset =
	bottom: 800

page02Scroll.contentInset =
	bottom: 800
	
page01Scroll.content.draggable.overdrag = false
page02Scroll.content.draggable.overdrag = false			
# pageScroller.directionLock = true	
# pageScroller.content.children[0].backgroundColor = "#FFF"

hd = new Layer
	parent: MainPageArr[1]
	x: 0
	y: 128*n+296*n
	backgroundColor: "transparent"
	width: Screen.width
	height: 80*n

hdbg = new Layer
	parent: hd
	x: 0
	y: 0
	width: Screen.width
	height: 80*n
	backgroundColor: "#FFF"

hdtxt = new TextLayer
	parent: hd
	x: 32*n
	y: Align.center
	text: "返现记录"
	fontSize: 28*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	textAlign: "left"
	color: "rgba(33,33,33,1)"




tableHd = new Layer
	parent: MainPageArr[1]
	x: 0
	y: 128*n+296*n+80*n
	backgroundColor: "transparent"
	width: Screen.width
	height: 48*n

rectangle = new Layer
	parent: tableHd
	x: 0
	y: 0
	width: Screen.width
	height: 48*n
	backgroundColor: "rgba(245,245,245,1)"

userlvl = new TextLayer
	parent: tableHd
	x: Align.left(32*n)
	y: 8
	width: 106*n
	text: "用户级别"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "left"
	color: "rgba(158,158,158,1)"
	opacity: 0

usename = new TextLayer
	parent: tableHd
	x: Align.left(32*n)
	y: 8
	width: 106
	text: "用户"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "left"
	color: "rgba(158,158,158,1)"

phoneNum = new TextLayer
	parent: tableHd
	x: Screen.width/5
	y: 8
	width: 106*n
	text: "手机号"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "center"
	color: "rgba(158,158,158,1)"

date = new TextLayer
	parent: tableHd
	x: Screen.width*2/5+12*n
	y: 8
	width: 106
	text: "时间"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "center"
	color: "rgba(158,158,158,1)"

act = new TextLayer
	parent: tableHd
	x: Screen.width*3/5+40*n
	y: 8
	width: 106*n
	text: "行为"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "center"
	color: "rgba(158,158,158,1)"

retvalue = new TextLayer
	parent: tableHd
	x: Align.right(-32*n)
	y: 8
	width: 96*n
	text: "返现"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "right"
	color: "rgba(158,158,158,1)"

for i in [0...RetlistArr.length]
	retlist = new Layer
		parent: page01Scroll.content
		width: Screen.width
		height: 88*n
		y: 88*n*i
		backgroundColor: "#FFF"
		shadowY: 1
		shadowColor: "rgba(0,0,0,0.12)"


	cell_action = new TextLayer
		parent: retlist
		x: Screen.width*3/5+72*n
		y: Align.center
		text: RetlistArr[i].action
		fontSize: 24*n
		fontFamily: "PingFang SC"
		fontWeight: 300
		textAlign: "left"
		color: "rgba(66,66,66,1)"
	
	cell_name = new TextLayer
		parent: retlist
		x: Align.left(32*n)
		y: Align.center
		width: 106*n
		text: RetlistArr[i].name
		fontSize: 24*n
		fontFamily: "PingFang SC"
		fontWeight: 300
		textAlign: "left"
		color: "rgba(66,66,66,1)"
	
	cell_phone = new TextLayer
		parent: retlist
		x: Align.left(Screen.width/5-20*n)
		y: Align.center
		width: 162*n
		text: RetlistArr[i].phone
		fontSize: 24*n
		fontFamily: "PingFang SC"
		fontWeight: 300
		textAlign: "left"
		color: "rgba(66,66,66,1)"
	
	cell_date = new TextLayer
		parent: retlist
		x: Align.left(Screen.width*2/5+20*n)
		y: Align.center
		width: 162*n
		text: RetlistArr[i].date
		fontSize: 24*n
		fontFamily: "PingFang SC"
		fontWeight: 300
		textAlign: "left"
		color: "rgba(66,66,66,1)"
	
	cell_value = new TextLayer
		parent: retlist
		x: Align.right(-32*n)
		y: Align.center
		text: RetlistArr[i].value
		fontSize: 26*n
		fontFamily: "PingFang SC"
		fontWeight: 600
		textAlign: "right"
		color: "rgba(33,33,33,1)"
	if i%2==1
		retlist.backgroundColor = "#FAFAFA"
 
TeamListLayers = [] 
for i in [0...TeamlistArr.length]
	teamlist = new Layer
		parent: page02Scroll.content
		width: Screen.width
		height: 88*n
		y: 88*n*i
		backgroundColor: "#FFF"
		shadowY: 1
		shadowColor: "rgba(0,0,0,0.12)"
	TeamListLayers.push(teamlist)
	
	layer = new TextLayer
		parent: teamlist
		x: Align.left(224*n)
		y: Align.center
		width: 106*n
		text: TeamlistArr[i].name
		fontSize: 24*n
		fontFamily: "PingFang SC"
		fontWeight: 300
		textAlign: "left"
		color: "rgba(66,66,66,1)"
	
	layer_1384509 = new TextLayer
		parent: teamlist
		x: Align.right(-32*n-180*n)
		y: Align.center
		width: 162*n
		text: TeamlistArr[i].phone
		fontSize: 24*n
		fontFamily: "PingFang SC"
		fontWeight: 300
		textAlign: "left"
		color: "rgba(66,66,66,1)"
	
	layer_20180711 = new TextLayer
		parent: teamlist
		x: Align.right(-32*n)
		y: Align.center
		width: 162*n
		text: TeamlistArr[i].date
		fontSize: 24*n
		fontFamily: "PingFang SC"
		fontWeight: 300
		textAlign: "right"
		color: "rgba(66,66,66,1)"
	
	layer_1 = new TextLayer
		parent: teamlist
		x: Align.left(32*n)
		y: Align.center
		width: 106*n
		text: TeamlistArr[i].lvl
		fontSize: 22*n
		fontFamily: "PingFang SC"
		fontWeight: 400
		textAlign: "left"
		color: "#9e9e9e"
	
	if TeamlistArr[i].father == "true" 
		TeamListLayers[i].children[3].fontSize = 24*n
		TeamListLayers[i].children[3].fontWeight = 600
		TeamListLayers[i].children[3].color = "#212121"
		TeamListLayers[i].backgroundColor = "#FAFBFB"

mask = new Layer
	parent: MainPageArr[1]
	z: 2
	width: Screen.width
	height: Screen.height
	backgroundColor: "#000"
	opacity: 0
	visible: false
	 
shareSheet = new Layer
	parent: MainPageArr[1]
	x: 0
	y: Align.bottom(426*n)
	backgroundColor: "#FFF"
	width: Screen.width
	height: 426*n
	z: 3

rectangle = new Layer
	parent: shareSheet
	x: 0
	y: 0
	width: Screen.width
	height: 80*n
	backgroundColor: "transparent"
	shadowColor: "rgba(245,245,245,1)"
	shadowX: 0
	shadowY: 1
	shadowBlur: 0
	shadowSpread: 0

layer = new TextLayer
	parent: rectangle
	x: Align.center
	y: Align.center
	text: "选择分享方式"
	fontSize: 28*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	letterSpacing: 0.0
	lineHeight: 1.1428571428571428
	textAlign: "left"
	color: "rgba(97,97,97,1)"

share01 = new Layer
	parent: shareSheet
	x: Align.left(124*n)
	y: 144*n
	width: 144*n
	height: 144*n
	image: "images/popularize/share01.svg"

layer_2 = new TextLayer
	parent: shareSheet
	width: Screen.width/2-144*n
	x: 80*n
	y: 330*n
	text: "二维码分享"
	fontSize: 28*n
	fontFamily: "PingFang SC"
	fontWeight: 500
	letterSpacing: 0.0
	textAlign: "center"
	color: "rgba(66,66,66,1)"

share02 = new Layer
	parent: shareSheet
	x: Align.right(-124*n)
	y: 144*n
	width: 144*n
	height: 144*n
	image: "images/popularize/share02.svg"

layer_3 = new TextLayer
	parent: shareSheet
	width: Screen.width/2-144*n
	x: Align.right(-80*n)
	y: 330*n
	text: "专属链接推广"
	fontSize: 28*n
	fontFamily: "PingFang SC"
	fontWeight: 500
	letterSpacing: 0.0
	textAlign: "center"
	color: "rgba(66,66,66,1)"

 
 
inviteBg = new Layer
	parent: MainPageArr[1]
	y: Align.bottom(-80*n)
	width: Screen.width
	image: "images/popularize/invitebg.png"
	opacity: 0.92
	
inviteBtn = new TextLayer
	parent: inviteBg
	text: "立即邀请"
	width: 290*n
	fontSize: 26*n
	fontFamily: "PingFang SC"
	fontWeight: 600
	color: "#FFF"
	lineHeight: 3.6
	textAlign: "center"
	x: Align.center
	height:108*n
	y: Align.bottom(-20*n)
	image: "images/popularize/btn_bg.png"	

#add states
	
inviteBg.states = 
	on:
		opacity:0
		y:Align.bottom()
		options: 
			curve:materialActionSheet
			time: 0.3

act.states =
	on:
		opacity: 0
		x: Screen.width*3/5+320*n

userlvl.states = 
	on:
		opacity: 1

retvalue.states =
	on:
		opacity: 0
		x: Align.right(-32*n+Screen.width/4)

date.states =
	on:
		opacity: 1
		x: Align.right()
				
phoneNum.states =
	on:
		opacity: 1
		x: Screen.width/5+240*n
		
usename.states =
	on:
		x: Align.left(32*n+192*n)
		
		
inviteBtn.onTap ->
	mask.visible = true
	mask.animate
		opacity: 0.72
		options: 
			curve:materialActionSheet
			time: 0.3
			
	shareSheet.animate
		y: Align.bottom()		
		options: 
			curve:materialActionSheet
			time: 0.3

mask.onTap ->
	mask.animate
		opacity: 0
		options: 
			curve:materialActionSheet
			time: 0.3
	mask.visible = false
	shareSheet.animate
		y: Align.bottom(426*n)		
		options: 
			curve:materialActionSheet
			time: 0.3
			
pageScroller.content.draggable.overdrag = false

page01Scroll.content.onDragEnd (event, layer) ->
# 	print @draggable.direction
	if @draggable.direction == "up"
		inviteBg.animate "on",curve:quick,time: 0.8
	if @draggable.direction == "down"
		inviteBg.animate "default",curve:quick,time: 0.8

page02Scroll.content.onDragEnd (event, layer) ->
# 	print @draggable.direction
	if @draggable.direction == "up"
		inviteBg.animate "on",curve:quick,time: 0.8
	if @draggable.direction == "down"
		inviteBg.animate "default",curve:quick,time: 0.8

	
pageScroller.content.on Events.DragStart, ->
	page01Scroll.content.draggable.enabled = false
	page02Scroll.content.draggable.enabled = false

pageScroller.content.on Events.DragEnd, ->
	page01Scroll.content.draggable.enabled = true
	page02Scroll.content.draggable.enabled = true	
	
page01Scroll.content.on Events.DragStart, ->
	pageScroller.content.draggable.enabled = false
page02Scroll.content.on Events.DragStart, ->
	pageScroller.content.draggable.enabled = false

page01Scroll.content.on Events.DragEnd, ->
	pageScroller.content.draggable.enabled = true	
page02Scroll.content.on Events.DragEnd, ->
	pageScroller.content.draggable.enabled = true


for i in [0...TabNameData.length]
	TopBanRedBg.states =
		on:
			opacity:0
			
	teamData.states =
		on:
			opacity:1

	bftData.states =
		on:
			opacity:0					

	TabLayerArr[i].onTap ->
		for i in [0...TabNameData.length]
			TabLayerArr[i].fontWeight = 300
# 			TabLayerArr[i].brightness = 100	
		@fontWeight = 800
# 		@brightness = 96
		TabunderLineLayer.animate
			midX:@midX+232*n
			options:
				curve:quick
				time:0.5
# 		print @index
		pageScroller.content.x = (-Screen.width)*(@index-1)
		
# 	#点击TAB的交互			
	TabLayerArr[0].onTap ->
		TopBanRedBg.animate "default",curve:quick,time:0.5
		bftData.animate "default",curve:quick,time:0.5
		teamData.animate "default",curve:quick,time:0.5
# 		inviteBg.animate "default",curve:quick,time: 0.8
		act.animate "default",time:0.3
		userlvl.animate "default",time:0.3
		retvalue.animate "default",time:0.3
		date.animate "default",time:0.3
		phoneNum.animate "default",time:0.3
		usename.animate "default",time:0.3
				
		bftNum01.reset()
		bftNum01.start()
		bftNum02.reset()
		bftNum02.start()
				
			
	TabLayerArr[1].onTap ->
		TopBanRedBg.animate "on",curve:quick,time:0.5
		teamData.animate "on",curve:quick,time:0.5
		bftData.animate "on",curve:quick,time:0.5
		act.animate "on",time:0.3
		userlvl.animate "on",time:0.3
		retvalue.animate "on",time:0.3
		date.animate "on",time:0.3
		phoneNum.animate "on",time:0.3
		usename.animate "on",time:0.3
		teamNum01.reset()
		teamNum01.start()
		teamNum02.reset()
		teamNum02.start()
# 		invit1eBg.animate "on",curve:quick,time: 0.8

pageScroller.scroll = false
pageScroller.content.on Events.Move, ->
	scrolltoX(pageScroller.scrollX)

#滑动结束的交互	
pageScroller.content.onDragEnd ->	
# 	print @draggable.direction
	if @draggable.direction == "right"
# 		teamData.animate "off",curve:quick,time:0.5
# 		bftData.animate "on",curve:quick,time:0.5				
		bftNum01.reset()
		bftNum01.start()
		bftNum02.reset()
		bftNum02.start()

	if @draggable.direction == "left"
# 		teamData.animate "on",curve:quick,time:0.5
# 		bftData.animate "off",curve:quick,time:0.5 
		teamNum01.reset()
		teamNum01.start()
		teamNum02.reset()
		teamNum02.start()
		
#滑动过程的交互		
# scrolltoX = (x)	->
# 	TabunderLineLayer.x = Utils.modulate(x,[0,-Screen.width],[280*n,140*n],false)
# # 	inviteBg.opacity = Utils.modulate(x,[0,-Screen.width],[1,0],true)
# 	TabLayerArr[0].fontWeight = Utils.modulate(x,[0,-Screen.width],[300,800],true)
# 	TabLayerArr[1].fontWeight = Utils.modulate(x,[0,-Screen.width],[800,300],true)
# 	TabLayerArr[0].fontWeight = Utils.modulate(x,[-Screen.width,0],[300,800],false)
# 	TabLayerArr[1].fontWeight = Utils.modulate(x,[-Screen.width,0],[800,300],false)

#翻页结束的交互	
# pageScroller.on "change:currentPage", ->
# 	TopBanRedBg.stateCycle(curve:quick,time:0.5)
# 	inviteBg.stateCycle(curve:quick,time:0.5)
# 	teamData.stateCycle(curve:quick,time:0.5)
# 	bftData.stateCycle(curve:quick,time:0.5)
# 	act.stateCycle(time:0.3)
# 	userlvl.stateCycle(time:0.3)
# 	retvalue.stateCycle(time:0.3)
# 	date.stateCycle(time:0.3)
# 	phoneNum.stateCycle(time:0.3)
# 	usename.stateCycle(time:0.3)
	
						
BottomBarNavArr[1].onTap ->
	bftNum01.reset()
	bftNum01.start()
	bftNum02.reset()
	bftNum02.start()
	teamNum01.reset()
	teamNum01.start()
	teamNum02.reset()
	teamNum02.start()

#new



#mine
#导航图标数据
{IconsNavBar} = require "IconsNavBar"
	

mineIconsData = [{src:"images/mine/nav_icon05.svg",name:"我要提现";},{src:"images/mine/nav_icon06.svg",name:"提现记录";},{src:"images/mine/nav_icon07.svg",name:"我的资料";},{src:"images/mine/nav_icon08.svg",name:"征信查询";},{src:"images/mine/nav_icon09.svg",name:"设置";},{src:"images/mine/nav_icon10.svg",name:"平台手册";}]

#top
mine = new Layer
	x: 0
	y: StatusBar.topbar.height+StatusBar.topbar.y
	backgroundColor: "transparent"
	width: Screen.width
	height: 448*n
	parent: MainPageArr[3]

combinedShape = new Layer
	parent: mine
	x: 0
	y: 0
	width: Screen.width
	height: 448*n
	html: "<div style='background: linear-gradient(45deg, #EA3C35,#FF9743);height:800px;filter:hue-rotate(0deg);'></div>"

value = new Layer
	parent: mine
	x: 0
	y: 320*n
	width: Screen.width/3
	height: 128*n
	backgroundColor: "rgba(255,255,255,0.12)"
	

frzTxt = new TextLayer
	parent: value
	x: Align.center
	y: 70*n
	text: "冻结金额(元)"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "center"
	color: "rgba(255,255,255,1)"

frzSum = new TextLayer
	parent: value
	x: Align.center
	y: 20*n
# 	text: "400.00"
	fontSize: 36*n
	fontFamily: "DIN Alternate"
	fontWeight: 700
	textAlign: "center"
	color: "rgba(255,255,255,1)"
	html: "<div id='frzSum' style='text-align:center;'>-.--</div>"

	

valueCopy = new Layer
	parent: mine
	x: Screen.width/3
	y: 320*n
	width: Screen.width/3
	height: 128*n
	backgroundColor: "rgba(255,255,255,0.12)"
	
	
avbTxt = new TextLayer
	parent: valueCopy
	x: Align.center
	y: 70*n
	text: "可提现金额(元)"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "center"
	color: "rgba(255,255,255,1)"

avbSum = new TextLayer
	parent: valueCopy
	x: Align.center
	y: 20*n
# 	text: "400.00"
	fontSize: 36*n
	fontFamily: "DIN Alternate"
	fontWeight: 700
	textAlign: "center"
	color: "rgba(255,255,255,1)"
	html: "<div id='avbSum' style='text-align:center;'>-.--</div>"
	
valueCopy2 = new Layer
	parent: mine
	x: Screen.width*2/3
	y: 320*n
	width: Screen.width/3
	height: 128*n
	backgroundColor: "rgba(255,255,255,0.12)"
	
	
wdrTxt = new TextLayer
	parent: valueCopy2
	x: Align.center
	y: 70*n
	text: "已提现金额(元)"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	textAlign: "center"
	color: "rgba(255,255,255,1)"

wdrSum = new TextLayer
	parent: valueCopy2
	x: Align.center
	y: 20*n
# 	text: "400.00"
	fontSize: 36*n
	fontFamily: "DIN Alternate"
	fontWeight: 700
	textAlign: "center"
	color: "rgba(255,255,255,1)"
	html: "<div id='wdrSum' style='text-align:center;'>-.--</div>"	

line = new Layer
	parent: mine
	x: Screen.width/3
	y: 360*n
	width: 1
	height: 48
	backgroundColor: "#FFF"
	opacity: 0.3

lineCopy = new Layer
	parent: mine
	x: Screen.width*2/3
	y: 360*n
	width: 1
	height: 48
	backgroundColor: "#FFF"
	opacity: 0.3
layer_1764756 = new TextLayer
	parent: mine
	x: Align.center
	y: 220*n
	text: "176****4756"
	fontSize: 36*n
	fontFamily: "PingFang SC"
	fontWeight: 500
	textAlign: "center"
	color: "rgba(255,255,255,1)"

avatar = new Layer
	parent: mine
	x: Align.center
	y: 70*n
	width: 96*n
	height: 96*n
	image: "images/mine/avatar.png"
	

#countJS
frzSum = new countup("frzSum", 0.00, 24.60,2,0.3)
avbSum = new countup("avbSum", 0.00, 28.80,2,0.3)
wdrSum = new countup("wdrSum", 0.00, 12.00,2,0.3)



mineIcons = []
row = 3
col = 0


for i in [0...mineIconsData.length]
	if i%3 == 0
		row = 0
		col++
	iconsNavBar = new IconsNavBar
# 	iconsNavBar.height = 160*n
	iconsNavBar.parent = MainPageArr[3]
	
	#载入导航图标组件
	mineIcons.push(iconsNavBar)
	iconsNavBar.width = Screen.width/3
	iconsNavBar.height = Screen.width/3
	iconsNavBar.y = 448*n+StatusBar.topbar.height+StatusBar.topbar.y+(col-1)*Screen.width/3
	iconsNavBar.x = Screen.width/3*row
	row++
		
	iconsNavBar.navIconPic.width = 64*n
	iconsNavBar.navIconPic.height = 64*n
	iconsNavBar.navIconPic.x = Align.center
	iconsNavBar.navIconPic.y = Align.center(-32*n)
	iconsNavBar.navIconPic.image = mineIconsData[i].src
	iconsNavBar.navIconName.text = mineIconsData[i].name
	iconsNavBar.navIconName.y = Align.center(32*n)
	iconsNavBar.navIconName.x = Align.center
	iconsNavBar.borderWidth = 1
	iconsNavBar.borderColor = "rgba(0,0,0,0.12)"

# print mineIcons[i-1]

likebtn = new Layer
	parent: MainPageArr[3]
	x: Align.center
	y: mineIcons[i-1].y+mineIcons[i-1].height+24*n
	width: Screen.width-120*n
	height: 100*n
	image: "images/mine/likebtn.png"

BottomBarNavArr[3].onTap ->
	frzSum.reset()
	frzSum.start()
	wdrSum.reset()
	wdrSum.start()
	avbSum.reset()
	avbSum.start()
