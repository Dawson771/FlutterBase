变量**var**：变化的数据	

编译时常量**const**：编译时确定的常量

运行时常量**final**：运行时才确定的常量	

### 数据类型

#### 字符串**String**:文本变量

​	语法：String 属性名='文本内容';

​	模板字符串: String 属性名 = '文本内容$变量名'; **String 属性名 = '文本内容${变量名}';**

#### 数字**int/double/num**

​	int 整数 double 可整数可小数  num 小数

```dart
	//int和double不能直接赋值,num不能直接给double赋值,double可以给num直接赋值
	int a = 1;
	double b= 1.2;
	num c= 1.2;
	//b=a;//错误
	b = a.toDouble();
	//b = c; //错误
	b = c.toDouble();
```

#### 布尔**bool**

​	语法： bool 属性名 = true  或者false;

#### 列表**list**

​	语法： List 属性名  = ['数据1','数据2','数据3','数据4'];

​	属性名.add(内容)       尾部添加一个

​		   .allAll(内容)	尾部添加列表

​		   .remove(内容)	删除满足内容第一个

​		   .removeLast() 	删除最后一个

​		   .removeRange(start,end)  删除范围内的数据  [start,end)   start<=  X < end

​		.forEach((item) {});	循环  {}中针对每个列表每个数据进行操作

​		.every((item) {return 布尔值});	是否满足条件

​		.where((item) {return 布尔值});	筛选出满足条件的数据

​		.length  列表的长度(属性)

​		.last  最后一个元素(属性)

​		.first 第一个元素(属性)

​		.isEmpty 是否为空(属性)

#### 字典**map**

​	语法：Map 属性名 = [{key: value}, {key: value}]

​	属性名.forEach((item){});  循环

​		.allAll({key: value});  添加一个字典	

​		.containsKey(key);  是否包含某个key

​		.containsValue(value);  是否包含某个value

​		.clear()  清空字典

#### 动态类型**dynamic**  

变量运行自由改变类型，同时绕过编译时的静态检查

​	语法：dynamic 属性名 = 值；

### 空安全机制

|          |      |                                    |                            |
| -------- | ---- | ---------------------------------- | -------------------------- |
| 可空类型 | ?    | 声明可空变量                       | String? ->允许String为null |
| 安全访问 | ?.   | 对象为null时跳过操作，返回null     | user?.name ->若user为null  |
| 非空断言 | !.   | 开发者认为变量非空(否则运行时崩溃) | name!.length               |
| 空合并   | ??   | 左侧为null时返回右侧默认值         | name??"Guest"->            |

```dart
void main(List<String>args){ 
	String? username=nuLL;  //?表示变量可以是nuLL 
    username?.startsWith("新")；//安全访问
    //客观判断
    //username="张三"
    //主观判断-开发者认为username一定不为nuL 
    username!.startsWith("新")；
    //要保证别人一定能够显示用户名 
    String displayName=username ?? "老高"；
}
```

### 运算符

#### 算数运算符

| 运算符 | 作用 |
| :----: | :--: |
|   +    |  加  |
|   -    |  减  |
|   *    |  乘  |
|   /    |  除  |
|   ~/   | 整除 |
|   %    | 取余 |

#### 赋值运算符

| 运算符 |            作用             |
| :----: | :-------------------------: |
|   =    |          赋值操作           |
|   +=   |  加等，a+=b 相等于 a= a +b  |
|   -=   | 减等,a -=b 相等于 a = a - b |
|   *=   |   乘等,a*=b 相等于 a=a *b   |
|   /=   |    除等，a/=b相等于a=a/b    |

#### 比较运算符

结果都是bool类型

|  ==  |      判断两个值是否相等      |
| :--: | :--------------------------: |
|  !=  |      判断两个值是否不等      |
|  >   |   判断左侧值是否大于右侧值   |
|  >=  | 判断左侧值是否大于等于右侧值 |
|  <   |   判断左侧值是否小于右侧值   |
|  <=  | 判断左侧值是否小于等于右侧值 |

