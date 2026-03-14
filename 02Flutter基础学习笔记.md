# Flutter 命令

```dart
flutter doctor                # 检查环境 
flutter create my_app         # 创建项目 
flutter run                   # 运行项目 
flutter emulators             # 查看模拟器 
flutter emulators --launch xxx   # 启动模拟器 
flutter devices               # 查看连接设备 
emulator -avd xxx             # 启动 AVD 统命令) 
flutter run -d emulator-5554 //运行项目到这个设备 
emulator -avd Medium_Tablet -gpu host //强制启动 
emulator -avd Medium_Tablet //启动设备


```





flutter的web工程

```dart
//flutter的web工程
flutter create --platforms web <项目名称>
```

# flutter工程目录

.dart tool	#Dart工具生成的文件和缓存
.idea	#IntelliJ IDEA配置文件
build	#构建产物目录，包含编译生成的文件
**lib	#项目的主要源代码目录**
	**main.dart	#应用程序入口点**
test	#测试文件目录
web	#Web平台特定的配置和资源文件
.gitignore	#Gt版本控制忽略文件配置
metadata	#Flutter项目标识文件（自动生成)
analysis._options.yaml	#配置静态代码分析工具
flutter_core.iml	#用于存储模块(Module)的特定设置
pubspec.lock	#依赖锁定文件
**pubspec.yaml	#项目依赖和配置文件**
README.md	#项目说明文档

### 启动文件说明-runApp和Widget

启动Flutter应用使用runApp方法
runApp方法中需要传入一个Widget

**runApp**函数是Flutter内部提供的一个函数，启动一个Flutter应用就是从调用这个函数开始的----一般在**main.dart**中寻找
**Widget**表示**控件、组件、部件**的含义，Flutter中万物皆Widget

### Flutter的默认Material库

●Material是Google公司推行的一套设计风格，有很多的设计规范，如颜色、文字排版、动画等
●目的：Material为Android、Web、iOS、HarmonyOS多个平台提供统一的交互和视觉体验

### 组件--MartialApp

特性：整个应用被MaterialApp包裹，方便我们对整个应用的属性进行整体设计
常见属性：title/theme/home
	title:用来展示窗口的标题内容（可以不设置）
	theme:用来设置整个应用的主题
	home:用来展示窗口的主体内容

### Scaffold组件

Scaffold:用于构建Material Design风格页面的核心布局组件，提供标准、灵活配置的页面骨架

|         属性         | 主要作用说明                                           |
| :------------------: | :----------------------------------------------------- |
|        appBar        | 页面顶部的应用栏，通常用于显示标题、导航按钮和操作菜单 |
|         body         | 页面的主要内容区域，可以放置任何其他组件，是页面的核心 |
| bottomNavigationBar  | 底部导航栏，方便用户在不同核心功能页面间切换           |
|   backgroungColor    | 设置整个Scaffold的背景颜色                             |
| floatingActionButton | 悬浮操作按钮，常用于触发页面的主要动作                 |
|         ...          | 其他                                                   |

```dart
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    title: "flutter app",
    // theme: ThemeData(scaffoldBackgroundColor: Colors.green),
    home: Scaffold(
      appBar: AppBar(
        title: Text("app bar头部区域"),
        centerTitle: true,
      ),  
      body:Container(
        child:Center(
          child: Text("body中部区域"),
        )     
      ),
      bottomNavigationBar: Container(
        height: 80,
        child:Center(
          child:Text("bottomNavigationBar底部区域"),
        )
      ),
    )));
}
```

**Materialapp**包裹整个应用形成统一的Material Design风格
**Scoffold**组件可快速搭建页面骨架，如appBar、body、bottomNavigationBar等
**Container**用来作为容器，设置高度(height),child用来存放子组件
**Text**是用来显示文本的组件

### 自定义组件-无状态组件和有状态组件

定义：根据自己特定的需求创建自己的Widget
分类：Flutter分为无状态组件和有状态组件

