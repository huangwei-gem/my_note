# MySQL数据库





## 数据库相关指令



### 数据库





数据库和数据表的关系，类似于文件夹和`exel`的关系，文件夹就是数据库，`exel`就是数据表。

`mysql`对于大小写是不敏感的。



1. 登录数据库：`mysql -uroot -p123456`

2. 展示数据库：` show databases;  `注意一下分号，分号才是一个语句的结束。

3. 创建数据库：`create database database_test;`名字尽量不要有中文名，不然有很多的bug。
   ~~~sql
   create database 数据库的名字 default charset utf8 # 默认的编码格式（后面这一段写不写没关系，反着是默认的）
   create database 数据库的名字[编码格式][校对规则]; # 主要针对的问题是大小写不敏感的问题，比如说创建数据表的时候是BBB，但是显示的是bbb。
   
   
   
   
   ~~~

   

4. 删除数据库：`drop database database_test; `一定是英文分号，并且是分号结尾。

5. 进入数据库：`use data_test;`





>  注意事项：如果说要查询或者做操作的前提下是数据库里面有数据才能进行操作







### 数据表





1. 进入数据库：`use 数据库的名字;`

2. 查看数据表：

   ~~~sql
   show tables; # 展示所有的数据表
   desc 表名； #详细展示一张数据表
   ~~~

   

3. 创建表语句：
   ~~~sql
   create table 表名(
       字段 类型，
       字段 类型，
       ......
   );
   ~~~

   ~~~sql
   create table user_info(
       id int，
       name varchar(16)，# 这个其实是字符串类型，并且长度是16.
       ......
   )default charsrt=utf8;
   ~~~

   ~~~sql
   create table user_info(
       id int,
       name varchar(16) not null, # 允许为空
       email varchar(32) null # 不允许为空
       )default charset=utf8;
   ~~~

   ~~~sql
   create table user_info2(
       id int, 
       name varchar(16) not null,
       age int default 18 # 没有内容的时候：默认值18
   );
   ~~~

   ~~~sql
   create table user_info3(
       id int primary key, # 主键，不能重复，并且不能为空，其实这个id就像身份证一样的，不会重复的
       name varchar(16) not null
   );
   ~~~

   主键:一般用于表示当前这条数据的编号(人的身份证)，的值，所以在数据库中都会让主键和自增结合需要我们自己来维护的一个不重复。

   ~~~sql
   create table user_infor4(
       id int primary key auto_increment # 自增的一个主键，就是我们增加一个数据的时候，那个id回自己+1
   );
   ~~~

4. 删除表：

   ~~~sql
   drop table 表名;
   ~~~

5. 清空表：
   ~~~sql
   delete from 表名；
   truncate table 表名;# 执行的很快，无法回滚撤销 直译过来是截断的意思
   ~~~

6. 修改表：

   - 添加列

   ~~~sql
   alter table user_info add age int;
   alter table user_info add 
   new_id intnot null primary key auto_increment; # 后面是属性值，不能为空，是主键，并且是自增的
   
   
   ~~~

   - 删除列

   ~~~sql
   alter table 表名 drop column 列名
   ~~~

   - 修改列的类型

     ~~~sql
     alter table 表名 modify column 列名 类型; # 大部分用的是这个
     ~~~

   - 修改列 类型+名称

     ~~~sql
     alter table 表名 change 原列名 新列名 新类型; # 用的 比较少，因为列名一般是确定好的，不会修改的。
     ~~~

   - 修改列 默认值 不为空。。。

     ~~~sql
     alter table 表名 modify 列名 类型 状态;
     alter table us_info modify new_name varchar(8) not null default 3;
     ~~~

   - 删除列的默认值

     ~~~sql
     alter table 表名 alter 列名 drop default;
     ~~~

   

## 数据行的学习











- 新增的数据
  ~~~sql
  insert into 表名（列名，列名2.....） values （对应的列名1内容，2内容，3内容） 
  
  ~~~

- 删除数据

  ~~~sql
  delete from 表名； ---把数据全部删除
  delete from 表名 where 条件；
  ~~~