#### 逻辑运算符

参与的变量必须是bool类型

| 运算符 |                 作用                 |
| :----: | :----------------------------------: |
|   &&   |  逻辑与，a&&b，a和b同时true，得true  |
|   1    | 逻辑或，allb，a和b有一个true，得true |
|   ！   |     逻辑非，la，对a变量进行取反      |

#### 三元运算符

语法：表达式(布尔值)?结果1:结果2;

### 流程控制

#### if分支

| if分支 | 作用         |
| ------ | ------------ |
| 单分支 | 单个条件判断 |
| 双分支 | 两个条件判断 |
| 多分支 | 多个条件判断 |

三元运算符类似双分支      语法：表达式(布尔值)?结果1:结果2;

#### switch/case

●定义：在Dart语言中，如果分支条件很多，且条件是判断相等，可以使用switch case语句

语法：

```
switch(变量){ 
	case值1：
		逻辑1； 
		break; 
    case值2：
    	逻辑2； 
    	break; 
    default:
    	默认逻辑;
         }
```

#### while 循环

```dart
while(条件){
 	逻辑;
}
```

●特点：只有条件满足，括号中逻辑一直执行，想要执行可以使用**break**或者**continue**

注意：break:是跳出整个while循环，continue是跳出当前迭代，进入下一次迭代

#### for循环

```dart
for(int i = 0;i < 2;i++){
	逻辑;
}
```

●特点：只有小括号逻辑满足，大括号逻辑一直执行，想要执行可以使用break或者continue注意：break是跳出整个while循环，continue:是跳出当前迭代，进入下一次迭代

### dart函数

函数是代码组合和复用的核心单元

```dart
返回类型 函数名(参数){
	函数体	
}
```

##### 函数的返回值

有返回值：具体类型 函数名(){}

无返回值：void 函数名(){}

特点：返回值类型可省略，Dart会自动推断类型为dynamic

### 参数(必传参数/可选位置参数/可选命名参数)

#### 必传参数

```dart
void main(List<String>args){ 
	add(1,2);//必传参数 
}
int add(int a,int b) {
	return a + b;
}
```

#### 可选位置参数

特点：可选位置参数必须位于必传参数后面，采用**中括号**包裹

语法：**函数名(String a,[String? b,...])**,传递时按照顺序传递

适用场景：参数少且顺序固定时

默认值：可选参数可以设置默认值

```dart
void main(List<String>args){ 
	print(combine("1")); 
}
String combine(String a,[String?b = "b",String?c = "c"]){ 
	return a+(b ?? "默认值b")+(c ?? "默认值c");
}
```



#### 可选命名参数

●特点：可选命名参数必须位于必传参数后面，采用大括号包裹