|   特性   |      StatelessWidget(无状态)       |            Statefulwidget(有状态)            |
| :------: | :--------------------------------: | :------------------------------------------: |
| 核心特征 |      一旦创建，内部状态不可变      |        持有可在其生命周期内改变的状态        |
| 使用场景 | 静态内容展示，外观仅由配置参数决定 | 交互式组件，如计数器、可切换开关、表单输入框 |
| 生命周期 |   相对简单，主要是构建（build）    |      更为复杂，包含状态创建、更新和销毁      |
| 代码结构 |               单个类               |   两个关联的类：Widget本身和单独的State类    |

#### 无状态组件-StatelessWidget

●定义：创建一个新的类，继承StatelessWidget类并实现build方法
●要点：build返回一个Widget
●场景：纯展示型组件，没有用户交互操作
需求：把之前案例的骨架换成无状态组件

#### 有状态组件-StatefulWidget

定义：有状态组件是构建**动态交互界面**的核心，能够管理变化的内部状态，当**状态改变**时，组件会更新显示内容

实现1：创建两个类，第一个类继承**StatefulWidget**类，主要接收和定义最终参数，核心作用是创建**State**对象

实现2：第二个类**继承State<第一个类名>**，负责管理所有**可变的数据和业务逻辑**，并实现**build构建方法**

要点：**build方法需要返回一个Widget**

需求：将之前骨架组件换成有状态组件

##### 有无状态组件扩展 快捷键

vscode中无状态组件stless

有状态组件stful

无状态组件快捷键：statelessW
有状态组件快捷键：statefulW

### 生命周期 组件

#### 无状态组件 生命周期

无状态组件-唯一阶段
build方法
当**组件被创建或父组件状态变化**导致其需要重新构建时，buld方法会被调用

#### 有状态组件 生命周期

