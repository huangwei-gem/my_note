# MySQL数据库

## 数据库相关指令

### 数据库

数据库和数据表的关系，类似于文件夹和`exel`的关系，文件夹就是数据库，`exel`就是数据表。

`mysql`对于大小写是不敏感的。

1. 登录数据库：`mysql -uroot -p123456`

2. 展示数据库：` show databases;  `注意一下分号，分号才是一个语句的结束。

3. 创建数据库：`create database database_test;`名字尽量不要有中文名，不然有很多的bug。
   
   ```sql
   create database 数据库的名字 default charset utf8 # 默认的编码格式（后面这一段写不写没关系，反着是默认的）
   create database 数据库的名字[编码格式][校对规则]; # 主要针对的问题是大小写不敏感的问题，比如说创建数据表的时候是BBB，但是显示的是bbb。
   ```

```
4. 删除数据库：`drop database database_test; `一定是英文分号，并且是分号结尾。

5. 进入数据库：`use data_test;`





>  注意事项：如果说要查询或者做操作的前提下是数据库里面有数据才能进行操作







### 数据表





1. 进入数据库：`use 数据库的名字;`

2. 查看数据表：

   ~~~sql
   show tables; # 展示所有的数据表
   desc 表名； #详细展示一张数据表
```

3. 创建表语句：
   
   ```sql
   create table 表名(
       字段 类型，
       字段 类型，
       ......
   );
   ```
   
   ```sql
   create table user_info(
       id int，
       name varchar(16)，# 这个其实是字符串类型，并且长度是16.
       ......
   )default charsrt=utf8;
   ```
   
   ```sql
   create table user_info(
       id int,
       name varchar(16) not null, # 允许为空
       email varchar(32) null # 不允许为空
       )default charset=utf8;
   ```
   
   ```sql
   create table user_info2(
       id int, 
       name varchar(16) not null,
       age int default 18 # 没有内容的时候：默认值18
   );
   ```
   
   ```sql
   create table user_info3(
       id int primary key, # 主键，不能重复，并且不能为空，其实这个id就像身份证一样的，不会重复的
       name varchar(16) not null
   );
   ```
   
   主键:一般用于表示当前这条数据的编号(人的身份证)，的值，所以在数据库中都会让主键和自增结合需要我们自己来维护的一个不重复。
   
   ```sql
   create table user_infor4(
       id int primary key auto_increment # 自增的一个主键，就是我们增加一个数据的时候，那个id回自己+1
   );
   ```

4. 删除表：
   
   ```sql
   drop table 表名;
   ```

5. 清空表：
   
   ```sql
   delete from 表名；
   truncate table 表名;# 执行的很快，无法回滚撤销 直译过来是截断的意思
   ```

6. 修改表：
   
   - 添加列
   
   ```sql
   alter table user_info add age int;
   alter table user_info add 
   new_id intnot null primary key auto_increment; # 后面是属性值，不能为空，是主键，并且是自增的
   ```

```
   - 删除列

   ~~~sql
   alter table 表名 drop column 列名
```

- 修改列的类型
  
  ```sql
  alter table 表名 modify column 列名 类型; # 大部分用的是这个
  ```

- 修改列 类型+名称
  
  ```sql
  alter table 表名 change 原列名 新列名 新类型; # 用的 比较少，因为列名一般是确定好的，不会修改的。
  ```

- 修改列 默认值 不为空。。。
  
  ```sql
  alter table 表名 modify 列名 类型 状态;
  alter table us_info modify new_name varchar(8) not null default 3;
  ```

- 删除列的默认值
  
  ```sql
  alter table 表名 alter 列名 drop default;
  ```

## 数据行的学习

- 新增的数据
  
  ```sql
  insert into 表名（列名，列名2.....） values （对应的列名1内容，2内容，3内容） 
  ```

- 删除数据
  
  ```sql
  delete from 表名； ---把数据全部删除
  delete from 表名 where 条件；
  ```

- 修改数据
  
  ```sql
  update 表名 set 列名=值；# 默认是所有的都会被替换，所以一般是用下面那一种
  update 表名 set 列名=值 where 条件；
  ```

- 查询数据
  
  ```sql
  select * from 表名；# 查看表名所有的数据
  ```

## 数据类型和长度

```sql
# 在sql中括号中的数据表示数据类型的长度或者最大值，具体含义取决于数据类型
varchar（32） 显示的是长度
int  显示的是长度/宽度，但是实际存储的数字范围是不会受到限制的 
```

