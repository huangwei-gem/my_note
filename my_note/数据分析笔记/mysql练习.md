# mysql练习



原文地址：https://blog.csdn.net/2301_80436820/article/details/149606011





## 前置准备







#### 部门表（dept）

```sql
-- ----------------------------
-- 创建部门表
-- ----------------------------
DROP TABLE IF EXISTS dept;
CREATE TABLE dept  (
  DEPTNO int(11) NOT NULL COMMENT '部门编号',
  DNAME varchar(20) NOT NULL COMMENT '部门名称',
  LOC varchar(20)  COMMENT '部门所在的位置',
  PRIMARY KEY (DEPTNO) 
) ENGINE = InnoDB CHARACTER SET = utf8mb4  COMMENT = '部门表';

```

#### 员工表（emp）









```sql

-- ----------------------------
-- 创建员工表
-- ----------------------------
DROP TABLE IF EXISTS emp;
CREATE TABLE emp  (
  EMPNO int(11) NOT NULL COMMENT '雇员的编号',
  ENAME varchar(50)  NOT NULL COMMENT '雇员的姓名',
	JOB	varchar(50)  NOT NULL COMMENT '职位',
  MGR int(11) NULL DEFAULT NULL COMMENT '雇员对应的领导编号',
  HIREDATE date NULL DEFAULT NULL COMMENT '雇员的雇佣日期',
  SAL decimal(7, 2) NULL DEFAULT NULL COMMENT '基本工资',
  COMM decimal(7, 2) NULL DEFAULT NULL COMMENT '奖金，佣金',
  DEPTNO int(11) NULL DEFAULT NULL COMMENT '雇员所在的部门编号',
  PRIMARY KEY (EMPNO),
  CONSTRAINT FK_EMP_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES dept (DEPTNO) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COMMENT = '员工表';

```



#### 工资等级表（salgrade）



```sql

-- ----------------------------
-- 工资等级表
-- ----------------------------
DROP TABLE IF EXISTS salgrade;
CREATE TABLE salgrade  (
  GRADE int(11) NOT NULL COMMENT '工资的等级  主键',
  LOSAL decimal(7, 2) NOT NULL COMMENT '此等级的最低工资',
  HISAL decimal(7, 2) NOT NULL COMMENT '此等级的最高工资',
  PRIMARY KEY (GRADE)
) ENGINE = InnoDB CHARACTER SET = utf8mb4  COMMENT = '工资等级表' ;

```















### 测试数据















#### 部门表数据



```sql

-- ----------------------------
-- 部门表插入数据
-- ----------------------------
INSERT INTO DEPT VALUES (10, '财务部', '武汉');
INSERT INTO DEPT VALUES (20, '研发部', '武汉');
INSERT INTO DEPT VALUES (30, '销售部', '深圳');
INSERT INTO DEPT VALUES (40, '业务部', '上海');


```





#### 员工表数据









```sql

-- ----------------------------
-- 员工表插入数据
-- ----------------------------
INSERT INTO EMP  values (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, null, 20);
INSERT INTO EMP  values (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30);
INSERT INTO EMP  values (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30);
INSERT INTO EMP  values (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, null, 20);
INSERT INTO EMP  values (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30);
INSERT INTO EMP  values (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, null, 30);
INSERT INTO EMP  values (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, null, 10);
INSERT INTO EMP  values (7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000.00, null, 20);
INSERT INTO EMP  values (7839, 'KING', 'PRESIDENT', null, '1981-11-17', 5000.00, null, 10);
INSERT INTO EMP  values (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.00, 0.00, 30);
INSERT INTO EMP  values (7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100.00, null, 20);
INSERT INTO EMP  values (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950.00, null, 30);
INSERT INTO EMP  values (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000.00, null, 20);
INSERT INTO EMP  values (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, null, 10);

```







#### 工资等级表数据



```sql
-- ----------------------------
-- 工资等级表插入数据
-- ----------------------------
INSERT INTO SALGRADE (GRADE, LOSAL, HISAL) values (1, 700, 1200);
INSERT INTO SALGRADE (GRADE, LOSAL, HISAL) values (2, 1201, 1400);
INSERT INTO SALGRADE (GRADE, LOSAL, HISAL) values (3, 1401, 2000);
INSERT INTO SALGRADE (GRADE, LOSAL, HISAL) values (4, 2001, 3000);
INSERT INTO SALGRADE (GRADE, LOSAL, HISAL) values (5, 3001, 9999);

```









#### 表关系说明

- **emp表**：员工信息表，包含员工的基本信息
- **dept表**：部门信息表，包含部门的基本信息
- **salgrade表**：工资等级表，用于工资等级划分
- **关联关系**：emp表的DEPTNO字段关联dept表的DEPTNO字段





## 练习题











1. 查询员工名字里面性`W`的个数。
   ~~~sql
   -- 
   SELECT count(MGR) 以W开头的人数 from emp where ENAME like 'W%';
   ~~~

   复习一下`like`模糊匹配的语法。

   | `%`  | 匹配**任意长度的字符串**（包括 0 个） | `'abc%'`  | 以 `abc` 开头的字符串（如 abc、abcd、abc123）   |
   | ---- | ------------------------------------- | --------- | ----------------------------------------------- |
   | `%`  | 同上                                  | `'%abc'`  | 以 `abc` 结尾的字符串（如 xyzabc、123abc）      |
   | `%`  | 同上                                  | `'%abc%'` | 包含 `abc` 的字符串（如 xabcx、abc、123abc456） |
   | `_`  | 匹配**单个字符**（必须且仅 1 个）     | `'_abc'`  | 4 位字符串，后 3 位是 abc（如 1abc、xabc）      |
   | `_`  | 同上                                  | `'a_c'`   | 3 位字符串，首字符 a、尾字符 c（如 abc、a1c）   |

2. 查询名字里面含有`N`的员工名单。
   ~~~sql
   -- 
   SELECT ENAME from emp where ENAME like '%N%';
   ~~~

3. 查询每一个部门的人数。
   ~~~sql
   -- 分组必聚合，并且前面要有分组的字段，也就是下面出现了俩个deptno
   SELECT DEPTNO,count(EMPNO) from emp group by DEPTNO;
   ~~~

4. 查询同名的部门人员名单，并且统计同名的人数。
   ~~~sql
   -- 我这种方法都话，太冗余了，如果我们想在group by 分组之后再筛选一下的话就用having 不能用where
   SELECT *
   FROM (
       -- 子查询：按ENAME分组，统计每个姓名的人数，子查询别名temp写在括号外
       SELECT ENAME, COUNT(EMPNO) AS name_num 
       FROM emp 
       GROUP BY ENAME  -- GROUP BY后仅跟列名，无需AS
   ) AS temp  -- 子查询的别名放在括号后，这是正确位置
   WHERE name_num > 1;  -- 筛选重复的姓名（出现次数>1）
   
   -- 老师的版本
   SELECT ENAME, COUNT(EMPNO) AS name_num 
       FROM emp 
       GROUP BY ENAME  
       having name_num > 1;
      
   -- having 的语法
   
   ~~~

   | 对比维度            | WHERE                              | HAVING                                                       |
   | ------------------- | ---------------------------------- | ------------------------------------------------------------ |
   | **执行时机**        | `GROUP BY` 分组**之前**执行        | `GROUP BY` 分组**之后**执行                                  |
   | **筛选对象**        | 原始数据行（表的单行记录）         | 分组后的聚合结果（整个分组）                                 |
   | **聚合函数**        | 不允许使用（如 `COUNT()`/`SUM()`） | 允许使用（核心场景）                                         |
   | **可用字段**        | 仅能使用表的「原始列」（或别名）   | 可使用分组列、聚合函数、`SELECT` 中定义的聚合别名            |
   | **依赖 `GROUP BY`** | 无需 `GROUP BY`，可独立使用        | 通常与 `GROUP BY` 配合使用（无 `GROUP BY` 时等价于 `WHERE`，但效率低） |
   | **索引利用**        | 可命中索引（如前缀索引）           | 仅能筛选分组结果，无法利用原始索引（需先分组再筛选）         |

