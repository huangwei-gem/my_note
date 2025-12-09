import asyncio
import aiohttp
import os

# 目标文件夹路径
TARGET_FOLDER = r"C:\Users\35796\Desktop\植物作业"

# 确保目标文件夹存在
os.makedirs(TARGET_FOLDER, exist_ok=True)

headers = {
    'Accept': 'image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8',
    'Accept-Language': 'zh-CN,zh;q=0.9',
    'Cache-Control': 'no-cache',
    'Connection': 'keep-alive',
    'Pragma': 'no-cache',
    'Referer': 'https://pan-yz.chaoxing.com/screen/file_0cec982bc85858fe486eece376a30131?ext=%7B%22_from_%22:%22254191064_125024447_294244985_04a1c1c27a266a7d8a025dd829b707ec%22%7D',
    'Sec-Fetch-Dest': 'image',
    'Sec-Fetch-Mode': 'no-cors',
    'Sec-Fetch-Site': 'cross-site',
    'Sec-Fetch-Storage-Access': 'active',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36',
    'sec-ch-ua': '"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"',
    'sec-ch-ua-mobile': '?0',
    'sec-ch-ua-platform': '"Windows"',
}

async def download_image(session, i):
    """下载单张图片"""
    url = f'https://s3.cldisk.com/sv-w9/doc/25/45/97/0cec982bc85858fe486eece376a30131/thumb/{i}.png'
    file_path = os.path.join(TARGET_FOLDER, f'{i}.png')
    
    try:
        async with session.get(url, headers=headers) as response:
            if response.status == 200:
                content = await response.read()
                with open(file_path, 'wb') as f:
                    f.write(content)
                print(f"已下载: {i}.png")
            else:
                print(f"下载失败 {i}.png, 状态码: {response.status}")
    except Exception as e:
        print(f"下载 {i}.png 时出错: {e}")

async def main():
    """主函数，异步下载所有图片"""
    async with aiohttp.ClientSession() as session:
        # 创建所有下载任务
        tasks = [download_image(session, i) for i in range(1, 120)]
        # 并发执行所有任务
        await asyncio.gather(*tasks)
    
    print("所有图片下载完成！")

# 运行异步程序
if __name__ == "__main__":
    asyncio.run(main())