### int

```sql
int
int unsigned # 表表示数据范围是无符号的
int（5）zerofill # 表示当位数不满足五位的时候，按照左边的顺序补0，比如00001。

tinyint 取值范围比int小

bigint 取值范围比int大
```

### 浮点型

```sql
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
```

### 字符串类型

```sql
char() # 定长的字符串
# 例如：哈哈哈 本质上用了5个字符串

varchar(5) # 可变长的字符串  ----一般用的是这个，效率更高
# 例如：哈哈哈 本质上用了3个字符串。

text 类型
本质上存储哪些长文本内容的，比如弹幕。。文章。。新闻

mediumtext/longtext
```

### 枚举类型

```sql
enum，非难即女
# 比如说建立事后的数据类型是（'男','女'）
# 那么在插入数据的时候只能是男，女，不能是中性
```

### 时间类型

插入的时候都可以插入`2000-11-11 11:11:11`，但是显示的不一样

```sql
datetime # （2000-11-11 11:11:11）----最常用的


timestamp # （把客户端插入的时候从当前时区转化为UTC（世界标准时间进行存储））
# 查询的时候，将这个时间有转化为客户端当前的时区进行返回
time# （11:11:11）
date# （2000-11-11）
```

## 查询语句

### 创表和插入数据

```sql
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
```

```sql
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
```

### 基础的查询语句语法

#### 条件

```sql
select * from info  where age>30;
select * from 表名 条件;
> ,< ,= ,!= ,or ,and ,between 20 and 30,

in ,not in # 包含的意思
select * from info where id in (1,3,5,7,9);
```

==多层的嵌套(从里面往外面读)==

```sql
# 条件的嵌套
select * from info where depart_id in (select id from depart);

# 大于三十岁的员工他们的部门都叫什么名字
# 一步一步来，先找他们的部门叫什么名字，再筛选大于30岁的。
select id,title from depart where id in (select depart_id from info where age>30);


# 表的嵌套
select * from (select * from info where age>30) as t1 where age=4;

# 最好是些info.id这样的话比较精确，如果有很多张表的话，这样不容易出错
select * from info where info.id=1;
```

#### 通配符

通俗来讲：模糊搜索`like`

- `%`
  0-n个长度的内容

```sql
# 意思就是以@qq.com结尾就行，前面的内容我不管
select * from info where email like '%@qq.com';
```

- `_`
  占位符，只占用一个位置

- `rlike`
  
  含有某个字符串，并且是多个的。和`python`的`re`是很像的，是多匹配的内容。

```sql
# 这样也能实现，但是太麻烦了
select * from info where name like '%ar%' or name like '%na%';
# 含有name里面含有na或者含有ar的都会查询到
select * from info where name rlike 'ar|na';
```

#### 映射

```sql
select 字段1，字段2，。。。。 from 表名;

as 起别名

select id,name,123 as 字段名 from info # 123这个字段在表里面是不存在的
# 创造字段：一般搭配union来使用

# 推荐用下面那一个，因为上面那一个只能针对一个字段，下面那一个可以针对多个字段
case 字段 when 原有的内容 then 输出的内容 else 其他内容 end as 别名
case when 字段的条件 then 输出的内容 else 其他的内容 end as 别名
```

#### 排序

```sql
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
```

#### 取部分内容

因为公司的数据是很多的，所以我们一般是只会取前面几个看一下，符不符合我们的要求。

```sql
# 取前五行
select * from info limit 5;

select 字段名
from 表名
where 条件
order by 字段1，字段2.。。 asc/desc

# offset 跳过前面5行
select * from info limit 2 offset 5；
```

#### 联合

优势：查找的效率很高

要注意的事项：

1. 先联合，排序在后
2. 针对于不同列数，union去重的时候，记忆是正对所有的列同时相同的情况下，才会进行去重。

```sql
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
```

#### 分组

注意事项：

==分组必须要聚合！！！==

==非聚合字段全部放到`group by`后面当做分组的字段！！！==

==拿到数据的第一个要干的事情就是弄明白字段的内容是干啥的!!!==

使用`count`的啊回收，如果遇到`null`值，不会计数

使用`sum()`的时候如果遇到null值，会出现俩种情况

1. 不会统计`null`值
2. 结果`null`

```sql
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
```

#### 连表查询

- 主表，从表

先观察主表和从表分别是什么表。一般来讲都是主表在左，1eftjoin 使用率最高。