- 修改数据

  ~~~sql
  update 表名 set 列名=值；# 默认是所有的都会被替换，所以一般是用下面那一种
  update 表名 set 列名=值 where 条件；
  ~~~

- 查询数据

  ~~~sql
  select * from 表名；# 查看表名所有的数据
  ~~~



## 数据类型和长度







~~~sql
# 在sql中括号中的数据表示数据类型的长度或者最大值，具体含义取决于数据类型
varchar（32） 显示的是长度
int  显示的是长度/宽度，但是实际存储的数字范围是不会受到限制的 
~~~







### int



~~~sql
int
int unsigned # 表表示数据范围是无符号的
int（5）zerofill # 表示当位数不满足五位的时候，按照左边的顺序补0，比如00001。

tinyint 取值范围比int小

bigint 取值范围比int大
~~~



### 浮点型



~~~sql
decimal(8,2) # 8是总长度，2代表小数点后面的位数 -- 比较草率，回默认截取
float（8,2）# 单精度浮点数，精度要求更高，不会默认截取
# 比如说31495926.11，第一个会存入数据，但是存入的数据是：314959.11，
# 第二个会报错，不会截取数据。
double（8,2）双精度浮点数 底层用的64为的二进制存储


# decimal 适用于需要精准计算和存储的场景
# float和double更适用于需要更大的范围的数值存储
# 本质区别：
# 比如我们日常用的 0.1、0.2、0.01（钱、税务、计量），用 decimal 存储时（10进制存储），会直接以「整数 1 × 10⁻¹」「整数 2 × 10⁻¹」「整数 1 × 10⁻²」的形式存储，没有任何误差；
# 而 float/double 存储 0.1 时，二进制是无限循环的（类似十进制的 1/3=0.333...），只能近似存储，最终导致计算误差：
~~~





### 字符串类型



~~~sql
char() # 定长的字符串
# 例如：哈哈哈 本质上用了5个字符串

varchar(5) # 可变长的字符串  ----一般用的是这个，效率更高
# 例如：哈哈哈 本质上用了3个字符串。

text 类型
本质上存储哪些长文本内容的，比如弹幕。。文章。。新闻

mediumtext/longtext
~~~







### 枚举类型





~~~sql
enum，非难即女
# 比如说建立事后的数据类型是（'男','女'）
# 那么在插入数据的时候只能是男，女，不能是中性
~~~





### 时间类型



插入的时候都可以插入`2000-11-11 11:11:11`，但是显示的不一样



~~~sql
datetime # （2000-11-11 11:11:11）----最常用的


timestamp # （把客户端插入的时候从当前时区转化为UTC（世界标准时间进行存储））
# 查询的时候，将这个时间有转化为客户端当前的时区进行返回
time# （11:11:11）
date# （2000-11-11）
~~~







## 查询语句









### 创表和插入数据







~~~sql
create database test_sql;
use test_sql;


create table depart(
      id int not null auto_increment primary key,
      title varchar(16) not null 
)default charset=utf8;


create table info(
     id int not null auto_increment primary key,
    name varchar(16) not null ,
    email varchar(32) not null,
    age int,
    depart_id int 
)default charset=utf8;
~~~











~~~sql
insert into depart(title) values ("开发"),("运营"),("销售");
insert into info(name,email,age,depart_id)
values
("Mona-Lisa","Mona-Lisa@qq.com",19,3),
("Mary","Mary.@qq.com",29,2),
("Richa","Richa@qq.com",18,2),
("Mark","Mark@qq.com",40,1),
("Ray","Ray@qq.com",20,1),
("Tina","Tina@qqq.com",18,1),
("Dancer","Dancer@qq.com",38,2),
("Rose","Rose@qq.com",17,2);
~~~



















### 基础的查询语句语法













#### 条件









~~~sql
select * from info  where age>30;
select * from 表名 条件;
> ,< ,= ,!= ,or ,and ,between 20 and 30,

in ,not in # 包含的意思
select * from info where id in (1,3,5,7,9);
~~~









==多层的嵌套(从里面往外面读)==

~~~sql
# 条件的嵌套
select * from info where depart_id in (select id from depart);

# 大于三十岁的员工他们的部门都叫什么名字
# 一步一步来，先找他们的部门叫什么名字，再筛选大于30岁的。
select id,title from depart where id in (select depart_id from info where age>30);