5. 查找“20”部门的所有要人员名字。
   ~~~sql
   -- 
   SELECT ENAME,DEPTNO from EMP WHERE DEPTNO=2
   ~~~

6. 查询每个部门的部门部门名称和部门人数。

   ~~~sql
   -- 这里的执行步骤是：先连表，再分组聚合，然后再选择。
   select dept.DEPTNO,dept.DNAME,COUNT(EMPNO)
   from emp
   left join
   dept
   on dept.DEPTNO = emp.DEPTNO
   group by DEPTNO;
   
   -- 连表要注意主表
   
   
   ~~~

7. 查询基本工资小于`1500`的员工姓名和职位以及他所在的部门。

   ~~~sql
   -- 
   select emp.ENAME,emp.JOB,dept.DNAME
   from emp
   left join
   dept
   on dept.DEPTNO = emp.DEPTNO
   WHERE SAL<1500;
   
   
   ~~~

8. 查询工作是`SALESMAN`的所有员工名字和基本工资以及他的部门名称。

   ~~~sql
   -- 字符串记得加上引号
   select emp.ENAME,emp.SAL,dept.DNAME
   from emp
   left join
   dept
   on dept.DEPTNO = emp.DEPTNO
   WHERE emp.JOB='SALESMAN';
   
   ~~~

9. 查询工作是`SALESMAN`或者工资小于`1000`的员工名字和基本工资以及他的部门名称。

   ~~~sql
   -- 
   select emp.ENAME,emp.SAL,dept.DNAME
   from emp
   left join
   dept
   on dept.DEPTNO = emp.DEPTNO
   WHERE emp.JOB='SALESMAN' or emp.SAL<1000;
   ~~~

10. 查询工作是`SALESMAN`且工资低于1500的的所有员工id、员工姓名、员工部门。

   ~~~sql
   -- 
   SELECT a.EMPNO,a.ENAME,b.DNAME,a.SAL
   from emp as a 
   left join
   dept as b
   on a.DEPTNO=b.DEPTNO
   WHERE SAL<1500;
   ~~~

11. 查询所有员工的姓名，id和部门名称还有工资等级

    ~~~sql
    -- 如果表是emp和salgrade这种关系，可以用内联哈
    SELECT a.EMPNO,a.ENAME,b.DNAME,a.SAL,s.GRADE
    from emp as a 
    left join
    dept as b
    on a.DEPTNO=b.DEPTNO
    INNER JOIN salgrade s
      ON a.SAL BETWEEN s.LOSAL AND s.HISAL;
    ~~~

12. 查询每一个等级的工资人数有多少个。

    ~~~sql
    -- 分组必须聚合，并且分组的字段一定也是筛选的字段，比如这里面的 GRADE
    SELECT GRADE,COUNT(a.EMPNO)
    from emp as a 
    left join
    dept as b
    on a.DEPTNO=b.DEPTNO
    INNER JOIN salgrade s
      ON a.SAL BETWEEN s.LOSAL AND s.HISAL
    group BY GRADE;
    ~~~

13. 查询每一个部门工资的总和、最高工资、最低工资，显示：部门名称、部门代号、总工资、最高工资、最低工资。

    ~~~sql
    -- 
    SELECT a.DEPTNO,b.DNAME,SUM(a.SAL),min(a.SAL),max(a.SAL)
    from emp as a 
    left join
    dept as b
    on a.DEPTNO=b.DEPTNO
    group BY DEPTNO;
    ~~~

14. 查询每一个部门工资的平均分，显示：部门名称、部门代号、平均工资。

    ~~~sql
    -- 
    SELECT a.DEPTNO,b.DNAME,avg(SAL)
    from emp as a 
    left join
    dept as b
    on a.DEPTNO=b.DEPTNO
    group BY DEPTNO;
    ~~~

15. 查询每一个部门工资的平均分，显示：部门名称、部门代号、平均工资。（按平均工资从大到小排序）。

    ~~~sql
    -- 
    
    SELECT a.DEPTNO,b.DNAME,avg(SAL) `平均工资`
    from emp as a 
    left join
    dept as b
    on a.DEPTNO=b.DEPTNO
    group BY DEPTNO
    order BY `平均工资` desc;
    ~~~

16. 查询部门的平均工资和及格率（大于1500算及格），显示：课程ID、课程名称、平均工资、及格率。

    ~~~sql
    -- 
    
    SELECT 
      a.DEPTNO,
      b.DNAME,
      ROUND(AVG(a.SAL), 2) `平均工资`,  -- 保留2位小数，更易读
      -- 修正占比计算：SUM统计符合条件的行数，COUNT统计总行数
      ROUND(SUM(a.SAL > 1500) / COUNT(a.SAL), 4) `薪资>1500占比`  
    FROM emp as a 
    LEFT JOIN dept as b
      ON a.DEPTNO = b.DEPTNO
    GROUP BY a.DEPTNO, b.DNAME  -- 补充b.DNAME，符合ONLY_FULL_GROUP_BY严格模式
    ORDER BY `平均工资` DESC;
    
    SELECT * from emp;
    ~~~

17. 查询基本工资加上绩效及格（大于1500算及格）的所有部门号、加上绩效的工资；

    ~~~sql
    -- 我的
    SELECT EMPNO,SAL+COMM `实际工资`
    FROM emp as a 
    LEFT JOIN dept as b
      ON a.DEPTNO = b.DEPTNO
    WHERE SAL+COMM>1500;
    -- AI写的
    SELECT 
      a.EMPNO,  -- 补充表别名a，避免多表歧义
      b.DNAME,
      SAL + IFNULL(COMM, 0) `实际工资`  -- COMM为NULL时按0计算
    FROM emp as a 
    LEFT JOIN dept as b
      ON a.DEPTNO = b.DEPTNO
    WHERE SAL + IFNULL(COMM, 0) > 1500;  -- WHERE中也要统一处理，否则筛选失效
    ~~~

18. 查询基本工资加上绩效及格（大于1500算及格）的所有部门号、加上绩效的工资，部门名称；

    ~~~sql
    SELECT 
      a.EMPNO,  -- 补充表别名a，避免多表歧义
      b.DNAME,
      SAL + IFNULL(COMM, 0) `实际工资`  -- COMM为NULL时按0计算
    FROM emp as a 
    LEFT JOIN dept as b
      ON a.DEPTNO = b.DEPTNO
    WHERE SAL + IFNULL(COMM, 0) > 1500;  -- WHERE中也要统一处理，否则筛选失效
    ~~~