1. 主表的信息会全部保留。从表的信息有的会展示，没有的会展示为nu11
2. 主表的信息多，从表的信息少，那么少的一方则会被copy n份
3. 主表的信息少，从表信息多，主表会被copy n份

```sql
# 主键，外键

select info.*,depart.title
from info
left join
depart
on info.depart_id = depart.id;
```

```sql
# 固定语法
select 表1.字段 ，表2.字段，
from 表1
left join
表2
on 表1.字段 = 表2.字段
```

- 左连接 左边是主表，右边是从表。这在工作中占比99%。
- 右连接
- 内连接 `inner`左表右表都有的才会显现出来。

==主表的信息是不会丢失的==

## MySQL的执行顺序

```sql
select 。。。
from a
left join b
on a.xx = b.xx
where 条件..
group by ...
having .... (和where一样的，不过他是对新表进行的条件筛选)
order by
limit 
```

## 表关系主键/外键

- 外键起到一个约束的作用，可以约束主键
- 在删除主键所在的表的时候，要先删除表里面的连接的外键，才能删除这张表。

```sql
create table depart1(
    id int not null auto_increment primary key,
    title varchar(16) not null
)default charset=utf8;


create table info1(
   id int not null auto_increment primary key,
    name varchar(16) not null,
    email varchar(32) not null,
    age int,
    depart_id int not null,
    constraint fk_info_depart foreign key (depart_id) references
    depart1(id)
)default charset=utf8;

# constraint fk_info_depart(fk_info_depart是自定义的外键约束名称（命名规则通常为fk_从表名_主表名或fk_字段名_关联表名) foreign key (depart_id)（当前表） references
#     depart1(id)（父表的某一个字段）
```

```sql
alter table infol drop foreign key fk info_depart;
```

### 一对一，一对多，多对多

#### 一对一

| id  | name |
| --- | ---- |
| 1   | a    |
| 2   | b    |
| 3   | c    |

| id  | time     |
| --- | -------- |
| 1   | 2023/1/1 |
| 2   | 2023/1/2 |
| 3   | 2023/1/3 |

#### 一对多

| id  | name |
| --- | ---- |
| 1   | a    |
| 2   | b    |
| 3   | c    |

| id    | time         |
| ----- | ------------ |
| 1     | 2023/1/1     |
| **1** | **2023/1/4** |
| 2     | 2023/1/2     |
| 3     | 2023/1/3     |

由于是一对多的情况，所以说在合并的时候，少的那一边会多复制一份（第一行就是多复制出来的），变成这样：

| id  | name | id    | time     |
| --- | ---- | ----- | -------- |
| 1   | a    | 1     | 2023/1/1 |
| 1   | a    | 1     | 2023/1/4 |
| 2   | b    | **1** | 2023/1/2 |
| 3   | c    | 2     | 2023/1/3 |

你要理解这个合并之后，**==少的那一边会多复制一份出来==**，所以在统计id数量的时候你要去重，但是在统计时间的时候不要去重，因为原来那一张表就是有俩个时间，所以的看你的业务需求。

```sql
select a.id,count(distinct a.id),count (ring_time)
from 
a left join b on a.id=b.id
group by a.id
```

#### 多对多（要尽量避免，因为数据很冗余）

| id  | name |
| --- | ---- |
| 1   | a    |
| 1   | d    |
| 2   | b    |
| 3   | c    |

| id    | time         |
| ----- | ------------ |
| 1     | 2023/1/1     |
| **1** | **2023/1/4** |
| 2     | 2023/1/2     |
| 3     | 2023/1/3     |

| id  | name | id    | time     |
| --- | ---- | ----- | -------- |
| 1   | a    | 1     | 2023/1/1 |
| 1   | a    | 1     | 2023/1/4 |
| 1   | d    | 1     | 2023/1/1 |
| 1   | d    | 1     | 2023/1/4 |
| 2   | b    | **1** | 2023/1/2 |
| 3   | c    | 2     | 2023/1/3 |

一般是不会这么操作的，而是先把左边的表分组聚合（先求后面的），再去和右边的表连接。

## 视图

- 封装好的表格，相当于创建了一个表，只不过是一个视图表