# 表的嵌套
select * from (select * from info where age>30) as t1 where age=4;

# 最好是些info.id这样的话比较精确，如果有很多张表的话，这样不容易出错
select * from info where info.id=1;
~~~



















#### 通配符





通俗来讲：模糊搜索`like`



- `%`
  0-n个长度的内容

~~~sql
# 意思就是以@qq.com结尾就行，前面的内容我不管
select * from info where email like '%@qq.com';
~~~



- `_`
  占位符，只占用一个位置

- `rlike`

  含有某个字符串，并且是多个的。和`python`的`re`是很像的，是多匹配的内容。

~~~sql
# 这样也能实现，但是太麻烦了
select * from info where name like '%ar%' or name like '%na%';
# 含有name里面含有na或者含有ar的都会查询到
select * from info where name rlike 'ar|na';
~~~















#### 映射







~~~sql
select 字段1，字段2，。。。。 from 表名;

as 起别名

select id,name,123 as 字段名 from info # 123这个字段在表里面是不存在的
# 创造字段：一般搭配union来使用

# 推荐用下面那一个，因为上面那一个只能针对一个字段，下面那一个可以针对多个字段
case 字段 when 原有的内容 then 输出的内容 else 其他内容 end as 别名
case when 字段的条件 then 输出的内容 else 其他的内容 end as 别名


~~~







#### 排序







~~~sql
# 单列排序
order by 字段名 排序规则；
desc 降序
asc 升序(这是默认的)
# order by 一定要在 where的后面
select * from info where depart_id=1 order by age asc;


# 多列排序
select * from info order by age,depart_id desc;
# 优先按照age来排序，在age相同的情况下，再按照depart_id进行降序排序

顺序：
select 字段名
from 表名
where 条件
order by 字段1，字段2.。。 asc/desc
limit 5；
~~~









#### 取部分内容



因为公司的数据是很多的，所以我们一般是只会取前面几个看一下，符不符合我们的要求。





~~~sql
# 取前五行
select * from info limit 5;

select 字段名
from 表名
where 条件
order by 字段1，字段2.。。 asc/desc

# offset 跳过前面5行
select * from info limit 2 offset 5；

~~~







#### 联合







优势：查找的效率很高

要注意的事项：

1. 先联合，排序在后
2. 针对于不同列数，union去重的时候，记忆是正对所有的列同时相同的情况下，才会进行去重。



~~~sql
# 就是把俩张表合起来，但是他们的字段行数必须是一样的
select id,title from depart 
union 
select id,name from info;

# 这个但是有一个表有2列，有一个表有3列怎么办，这个就要联动上面的映射了。
select id,title,'默认' as depart_info from depart 
union 
select id,name,email from info;

union # 自动去重
union all # 不会自动去重
~~~











#### 分组



注意事项：



==分组必须要聚合！！！==



==非聚合字段全部放到`group by`后面当做分组的字段！！！==



==拿到数据的第一个要干的事情就是弄明白字段的内容是干啥的!!!==



使用`count`的啊回收，如果遇到`null`值，不会计数

使用`sum()`的时候如果遇到null值，会出现俩种情况

1. 不会统计`null`值
2. 结果`null`

 







~~~sql
select 字段1，聚合的函数（字段）
from 表名
group by 字段；
select depart_id,count(id)
from info 
group by depart_id;


select 字段1 ，字段2，聚合的函数（字段），聚合的函数（字段）
from 表名
group by 字段，字段；
select depart_id,age,count(id)
from info
group by depart_id,age;
# 这个的意思就是把前面俩个字段当成一组了，depart_id和age相同的放一组。如果是只写一个depart_id的话，那么age就是一个无效字段

# 聚合函数
count min max  avg sum

distinct 去重
select age,count(distinct id),count(distinct name) from info group by age;
# 去重哪一个字段，是根据业务额场景来的，如果这里的id是订单编号的话，那么名字和年龄相同的话就是一个人（或者有其他判断条件）
# 如果id就是学号的话，是不会重复的，那么就去重id，因为可能有重名的但是名字是一样的。


~~~

















#### 连表查询















