19. 查询“20”部门每个学生的id、姓名、个人实际（包括绩效）、部门平均的工资（加上绩效的）。

    ~~~sql
    -- 涉及到俩张表的话，一定记得要写，a.,或者b.，不然容易造成歧义。
    SELECT a.EMPNO,
    a.ENAME,
    ENAME,SAL + IFNULL(COMM, 0) `实际工资`,
    temp.部门平均工资 
    from emp a 
    LEFT JOIN
    (select DEPTNO,
    AVG(SAL + IFNULL(COMM, 0)) `部门平均工资`
    from 
    emp 
    GROUP BY DEPTNO) AS temp
    ON a.DEPTNO=temp.DEPTNO
    WHERE a.DEPTNO=20;
    
    
    -- 方法2
    SELECT 
      a.EMPNO,
      a.ENAME,
      a.SAL + IFNULL(a.COMM, 0) `实际工资`,
      -- 标量子查询：仅返回20部门的平均实际工资（单值）
      (SELECT AVG(SAL + IFNULL(COMM, 0)) 
       FROM emp 
       WHERE DEPTNO = 20) `部门平均工资`
    FROM emp a 
    WHERE a.DEPTNO = 20;
    
    
    -- 方法三，用窗口原函数
    SELECT 
      EMPNO,
      ENAME,
      SAL + IFNULL(COMM, 0) `实际工资`,
      -- 窗口函数：按DEPTNO分组计算平均工资，每行都带对应部门的平均值。开窗函数就相当于开了一个临时的窗口，这里是开了一个分组的窗口
      AVG(SAL + IFNULL(COMM, 0)) OVER (PARTITION BY DEPTNO) `部门平均工资`
    FROM emp 
    WHERE DEPTNO = 20;  -- 仅筛选20部门
    ~~~

20. 查询各个部门的部门名称、总工资、平均工资、及格率（工资大于1500）（按平均工资从大到小排序）。

    ~~~sql
    -- 普通方法
    
    SELECT a.DNAME,
    temp.总工资,
    temp.部门平均工资,
    temp.工资大于1500的
    from dept a 
    LEFT JOIN
    (select DEPTNO,
    SUM(SAL) `总工资`,
    AVG(SAL + IFNULL(COMM, 0)) `部门平均工资`,
    ROUND(SUM(SAL > 1500) / COUNT(SAL), 4) `工资大于1500的`
    from 
    emp 
    GROUP BY DEPTNO) AS temp
    ON a.DEPTNO=temp.DEPTNO
    ORDER BY `部门平均工资` DESC;
    
    -- 窗口函数的方法
    SELECT DISTINCT  -- 去重：每个部门只展示一条统计结果
      b.DNAME,
      a.DEPTNO,
      SUM(a.SAL) OVER (PARTITION BY a.DEPTNO) `总工资`,
      AVG(a.SAL + IFNULL(a.COMM, 0)) OVER (PARTITION BY a.DEPTNO) `部门平均工资`,
      ROUND(SUM(a.SAL > 1500) / COUNT(a.SAL), 4) OVER (PARTITION BY a.DEPTNO) `工资>1500占比`
    FROM emp a 
    LEFT JOIN dept b 
      ON a.DEPTNO = b.DEPTNO
    ORDER BY `部门平均工资` DESC;
    ~~~

21. 查询工资等级是1档的同学的学号、姓名。

    ~~~sql
    -- 
    SELECT EMPNO,
    ENAME,
    SAL
    FROM emp e
    LEFT JOIN
    salgrade s
    ON e.SAL BETWEEN s.LOSAL AND s.HISAL
    WHERE s.GRADE=1;
    ~~~

22. 查询工资等级不是1档的同学的学号、姓名。

    ~~~sql
    -- 
    SELECT EMPNO,
    ENAME,
    SAL
    FROM emp e
    LEFT JOIN
    salgrade s
    ON e.SAL BETWEEN s.LOSAL AND s.HISAL
    WHERE s.GRADE!=1;
    ~~~

23. 查询工资等级是1档的同学中，工资最高的学生姓名及其成绩（不考虑并列）。

    ~~~sql
    -- 
    SELECT EMPNO,
    ENAME,
    SAL,
    row_number() over(order by SAL desc) '工资排名'
    FROM emp e
    LEFT JOIN
    salgrade s
    ON e.SAL BETWEEN s.LOSAL AND s.HISAL
    WHERE s.GRADE=1
    ORDER by SAL DESC;
    ~~~

24. 查询工资等级是1档的同学中，工资最高的学生姓名及其成绩（考虑并列）。

    ~~~sql
    -- 
    SELECT EMPNO,
    ENAME,
    SAL,
    row_number() over(order by SAL desc) '工资排名'
    FROM emp e
    LEFT JOIN
    salgrade s
    ON e.SAL BETWEEN s.LOSAL AND s.HISAL
    WHERE s.GRADE=1
    ORDER by SAL DESC;
    
    -- rank：相同分值的排名一样，之后的排名会跳过  1 2 2 4
    -- dense_rank：相同分值排名一样 之后的排名不会跳过 依次输出 1 2 2 3
    -- row_number：会按照顺序依次排名，不会有相同排名 1 2 3 4
    ~~~

25. 查询基本工资和加上绩效的工资是一个档位的的全部学生的id、姓名。

    ~~~sql
    -- 
    SELECT 
      e.EMPNO,
      e.ENAME,
      s1.GRADE,
      s2.GRADE
    FROM emp e
    LEFT JOIN salgrade s1 ON e.SAL BETWEEN s1.LOSAL AND s1.HISAL
    LEFT JOIN salgrade s2 ON (e.SAL + IFNULL(e.COMM, 0)) BETWEEN s2.LOSAL AND s2.HISAL
    WHERE s1.GRADE = s2.GRADE;
    
    ~~~

26. 查询基本工资和加上绩效的工资不是一个档位的的全部学生的id、姓名。

    ~~~sql
    -- 
    SELECT 
      e.EMPNO,
      e.ENAME,
      s1.GRADE,
      s2.GRADE
    FROM emp e
    LEFT JOIN salgrade s1 ON e.SAL BETWEEN s1.LOSAL AND s1.HISAL
    LEFT JOIN salgrade s2 ON (e.SAL + IFNULL(e.COMM, 0)) BETWEEN s2.LOSAL AND s2.HISAL
    WHERE s1.GRADE != s2.GRADE;
    
    ~~~

27. 查询两人及以上工资不及格的部门。

    ~~~sql
    -- SAL+IFNULL(e.COMM, 0))>1500 返回的是0或者1，如果小于就是0，反之则是1.这样也能算次数。
    SELECT
    d.DNAME,
    e.DEPTNO,
    SUM((SAL+IFNULL(e.COMM, 0))>1500) `合格的人数`
    FROM emp e
    LEFT JOIN
    dept d
    on e.DEPTNO=d.DEPTNO
    GROUP BY DEPTNO
    having `合格的人数`>1
    ORDER BY `合格的人数` desc;
    ~~~

28. 查询部门里所有收入等级都有的部门并且显示该部门学生的学号、姓名。

    ~~~sql
    -- 
    SELECT 
    DEPTNO,
    COUNT(DISTINCT GRADE) `部门所含等级数量`
    FROM 
    emp e
    LEFT JOIN
    salgrade s
    ON e.SAL+IFNULL(e.COMM,0) BETWEEN s.LOSAL AND s.HISAL
    GROUP BY e.DEPTNO
    having `部门所含等级数量`= max(s.GRADE);
    
    ~~~

29. 查询部门里只有一个收入等级的学生的学号、姓名。

    ~~~sql
    -- 
    SELECT 
    DEPTNO,
    COUNT(DISTINCT GRADE) `部门所含等级数量`
    FROM 
    emp e
    LEFT JOIN
    salgrade s
    ON e.SAL+IFNULL(e.COMM,0) BETWEEN s.LOSAL AND s.HISAL
    GROUP BY e.DEPTNO
    having `部门所含等级数量`=1;
    
    ~~~