```sql
# 创建一个depart_one这个表来作为后面那一段的视图
create view depart_one as 
select id from depart where title = "开发";

# 简化了表达式
select * from info where depart_id = (select id from depart_one);
select * from info where depart_id = (select id from depart where title = "开发");

# create view：创建一个视图，最终生成一个虚拟的表格,这个表格可以和其他数据库里面联动查询，并且可以在不同的sql语句里面去应用,用的少，因为权限的原因会有受阻。
# with as (当前脚本临时的一个语句)：只能在一个sql语句去运用。
with depart_ones as
(select id from depart where title = '开发')
select *
from
(select * from info where depart_id in (select id from depart_ones)) as
a left join depart as b on a.depart_id = b.id;
```

## case when/if…

```sql
# 其实这个就是类似于在python里面的case，else
case when

select *,case when age<18 then '未成年' when age<30 then '青年' when age between 30 and 60 then '中年' else '老年'
end as age_title from info;



# select 年龄段,count(id) from info group by 年龄段;(基本的逻辑)
SELECT 
    CASE 
        WHEN age < 18 THEN '未成年' 
        WHEN age < 30 THEN '青年' 
        WHEN age BETWEEN 30 AND 60 THEN '中年' 
        ELSE '老年' 
    END AS 年龄段,
    COUNT(DISTINCT id) AS 人数
FROM info
GROUP BY 年龄段  
ORDER BY 人数 ASC;


# 如果是18就输出id，反之就输出null
select *,if(age=18,id,null) from info;
```

## 窗口函数

先学着使用数据库的客户端

解决三类问题：

1. 排名问题
   
   ```sql
   rank
   dense_rank
   row_number
   -- 从student表中查出所有数据，同时给每一行数据增加一个 “排名列”（stu_rank），这个排名是「按 caption 列分组、组内按 num 列降序」计算的。
   select *，rank() over(partition by caption order by num desc) as stu_rank from student;
   -- 举一反三
   ```
   
   -- 在我的data里面是这么执行的
    select *,rank() over(partition by 评论数 order by 点赞数 desc) as pinlun_rank from data;
   
   -- rank：相同分值的排名一样，之后的排名会跳过  1 2 2 4
   -- dense_rank：相同分值排名一样 之后的排名不会跳过 依次输出 1 2 2 3
   -- row_number：会按照顺序依次排名，不会有相同排名 1 2 3 4

```
2. 将表中某一个指标与分组之后的数学指标做对比【分组后找高低】

   ~~~sql
   -- 聚合开窗
   SELECT distinct GradeID,count(Relation) OVER(partition by GradeID) AS 年级平分数
   from students_academic_performance
   where raisedhands>60;
```

