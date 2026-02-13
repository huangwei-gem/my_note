file_path = r"./股票数据.xlsx"

import os  
import pymysql
import pandas as pd
import numpy as np

def clean_percentage_data(value):
    """清理百分比数据"""
    if pd.isna(value):
        return None
    if isinstance(value, (int, float)):
        return float(value)
    if isinstance(value, str):
        # 移除百分比符号和其他非数字字符
        cleaned_value = value.replace('%', '').strip()
        try:
            return float(cleaned_value)
        except ValueError:
            return None
    return None

def clean_numeric_data(value):
    """清理数值数据"""
    if pd.isna(value):
        return None
    if isinstance(value, (int, float)):
        return float(value)
    if isinstance(value, str):
        # 移除逗号和其他非数字字符
        cleaned_value = value.replace(',', '').strip()
        try:
            return float(cleaned_value)
        except ValueError:
            return None
    return None
    
def prepare_value_for_db(value):
    """准备插入数据库的值"""
    if pd.isna(value) or value is None:
        return None
    if isinstance(value, str) and '%' in value:
        return clean_percentage_data(value)
    elif isinstance(value, (int, float)):
        return float(value)
    elif isinstance(value, str):
        return clean_numeric_data(value)
    return value

# 创建连接对象，参数分别为：主机名，端口号，用户名，密码，数据库名称，字符集
conn = pymysql.connect(host='localhost', port=3306, user='root', passwd='123456', db='test', charset='utf8')

# 创建游标对象  
cursor = conn.cursor()

# 创建数据库
cursor.execute("CREATE DATABASE IF NOT EXISTS test")

# 选择数据库
cursor.execute("USE test")

# 创建表
cursor.execute("CREATE TABLE IF NOT EXISTS stock_data ("
               "id INT AUTO_INCREMENT PRIMARY KEY, "
               "sequence INT, "
               "industry VARCHAR(50), "
               "industry_index DECIMAL(10,2), "
               "change_rate DECIMAL(5,2), "
               "inflow_funds DECIMAL(10,2), "
               "outflow_funds DECIMAL(10,2), "
               "net_amount DECIMAL(10,2), "
               "company_count INT, "
               "leading_stock VARCHAR(50), "
               "leading_change_rate DECIMAL(5,2), "
               "current_price DECIMAL(10,2))")

# 导入数据
# 读取Excel文件
df = pd.read_excel(file_path)

# 遍历DataFrame并将数据插入到数据库中
for index, row in df.iterrows():
    # 准备插入数据库的值
    values = tuple(prepare_value_for_db(cell) for cell in row)
    
    # 方式1: 使用 %s 占位符（您当前使用的方式）
    cursor.execute("INSERT INTO stock_data (sequence, industry, industry_index, change_rate, inflow_funds, outflow_funds, net_amount, company_count, leading_stock, leading_change_rate, current_price) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", values)

    # 方式2: 使用 .format() 方法
    cursor.execute("INSERT INTO stock_data (sequence, industry, industry_index, change_rate, inflow_funds, outflow_funds, net_amount, company_count, leading_stock, leading_change_rate, current_price) VALUES ({}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {})".format(values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8], values[9], values[10]))

    # 方式3: 使用 f-string 格式 (注意：这种方式不推荐用于SQL查询，因为容易受到SQL注入攻击)
    sequence, industry, industry_index, change_rate, inflow_funds, outflow_funds, net_amount, company_count, leading_stock, leading_change_rate, current_price = values
    cursor.execute(f"INSERT INTO stock_data (sequence, industry, industry_index, change_rate, inflow_funds, outflow_funds, net_amount, company_count, leading_stock, leading_change_rate, current_price) VALUES ({sequence}, '{industry}', {industry_index}, '{change_rate}', {inflow_funds}, {outflow_funds}, {net_amount}, {company_count}, '{leading_stock}', '{leading_change_rate}', {current_price})")

# 执行查询以验证数据插入成功
cursor.execute("SELECT * FROM stock_data")
result = cursor.fetchall()
print(result)
# 提交事务（将所有执行的SQL语句提交到数据库，相当于更新数据库）
conn.commit()

# 关闭游标和连接象
cursor.close()
conn.close()