30. 查询所有部门里面的员工都达到了的等级是哪几个（部门/等级）？

    ~~~sql
    -- 计算每个员工的工资等级：通过员工的SAL+IFNULL(COMM,0)匹配salgrade表，得到员工对应的GRADE；
    -- 提取各部门的不重复等级：对每个部门，只保留其员工出现过的不重复等级；
    -- 筛选覆盖所有部门的等级：统计每个等级出现的部门数，等于 “总部门数” 的等级即为结果。
    -- 这个是先筛选等级，再筛选部门的，我可以反着来
    -- 先分组等级再筛选部门（回答了部门的）
    SELECT GRADE
    FROM (
        -- 步骤1+2：获取每个部门对应的不重复等级
        SELECT DISTINCT 
            e.DEPTNO,
            s.GRADE
        FROM emp e
        INNER JOIN salgrade s 
            ON (e.SAL + IFNULL(e.COMM, 0)) BETWEEN s.LOSAL AND s.HISAL
    ) AS 部门等级表
    GROUP BY GRADE
    -- 步骤3：筛选覆盖所有部门的等级
    HAVING COUNT(DISTINCT DEPTNO) = (SELECT COUNT(DISTINCT DEPTNO) FROM dept);
    -- 先分组部门再筛选等级（回答了等级的）
    SELECT DEPTNO
    FROM (
        -- 步骤1+2：获取每个部门对应的不重复等级
        SELECT DISTINCT 
            e.DEPTNO,
            s.GRADE
        FROM emp e
        INNER JOIN salgrade s 
            ON (e.SAL + IFNULL(e.COMM, 0)) BETWEEN s.LOSAL AND s.HISAL
    ) AS 部门等级表
    GROUP BY DEPTNO
    -- 步骤3：筛选覆盖所有部门的等级
    HAVING COUNT(DISTINCT GRADE) = (SELECT COUNT(DISTINCT GRADE) FROM salgrade);
    ~~~

31. 查询等级为2和3的所有学生姓名和部门以及工作。

    ~~~sql
    -- 
    SELECT 
    d.DNAME,
    e.JOB
    FROM 
    emp e
    LEFT JOIN
    salgrade s
    ON e.SAL+IFNULL(e.COMM,0) BETWEEN s.LOSAL AND s.HISAL
    LEFT JOIN
    dept d 
    ON e.DEPTNO=d.DEPTNO
    WHERE s.GRADE = 2 or s.GRADE=3;
    ~~~

32. 查询工资等级与员工号为”7369"的学生所处的工资等级一样的其他同学。

    ~~~sql
    -- 这个内联，相当于where，因为内联是满足条件的才会相连。这里是满足7369等级的才会相连。
    SELECT 
      e.EMPNO,
      e.ENAME,
      s.GRADE
    FROM 
      emp e
    INNER JOIN salgrade s 
      ON (e.SAL + IFNULL(e.COMM, 0)) BETWEEN s.LOSAL AND s.HISAL
    -- 关联7369的等级
    INNER JOIN (
      SELECT s2.GRADE 
      FROM emp e2
      LEFT JOIN salgrade s2 ON (e2.SAL + IFNULL(e2.COMM, 0)) BETWEEN s2.LOSAL AND s2.HISAL
      WHERE e2.EMPNO = 7369
    ) AS t ON s.GRADE = t.GRADE;
    
    
    
    
    -- 这个和上面的本质上是一样的，就是把内联换成了where
    SELECT 
      e.EMPNO,
      e.ENAME,
      s.GRADE
    FROM 
      emp e
    INNER JOIN  -- 因WHERE过滤等级，LEFT JOIN无意义，改为INNER JOIN更高效
      salgrade s
    ON (e.SAL + IFNULL(e.COMM, 0)) BETWEEN s.LOSAL AND s.HISAL
    -- 子查询独立查emp表获取7369的等级，避免引用外部别名
    WHERE s.GRADE = (
      SELECT s2.GRADE 
      FROM emp e2
      LEFT JOIN salgrade s2 ON (e2.SAL + IFNULL(e2.COMM, 0)) BETWEEN s2.LOSAL AND s2.HISAL
      WHERE e2.EMPNO = 7369  -- 7369是数字，直接写，无需引号/反引号
    );
    ~~~

33. 查询工资等级与员工号为”7521"的学生所处的工资等级不一样的其他同学。

    ~~~sql
    -- 
    SELECT 
      e.EMPNO,
      e.ENAME,
      s.GRADE
    FROM 
      emp e
    INNER JOIN  -- 因WHERE过滤等级，LEFT JOIN无意义，改为INNER JOIN更高效
      salgrade s
    ON (e.SAL + IFNULL(e.COMM, 0)) BETWEEN s.LOSAL AND s.HISAL
    -- 子查询独立查emp表获取7369的等级，避免引用外部别名
    WHERE s.GRADE != (
      SELECT s2.GRADE 
      FROM emp e2
      LEFT JOIN salgrade s2 ON (e2.SAL + IFNULL(e2.COMM, 0)) BETWEEN s2.LOSAL AND s2.HISAL
      WHERE e2.EMPNO = 7369  -- 7369是数字，直接写，无需引号/反引号
    );
    ~~~

34. 查询基本工资比所在部门的平均工资高的学生的id和部门名称；

    ~~~sql
    -- 兼容所有版本的
    SELECT EMPNO,
    ENAME,
    d.DNAME,
    e.SAL,
    t.`平均工资`
    FROM emp e
    LEFT JOIN
    (SELECT DEPTNO,
    AVG(SAL) `平均工资`
    FROM emp
    GROUP by DEPTNO) AS t
    ON e.DEPTNO=t.DEPTNO
    LEFT JOIN dept d
    ON e.DEPTNO=d.DEPTNO
    WHERE e.SAL > `平均工资`;
    
    -- 用窗口函数简化一下，其实就是吧分组变成窗口了
    SELECT 
      e.EMPNO,
      e.ENAME,
      d.DNAME,
      e.SAL,
      e.平均工资
    FROM (
      -- 子查询先计算每个员工的部门平均工资
      SELECT 
        EMPNO,
        ENAME,
        DEPTNO,
        SAL,
        AVG(SAL) OVER (PARTITION BY DEPTNO) AS 平均工资
      FROM emp
    ) e
    LEFT JOIN dept d ON e.DEPTNO = d.DEPTNO
    WHERE e.SAL > e.平均工资;
    ~~~

35. 查询每个部门工资最高的前3个人（不考虑成绩并列情况）。

    ~~~sql
    -- 
    
    WITH emp_rank AS (
        SELECT 
            *,
            dense_rank() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) AS `工资排名`
        FROM emp
    )
    SELECT *
    FROM emp_rank
    WHERE `工资排名` < 4;
    ~~~

36. 查询每个部门工资最高的前3个人（考虑成绩并列情况）。

    ~~~sql
    --
    
    WITH emp_rank AS (
        SELECT 
            *,
            row_number() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) AS `工资排名`
        FROM emp
    )
    SELECT *
    FROM emp_rank
    WHERE `工资排名` < 4;
    ~~~

37. **找出早于38年前受雇的员工**

    ~~~sql
    -- 我的
    SELECT
      ENAME,
      HIREDATE
    FROM
      emp 
    where
      YEAR(CURDATE()) - YEAR(HIREDATE) > 38;
    -- 答案
    SELECT * FROM emp WHERE TIMESTAMPDIFF(YEAR, hiredate, NOW()) > 38;
    ~~~

    - `TIMESTAMPDIFF(YEAR, hiredate, NOW())`：计算雇佣日期到现在的年数差
    - `NOW()`：获取当前日期时间
    - `YEAR()`把`1980-12-17`这种数据只保留年。

