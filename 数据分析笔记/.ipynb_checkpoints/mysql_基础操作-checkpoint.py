'''
Author: Python Crawler Developer crawler@example.com
Date: 2025-12-16 17:50:40
LastEditors: Python Crawler Developer crawler@example.com
LastEditTime: 2025-12-18 22:33:38
FilePath: \test\test.py
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
'''

import pymysql
# 创建连接对象，参数分别为：主机名，端口号，用户名，密码，数据库名称，字符集
conn = pymysql.connect(host='localhost', port=3306, user='root', password='123456', charset='utf8')
# 创建的游标对象，用于执行sql语句
cursor = conn.cursor()


# 执行sql语句，查询所有数据库
cursor.execute('show databases')
res = cursor.fetchall()

# 执行sql语句，创建数据库test
cursor.execute('create database if not exists test')

# 删除数据库
cursor.execute('drop database if exists test')  

# 进入数据库
cursor.execute('use test')
cursor.execute('show tables')


print(res)
# 提交事务(相当于更新数据库)
conn.commit()
# 关闭游标
cursor.close()
# 关闭连接
conn.close()