●语法：函数名(String a,{String?b,),传递时按照参数名：值的方式进行传递，无需关注顺序

●适用场景：参数多且需明确含义时

```dart
void main(List<String>args){ 
	showPerson("张三")； 
}
void showPerson(String username,{int?age = 10,String?sex ="男"}){
	print('姓名：$username,年龄：$age,性别：$sex');
}
```

### 匿名函数

●特点：可以声明一个没有名称的函数赋值给变量，进行调用

语法：**Function 变量名 = (){}**；

●注意：函数的类型使用Function来声明

```dart
void main(List<String>args){ 
    //test();//直接调用
	onTest(test);//调用函数传递匿名函数
}
//声明匿名函数 
Function test =(){
	print("测试")；
}
//定义一个参数接受一个函数 
void onTest(Function callBack){ 
	callBack();
}
```

### 箭头函数

特点：当函数体只有一行代码时，可以使用箭头函数编写

语法：**函数名 () => 代码逻辑**

注意：使用箭头函数可以省略return关键字

## 类 class

定义：Dart语言中，类(class)是面向对象编程的核心，类包含属性和方法来定义对象的行为和状态

需求：定义一个Person类，属性包括姓名、年龄、性别，包括学习的方法

定义类语法：**class Person{ 属性 方法 }**

实例化对象：**Person 变量 = Person();**

属性和方法：变量.属性/方法()

```dart
void main(List<string>args){
	//实例化类 
    Person p = Person(); 
    p.name = "老高"； 
    p.age = 35; 
    p.study();
}
//定义类 
class Person {
	String name = ""; 
	int age = 0; 
	String sex="男"; 
	void study(){ 
		print('$name在学习')；
	}
}
```

### 类的构造函数

定义：实例化对象的时候，使用构造函数直接给对象中的属性赋值

#### 默认构造函数

定义语法： 

```dart
class 类名{
	类名（可选命名参数）{
	}
}
```

实例化语法： Person p = new Person(属性：值)

#### 命名构造函数

定义：构造函数可以采用命名的方式，返回一个实例化对象

定义语法：

```dart
class 类名{	
	类名.构造函数名（可选命名参数）{
	}
}
```

实例化语法： Person p=Person.构造函数名（属性：值）

注意：默认构造函数和命名构造函数可同时存在

#### 构造函数的语法糖(简写构造函数)

```dart
class 类名{
    类名({ this.属性1, this.属性2});
    或
    类名.命名函数({ this.属性1, this.属性2});
}
```

### 类的公有属性和私有属性

公有属性，提供自身或者其他外部文件和类使用的属性和方法

私有属性，仅供自身使用的属性和方法，其他外部文件和类无法访问

语法：私有属性以**下划线开头**，如_name,其余均为公有属性

### 类的继承

定义：继承是拥有父类的属性和方法

特点：dart属于单继承，一个类只能拥有一个直接父类，子类拥有父类所有的属性和方法

语法：class 类名 **extends** 父类

重写：子类可通过@override注解重写父类方法，扩展其行为

注意：子类**不会继承**父类构造函数，子类必须通过**super关键字**调用父类构造函数确保父类正确初始化 

super语法：子类构造函数(可选命名参数):super({参数})

### 类的多态（继承和方法重写）

定义：Dart中的类的是指同一操作作用于不同的对象，可以产生不同的执行效果

场景：微信和支付宝都遵循同样支付接口，但实现逻辑不同，即同一个支付操作拥有不同的支付效果

实现方式：**1.继承和方法重写、2.抽象类和接口**

需求：定义一个父类，分别实现微信和支付宝支付类，重写得到不同的支付逻辑

```dart 
void main(List<String>args){ 
	PayBase wx = WxPay(); 
	wx.pay(); 
	PayBase ali = AliPay(); 
	ali.pay();
}
//基础支付类 
class PayBase{
	void pay(){ 
		print("基础支付")；
	}
}
//微信支付类 
class WxPay extends PayBase{
	@override 
	void pay(){
		//TODO:implement pay
		//super.pay(); 
		print("微信支付");
    }
}
```

### 类的多态（抽象类和接口）

方式：使用**abstract**关键字声明一个抽象类（没有实现体）

方式：使用**implements**关键字**继承并实现抽象类**

```dart
void main(List<String>args){
    PayBase wx = WxPay();
    PayBase ali = AliPay();
    wx.pay();
    wx.pay();
}
abstract class PayBase{
	void pay();//抽象类不写具体实现的
}
//微信支付 
class WxPay implements PayBase{
	@override 
	void pay(){
	//TODO:implement pay 
	print("微信支付");
}
//支付宝支付 
class AliPay implements PayBase{
	@override 
	void pay(){
	//TODO:implement pay 
	print("支付宝支付");
}
```

### 类的混入

定义：Dart允许在不使用传统继承的情况下，向类中添加新的功能

方式：使用**mixin**关键字定义一个对象

方式：使用**with**关键字将定义的对象混入到当前对象

特点：一个类支持**with多个mixin**,调用优先级遵循“**后来居上**”原则，即后混入的会覆盖先混入的同名方法

需求：让一个学生类和一个老师类都拥有唱歌的方法

```dart
void main(List<string>args){ 
    Student s = Student(name:'小张同学');
    s.song(s.name!);
    Teacher T = Teacher(name:'老高老师');
    T.song(T.name!);
}
//定义一个混入对象 
mixin Base{
    void song(String name){ 
        print("$name在唱歌");
    }
class Student with Base{
    String? name; 
	int? age;
    Student({this.name,this.age});
}
class Teacher with Base{
    String? name; 
    int? age; 
    Teacher({this.name,this.age});
}
```

### 泛型

定义：Dart允许使用类型参数，限定类型的同时又让类型更加灵活，让代码更加健壮和维护性更强

场景：List类型中只想存储String类型怎么办？函数中返回值希望和参数一个类型怎么办？

常见分类：**泛型集合、泛型方法、泛型类**

```dart
void main(List<String> args){
	//列表泛型或者Map 
	List<String> list = []; 				
	List.add("");
	//list.add(1);
	//List.add(false);
	//1ist.add([]); 

	Map<String,int> map = {}; 
	map["a"]=1; 
	getValue<String>("1"); 
	printList<String>(["1","2","3"]);
    
    Student<String> s = Student();
    s.name = "";
}
//函数中的方法 
T getValue<T>(T valve){ 
	return value; 
}
void printList<T>(List<T> list) {
	for (var i=0;i<list.length;i++){ 
		print(list[i]);
    }
}

class Student<T>{
    T? name;
}
```

### 异步编程

介绍：Dart是单线程语言，即同时只能做一件事，遇到耗时任务就会造成程序阻塞，此时需要异步编程

定义：Dart采用**单线程+事件循环**的机制完成耗时任务的处理

事件循环：**执行同步代码** ==> **执行微任务队列** ==> **执行事件队列** ==> **结束**

微任务队列：Future.microtask()

事件队列：Future、Future.delayed()、I/o操作（文件、网络）等

#### 异步编程Future

介绍：Future代表一个异步操作的最终结果.

状态：**Uncompleted(等待)**、**Completed with a value(成功)**、**Completed with a error(失败)**

创建：**Future( (){} )**

执行成功：不抛出异常-成功状态-then( (){} )

执行失败：throw Exception()-失败状态-catchError( (){} )

```dart
void main(List<String>args){ 
    Future f Future((){ 
        return "Hello FLutter";
        //没有抛出异常那就是成功状态)
    });
    //then中接收成功状态 
    f.then((valve){ 
        print(valve);
    });
    f.catchError((error){ 
        print("出现错误了");
    });
}
```

#### 异步编程Future 链式调用 	

介绍：Future可以通过链式的方式连续得到异步的结果

语法：通过**Future().then()**拿到执行**成功**的结果

语法：通过**Future().catchError()**拿到执行**失败**的结果

注意：在上一个then返回对象会在下一个then中接收

需求：执行三个异步任务，按照顺序排列，最后一次任务抛出异常

```dart
void main(List<string>args){
//三个异步任务采用链式调用的方式来实现 
	Future f Future((){ 
	return "Hello World";
	})； 
	f.then((valve){
		//第一个任务 
		return Future(() => "task1");
    }).then((valve){
		//第二个任务 
        return Future(()=>"$value-task2");
    }).then((valve){
    	//第三个任务
    	return Future(() => "$value-task3");
    }).then((value){
    	print(value);
    }).catchError((error){
    	print("出现错误");
    });
}
```

#### 异步编程-Future-async/await

介绍：除了通过then/catchErrorl的方式，还可以通过async/await来实现异步编程

特点：await总是等到后面的Future执行成功，才执行下方逻辑，async必须配套await出现

语法：

```dart
函数名() async{ 
	try{
    	await Future();
		//Future执行成功才执行的逻辑
	} 
	catch(error){
	//执行失败的逻辑
	}
}
```

```dart
void main (List<Strings> args){
    test();
}
void test() async{
    try {
        String result = await Future((){
            return "测试";
            //throw Exception();
        });
        //await Future.delayed(Duration(seconds:3));
        //await下方的逻辑永远是Future执行成功之后执行的 
        print(result); 
    } catch (e){
        print("异步请求出现异常");
    }
}
```