38. **以首字母大写其它字母小写的方式显示所有员工的姓名**

    ~~~sql
    -- 
    SELECT
      CONCAT(
        UPPER(SUBSTRING(ENAME, 1, 1)),  -- 首字母大写
        LOWER(SUBSTRING(ENAME, 2))      -- 剩余字母小写
      ) AS name  -- 别名放在concat函数外部，且函数括号正确闭合
    FROM
      emp;
    ~~~

    - `SUBSTRING(ENAME, 1, 1)`：提取姓名的第一个字符
    - `SUBSTRING(ENAME, 2)`：提取姓名从第二个字符开始的所有字符
    - `UPPER()`：转换为大写
    - `LOWER()`：转换为小写
    - `CONCAT()`：连接字符串

39. **显示不带有"R"的员工的姓名**

    ~~~sql
    -- 
    SELECT * FROM emp;
    SELECT 
    ENAME
    FROM
    emp
    where ENAME not like '%R%'
    ~~~

    - `NOT LIKE '%R%'`：排除姓名中包含字母R的员工
    - `%`：通配符，表示任意字符
    - 注意：原题 `NOT LIKE 'R'` 只排除以R开头的，应该用 `NOT LIKE '%R%'`

40. **显示所有员工的姓名，用a替换所有"A"**

    ~~~sql
    -- 
    SELECT 
    ENAME,
    replace(ENAME,'A','a') name
    FROM
    emp
    ~~~

    - `REPLACE(ename, 'A', 'a')`：将姓名中的大写A替换为小写a
    - 这是字符串替换的标准用法

41. **显示员工的详细资料，按姓名排序**

    ~~~sql
    -- 
    SELECT 
    a.*,
    b.DNAME
    FROM
    emp a
    left join
    dept b
    on a.DEPTNO=b.DEPTNO
    order by ENAME desc;
    ~~~

    - `LEFT JOIN`：左连接，保留左表（emp）的所有记录
    - `e.*`：选择emp表的所有字段
    - `ORDER BY ename`：按姓名升序排序

42. **显示员工的姓名和受雇日期，根据其服务年限，将最老的员工排在最前面**

    ~~~sql
    SELECT 
    ENAME,
    HIREDATE,
    FROM emp
    order by HIREDATE;
    
    ~~~

    - `ORDER BY HIREDATE`：按雇佣日期升序排序，最早的日期（最老的员工）排在前面

43. **显示所有员工的姓名、工作和薪金，按工作的降序排序，若工作相同则按薪金排序**

    ~~~sql
    SELECT 
    ENAME,
    JOB,
    SAL
    FROM emp
    order by JOB desc,SAL ASC;
    ~~~

    - `ORDER BY JOB DESC, SAL ASC`：先按工作降序，再按薪金升序
    - 多字段排序时，从左到右依次排序

44. **显示所有员工的姓名、加入公司的年份和月份，按受雇日期所在月排序，若月份相同则将最早年份的员工排在最前面**

    ~~~sql
    SELECT ename, 
           EXTRACT(YEAR FROM hiredate) AS 年,
           EXTRACT(MONTH FROM hiredate) AS 月 
    FROM emp 
    ORDER BY 月 ASC, 年 ASC;
    ~~~

    - `EXTRACT(YEAR FROM hiredate)`：提取年份
    - `EXTRACT(MONTH FROM hiredate)`：提取月份
    - 注意：题目要求按月份排序，若月份相同则按年份排序，所以是 `ORDER BY 月 ASC, 年 ASC`

45. **找出在(任何年份的)2月受聘的所有员工**

    ~~~sql
    -- 这样会报错，因为where在select之前执行，导致他不知道月份是什么，所以就要用having
    SELECT
      ENAME,
      EXTRACT(
        month
        FROM
          hiredate
      ) `月份`
    FROM
      emp
     where `月份`= 2;
     
     
    -- 这个是正确的
    SELECT
      ENAME,
      EXTRACT(
        month
        FROM
          hiredate
      ) `月份`
    FROM
      emp
     having `月份`= 2;
    
    ~~~

46. **对于每个员工，显示其加入公司的天数**

    ~~~sql
    SELECT
      ENAME,
      EMPNO,
      DATEDIFF(CURDATE(), hiredate) `加入公司天数`
    FROM
      emp;
    ~~~

    - `DATEDIFF(CURDATE(), hiredate)`：计算当前日期与雇佣日期的天数差
    - `TIMESTAMPDIFF(DAY, hiredate, NOW())`：同样计算天数差，但使用不同的函数

47. **显示姓名字段的任何位置包含"A"的所有员工的姓名**

    ~~~sql
    SELECT * FROM emp WHERE ename LIKE '%A%';
    ~~~

    - `LIKE '%A%'`：匹配姓名中包含字母A的所有员工
    - `%`：表示任意数量的任意字符

48. **检索emp表中的员工姓名、月收入及部门编号**

    ~~~sql
    SELECT
      ENAME,
      EMPNO,
      DEPTNO,
      SAL+ifnull(COMM,0) `月收入`
    FROM
      emp;
    ~~~

    - `ifnull(1,2)`如果字段不为空返回1，反之则返回2.

49. **检索emp表中的部门编号及工种，并去掉重复行**

    ~~~sql
    SELECT distinct
      DEPTNO,
      JOB
    FROM
      emp;
    
    ~~~

    - `distinct`去重，放在select后面就是对整个的去重，放在某一个字段后面就是对一个字段进行去重。

50. **检索emp表中的员工姓名及全年收入**

    ~~~sql
    SELECT ename, (sal * 12 + IFNULL(comm, 0)) AS total_income FROM emp;
    ~~~

    - `sal * 12`：月薪乘以12得到年薪
    - `IFNULL(comm, 0)`：如果佣金为空，则用0代替
    - 全年收入 = 年薪 + 佣金

51. **检索emp表，用"is a"这个字符串来连接员工姓名和工种两个字段**

    ~~~sql
    SELECT
      ENAME,
      EMPNO,
      JOB,
      CONCAT_WS(' is a ',ENAME,JOB) `描述`
    FROM
      emp;
    ~~~

    - `CONCAT_WS(' is a ', ENAME, JOB)`：用"is a"作为分隔符连接姓名和工种
    - 结果格式：如"SMITH is a CLERK"

52. **检索月收入大于2000的员工姓名及月收入**

    ```sql
    SELECT
      ENAME,
      SAL
    FROM
      emp
    where sal>2000;
    ```

53. **检索月收入在1000元到2000元的员工姓名、月收入及雇佣时间**

    ```sql
    SELECT
      ENAME,
      EMPNO,
      DATEDIFF(CURDATE(),HIREDATE) `雇佣时间`
    FROM
      emp
    where sal between 1000 and 2000;
    ```

    - `BETWEEN 1000 AND 2000`：包含边界值的范围查询
    - 等价于 `sal >= 1000 AND sal <= 2000`

54. **检索以S开头的员工姓名及月收入**

    ```sql
    SELECT
      ENAME,
      EMPNO,
      SAL
    FROM
      emp
    where ENAME like 'S%';
    ```

    - `LIKE 'S%'`：匹配以S开头的姓名
    - `%`：表示任意数量的任意字符

55. **检索员工姓名中的第三个字符是A的员工姓名及月收入**

    ```sql
    -- 我可以用like试一下
    SELECT
      ENAME,
      EMPNO,
      SAL
    FROM
      emp
    where ENAME like '__A%';
    
    -- 官方的方法
    SELECT
      ENAME,
      EMPNO,
      SAL
    FROM
      emp
    where SUBSTRING(ename, 3, 1)='A';
    
    ```

    - `SUBSTRING(ename, 3, 1)`：从姓名的第3个位置开始，提取1个字符
    - 检查提取的字符是否等于’A’