3. 累计
   
   ```sql
   
   ```
   
   -- 创建数据
   
   CREATE TABLE IF NOT EXISTS sale_order (
   
       id INT PRIMARY KEY AUTO_INCREMENT COMMENT '订单id',  
       sale_dt DATE COMMENT '订单时间',                    -- 订单id
       user_id INT COMMENT '用户id',                      -- 订单时间
       sku_id INT COMMENT '商品类型id',                   -- 用户id
       sale_count INT COMMENT '销售数量',                 -- 商品类型id
       price INT COMMENT '销售单价',                      -- 销售单价
       amount INT COMMENT '销售金额'                      -- 销售金额
   
   ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;  -- 可选：添加主流存储引擎和字符集
   
   INSERT INTO sale_order (sale_dt, user_id, sku_id, sale_count, price, amount)
   VALUES
   
       ('2019-01-01', 1, 1001, 2, 100, 200),
       ('2019-01-02', 2, 1001, 1, 100, 100),
       ('2019-02-10', 3, 1001, 2, 80, 160),
       ('2019-02-11', 2, 1002, 2, 100, 200),  -- 补充缺失的逗号
       ('2019-03-01', 3, 1002, 1, 100, 100),
       ('2019-03-01', 3, 1001, 1, 50, 50),
       ('2020-03-01', 3, 1002, 1, 100, 100),
       ('2020-04-01', 3, 1001, 1, 50, 50),    -- 补充缺失的逗号
       ('2019-03-01', 3, 1003, 4, 100, 400);
   
   -- 写年月的俩种写法，标注的数据是这样的：2019-03-01
   select *
   ,substr(sale_dt,1,7) '年月'
   ,date_format(sale_dt,"%Y-%m") '年月'
   from sale_order；
   
   -- 之前学过的，能计算出每个月的销售额和销售数量
   select substr(sale_dt,1,7) '年月',sum(amount) '销售额',sum(sale_count) '销售数量'
   from sale_order
   group by substr(sale_dt,1,7);
   
   -- 上面有一个局限，每一个月的都是每一个月的总量，我现在要实现总量的累加，也就是第二个月就是第一个月和
   -- 第二个月只和，以此类推。
   -- 先创建一个视图，后面计算会简单一些
   CREATE view sales as
   (select substr(sale_dt,1,7) '年月',sum(amount) '销售额',sum(sale_count) '销售数量'
   from sale_order
   group by substr(sale_dt,1,7)
   )
   
   -- 窗口函数
   select *，sum() over(partition by 年月 order by 销售额 desc) as '累加销售额' from sales;
   
   -- 这就实现每个月的累加了
   SELECT 
   
       *,
       SUM(销售额) OVER(
           ORDER BY 年月
       ) AS 累计金额  
   
   FROM sales;
   -- 再优化一下，下面这个会计算每一年的累计销售额，第二年的时候清空，上面那个不会，也就是累加是累加在每一个组上面了，上面因为每一欧分组所以是一个人。
   SELECT 
   
       *,
       SUM(销售额) OVER(
       partition BY substr(年月,1,4)
           ORDER BY 年月
       ) AS 累计金额  -- 中文别名加反引号，避免兼容问题
   
   FROM sales;

```
语法：

~~~sql
窗口函数（）over（partition by 分组字段。。。
      order by 排序字段 asc/desc
）
~~~















## 补充知识

















1. 统计一个表的行数：
   ~~~sql
   -- 我们一般的写法，但是有字段为空，就会导致统计少了
   select count(id) from info;
   -- 大部分时候用这个，因为他就是来统计行数的，只要整行不为空他就会统计算一个
   select count(*) from info;
   -- 在末尾增加一个1，后面就和count(*)是一样的了
   select count(1) from info;
   ~~~

   | 写法          | 统计逻辑                                | 处理 NULL 值       | 性能特点（主流数据库：MySQL/Oracle/PostgreSQL）              |
   | ------------- | --------------------------------------- | ------------------ | ------------------------------------------------------------ |
   | `count(*)`    | 统计**所有行数**（仅判断行存在）        | 包含 NULL 行       | 语义最清晰，优化器优先选最优索引（如最小二级索引），性能最优 |
   | `count(1)`    | 统计**所有行数**（用 1 占位判断行存在） | 包含 NULL 行       | 与 `count(*)` 等价，优化器会统一处理，性能无差异             |
   | `count(列名)` | 统计该列**非 NULL 值**的行数            | 排除 NULL 行       | 若列无索引，需全表扫描；有索引则接近 `count(*)`              |
   | `count(主键)` | 统计所有行数（主键必非 NULL）           | 包含 NULL 行（无） | 与 `count(*)` 等价，优先走主键索引，性能接近                 |

2. 结构
   `show index from info; `查看结构

   | 对比维度                | 聚簇索引                                                     | 非聚簇索引                                                   |
   | ----------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
   | 叶子节点内容            | 完整数据行                                                   | 索引键 + 指向数据行的 “指针”（InnoDB 是主键值）              |
   | 数据物理顺序            | 数据行的物理存储顺序 = 聚簇索引的逻辑顺序                    | 数据物理顺序与索引逻辑顺序无关                               |
   | 数量限制                | 一个表**只能有 1 个**（物理存储只能按一种顺序排）            | 一个表可以有**多个**（可建多个不同维度的目录）               |
   | 主键关联（InnoDB）      | 默认主键就是聚簇索引；无主键则选唯一非空索引；仍无则生成隐式 rowid 作为聚簇索引 | 叶子节点存储主键值（通过主键回表找数据）                     |
   | 查询性能（等值 / 范围） | 等值 / 范围查询极快（无需回表，直接取数）                    | 普通查询需 “回表”（先查索引→再查聚簇索引），仅覆盖索引场景无需回表 |
   | 更新成本                | 若修改聚簇索引键（如主键），会移动数据行物理位置，成本高     | 仅修改索引键时，只需调整索引结构，不移动数据行，成本低       |
   | 空间占用                | 无需额外存储指针，空间利用率高                               | 需存储索引键 + 指针，空间占用更高                            |

3. 常用函数

   ~~~sql
   -- 替换函数
   replace("字段",",","-"),把字段里面的,换成-
   -- 获取当前时间，获取的格式是：2025-12-16
   current_date 
   -- 把一列变为字符串
   GROUP_CONCAT(字段名 [SEPARATOR 分隔符])
   ~~~

4. 思想：把复制的东西简单化，把简单的东西流程化。 如果直接查找很麻烦，可以新映射一个字段，映射一个不行就映射两个。
```