![image-20260204224740247](https://gitee.com/Dawson771/pic-bed/raw/master/img/202602042247427.png)

|  生命周期阶段  |         函数名          | 调用时机与核心任务                                           |
| :------------: | :---------------------: | ------------------------------------------------------------ |
|    创建阶段    |      createState()      | Widget初始化调用，创建State对象                              |
|                |       initState()       | State对象插入widget树立刻执行，**仅执行一次**                |
|                | didChangeDependencies() | initState后立刻执行，当所依赖的InheritedWidget更新时 调用，可能多次 |
| 构建与更新阶段 |         build()         | 构建UI方法，初始化或更新后**多次调用**                       |
|                |    didUpdatewidget()    | 父组件传入新配置时调用，用于比较新旧配置                     |
|    销毁阶段    |      deactiveate()      | 当State对象从树中暂时移除时调用                              |
|                |        dispose()        | 当State对象被永久移除时调用，释放资源，**仅执行一次**        |

无状态组件-build
有状态组件（创建阶段）：createState->initState->didChangeDependencies->build
有状态组件（更新阶段）：didUpdatewidget->build
有状态组件（销毁阶段）：deactivate->dispose
执行一次函数：createState、initState、dispose
**Inheritedwidget**:专门用于在Widget树中自顶向下高效地共享数据，顶层组件提供数据，子孙节点直接获取

### 事件-点击事件GestureDetector

●事件：用户与应用程序交互时触发的各种动作，比如**触摸屏幕、滑动、点击**等
●点击事件：当**点击**某个元素触发的动作
●常规方案：**GestureDetector**是Flutter中最常用、功能最丰富的手势检测组件。

#### 事件-组件点击事件

●组件：Flutter:提供了多种方式为组件添加点击交互

|   组件类别   |                           核心组件                           | 主要特点/使用场景                                       |
| :----------: | :----------------------------------------------------------: | ------------------------------------------------------- |
| 专用按钮组件 | ElevatedButton、TextButton、 OutlineButton、FloatingActionButton | 内置点击动画和样式，通过onPressed参数处理点击逻辑       |
| 视觉反馈组件 |                           Inkwell                            | 提供点击事件(onTap)，有MaterialDesign风格的水纹扩散效果 |
| 其他交互组件 |                 IconButton、Switch、Checkbox                 | 具有特定功能的交互式控件、点击事件(onPressed)           |

#### 状态更新-setState

●场景：计数器，点击+进行数量+1，点击-进行数量-1，UI视图需要进行**相应更新**。
●语法：数据的变化要更新UI视图，需要执行**setState**方法，**setState方法会造成build的重新执行**。
●案例：实现一个计数器案例    ---9setState-状态更新

### 布局组件-介绍

●Flutter提供了丰富强大的布局组件来构建各种用户界面。下面这个表格汇总了最核心的几类布局组件

| 组件类别 |             核心组件              | 主要特点/使用场景                                            |
| :------: | :-------------------------------: | ------------------------------------------------------------ |
| 基础容器 | Container、Center、Align、Padding | 提供装饰、对齐、边距等基础样式和布局控制，是使用频率极高的组件 |
| 线性布局 |            Row、Column            | 在水平或垂直方向线性排列子组件，是构建界面的基础             |
| 弹性布局 |      Flex,Expanded, Flexible      | 按照比例分配剩余空间，实现自适应布局，常与Row和Column配合使用 |
| 层叠布局 |         Stack, Positioned         | 让子组件重叠堆叠，用于实现如图片上叠加文字、悬浮按钮等效果   |
| 流式布局 |            Wrap, Flow             | 当主轴空间不足时自动换行或换列，常用于标签、滤镜等动态宽高内容的排列 |
| 滚动布局 |        ListView, GridView         | 提供可滚动的列表或网格视图，高效展示大量数据                 |

#### 基础容器-Container

● 定义：Container是功能丰富的布局组件，是一个**多功能组合容器**
● 尺寸控制：可通过多种方式定义大小，有明确优先级规则。
● 优先级：明确宽高>constraints约束>父组件约束>自适应组件大小
● 装饰系统：通过**decoration**,属性实现视觉效果，但和**color**属性互斥
● 布局控制：提供**内外边距**和对齐方式
● 可选变化：支持绘制时进行矩阵变换，如**旋转、倾斜、平移**等

基础容器-Container-常见属性

| 属性类别 |         关键属性         | 作用说明                                                     |
| :------: | :----------------------: | ------------------------------------------------------------ |
| 布局定位 |        alignment         | 控制其child（子组件）在容器内部的对齐方式。 例如：Alignment.center（居中）、Alignment.topLeft（左上角） |
| 尺寸控制 | width/height/constraints | 设置容器的宽度和高度/为容器设置更复杂的尺寸约束（如最小/最大宽高） |
| 间距留白 |      padding/margin      | 按照比例分配剩余空间，实现自适应布局，常与Row和Column配合使用 |
| 装饰效果 |     color/decoration     | 为容器设置一个简单的背景颜色/为容器设置复杂的背景装饰        |
| 变换效果 |        transform         | 对容器及其内容进行矩阵变换                                   |
|  子组件  |          child           | 容器内包含的唯一直接子组件                                   |

Container:基础布局组件，可以方便地容纳一个子组件，并对其施加各种样式、布局约束和变换

#### 基础容器-Center-居中组件

●Center：将其子组件在父容器的空间内进行水平和垂直方向上的居中排列

●应用场景：页面内容整体居中，如将一个登录表单或一个加载中的提示图标在页面正中显示
●注意事项：Center不能设置宽高，Center的最终大小取决于其父组件传递给它的约束，Center:会向它的父组件**申请尽可能大的空间**
●实现固定宽高且居中的组件：Center去包裹一个具有固定宽高的子组 Container/.SizeBox

#### 基础容器-Align-对齐组件

●作用：精确控制其子组件在父容器空间内的**对齐位置**
●alignment(对齐方式)：子组件在父容器内的**对齐方式**。
●widthFactor(宽度因子)：Align的**宽度**将是子组件宽度乘以该因子
●heightFactor(高度因子)：Align的**高度**将是子组件高度乘以该因子

●与Center的区别：Center:是Align的一个特例，继承自Align,相当于一个将alignment/属性为居中的Align.center
●使用场景：当需要将一个组件放置在父容器的特定角落，Align是理想选择。
●动态尺寸：通过widthFactor和heightFactor,可以创建出与子组件大小成比例的容器，动态布局中很有用

#### 基础容器-Padding-内边距组件

●作用：为其子组件添加内边距

| 属性    | 类型               | 作用说明                                                 |
| ------- | ------------------ | -------------------------------------------------------- |
| padding | EdgelnsetsGeometry | 必需。定义内边距的大小和方向，通常使用Edgelnsets类来设置 |
| child   | Widget             | 需要被添加内边距的子组件。                               |

```
child:Padding(          //padding设置子组件内边距
            // padding: EdgeInsets.only(top: 20,left:10,right:  70),
            padding: EdgeInsets.all(70),
            child: Container(
              color: Colors.red,
              child: Text("Padding的子组件"),
            )
          )
```

特点：功能单一而纯粹，就是添加内边距。如果需求仅是为组件添加间距，那么直接使用Padding组件
区别：Containert也有padding属性，单一需求用Padding组件，复杂样式用Container

#### 线性布局 Column

作用：用于**垂直排列**其子组件的核心布局容器

| 属性               | 类型                | 作用说明                                                     |
| ------------------ | ------------------- | ------------------------------------------------------------ |
| mainAxisAlignment  | MainAxisAlig nment  | 控制子组件在主轴（垂直方向）上的排列方式，如顶部对齐、居中或均匀分 布。 |
| crossAxisAlignment | CrossAxisAlig nment | 控制子组件在交叉轴（水平方向）上的对齐方式，如左对齐、右对齐或拉伸 填满。 |
| mainAxisSize       | MainAxisSize        | 决定 Column本身在垂直方向上的尺寸策略：是占满所有可用空间（max）， 还是仅仅包裹子组件内容（min）。 |
| children           | List<Weight>        | 需要被垂直排列的子组件列表。                                 |

几乎在所有需要垂直排列元素的界面中都能看到它的身影
表单：如登录页面的用户名输入框、密码输入框和登录按钮的垂直排列。
设置列表：如设置页面中多个选项项的垂直堆叠。
卡片布局：如新闻流中多个新闻卡片的垂直排列。
图文混排：如商品详情页的图片、标题、描述和价格等信息从上到下的展示。

注意事项：Column本身不支持滚动，如果内容超出，需要使用ListView或者SingleChildScrollView包裹
明确尺寸约束，父组件的大小直接影响**Column的最终大小**和子组件的布局行为
避免过度嵌套，过深的嵌套会影响性能并增加代码维护难度

#### 线性布局 Row

作用：用于**水平排列**其子组件的核心布局容器

| 属性               | 类型                | 作用说明                                                     |
| ------------------ | ------------------- | ------------------------------------------------------------ |
| mainAxisAlignment  | MainAxisAlig nment  | 控制子组件在主轴（水平方向）上的排列方式，如顶部对齐、居中或均匀分 布。 |
| crossAxisAlignment | CrossAxisAlig nment | 控制子组件在交叉轴（垂直方向）上的对齐方式，如左对齐、右对齐或拉伸 填满。 |
| mainAxisSize       | MainAxisSize        | 决定Row本身在水平方向上的尺寸策略：是占满所有可用空间（max），还 是仅仅包裹子组件内容（min）。 |
| children           | List<Weight>        | 需要被水平排列的子组件列表。                                 |

几乎在需要水平排列元素的界面中都能看到它的身影
导航栏：如顶部或底部的标签栏、按钮组。
图文混排：如列表项左侧的图标与右侧的文本描述，
表单行：如标签和输入框的组合

注意事项：Row本身不支持滚动，如果内容超出，需要使用ListView.或者SingleChildScrollView包裹
明确尺寸约束，父组件的大小直接影响ROW的最终大小和子组件的布局行为

#### 弹性布局 Flex

作用：允许沿一个主轴（水平或垂直）排列其子组件，灵活地控制这些子组件在主轴上的尺寸比例和空间分配

| 属性                | 类型                          | 作用说明                       |
| ------------------- | ----------------------------- | ------------------------------ |
| direction           | Axis.horizontal/Axis.vertical | 主轴方向，决定子组件的排列方向 |
| mainAxisAlignme nt  | MainAxisAlignment             | 子组件在主轴方向上的对齐方式。 |
| crossAxisAlignme nt | CrossAxisAlignment            | 子组件在交叉轴方向上的对齐方式 |
| mainAxisSize        | MainAxisSize                  | Flex容器自身在主轴上的尺寸策略 |

子组件：Flex的子组件常使用Expanded:或Flexible来控制空间分配
Flex是Column和Row的结合体

**弹性布局-Flex/Expanded/Flexible**
●Expanded/Flexible作为Flex的子组件通过**flex属性**来分配Flex组件空间

●Flex布局受其父组件传递的约束影响。确保父组件提供了适当的布局约束
●Expanded与Flexible的区别：Expanded强制子组件**填满所有剩余空间**，Flexible根据自身大小调整，**不强制占满空间**

#### 流式布局-Wrap

●作用：流式布局组件，当子组件在主轴方向上排列不下时，它会自动换行（或换列）

|     属性     |                   常用值                    | 作用说明                           |
| :----------: | :-----------------------------------------: | :--------------------------------- |
|  direction   | Axis.horizontal(水平)/Axis.vertical（垂直） | 设置主轴方向，即排列方向。         |
|   spacing    |                    数值                     | 主轴方向上，子组件之间的间距       |
|  runSpacing  |                    数值                     | 交叉轴方向上，行（或列）之间的间距 |
|  alignment   |                WrapAlignment                | 子组件在主轴方向上的对齐方式。     |
| runAlignment |                WrapAlignment                | 交叉轴方向上的对齐方式             |

●注意：Column/Row/Flex内容超出**均不会换行**
●Wrap组件更像是**'Flex组件加了换行特性**

●当子组件内容是根据数据动态生成时，使用Wrp可以确保布局始终适配

注意：**List.generate**是一个构造器，用于快速创建长度固定且每个元素可以通过索引号确定的列表

语法：List.generate(int count,E generator(int index),(bool growable:false))

#### 层叠布局-Stack/Positioned

●作用：层叠布局组件，允许你将多个子组件按照Z轴（深度方向）进行叠加排列。

|     属性     |       类型        | 作用说明                                        |
| :----------: | :---------------: | ----------------------------------------------- |
|  alignment   | AlignmentGeometry | 控制非定位子组件在Stack内的对齐方式，默认左上角 |
|     fit      |     StackFit      | 控制非定位子组件如何适应Stack的尺寸             |
| clipBehavior |       Clip        | 控制子组件超出Stack边界时的裁剪方式             |
|   children   |       List        | 需要被层叠排列的子组件列表                      |

●搭档：Positioned组件是Stack的黄金搭档，对子组件进行精确定位控制。Positioned必须作为Stack的直接子组件。
**Positioned**：通过left、right、top、bottom来将子组件"钉”在**Stack**的某个角落或边缘（套起来）



#### 文本组件-Text

●作用：在用户界面中显示文本的基础组件

|   属性    |   类型    | 作用说明                                      |
| :-------: | :-------: | --------------------------------------------- |
|   data    |  String   | 必需。要显示的文本内容。                      |
|   style   | TextStyle | 文本样式，可设置颜色、大小、粗细等。          |
| textAlign | TextAlign | 文本在容器内的水平对齐方式，如.left,.center。 |
| maxLines  |    int    | 文本显示的最大行数。                          |

●如果需要在同一段文本中显示不同样式，可用Text.rich构造函数配合**TextSpan**来实现

●适用场景：   所有的文本显示都需要Text组件
●注意事项：   Text组件本身和其TextStyle中都可能有overflow等属性，Text组件属性优先级更高
			假如文本过长请务必设置maxLines和overflow。
			大量重复使用的文本样式，建议统一定义，有助于保持一致性并提升性能

#### 图片组件-Image

●作用：在用户界面中显示图片的核心部件
●图片分类：

|      分类       | 作用说明                                                     |
| :-------------: | ------------------------------------------------------------ |
|  Image.asset()  | 加载项目资源目录（assets）中的图片。需要在 pubspec.yaml文件中声明资源路径 |
| Image.network() | 直接从网络地址加载图片                                       |
|  Image.file()   | 加载设备本地存储中的图片文件                                 |
| Image.memory()  | 加载内存中的图片数据                                         |

●常用属性：

|     分类      |       类型        | 作用说明                                                   |
| :-----------: | :---------------: | ---------------------------------------------------------- |
| width/ height |      double       | 设置图片显示区域的宽度和高度                               |
|      fit      |      BoxFit       | 控制图片如何适应其显示区域，例如是否拉伸、裁剪或保持原比例 |
|   alignment   | AlignmentGeometry | 图片在其显示区域内的对齐方式，如Alignment.center           |
|    repeat     |    ImageRepeat    | 当图片小于显示区域时，设置是否以及如何重复平铺图片         |

注意：Android/HarmonyoS/iOS使用Image.network需要配置网络权限

#### 文本输入组件-TextField

●作用：实现文本输入功能的核心组件

|    属性     | 作用说明                                           |
| :---------: | -------------------------------------------------- |
| controller  | 文本编辑器控制器，用于获取、设置文档内容及监听变化 |
| decortation | 当时输入框的外观、如标签、提示文字、图标、边框等   |
|    style    | 定义输入文本的样式                                 |
|  maxLines   | 最大行数                                           |
|  onChanged  | 输入内容发生变化时执行的回调函数                   |
| onSubmitted | 用户提交输入时的回调函数                           |

●使用：使用TextField必须使用有状态组件
	使用TextEditingController管理输入内容、onChanged可以监听数据变化
	decoration.属性下的InputDecoration来定制如边框、背景、提示文字
	obscureText设置为true可隐藏输入内容，用于密码输入框

#### 常用滚动组件

|         组件          | 特点                                           | 使用场景                                     |
| :-------------------: | ---------------------------------------------- | -------------------------------------------- |
| SingleChildScrollView | 让单个子组件可以用滚动，所有内容一 次性渲染    | 长表单、设置页、内容不固定但是总量不多的页面 |
|       ListView        | 线性列表，通过builder可以实现懒加 载，性能优异 | 聊天记录、新闻、常见的单列滚动的数据列表     |
|       GridView        | 网格布局列表，支持懒加载，可以固定 列数        | 图片墙、商品网格、应用图标列表               |
|   CustomScrollView    | 复杂布局方案，通过组合多个Sliver组 件实现滚动  | 电商首页、社交App个人主页多个滚动紧密联动    |
|       PageView        | 整页滚动效果，支持横向和纵向                   | 应用引导页、图片轮播图、书籍翻页             |

##### 滚动组件-SingleChildScrollView

●用法：包裹一个子组件，让单个子组件具备滚动能力。

控制滚动-controller:给组件的controller绑定ScrollController对象

●子组件：**只能包含一个子组件**，如果滚动多个组件，通常将其嵌套在Column或Row组件中
●滚动方向：通过scrollDirection属性控制，默认为垂直方向(Axis.vertical),也可设置为水平方向(Axis.horizontal)
●特点：**一次性构建所有子组件**，如果嵌套的Column或Row中包含大量子项，可能会导致性能问题，建议使用**ListView**
●控制滚动：绑定一个ScrollController对象给controller对象，使用animateTo/jumpTo方法控制滚动
●滚动到顶部：controller.jumpTo(O)
●滚动到底部：controller.jumpTo(controller.position.maxScrollExtent)

##### 滚动组件-ListView

●作用：用于**构建可滚动列表**的核心部件，并提供流畅滚动体验
●方式：提供多种构造函数，如**默认构造函数、ListView.builder、ListView.separated**
●机制：采用**按需渲染（懒加载），只构建当前可见区域的列表项**，极大提升长列表性能

特点：默认构造函数适用于静态数量有限数据**一次性构建所有表项**

ListView-builder模式
。作用：处理**长列表或动态数据**的首选和推荐方式
●方式：接受一个**itemBuilderl**回调函数来按需构建列表项，通过**itemCount**控制列表长度

优势：**按需构建**，不会在初始化时将所有列表项都创建，而是根据用户的**滚动行为，动态地创建和销毁列表项**

ListView--separated模式
●作用：在ListView.builder的基础上，额外提供了构建分割线的能力
●方式：需要同时提供itemBuilder、separatorBuilder、itemCount3三个属性

##### 滚动组件-GridView

●作用：用于**创建二维可滚动网格布局**的核心组件
●方式：提供多种构建方式，**GridView.count、GridView.extent、GridView.builder**等
GridView默认构造方式-（写起来最过繁琐，很少使用）
GridView.count-基于**固定列数**的网格布局（最常用之一）
GridView.extent--基于**固定子项最大宽度/高度**的网格布局（最常用之二）
GridView.builder,用于**网格项数量巨大或动态生成的**情况，需要接收**gridDelegate**布局委托属性
●gridDelegate:  **SliverGridDelegateWithFixedCrossAxisCount**:固定列数mainAxisSpacing主轴间距
			    **SliverGridDelegateWithMaxCrossAxisExtent**:最大宽度crossAxisSpacing交叉轴间距
**scrollDirection**设置滚动方向**横向/纵向（默认）**

###### GridView.count:构造

●作用：使用GridView.count创建固定列数网格

●GridView.countk以列数为优先。指定网格多少列，Flutter自动计算列的宽度，在空间内均匀排列

###### GridView.extent构造

●作用：使用GridView.extent指定子项最大宽度或者高度

●GridView.extent通过maxCrossAxisExtent设置子项最大宽度/高度来计算横向或者纵向有多少列

GridView-GridView.builder构造(性能最好)
●作用：使用**GridView.builder实现动态长网格**-（**懒加载，只渲染可见区域**）
●注意：接收**gridDelegate**布局委托**、itemBuilder构建函数、itemCount构建数量**

gridDelegates:SliverGridDelegateWithFixedCrossAxisCount /  SliverGridDelegateWithMaxCrossAxisExtent

#### 自定义滚动容器-CustomScrollView

●作用：用于**组合多个可滚动组件**（如列表、网格），实现统一协调的滚动效果
●Sliver:Flutter中**描述可滚动视图内部**一部分内容的组件，它是滚动视图的"切片"
●用法：通过**slivers**属性接收一个**Sliver组件列表**
●Siiver组件对应关系：
	SliverList 	=>	ListView
	SliverGrid	 =>	GridView
	SliverAppBar 	=>	AppBar
	SliverPadding 	=>	Padding
	SliverToBoxAdapter	=>	ToBoxAdapter(用于包裹普通Widget)
	SliverPersistentHeader(粘性吸顶)

案例代码实现-粘性吸顶分类SliverPersistentHeader
SliverPersistentHeader:给**delegate**属性赋值一个**继承SliverPersistentHeaderDelegate**的对象实例

​					设置固定属性**pinned**为true

maxExtent:展开时最大高度
minExtent:收缩时最小高度
shouldRebuild:是否重建
build:返回构建Widget

#### 整页滚动容器-PageView

●作用：用于实现分页滚动视图的核心组件
●方式：提供多种构建方式，默认构造方式、PageView.builders等
●优势：支持懒加载（按需渲染）

整页滚动容器-PageView-跳转控制
●控制器：PageView绑定controller属性，对象类型为PageController
●切换方法：controller,jumpPage/animateToPage

### 组件通信

|    通信方式     |    方向    | 适用场景         |
| :-------------: | :--------: | :--------------- |
|  构造函数传递   |  父 =>子   | 简单的数据传递   |
|    回调函数     |   子=>父   | 子组件通知父组件 |
| Inheritedwidget | 祖先=>后代 | 跨层级数据共享   |
|    Provider     | 任意组件间 | 状态管理推荐方案 |
|    EventBus     | 任意组件间 | 全局事件通信     |
|  Bloc/Riverpod  | 任意组件间 | 复杂状态管理     |

#### 组件通信一父传子（构造函数传参数）

●步骤：1.**子组件定义接收属性**
2.**子组件在构造函数中接收参数**
3.**父组件传递属性给子组件**
4.**有状态组件**在'**对外的类**'接收属性，'**对内的类**'通过**widget对象**获取对应属性
5.注意A：子组件定义接收属性需要使用**final关键字**-因为属性由**父组件决定**，子组件不能随意更改

#### 组件通信-子传父（回调函数）

●步骤：1.父组件传递一个函数给子组件
2.子组件调用该函数
3.父组件通过回调函数获取参数
●需求：点击子组件删除父组件的菜品数据并更新列表

### 网络请求-Dio插件使用

●网络请求是Flutter移动应用开发的核心功能，最常用的网络请求工具是使用**Dio插件**
●安装dio:**flutter pub add dio**

●基本使用：**Dio(.get(地址).then().catchError()**

●一般情况下-在初始化状态initState获取页面数据

#### Dio工具类的封装

1. 设置基础地址和超时时间
2. 设置拦截器
3. 封装请求方法

#### 初始化获取数据

#### 解决web端跨域问题

默认情况下，flutter运行web端加载网络资源会报跨域提示错误。
1.flutter/packages/flutter_tools/lib/src/web/chrome.dart
如下图位置添加'**-disable-web-security**',

![image-20260309215523799](https://gitee.com/Dawson771/pic-bed/raw/master/img/202603092155089.png)

2.删除flutter/bin/cache/下**flutter tools.snaphot**和**flutter_tools.stamp**
3.执行**flutter doctor -v**然后重新运行项目

#### 父子组件通信

### 路由管理

路由管理
●定义：路由管理是构建多页面应用的核心，它通过Navigator和Route来管理页面栈，实现页面跳转和返回

![image-20260310074227907](https://gitee.com/Dawson771/pic-bed/raw/master/img/202603100742103.png)

#### 路由管理-基本路由

●场景：基本路由适合页面不多、跳转逻辑简单的场景
●用法：无需提前注册路由，跳转时创建MaterialPageRoute实例即可

●跳转新页面：**Navigator.push(BuildContext context,Route route)**
●返回上一页：**Navigator.pop(BuildContext context)**

注意：MaterialApp是路由系统的组件，只能有一个MaterialApp包裹

#### 路由管理-命名路由

●场景：应用页面增多后，使用命名路提升代码可维护性。
●用法：需要先在MaterialApp中注册一个路由表(routes)并设置initialRoute(首页)

![image-20260311140447490](https://gitee.com/Dawson771/pic-bed/raw/master/img/202603111404729.png)

●命名路由VS简单路由：
命名路由需在Materialapp的routes中预先注册路由表，适合中大型项目管理
简单路由直接构建页面，更灵活，适合简单应用或快速原型开发。

路由管理-**跳转方法**

|           方法           |       核心作用       | 使用场景            | 典型场景                                          |
| :----------------------: | :------------------: | :------------------ | ------------------------------------------------- |
|        pushNamed         |      进入新页面      | [A, B]→ [A, B, C]   | 常规页面跳转，如列表页进入详情页                  |
|  pushReplaceme ntNamed   |     替换当前页面     | [A, B]→ [A,C]       | 登录成功后跳转主页，并无法返回登录 页             |
| pushNamedAnd RemoveUntil |  跳转新页面并清理栈  | [A, B, C, D]→[A, E] | 退出登录后跳转登录页，并清空所有历 史页面         |
|     popAndPushNamed      | 返回并立即跳转新页面 | [A, B,C]→[A, B, D]  | 购物车页面结算后，返回商品列表并同 时跳转到订单页 |
|         popUntil         | 连续返回直到条件满足 | [A, B, C,D]→ [A, B] | 从设置页的深层级，一键返回到主设置 页面           |

#### 路由管理-传递参数-命名路由

●作用：通过路由传递参数是实现页面间数据通信的常用方式
●传递参数（命名路由）：Navigator.pushNamed(context,地址，arguments:{参数)
●接收参数（命名路由）：ModalRoute.of(context)?.settings.arguments

●接收时机：initState获取不到路由参数，放置在Future.microtask(异步微任务)中

#### 路由管理-传递参数-基础路由

●传递参数（基础路由）：通过组件构造函数传递参数-（父传子）
接收参数（基础路由）：通过组件构造函数接收参数-（父传子）
接收时机：initState可获取到基础路由的构造函数传参

#### 路由管理-动态路由与高级控制

●场景：更复杂的场景，如需根据参数动态生成页面，或实现路由拦截，可以使用onGenerateRoute和onUnknownRoute

<img src="https://gitee.com/Dawson771/pic-bed/raw/master/img/202603120756840.png" alt="image-20260312075615556" style="zoom:67%;" />

●onGenerateRoute:允许你根据RouteSettings(包含路由名称和参数)动态创建不同的Route