56. **检索emp表中月收入是800的或是1250的员工姓名及部门编号**

    ```sql
    -- 
    SELECT
      ENAME,
      EMPNO,
      DEPTNO,
      SAL
    FROM
      emp
    where SAL=800 or sal = 1250;
    
    ```

    - 使用 `OR` 逻辑运算符
    - 注意：原题写的是 `sal = 800 or 1250`，这是错误的语法，应该是 `sal = 800 OR sal = 1250`

57. **显示在部门20中岗位CLERK的所有雇员信息**

    ```sql
    -- 如果是字符串内容，记得加上引号
    SELECT
     *
    FROM
      emp
    where DEPTNO=20 and JOB='CLERK';
    
    ```

58. **检索emp表中有提成的员工姓名、月收入及提成**

    ```sql
    -- 
    SELECT
    ENAME,
    EMPNO,
    SAL,
    COMM
    FROM
      emp
    where COMM is not null;
    ```

    - `IS NOT NULL`：查询非空值

    - 注意：不能用 `comm != NULL`，必须用 `IS NOT NULL`

      why?

      核心原因：NULL 不是 “值”，而是 “状态”

      在 SQL 中，`NULL` 代表的是**缺失的值**或**未知的值**，它不是一个具体的数值（比如 0）、也不是空字符串（`''`），更不是可以被比较的 “常规值”。而 `=`、`!=`、`>`、`<` 等比较运算符，只能用于**具体值之间的对比**，无法处理 “未知状态” 的 `NULL`。

      1. 普通比较运算符与 NULL 比较的结果是 `UNKNOWN`

      SQL 的逻辑判断只有 `TRUE`（真）、`FALSE`（假）、`UNKNOWN`（未知）三种结果，而 `WHERE` 子句**只执行结果为 `TRUE` 的行**，`UNKNOWN` 会被当作 `FALSE` 处理。

      举个例子：

      ```sql
      -- 错误写法：永远返回空集
      SELECT ename, comm FROM emp WHERE comm != NULL;
      ```

      当 `comm` 字段值为 `NULL` 时，`comm != NULL` 的结果是 `UNKNOWN`；当 `comm` 有具体值（比如 100）时，`100 != NULL` 的结果还是 `UNKNOWN`—— 因为 “已知值” 和 “未知值” 无法比较，最终 `WHERE` 子句筛选不到任何行。

      2. `IS NOT NULL`/`IS NULL` 是专门判断 NULL 状态的运算符

      SQL 标准专门设计了 `IS NULL` 和 `IS NOT NULL` 这两个运算符，它们不比较 “值”，而是直接判断字段的 “状态”：

      - `IS NULL`：判断字段是否为 “未知 / 缺失” 状态
      - `IS NOT NULL`：判断字段是否为 “有具体值” 状态

59. **查询职（job）为’PRESIDENT’的员工的工资**

    ```sql
    SELECT
    JOB,
    SAL
    FROM
      emp
    where job='PRESIDENT';
    ```

60. **查询佣金为0或为null的员工的信息**

    ```sql
    
    SELECT
    *
    FROM
      emp
    where COMM=0 or COMM is null;
    
    ```

61. **查询入职日期在1981-5-1到1981-12-31之间的所有员工的信息**

    ```sql
    SELECT
    *
    FROM
      emp
    where HIREDATE between '1981-5-1' and '1981-12-31';
    
    ```

62. **查询所有名字长度为4的员工的员工的编号，姓名**

    ```sql
    SELECT
    ENAME,
    EMPNO
    FROM
      emp
    where length(ENAME)=4;
    ```

    - `LENGTH(ename)`：计算姓名的字符长度
    - 筛选长度为4的姓名

63. **显示10号部门所有经理和20号部门的所有员工**

    ```sql
    -- 
    SELECT
    *
    FROM
      emp
    where (DEPTNO=10 and JOB='MANAGER') or DEPTNO=20;
    ```

64. **显示姓名没有’L’字的员工的详细信息或含有’SM’字的员工信息**

    ```sql
    SELECT
    *
    FROM
      emp
    where ENAME not like '%L%' or ENAME like '%SM%';
    ```

65. **显示各个部门经理的工资**

    ```sql
    SELECT
    ENAME,
    EMPNO,
    DEPTNO,
    SAL
    FROM
      emp
    where JOB='MANAGER';
    ```

66. **显示佣金收入比工资高的员工的详细信息**

    ```sql
    SELECT
    *
    FROM
      emp
    where sal< ifnull(COMM,0);
    ```

67. **按照入职日期由新到旧排列员工信息**

    ```sql
    SELECT * FROM emp ORDER BY hiredate DESC;
    ```

68. **求1981年下半年入职的员工**

    ```sql
    SELECT
    ENAME,
    EMPNO,
    HIREDATE
    FROM
      emp
    where YEAR(HIREDATE)=1981 and month(HIREDATE)>6;
    
    
    -- 简洁版本
    SELECT * FROM emp WHERE hiredate >= '1981-07-01' AND hiredate <= '1981-12-31';
    ```

69. **把hiredate列看做是员工的生日，求本月过生日的员工**

    ```sql
    -- CURDATE()一定要加上括号，我老师忘记加括号
    SELECT
    ENAME,
    EMPNO,
    HIREDATE
    FROM
      emp
    where month(CURDATE())=month(HIREDATE);
    
    ```

    - `MONTH(hiredate)`：提取雇佣日期的月份
    - `MONTH(CURDATE())`：提取当前日期的月份

70. **求1982年入职的员工**

    ```sql
    SELECT
    ENAME,
    EMPNO,
    HIREDATE
    FROM
      emp
    where YEAR(hiredate)=1982;
    
    
    ```

71. **查询各个部门的平均工资**

    ```sql
    SELECT d.DNAME,
    e.DEPTNO,
    avg(sal) `部门平均工资`
    FROM emp e
    left join
    dept d
    on e.DEPTNO=d.DEPTNO
    group by e.DEPTNO
    ```

    - `GROUP BY deptno`：按部门分组
    - `AVG(sal)`：计算每个部门的平均工资
    - 聚合函数与GROUP BY配合使用

72. **显示各种职位的最低工资**

    ```sql
    -- 
    SELECT JOB,
    min(sal) `职业最低工资`
    FROM emp
    group by JOB
    
    ```

73. **查询每个部门的最高工资**

    ```sql
    -- 
    SELECT d.DNAME,
    e.DEPTNO,
    max(sal) `部门平均工资`
    FROM emp e
    left join
    dept d
    on e.DEPTNO=d.DEPTNO
    group by e.DEPTNO
    ```

74. **查询每个部门，每个职位的最高工资**

    ```sql
    -- 分组和排序后面是可以写俩个或者以上的，并且按照你写的显瘦顺序来分组的
    SELECT d.DNAME,
    e.DEPTNO,
    e.JOB,
    max(sal) `部门平均工资`
    FROM emp e
    left join
    dept d
    on e.DEPTNO=d.DEPTNO
    group by e.DEPTNO,e.JOB
    order by DNAME desc,`部门平均工资` desc;
    ```

75. **列出各种工作的最低薪金，并使最低薪金大于1500（分组和过滤）**

    ```sql
    SELECT JOB,
    min(sal) `职业最低工资`
    FROM emp
    group by JOB
    having `职业最低工资`>1500
    ```

76. **列出各种类别工作（分组）的最低工资**

    ```sql
    SELECT job, MIN(sal) AS min_sal FROM emp GROUP BY job;
    ```

77. 



































































































































































































































































































































==！！！如果还是不太熟悉，可以去牛客网刷题，或者leetcode==









## 注意的点



### having和where的区别





