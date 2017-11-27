//
//  project_pbxproj01.h
//  XcodeStudy
//
//  Created by xs on 2017/3/9.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface project_pbxproj01 : NSObject

@end
/**
 www.jianshu.com/p/59279b018217

*********Info.plist*******

 Application can be killed immediately after launch

 Key: NSSupportsSuddenTermination

 Value: BOOL

 说明：指定应用程序是否可以被杀死，以便更快地关闭或注销操作。

 表示系统是否可以彻底杀死的应用程序以注销或关闭更迅速。您可以使用此键来指定应用程序是否可以在关闭后立即被杀死。该应用程序还可以启用或禁用终止在运行时使用NSProcessInfo类的方法。默认值为NO

 Application Category

 Key: LSApplicationCategoryType

 Valeu: String

 说明：包含UTI相应的应用程序的类型。 App Store中使用该字符串的应用程序，以确定适当的分类。个人理解：用于确定APP的类别

 UTIs for app categories

 Category	UTI

 Business	public.app-category.business

 Developer Tools	public.app-category.developer-tools

 Education	public.app-category.education

 Entertainment	public.app-category.entertainment

 Finance	public.app-category.finance

 Games	public.app-category.games

 Graphics & Design	public.app-category.graphics-design

 Healthcare & Fitness	public.app-category.healthcare-fitness

 Lifestyle	public.app-category.lifestyle

 Medical	public.app-category.medical

 Music	public.app-category.music

 News	public.app-category.news

 Photography	public.app-category.photography

 Productivity	public.app-category.productivity

 Reference	public.app-category.reference

 Social Networking	public.app-category.social-networking

 Sports	public.app-category.sports

 Travel	public.app-category.travel

 Utilities	public.app-category.utilities

 Video	public.app-category.video

 Weather	public.app-category.weather

 UTIs for game-specific categories

 Category	UTI

 Action Games	public.app-category.action-games

 Adventure Games	public.app-category.adventure-games

 Arcade Games	public.app-category.arcade-games

 Board Games	public.app-category.board-games

 Card Games	public.app-category.card-games

 Casino Games	public.app-category.casino-games

 Dice Games	public.app-category.dice-games

 Educational Games	public.app-category.educational-games

 Family Games	public.app-category.family-games

 Kids Games	public.app-category.kids-games

 Music Games	public.app-category.music-games

 Puzzle Games	public.app-category.puzzle-games

 Racing Games	public.app-category.racing-games

 Role Playing Games	public.app-category.role-playing-games

 Simulation Games	public.app-category.simulation-games

 Sports Games	public.app-category.sports-games

 Strategy Games	public.app-category.strategy-games

 Trivia Games	public.app-category.trivia-games

 Word Games	public.app-category.word-games

 Application does not run in background

 Key: UIApplicationExitsOnSuspend

 Valeu: BOOL

 说明：是否支持在后台运行，YES时，点击HOME键，则退出应用。NO时点击HOME键切到后台。默认NO

 Application fonts resource path

 Key: ATSApplicationFontsPath

 Valeu: String

 说明：如果想使用外部字体时，可以指定外问字体的资源文件

 Application has localized display name

 Key: LSHasLocalizedDisplayName

 Valeu: BOOL

 说明：本地化显示名。设置为YES激活。默认NO

 Application is agent (UIElement)

 Key: LSUIElement

 Valeu: BOOL

 说明：如果该关键字被设为YES，启动服务会将该应用程序作为一个用户界面组件来运行。用户界面组件不会出现在Dock或强制退出窗口中。虽然它们通常作为后台应用程序运行，但是如果希望的话，它们也可以在前台显示一个用户界面。点击属于用户界面组件的窗口，应用程序将会处理产生的事件。

 Dock和登录窗口是两个用户界面组件应用程序。默认为NO

 Application is background only

 Key: LSBackgroundOnly

 Valeu: BOOL

 说明： 如果该关键字存在并且被设为YES，启动服务将只会运行在后台。您可以使用该关键字来创建无用户界面的后台应用程序。如果您的应用程序使用了连接到窗口服务器的高级框架，但并不需要显示出来，您也应该使用该关键字。后台应用程序必须被编译成Mach-O可执行文件。该选项不适用于CFM应用程序。默认为NO

 您也可以指定该关键字的类型为Boolean或Number。然而，只有Mac OS X 10.2或以上的版本才支持这些类型的值。

 Application is visible in Classic

 Key: LSVisibleInClassic

 Valeu: BOOL

 说明：指定代理的应用程序或后台唯一的应用程序在Classic环境中的其他应用程序是否是可见的。

 Application prefers Carbon environment

 Key: LSPrefersCarbon

 Valeu: BOOL

 说明：如果该关键字被设为YES，Finder将会在显示简介面板中显示“在Classic环境中打开”控制选项，缺省情况下该控件未被选中。如果需要，用户可以修改这个控制选项来在Classic环境中启动应用程序。默认NO

 您也可以指定该关键字的类型为Boolean或Number。然而，只有Mac OS X 10.2或以上的版本才支持这些类型的值。如果您在您的属性列表中加入了该关键字，那么就不要同时加入LSPrefersClassic, LSRequiresCarbon,或LSRequiresClassic关键字。

 Application prefers Classic environment

 Key: LSPrefersClassic

 Valeu: BOOL

 说明：如果该关键字被设为YES，Finder将会在显示简介面板中显示“在Classic环境中打开” 控制选项，缺省情况下该控件被选中。如果需要，用户可以修改这个控制选项来在Carbon环境中启动应用程序。默认NO

 您也可以指定该关键字的类型为Boolean或Number。然而，只有Mac OS X 10.2或以上的版本才支持这些类型的值。如果您在您的属性列表中加入了该关键字，那么就不要同时加入LSPrefersCarbon, LSRequiresCarbon,或LSRequiresClassic关键字。

 Application presents content in Newsstand

 Key: UINewsstandApp

 Valeu: BOOL

 说明：是否允许应用程序在Newsstand中显示。如果设为YES。可以通过设置NewsstandIcon来美化图标。默认NO

 效果：

 NewsstandIcon

 Application presents content in Newsstand

 Application prohibits multiple instances

 Key: LSMultipleInstancesProhibited

 Valeu: BOOL

 说明：指定一个或多个用户是否可以同时启动一个应用程序。默认NO

 Application requires Carbon environment

 Key: LSRequiresCarbon

 Valeu: BOOL

 说明： 如果该关键字被设为YES，启动服务将只在Carbon环境中运行应用程序。如果您的应用程序不应该运行在Classic环境中的话，可以使用该关键字。默认NO

 您也可以指定该关键字的类型为Boolean或Number。然而，只有Mac OS X 10.2或以上的版本才支持这些类型的值。如果您在您的属性列表中加入了该关键字，那么就不要同时加入LSPrefersCarbon, LSPrefersClassic,或LSRequiresClassic关键字。

 Application requires Classic environment

 Key: LSRequiresClassic

 Valeu: BOOL

 说明：如果该关键字被设为YES，启动服务将只在Classic环境中运行应用程序。如果您的应用程序不应该运行在Carbon兼容环境中的话，可以使用该关键字。默认NO

 您也可以指定该关键字的类型为Boolean或Number。然而，只有Mac OS X 10.2或以上的版本才支持这些类型的值。如果您在您的属性列表中加入了该关键字，那么就不要同时加入LSPrefersCarbon, LSPrefersClassic,或LSRequiresCarbon关键字。

 Application requires iPhone environment

 Key: LSRequiresIPhoneOS

 Valeu: BOOL

 说明： 如果应用程序不能在ipod touch上运行，设置此项为YES；默认YES

 Application requires native environment

 Key:LSRequiresNativeExecution

 Value:BOOL

 说明：指定应用程序是否必须在本机运行一个基于Intel的Mac上，而不是根据Rosetta模拟。指定是否要启动该应用程序使用subbinary当前的架构。如果此键被设置为“YES”，启动服务始终运行应用程序使用当前的架构编译的二进制代码。您可以使用此键，以防止一个通用的二进制下运行的Rosetta模拟一个基于Intel的Mac上。默认NO

 Application should get App Died events

 Key:LSGetAppDiedEvents

 Value:BOOL

 说明： 指定是否一个子进程死亡时通知应用程序。如果你的值设置为YES这个关键，系统会发送您的应用程序kAEApplicationDied苹果事件。默认NO

 Application supports iTunes file sharing

 Key:UIFileSharingEnabled

 Value:BOOL

 说明：应用程序支持共享与否；值为boolean值YES 共享；默认NO 不共享

 Application UI Presentation Mode

 Key:LSUIPresentationMode

 Value:Number

 说明：应用程序启动时设置系统UI元素的可见性。确定了初始的应用程序的用户界面模式。你可以使用这个应用程序，可能需要采取部分包含UI元素，如在Dock和菜单栏的屏幕。大多数模式的影响只出现在内容区域中的画面，就是在屏幕的面积，不包括菜单栏的UI元素。但是，您可以要求所有的UI元素被隐藏。

 Value	Description

 0 Normal mode	标准的系统UI元素可见。 默认值。

 1 Content suppressed mode	In this mode, system UI elements in the content area of the screen are hidden. UI elements may show themselves automatically in response to mouse movements or other user activity. For example, the Dock may show itself when the mouse moves into the Dock’s auto-show region.

 2 Content hidden mode	In this mode, system UI elements in the content area of the screen are hidden and do not automatically show themselves in response to mouse movements or user activity.

 3 All hidden mode	In this mode, all UI elements are hidden, including the menu bar. Elements do not automatically show themselves in response to mouse movements or user activity.

 4 All suppressed mode	In this mode, all UI elements are hidden, including the menu bar. UI elements may show themselves automatically in response to mouse movements or other user activity. This option is available only in OS X v10.3 and later.

 Application uses Wi-Fi

 Key:UIRequiresPersistentWiFi

 Value:BOOL

 说明：如果应用程序需要wi-fi才能工作，应该将此属性设置为true。这么做会提示用户，如果没有打开wi-fi的话，打开wi-fi。为了节省电力，iphone会在30分钟后自动关闭应用程序中的任何wi-fi。设置这一个属性可以防止这种情况的发生，并且保持连接处于活动状态；默认NO

 Architecture priority

 Key:LSArchitecturePriority

 Value:String

 说明：用于标识此应用程序支持的体系结构。此阵列中的字符串的顺序决定优选的执行优先级的架构。

 String	Description

 i386	The 32-bit Intel architecture.

 ppc	The 32-bit PowerPC architecture.

 x86_64	The 64-bit Intel architecture.

 ppc64	The 64-bit PowerPC architecture.

 Bundle creator OS Type code

 Key:CFBundleSignature

 Value:String

 说明：指定了束的创建者，类似于Mac OS 9中的文件创建者代码。该关键字的值包含四字母长的代码，用来确定每一个束。默认APPL

 Bundle display name

 Key:CFBundleDisplayName

 Value:String

 说明：这用于设置应用程序的名称，它显示在iphone屏幕的图标下方。应用程序名称限制在10－12个字符，如果超出，iphone将缩写名称。

 Bundle identifier

 Key:CFBundleIdentifier

 Value:String

 说明：身份证书，这个为应用程序在iphone developer program portal web站点上设置的唯一标识符。（就是你安装证书的时候，需要把这里对应修改）。例如com.apple.myapp。该束标识符可以在运行时定位束。预置系统使用这个字符串来唯一地标识每个应用程序。

 Bundle name

 Key:CFBundleName

 Value:String

 说明：安装到手机时文件夹的简称。简称应该小于16个字符并且适合在菜单和“关于”中显示。通过把它加入到适当的.lproj子文件夹下的InfoPlist.strings文件中，该关键字可以被本地化。如果您本地化了该关键字，那您也应该提供一个CFBundleDisplayName关键字的本地化版本。

 Bundle OS Type code

 Key:CFBundlePackageType

 Value:String

 说明：关键字指定了束的类型，类似于Mac OS 9的文件类型代码。该关键字的值包含一个四个字母长的代码。应用程序的代码是‘APPL’；框架的代码是‘FMWK’；可装载束的代码是‘BND’。如果您需要，您也可以为可装载束选择其他特殊的类型代码。

 Bundle version

 Key:CFBundleVersion

 Value:String

 说明：这个会设置应用程序版本号，每次部署应用程序的一个新版本时，将会增加这个编号，在app store用的。

 Bundle versions string, short

 Key:CFBundleShortVersionString

 Value:String

 说明：指定了束的版本号。一般包含该束的主、次版本号。这个字符串的格式通常是“n.n.n”（n表示某个数字）。第一个数字是束的主要版本号，另两个是次要版本号。该关键字的值会被显示在Cocoa应用程序的关于对话框中。

 该关键字不同于CFBundleVersion，它指定了一个特殊的创建号。而CFBundleShortVersionString的值描述了一种更加正式的并且不随每一次创建而改变的版本号。

 Clients allowed to add and remove tool

 Key:SMAuthorizedClients

 Value:Array

 说明：允行添加或移除工具。具体还真不知道什么效果。。。

 Cocoa Java application

 Key:NSJavaNeeded

 Value:BOOL

 说明：用来确定在执行该束的代码之前Java虚拟机是否需要被载入并运行。 默认NO

 Copyright (human-readable)

 Key:NSHumanReadableCopyright

 Value:String

 说明：包含了一个含有束的版权信息的字符串。您可以在“关于”对话框中显示它。该关键字通常会出现在InfoPlist.strings文件中，因为往往需要本地化该关键字的值。

 Core Data persistent store type

 Key:NSPersistentStoreTypeKey

 Value:String

 说明：核心数据存储的文档类型。

 string	description

 Sqlite	使用SQLITE存储数据

 XML	使用XML文档存储数据

 Binary	使用二进制流文件存储数据

 Memoery	使用内存存储数据。

 Dock Tile plugin path

 Key:NSDockTilePlugIn

 Value:String

 说明：停靠插件路径。这个Dock可以挂载一个叫NSDockTilePlugIn的 bundle，开发这个类似很多OSGI模型开发bundle一样，继承NSDockTilePlugIn，然后你实现相应的methods，完之后build出来放到指定的目录下，然后在某个特定的“动作”。

 1，build后的bundle必须放到你app下的Contents/PlugIns下，且必须在property list文件中申明，其中内容为.docktileplugin结尾的插件名。

 2，插件必须扩展NSDockTilePlugI，当插件加载的时候， setDockTile方法就会被执行，并且返回一个NSDockTile，你可以在这里做些其他初始化工作。

 3，你的插件和主程序可以同时updateDock title，但主程序的优先级更高。

 4，当你的application 从dock去除的时候，会把NSDockTile指向nil，在Object-C中指向nil的对象是自动释放内存并把指针指向NULL。

 Dock Plugin 主要做几个工作：

 1 其中更改dock上application的图标。

 2 更改badge：

 3 定义自己的menu：

 加徽章（Badge）  -------------图标上的数字。

 换图标

 隐藏和显示最小化时的图标徽章

 增加自定义Dock菜单

 苹果官方说明：

 The NSDockTilePlugIn protocol defines the methods implemented by plug-ins that allow an application’s Dock tile to be customized while the application is not running.

 Customizing an application’s Dock tile when the application itself is not running requires that you write a plug-in. The plug-in’s principal class must implement the NSDockTilePlugIn protocol.

 The name of the plugin is indicated by a NSDockTilePlugIn key in the application's Info.plist file.

 Document types

 Key:CFBundleDocumentTypes

 Value:Array

 说明：保存了一组字典，它包含了该应用程序所支持的文档类型。每一个字典都被称做类型定义字典，并且包含了用于定义文档类型的关键字。下表列出了类型定义字典中支持的关键字。

 关键字	类型	描述

 CFBundleTypeExtensions	Array	该关键字包含了一组映射到这个类型的文件扩展名。为了打开具有任何扩展名的文档，可以用单个星号“*”。该关键字是必须的。

 CFBundleTypeIconFile	String	该关键字指定了系统显示该类文档时使用的图标文件名，该图标文件名的扩展名是可选的。如果没有扩展名，系统会根据平台指定一个（例如，Mac OS 9中的.icons）。

 CFBundleTypeName	String	该关键字包含了这种文档类型的抽象名称。通过在适当的InforPlist.strings文件中包含该关键字，可以实现对它的本地化。

 CFBundleTypeOSTypes	Array	该关键字包含了一组映射到这个类型的四字母长的类型代码。为了打开所有类型的文档，可以把它设为“**”。该关键字是必须的。

 CFBundleTypeRole	String	该关键字定义了那些与文档类型有关的应用程序的角色。它的值可以是Editer，Viewer，Printer，Shell或None。有关这些值的详细描述可以参见“ 文档的配置” 。该关键字是必须的。

 NSDocumentClass	String	该关键字描述了被用来实例化文档的NSDocument子类。仅供Cocoa应用程序使用。

 NSExportableAs	Array	该关键字描述了一组可以输出的文档类型。仅供Cocoa应用程序使用。

 Environment variables

 Key:LSEnvironment

 Value:Dictionary

 说明：环境变量。

 Executable architectures

 Key:LSExecutableArchitectures

 Value:Array

 说明： 可执行文件框架。

 intel - 32 bit

 intel - 64 bit

 powerpc 32 bit

 powerpc 64 bit

 Executable file

 Key:CFBundleExecutable

 Value:String

 说明：应用程序的可执行文件。对于一个可加载束,它是一个可以被束动态加载的二进制文件。对于一个框架，它是一个共享库。Project Builder会自动把该关键字加入到合适项目的Info.plist文件中。

 Exported Type UTIs

 Key:UTExportedTypeDeclarations

 Value:Array

 说明：导出UTI（Unique Type Identifier）类型。

 File quarantine enabled

 Key:LSFileQuarantineEnabled

 Value:BOOL

 说明：启用文件隔离，默认NO

 Fonts provided by application

 Key:UIAppFonts

 Value:Array

 说明：用于在APP中使用第三方字体，在Array中添加字体库名称

 Get Info string

 Key:CFBundleGetInfoString

 Value:String

 说明： CFBundleGetInfoString关键字含有会在束的信息窗口中显示的纯文本字符串（这里的字符串也就是Mac OS 9中的长字符串）。该关键字的格式应该遵照Mac OS 9中的长字符串，例如：“2.2.1, ? Great Software, Inc, 1999”。通过把它加入到合适的.lproj目录中的InfoPlist.strings文件中，您也可以本地化该字符串。

 如果存在CFBundleGetInfoHTML的话，系统不会选择使用该关键字。

 Help Book directory name

 Key:CFBundleHelpBookFolder

 Value:String

 说明：帮助目录，CFBundleHelpBookFolder关键字含有该束的帮助文件的文件夹名字。帮助通常被本地化成一种指定的语言，所以该关键字指向的文件夹应该是所选择语言的.lproj目录中的文件夹。

 Help Book identifier

 Key:CFBundleHelpBookName

 Value:String

 说明：CFBundleHelpBookName指定了您的应用程序的帮助主页。该关键字指定的帮助页面名可以和HTML文件名不同。在帮助文件META标签的CONTENT属性中指定了帮助页面名。

 Help file

 Key:CFAppleHelpAnchor

 Value:String

 说明：定义了束的初始HTML帮助文件名，不需要包括.html或.htm扩展名。这个文件位于束的本地化资源目录中，或者如果没有本地化资源目录的话，则直接被放在Resources目录中。

 Icon already includes gloss effects

 Key:UIPrerenderedIcon

 Value:BOOL

 说明：默认情况下，应用程序被设置了玻璃效果，把这个设置为true可以阻止这么做。默认NO

 Icon file

 Key:CFBundleIconFile

 Value:String

 说明：设置应用程序图标的。CFBundleIconFile关键字指定了包含该束图标的文件。您给出的文件名不需要包含“.icns”扩展名。Finder会在该束的“Resource”文件夹内寻找图标文件。如果您的束使用了自定义的图标，那您就必须指定该属性。假如您没有指定，Finder（和其他应用程序）会使用缺省的图标来显示您的束。

 Icon files

 Key:CFBundleIconFiles

 Value:String

 说明：应用程序图标。

 Icon files (iOS 5)

 Key:CFBundleIcons

 Value:string

 说明：应用程序图标。

 Imported Type UTIs

 Key:UTImportedTypeDeclarations

 Value:Array

 说明：引入UTIs类型？

 Initial interface orientation

 Key:UIInterfaceOrientation

 Value:String

 说明：确定了应用程序以风景模式还是任务模式启动。

 string	description

 Portrait(bottom home button)	坚屏，状态条远离HOME按钮。

 Portrait(top home button)	坚屏，状态条近HOME键，在手机上就显示为颠倒的显示。

 Landscape(left home button)	横屏：以HOME键在左为基准，显示VIEW。即手拿真机横着时HOME按钮在左手边时，观看屏幕。

 Landscape(right home button)	横屏：以HOME键在右为基准，显示VIEW。

 Installation directory base file URL

 Key:APInstallerURL

 Value:String

 说明：指定了一个指向您希望安装的文件的路径。您必须以file://localhost/path/ 形式来说明这个路径。所有被安装的文件必须位于这个文件夹中。

 Installation files

 Key:APFiles

 Value:Dictionary

 说明：指定了一个字典，描述了您希望安装的文件。每个字典条目可以包含某个文件或目录的描述。您可以让APFiles 关键字包含在其自身中，用于指定在目录内部的文件。下表列出了用来指定有关单个文件或目录的信息。

 关键字	类型	描述

 APFileDescriptionKey	String	用来显示在Finder的信息窗口中的简短描述。

 APDisplayedAsContainer	String	如果值为“Yes”，该项目作为一个目录图标显示在信息面板中；否则，它被显示为一个文档图标。

 APFileDestinationPath	String	一个安装组件的相对路径。

 APFileName	String	文件或目录的名称。

 APFileSourcePath	String	指向应用程序包中组件的路径，相对与APInstallerURL路径。

 APInstallAction	String	操纵组件的动作：“Copy”或者“Open”

 InfoDictionary version

 Key:CFBundleInfoDictionaryVrsion

 Value:String

 说明：指定了属性列表结构的当前版本号。该关键字的存在使得可以支持Info.plist格式将来的版本。在您建立一个束时，Project Builder会自动产生该关键字。

 Java classpaths

 Key:NSJavaPath

 Value:String

 说明：包含了一组路径。每一个路径指向一个Java类。该路径相对于由NSJavaRoot关键字定义的位置来说，可能是一个绝对路径也可能是一个相对路径。开发环境会自动把这些值保存在数组中。

 Java root directory

 Key:NSJavaRoot

 Value:String

 说明： 一个指向一个目录的字符串。该目录是应用程序的Java类文件的根目录。

 Launch image

 Key:UILaunchImageFile

 Value:string

 说明：启动图像。根据不同设备来设置图片的规格大小。

 Launch image (iPad)

 Key:UILaunchImageFile~ipad

 Value:string

 说明：启动图像。根据不同设备来设置图片的规格大小

 Launch image (iPhone)

 Key:UILaunchImageFile~iphone

 Value:string

 说明：启动图像。根据不同设备来设置图片的规格大小。

 Localization native development region

 Key:CFBundleDevelopmentRegion

 Value:String

 说明：定位本地开发地区。本地化相关，如要设置拍照下面按钮显示中文，可以将其设置为China

 Localizations

 Key:CFBundleLocalizations

 Value:String

 说明： 多语言。应用程序本地化的一列表，期间用逗号隔开，例如应用程序支持英语 日语，将会适用 English,Japanese.

 Localized resources can be mixed

 Key:CFBundleAllowMixedLocalizations

 Value:BOOL

 说明：本地化资源可以混合，默认为NO，设置YES表示允许库使用本地语言资源

 Main nib file base name

 Key:NSMainNibFile

 Value:String

 说明：包含了一个含有应用程序的主nib文件名（不包含.nib文件扩展名）的字符串。一个nib文件作为一个Interface Builder的存档文件，含有对用户界面的详细描述信息以及那些界面中的对象之间的关联信息。当应用程序被启动时，主nib文件会被自动装载。Mac OS X会寻找与应用程序名相匹配的nib文件。

 Main nib file base name (iPad)

 Key:NSMainNibFile~ipad

 Value:String

 说明：(IPAD)包含了一个含有应用程序的主nib文件名（不包含.nib文件扩展名）的字符串。一个nib文件作为一个Interface Builder的存档文件，含有对用户界面的详细描述信息以及那些界面中的对象之间的关联信息。当应用程序被启动时，主nib文件会被自动装载。Mac OS X会寻找与应用程序名相匹配的nib文件。

 Main nib file base name (iPhone)

 Key:NSMainNibFile~iphone

 Value:String

 说明：(Iphone)包含了一个含有应用程序的主nib文件名（不包含.nib文件扩展名）的字符串。一个nib文件作为一个Interface Builder的存档文件，含有对用户界面的详细描述信息以及那些界面中的对象之间的关联信息。当应用程序被启动时，主nib文件会被自动装载。Mac OS X会寻找与应用程序名相匹配的nib文件。

 Main storyboard file base name

 Key:UIMainStoryboardFile

 Value:string

 说明：storyboard文件名

 Main storyboard file base name (iPad)

 Key:UIMainStoryboardFile~ipad

 Value:string

 说明：（iPad）storyboard文件名

 Main storyboard file base name (iPhone)

 Key:UIMainStoryboardFile~iphone

 Value:string

 说明：（iPhone）storyboard文件名

 Minimum system version

 Key:LSMinimumSystemVersion

 Value:string

 说明：最小系统版本

 Minimum system versions, per-architecture

 Key:LSMinimumSystemVersionByArchitecture

 Value:Dictionary

 说明：最小系统版本及其架构。包含Intel (32-bit)、Intel (64-bit)、PowerPC (32-bit)、PowerPC (64-bit)

 Plug-in dynamic registration function name

 Key:CFPlugInDynamicRegisterFunction

 Value:String

 说明：插件动态注册函数名。文件预览和用其他方式打开有关

 Plug-in factory interfaces

 Key:CFPlugInFactories

 Value:Dictionary

 说明： 插件工厂接口，设置文件预览和其他方式打开。。。

 Plug-in should be registered dynamically

 Key:CFPlugInDynamicRegistration

 Value:BOOL

 说明：是否动态注册插件

 Plug-in types

 Key:CFPlugInTypes

 Value:dictionary

 说明： 插件类型

 Plug-in unload function name

 Key:CFPlugInUnloadFunction

 Value:string

 说明：插件卸载函数名

 Preference Pane icon file

 Key:NSPrefPaneIconFile

 Value:String

 说明：首选项面板图标文件

 The name of an image file resource used to represent a preference pane in the System Preferences app. SeeNSPrefPaneIconFile for details.

 Preference Pane icon label

 Key:NSPrefPaneIconLabel

 Value:String

 说明： 首选项面板图标标签

 The name of a preference pane displayed beneath the preference pane icon in the System Preferences app. SeeNSPrefPaneIconLabel for details.

 Preferences sync exclusion keys

 Key:com.apple.PreferenceSync.ExcludeSyncKeys

 Value:Array

 说明：偏好设置同步排除键

 Principal class

 Key:NSPrincipalClass

 Value:String

 说明：定义了一个束的主类的名称。对于应用程序来说，缺省情况下这个名字就是应用程序的名字。

 Quick Look needs to be run in main thread

 Key:QLNeedsToBeRunInMainThread

 Value:BOOL

 说明：快速查找是否需要在主线程中运行。默认YES

 Quick Look preview height

 Key:QLPreviewHeight

 Value:Number

 说明：快速查看预览高度，默认800

 Quick Look preview width

 Key:QLPreviewWidth

 Value:Number

 说明：快速查看预览宽度，默认600

 Quick Look supports concurrent requests

 Key:QLSupportsConcurrentRequests

 Value:BOOL

 说明：快速浏览支持并发请求。默认NO

 Quick Look thumbnail minimum size

 Key:QLThumbnailMinimumSize

 Value:Number

 说明：快速浏览缩略图最小大小。默认17

 Renders with edge antialisasing

 Key:UIViewEdgeAntialiasing

 Value:BOOL

 说明：用于指示在描画不和像素边界对齐的层时，Core Animation层是否进行抗锯齿处理。这个特性使开发者可以在仿真器上进行更为复杂的渲染，但是对性能会有显著的影响。如果属性列表上没有这个键，则其缺省值为NO。这个键只在iPhone OS 3.0和更高版本上支持。

 如果信息属性文件中的属性值是显示在用户界面上的字符串，则应该进行本地化，特别是当Info.plist中的字符串值是与本地化语言子目录下InfoPlist.strings文件中的字符串相关联的键时。更多信息请参见“国际

 化您的应用程序”部分。

 Renders with group opacity

 Key:UIViewGroupOpacity

 Value:BOOL

 说明：用于指示Core Animation子层是否继承其超层的不透明特性。这个特性使开发者可以在仿真器上进行更为复杂的渲染，但是对性能会有显著的影响。如果属性列表上没有这个键，则其缺省值为NO。这个键只在iPhone OS 3.0和更高版本上支持。

 Required background modes

 Key:UIBackgroundModes

 Value:Array

 说明： 后台执行模式。可以参考这个例子。

 Required device capabilities

 Key:UIRequiredDeviceCapabilities

 Value:Array

 说明：指定程序适用于哪些设备。如：当提交程序到app store时，3.0及更高版本的应用程序不再直接说明使用哪种设备，而是使用info.plist文件来确定需要哪些设备功能。iTunes通过这个所需功能的列表来确定一个应用程序能否下载到一个指定的设备并在该设备上正常运行。

 例如，info.plist中的如下设置，那么只有居右wifi、电话功能和麦克风（内置的或附件所带的麦克风功能）的ios设备才能运行该程序。

 Required device capabilities

 除了wifi和telephony项，还有很多项代表各种设备功能，详见下表

 value	description

 sms	应用程序需要Messages应用程序或者使用sms://URL

 still-camera	应用程序需要使用照相机模式作为图像选取器的控制器

 auto-focus-camera	应用程序需要使用更多的聚焦功能以进行微距摄影或者拍摄特别清晰的图像以进行图像内数据检测

 video-camera	应用程序需要使用视频模式作为图像选取器的控制器

 accelerometer	应用程序需要特定于加速计的反馈而不知是简单的UIViewController方向事件

 location-services	应用程序需要使用Core Location

 gps	应用程序需要使用Core Location并需要更加精确的gps定位

 magnetometer	应用程序需要使用Core Location并需要与前进方向相关的事件，即行进的方向（通过磁力计获得）

 peer-peer	应用程序需要使用GameKit通过蓝牙（3.1或更高版本）进行对等连接

 opengles-1	应用程序需要OpenGL ES 1.1

 opengles-2	应用程序需要OpenGL ES 2.0

 armv-6	应用程序仅针对armv6指令集（3.1或更高版本）编译

 armv-7	应用程序仅针对armv7指令集（3.1或更高版本）编译

 wifi	当您的应用程序需要设备的网络特性时，包含这个键。

 microphone	如果您的应用程序需要使用内置的麦克风或支持提供麦克风的外设，则包含这个键。

 telephony	如果您的应用程序需要Phone程序，则包含这个键。如果您的应用程序需要打开tel模式的URL，则可能需要这个特性。

 Resources should be file-mapped

 Key:CSResourcesFileMapped

 Value:BOOL

 说明：是否进行文件映射。指定是否将应用程序的资源映射文件到内存中。否则，他们通常读入内存。对于经常访问的资源数量，使用文件映射可以提高性能。然而，资源被映射到只读存储器，不能被修改。

 Scriptable

 Key:NSAppleScriptEnabled

 Value:BOOL

 说明：说明了该应用程序是否支持AppleScript。如果您的应用程序支持，就需要把该字符串的值设为“Yes”。

 Scripting definition file name

 Key:OSAScriptingDefinition

 Value:String

 说明： 脚本文件名

 Services

 Key:NSServices

 Value:Array

 说明：包含了一组字典，它详细说明了应用程序所提供的服务。

 NSServices字典的关键字详情见下表

 关键字	类型	描述

 NSPortName	String	该关键字指定了由您的应用程序监听器为接受外部服务请求所提供的端口名称。

 NSMessage	String	该关键字指定了用来调用该服务的实例方法名。在Objective-C中，实例方法的形式是messageName:userData:error:。在Java中，实例方法的形式是messageName(NSPasteBoard.String)。

 NSSendTypes	Array	该关键字指定了一组可以被该服务读取的数据类型名。NSPasteboard类列出了几个常用的数据类型。您必须包含此关键字，NSReturnTypes，或者两者。

 NSReturnTypes	Array	该关键字指定了一组可以被该服务返回的数据类型名。NSPasteboard类列出了几个常用的数据类型。您必须包含此关键字，NSSendTypes，或者两者。

 NSMenuItem	Dictionary	该关键字包含一个字典，它指定了加入Services菜单中的文本。字典中的唯一一个关键字被称为default并且它的值是菜单项的文本。该值必须是唯一的。您可以使用斜杠“/”来指定一个子菜单。例如，Mail/Send出现在Services菜单中时就是一个带有Send子菜单并且名为Mail的菜单。

 NSKeyEquivalent	Dictionary	该关键字是可选的，并且包含一个含有用来请求服务菜单命令的快捷按键的字典。与NSMenuItem类似，字典中的唯一一个关键字被称为default并且它的值是单个的字符。用户可以通过按下Command，Shift功能键和相应的字符来请求该快捷按键。

 NSUserData	String	该关键字是一个可选字符串，它含有您的选择值。

 NSTimeout	String	该关键字是一个可选的数字字符串，它指定了从应用程序请求服务到收到它的响应所需要等待的毫秒数。

 Status bar style

 Key:UIStatusBarStyle

 Value:String

 说明：选择三种不同格式种的一种。gray、translation aplah 5.0、black。

 Status bar is initially hidden

 Key:UIStatusBarHidden

 Value:BOOL

 说明：设置是否隐藏状态栏。YES时隐藏，FALSE时不隐藏。

 Supported external accessory protocols

 Key:UISupportedExternalAccessoryProtocols

 Value:Array

 说明： 指定应用程序与外界硬件配件间支持的通迅协议，這個键值是一组设定，可以指定多个通迅协议。

 Supported interface orientations

 Key:UISupportedInterfaceOrientations

 Value:Array

 说明：设定应用程序的显示模式。

 Supported interface orientations (iPad)

 Key:UISupportedInterfaceOrientations~ipad

 Value:Array

 说明：设定应用程序的显示模式。

 Supported interface orientations (iPhone)

 Key:UISupportedInterfaceOrientations~iphone

 Value:Array

 说明：设定应用程序的显示模式。如：iOS设备的三种不同的分辨率：iPhone 320x480, iPhone 4 640x960, iPad 768x1024。以前程序的启动画面(图片)只要准备一个Default.png就可以了，但是现在变得复杂多了。

 如果一个程序，既支持iPhone又支持iPad，那么它需要包含下面几个图片：

 Default-Portrait.png iPad专用竖向启动画面 768x1024或者768x1004

 Default-Landscape.png iPad专用横向启动画面 1024x768或者1024x748

 Default-PortraitUpsideDown.png iPad专用竖向启动画面(Home按钮在屏幕上面)，可省略 768x1024或者768x1004

 Default-LandscapeLeft.png iPad专用横向启动画面，可省略 1024x768或者1024x748

 Default-LandscapeRight.png iPad专用横向启动画面，可省略 1024x768或者1024x748

 Default.png iPhone默认启动图片，如果没有提供上面几个iPad专用启动图片，则在iPad上运行时也使用Default.png（不推荐） 320x480或者320x460
 
 Default@2x.png iPhone4启动图片640x960或者640x920
 
 为了在iPad上使用上述的启动画面，你还需要在info.plist中加入key:UISupportedInterfaceOrientations。同时，加入值UIInterfaceOrientationPortrait、UIInterfacOrientationPortraitUpsideDown、 UIInterfaceOrientationLandscapeLeft、UIInterfaceOrientationLandscapeRight
 
 Tools owned after installation
 
 Key:SMPrivilegedExecutables
 
 Value:Dictionary
 
 说明：辅助工具，辅助工具必须有一个嵌入式的Info.plist中包含的“SMAuthorizedClients”的字符串数组。每个字符串是一个文本表示的代码签名要求描述一个客户端，它允许添加和删除工具。
 
 URL types
 
 Key:CFBundleURLTypes
 
 Value:Array
 
 说明：包含了一组描述了应用程序所支持的URL协议的字典。它的用途类似于CFBundleDocumentTypes的作用，但它描述了URL协议而不是文档类型。每一个字典条目对应一个单独的URL协议。
 
 字典的关键字
 
 关键字	类型	描述
 
 CFBundleTypeRole	String	该关键字定义了那些与URL类型有关的应用程序的角色（即该应用程序与某种文档类型的关系）。它的值可以是Editer，Viewer，Printer，Shell或None。有关这些值的详细描述可以参见“ 文档的配置”。该关键字是必须的。
 
 CFBundleURLIconFile	String	该关键字包含了被用于这种URL类型的图标文件名（不包括扩展名）字符串。
 
 CFBundleURLName	String	该关键字包含了这种URL类型的抽象名称字符串。为了确保唯一性，建议您使用Java包方式的命名法则。这个名字作为一个关键字也会在InfoPlist.strings文件中出现，用来提供该类型名的可读性版本。
 
 CFBundleURLSchemes	Array	该关键字包含了一组可被这种类型处理的URL协议。例如：http,ftp等。

*/