在 MySQL 中，`WHERE` 和 `HAVING` 都是用于筛选数据的关键字，但核心区别在于**筛选时机**和**筛选对象**——`WHERE` 筛选「分组前的原始行」，`HAVING` 筛选「分组后的聚合结果」，这也是为什么你之前的需求（筛选重复姓名）必须用 `HAVING`（或外层 `WHERE`），而非直接用 `WHERE`。

#### 一、核心区别（维度对比）

| 对比维度            | WHERE                              | HAVING                                                       |
| ------------------- | ---------------------------------- | ------------------------------------------------------------ |
| **执行时机**        | `GROUP BY` 分组**之前**执行        | `GROUP BY` 分组**之后**执行                                  |
| **筛选对象**        | 原始数据行（表的单行记录）         | 分组后的聚合结果（整个分组）                                 |
| **聚合函数**        | 不允许使用（如 `COUNT()`/`SUM()`） | 允许使用（核心场景）                                         |
| **可用字段**        | 仅能使用表的「原始列」（或别名）   | 可使用分组列、聚合函数、`SELECT` 中定义的聚合别名            |
| **依赖 `GROUP BY`** | 无需 `GROUP BY`，可独立使用        | 通常与 `GROUP BY` 配合使用（无 `GROUP BY` 时等价于 `WHERE`，但效率低） |
| **索引利用**        | 可命中索引（如前缀索引）           | 仅能筛选分组结果，无法利用原始索引（需先分组再筛选）         |

#### 二、关键底层逻辑：SQL 执行顺序

理解两者的核心是记住 SQL 完整执行流程，这决定了 `WHERE` 和 `HAVING` 的能力边界：

plaintext











```plaintext
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
```

- `WHERE` 先执行：过滤原始行后，剩下的行才会被分组，因此 `WHERE` 无法使用「分组后才生成的聚合值」（如 `count(EMPNO)`）；
- `HAVING` 后执行：分组并计算聚合值（如 `name_num`）后，再筛选符合条件的分组。

#### 三、实战例子（结合你的 `emp` 表场景）

假设 `emp` 表数据：

| EMPNO | ENAME  | SAL  |                  |
| ----- | ------ | ---- | ---------------- |
| 7369  | SMITH  | 800  |                  |
| 7499  | ALLEN  | 1600 |                  |
| 7521  | WARD   | 1250 |                  |
| 7566  | JONES  | 2975 |                  |
| 7654  | MARTIN | 1250 |                  |
| 7698  | BLAKE  | 2850 |                  |
| 7788  | SCOTT  | 3000 |                  |
| 7844  | TURNER | 1500 |                  |
| 7876  | SMITH  | 1100 | （重复的 SMITH） |

##### 场景 1：筛选「分组前的原始行」（用 WHERE）

需求：先筛选工资 > 1000 的员工，再统计每个姓名的人数。

sql











```sql
SELECT ENAME, COUNT(EMPNO) AS name_num
FROM emp
WHERE SAL > 1000  -- 先过滤工资>1000的原始行（排除SMITH(800)）
GROUP BY ENAME;
```

结果（仅展示部分）：

| ENAME | name_num |                              |
| ----- | -------- | ---------------------------- |
| ALLEN | 1        |                              |
| SMITH | 1        | （仅剩下工资 1100 的 SMITH） |

##### 场景 2：筛选「分组后的聚合结果」（用 HAVING）

需求：统计每个姓名的人数，并筛选出「人数 > 1」的重复姓名（你的核心需求）。

sql











```sql
-- 正确写法：GROUP BY 后用 HAVING 筛选聚合结果
SELECT ENAME, COUNT(EMPNO) AS name_num
FROM emp
GROUP BY ENAME
HAVING name_num > 1;  -- 筛选重复姓名（仅SMITH符合）
```

结果：

| ENAME | name_num |
| ----- | -------- |
| SMITH | 2        |

##### 场景 3：错误示范（WHERE 用聚合函数）

如果强行在 `WHERE` 中用聚合函数，会直接报错（因为执行 `WHERE` 时还没有 `name_num` 这个聚合值）：

sql











```sql
-- 报错：Invalid use of group function
SELECT ENAME, COUNT(EMPNO) AS name_num
FROM emp
WHERE COUNT(EMPNO) > 1  -- WHERE 不能用聚合函数
GROUP BY ENAME;
```

##### 场景 4：WHERE + HAVING 组合使用（最优实践）

先通过 `WHERE` 过滤无关行（减少分组数据量），再用 `HAVING` 过滤分组结果：

sql











```sql
-- 需求：筛选「工资>1000 且 姓名重复」的员工姓名及人数
SELECT ENAME, COUNT(EMPNO) AS name_num
FROM emp
WHERE SAL > 1000  -- 先过滤低工资行，减少分组压力
GROUP BY ENAME
HAVING name_num > 1;  -- 再筛选重复姓名
```

结果：无（因为工资 > 1000 的 SMITH 只有 1 个）。

### 四、易错注意事项

1. **HAVING 无 GROUP BY 时的行为**：

   若没有 `GROUP BY`，`HAVING` 会将整个表视为「一个分组」，此时等价于 `WHERE`，但效率更低（需先计算聚合再筛选），不推荐：

   sql

   ```sql
   -- 功能等价，但 HAVING 效率更低
   SELECT * FROM emp WHERE SAL > 2000;  -- 推荐
   SELECT * FROM emp HAVING SAL > 2000;  -- 不推荐
   ```

   

2. **HAVING 可使用 SELECT 中的别名**：

   `HAVING` 能直接用 `SELECT` 中定义的聚合别名（如 `name_num`），而 `WHERE` 不行（因为 `SELECT` 在 `WHERE` 之后执行）。

3. **性能优化原则**：

   能通过 `WHERE` 过滤的原始数据，优先用 `WHERE`（减少分组的数据量），再用 `HAVING` 过滤分组结果，避免「先分组所有数据，再筛选」的低效操作。

#### 五、对你之前 SQL 的优化（用 HAVING 替代外层 WHERE）

你之前的 SQL 是「子查询分组 + 外层 WHERE 筛选」，其实可以直接用 `HAVING` 简化，更高效：

sql











```sql
-- 原始修正版（外层 WHERE）
SELECT *
FROM (
    SELECT ENAME, COUNT(EMPNO) AS name_num 
    FROM emp 
    GROUP BY ENAME
) AS temp
WHERE name_num > 1;

-- 简化版（直接用 HAVING）
SELECT ENAME, COUNT(EMPNO) AS name_num 
FROM emp 
GROUP BY ENAME
HAVING name_num > 1;  -- 无需子查询，更简洁高效
```







### 表连接





- 有时候表的名字很长，记得写别名，不然写起来很长的。





~~~sql
-- 我的
select dept.DEPTNO,dept.DNAME,COUNT(EMPNO)
from emp
left join
dept
on dept.DEPTNO = emp.DEPTNO
group by DEPTNO;

-- 老师的
select dept.DEPTNO,dept.DNAME,COUNT(EMPNO)
from emp as a
left join
dept as b
on b.DEPTNO = a.DEPTNO
group by DEPTNO;
~~~





- 连表可以连俩张及以上，我之前一直以为只连一张

```sql

select a.sid,a.sname,b.num,c.cname
from student as a
leftjoin score as b on a.sid = b.student_id
leftjoin course as c on b.course_id = c.cid
where b.num<60
```









### 聚合函数



~~~sql
-- 我原来的
SELECT a.DEPTNO,b.DNAME,avg(SAL) `平均工资`,COUNT(a.SAL>1500)/COUNT(a.SAL)
from emp as a 
left join
dept as b
on a.DEPTNO=b.DEPTNO
group BY DEPTNO
order BY `平均工资` desc;



-- AI帮我修改的
SELECT 
  a.DEPTNO,
  b.DNAME,
  ROUND(AVG(a.SAL), 2) `平均工资`,  -- 保留2位小数，更易读
  -- 修正占比计算：SUM统计符合条件的行数，COUNT统计总行数
  ROUND(SUM(a.SAL > 1500) / COUNT(a.SAL), 4) `薪资>1500占比`  
FROM emp as a 
LEFT JOIN dept as b
  ON a.DEPTNO = b.DEPTNO
GROUP BY a.DEPTNO, b.DNAME  -- 补充b.DNAME，符合ONLY_FULL_GROUP_BY严格模式
ORDER BY `平均工资` DESC;

-- 深刻理解count和sum。
count是统计非空的字段个数，这里面我写的是a.SAL>1500，会返回布尔值，布尔值就是0和1，这些都是非空会统计进去。
我们要实现的话，可以加上一个sum，sum可以把返回的布尔值都加起来，1的就代表有，反之则是0，这样就能对工资小于
1500的进行统计了。
~~~



#### 关键修改点解释

##### 1. 修复「薪资 > 1500 占比」的计算逻辑（核心错误）

原写法 `COUNT(a.SAL>1500)/COUNT(a.SAL)` 是错误的：

- MySQL 中 `a.SAL>1500` 是布尔表达式，结果为 `1`（true）或 `0`（false），**但 COUNT 会统计所有非 NULL 值**（1 和 0 都是非 NULL），因此 `COUNT(a.SAL>1500)` 等价于 `COUNT(a.SAL)`，最终结果永远是 1（100%），完全不符合预期。
- 正确写法：用 `SUM(a.SAL>1500)` 统计「薪资 > 1500 的员工数」（true=1，false=0，SUM 会累加 1），再除以总员工数 `COUNT(a.SAL)`，得到真实占比。
- 补充 `ROUND(..., 4)`：保留 4 位小数（如 0.3750），避免小数过长。

##### 2. 修复 GROUP BY 分组列（MySQL5.7 + 必改）

MySQL 5.7 及以上开启了 `ONLY_FULL_GROUP_BY` 严格模式，要求：

`SELECT` 中出现的**非聚合列**（如 `a.DEPTNO`、`b.DNAME`）必须全部出现在 `GROUP BY` 中。

原写法仅 `GROUP BY DEPTNO`，缺少 `b.DNAME`，会触发报错，修正后改为 `GROUP BY a.DEPTNO, b.DNAME`（同时指定表别名，避免歧义）。

##### 3. 优化体验（可选但推荐）

- `ROUND(AVG(a.SAL), 2)`：给平均工资保留 2 位小数（如 2987.50），比原始的多位小数更易读；
- 给占比列加别名 `薪资>1500占比`：结果集列名更清晰，便于理解；
- `a.SAL` 明确指定表别名：避免多表连接时列名歧义（即使只有 SAL 一列，也是规范写法）。

#### 执行结果示例（参考）

| DEPTNO | DNAME      | 平均工资 | 薪资 > 1500 占比 |                              |
| ------ | ---------- | -------- | ---------------- | ---------------------------- |
| 20     | RESEARCH   | 2175.00  | 0.6000           | （60% 的员工薪资 > 1500）    |
| 10     | ACCOUNTING | 2916.67  | 0.3333           | （33.33% 的员工薪资 > 1500） |
| 30     | SALES      | 1566.67  | 0.2000           | （20% 的员工薪资 > 1500）    |
| NULL   | NULL       | 1200.00  | 0.0000           | （无部门员工薪资≤1500）      |

#### 额外说明（边界场景）

如果 `emp` 表中存在 `SAL` 为 `NULL` 的记录：

- `COUNT(a.SAL)` 会忽略 NULL 值（只统计薪资非空的员工）；
- 若想统计「所有员工（含 SAL 为 NULL）」的占比，需改为 `SUM(IF(a.SAL>1500,1,0)) / COUNT(*)`（`COUNT(*)` 统计所有行，`IF` 处理 SAL 为 NULL 的情况）。



### 核心解决方案：用 `IFNULL()` 函数处理 `COMM` 的 NULL 值

MySQL 中 `NULL` 与任何数值运算结果都是 `NULL`，因此需要将 `COMM` 为 `NULL` 的情况**替换为 0**，再和 `SAL` 相加。`IFNULL(字段, 替换值)` 是 MySQL 专门处理 NULL 的函数，能完美解决这个问题。

#### 修正后的完整 SQL













```sql
SELECT 
  a.EMPNO,  -- 补充表别名a，避免多表歧义
  b.DNAME,
  SAL + IFNULL(COMM, 0) `实际工资`  -- COMM为NULL时按0计算
FROM emp as a 
LEFT JOIN dept as b
  ON a.DEPTNO = b.DEPTNO
WHERE SAL + IFNULL(COMM, 0) > 1500;  -- WHERE中也要统一处理，否则筛选失效
```

#### 关键说明

#### 1. `IFNULL()` 函数的作用

1. `IFNULL(COMM, 0)` 表示：

- 如果 COMM 不为 NULL，取 COMM 的原值;

- 如果 COMM 为 NULL, 取 θ 替代。
  这样 SAL + IFNULL(COMM，8)就不会出现 NULL，而是正常的数值(比如 SAL=888 、COMM=NULL 时，结果为
  800).

  

  2. 必须「SELECT 和 WHERE 统一处理」



如果只在 SELECT 里用 `IFNULL`，但 WHERE 里还是 `SAL+COMM`，那么 WHERE 中的运算结果依然是 NULL，会导致符合条件的记录（比如 `SAL=2000`、`COMM=NULL`）被错误过滤。因此**两处的计算逻辑必须完全一致**。

3. 可选替代方案：`COALESCE()`（更通用）

`COALESCE(字段1, 字段2, ..., 替换值)` 是通用的 SQL 函数（支持多数据库），作用是返回第一个非 NULL 的值，效果和 `IFNULL` 一致，写法如下：





```sql
SELECT 
  a.EMPNO,
  b.DNAME,
  SAL + COALESCE(COMM, 0) `实际工资`
FROM emp as a 
LEFT JOIN dept as b
  ON a.DEPTNO = b.DEPTNO
WHERE SAL + COALESCE(COMM, 0) > 1500;
```

### 示例结果对比（直观理解）

假设 `emp` 表有如下数据：

| EMPNO | SAL  | COMM | DEPTNO |
| ----- | ---- | ---- | ------ |
| 7499  | 1600 | 300  | 30     |
| 7566  | 2975 | NULL | 20     |
| 7369  | 800  | NULL | 20     |

- 修正前：`7566` 的 `SAL+COMM` 为 NULL，会被 WHERE 条件过滤；
- 修正后：`7566` 的 `实际工资=2975+0=2975`，满足 `>1500`，会被正常筛选出来；
- 最终结果会包含 `7499`（1600+300=1900）和 `7566`（2975），排除 `7369`（800）。

### 额外优化（可选）：用别名简化重复逻辑

如果不想重复写 `SAL + IFNULL(COMM, 0)`，可以用子查询 / 派生表简化：

sql











```sql
SELECT EMPNO, DNAME, `实际工资`
FROM (
  SELECT 
    a.EMPNO,
    b.DNAME,
    SAL + IFNULL(COMM, 0) `实际工资`
  FROM emp as a 
  LEFT JOIN dept as b ON a.DEPTNO = b.DEPTNO
) AS temp
WHERE `实际工资` > 1500;
```

这种写法更简洁，且避免了重复的计算逻辑，适合复杂场景。





































~~~sql
-- 如果是字符串内容，记得加上引号
SELECT
 *
FROM
  emp
where DEPTNO=20 and JOB='CLERK';
~~~

