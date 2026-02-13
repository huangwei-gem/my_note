
<map>
  <node ID="root" TEXT="【课程4.0】第3章_Tableau_知识点笔记及作业 副本">
    <node TEXT="课程文件下载快速导航：​【课程4.0】第3章_Tableau.zip​" ID="7fa4f1c435cdf0088be9bbbe397d7c4e" STYLE="bubble" POSITION="right"/>
    <node TEXT="第一节 Tableau入门，复刻仪表盘" ID="498e9a2c6ed2bf8ad7c31825acbd1711" STYLE="bubble" POSITION="right">
      <node TEXT="入门准备" ID="03d52e9fef59738aeeec849f3af2f624" STYLE="fork">
        <node TEXT="下载Tableau Public Desktop" ID="2dc3b3366f3df071501837a095dc7c63" STYLE="fork">
          <node TEXT="Tableau无需付费激活的连接本地版" ID="5a497517d0b45b66cf4f99b7f2587703" STYLE="fork"/>
          <node TEXT="官网下载链接：https://downloads.tableau.com/public/TableauPublicDesktop-64bit-2024-3-0.exe" ID="670a377dd2a09b65fd9d4a7cc71e9510" STYLE="fork"/>
          <node TEXT="飞书下载链接：​TableauPublicDesktop-64bit-2024-3-0.exe​" ID="fbf99a36dd47f1268726a5586ddcd625" STYLE="fork"/>
        </node>
        <node TEXT="安装Tableau Public Desktop" ID="a81132a6fb0371b37bbdb3e9a7b4aeb3" STYLE="fork">
          <node TEXT="勾选接受条款，点击安装" ID="6bd1c967d445886cad4489ff3f134d94" STYLE="fork"/>
          <node TEXT="等待安装完毕" ID="39b4dc9e98afd685501e47b6f0370ade" STYLE="fork"/>
        </node>
        <node TEXT="Public和Desktop的异同" ID="cf5a1f0c2c0c39032d743394c25b89f2" STYLE="fork">
          <node TEXT="相同点" ID="a9a7b15983ef48e6a0314877152ff520" STYLE="fork">
            <node TEXT="都是Tableau的PC客户端软件" ID="ba714feb4bc203016cdd7964a64c9793" STYLE="fork"/>
            <node TEXT="都可以打开Tableau的工作簿文件" ID="077164b219747429fcd318fbc691c549" STYLE="fork"/>
            <node TEXT="都能完成Tableau的所有操作功能" ID="2451b570f2b77bd0e2401bcb199345ca" STYLE="fork"/>
          </node>
          <node TEXT="不同点" ID="4b54181c3dc3cc6ac4667208f162aaca" STYLE="fork">
            <node TEXT="Tableau Desktop" ID="b9fa1a5280ca5edfe44e240261f25aca" STYLE="fork">
              <node TEXT="只有14天试用期，需要付费激活，且激活密钥有期限" ID="a641de4fd35965dc3f376dff839adee1" STYLE="fork"/>
              <node TEXT="Tableau的完整专业版PC客户端" ID="28acda6e76da17382a19617593e0bf1b" STYLE="fork"/>
              <node TEXT="可以选择发布至私有部署服务器或者云端公有服务器" ID="768d99733a63a9fe9a0a42274aa58817" STYLE="fork"/>
            </node>
            <node TEXT="Tableau Public Desktop" ID="b58726ba030f507eafd1324f255c0f0a" STYLE="fork">
              <node TEXT="无需付费，下载安装完即可使用" ID="476c9abb2cc810fb276bfaac11af3007" STYLE="fork"/>
              <node TEXT="数据连接部分有功能阉割，只能连接本地文件，无法连接数据库" ID="da11aabd3daa748d67e8e0f2a1ab9e81" STYLE="fork"/>
              <node TEXT="只能发布至云端公有服务器（类似个人网页展示Tableau作品用于共享）" ID="e450af442ef84274610dad7e9d454206" STYLE="fork"/>
            </node>
          </node>
        </node>
        <node TEXT="本次教学仅使用本地文件数据，Tableau Public作为本次入门教学和本地数据分析完全足够！" ID="95de01ac31283f1660f618080bd592fa" STYLE="fork"/>
      </node>
      <node TEXT="任务一：练习交叉表，掌握基本操作" ID="c2a3785859b69669e2b617e5e144c9cf" STYLE="fork">
        <node TEXT="构建表格" ID="3b3f12b18d1373b98e78a35757967213" STYLE="fork">
          <node TEXT="连接数据" ID="25567d97b20f6165b8c2f7d3968370fd" STYLE="fork">
            <node TEXT="双击打开软件" ID="24ebcac4182b9ec8d65267913607a129" STYLE="fork"/>
            <node TEXT="到文件-Microsoft Excel，选择Excel文件【4-7月销售成交汇总数据.xlsx】" ID="f8c678c28e0ea4cd9ff7294f10cdaf21" STYLE="fork"/>
            <node TEXT="数据源界面，左边为数据连接管理，右上是数据模型" ID="41ed15360d8e43b5849da413c0625736" STYLE="fork"/>
            <node TEXT="点击sheet1，右键重命名为【销售成交数据】" ID="cbe09d337e6ed27a3bfd96777d5b9d32" STYLE="fork"/>
          </node>
          <node TEXT="预览数据，修改数据类型" ID="0bcb4cfcefbda7d1337b6650401f47bc" STYLE="fork">
            <node TEXT="这张表有12个字段9403行数据，只预览前100条" ID="6544d66529376b899020171dea9da93c" STYLE="fork"/>
            <node TEXT="每个字段都有自己的数据类型，主要有7种类型" ID="a708773d9444d913e90eb10ec3314e09" STYLE="fork">
              <node TEXT="7种数据类型" ID="548f65df2094a657984effaaacb555c1" STYLE="fork">
                <node TEXT="数字-小数" ID="20f19dff80f895c41855605eef9f0050" STYLE="fork"/>
                <node TEXT="数字-整数" ID="705fc6d23ebf4cf2dfdd1241b4d880a7" STYLE="fork"/>
                <node TEXT="日期和时间" ID="03c71cf301ada5b9fa12d26f8271704f" STYLE="fork"/>
                <node TEXT="日期" ID="c6b7d4ac08b61f021d0327e05b54bf93" STYLE="fork"/>
                <node TEXT="字符串" ID="0de50241746e70fc3d27cf51ed9e1765" STYLE="fork"/>
                <node TEXT="空间" ID="ba291bf0e92efd652094df8183bb787b" STYLE="fork"/>
                <node TEXT="布尔" ID="fad44f1d4e30dfe92a10ad7b9c2eace4" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="成交日期应该是日期格式但是被识别为字符串，所以在这个界面直接进行更改" ID="993f75555fb93945334226e9f26f76b0" STYLE="fork"/>
          </node>
          <node TEXT="认识维度和度量" ID="ed1161b9c26fa8326646190a3f6da920" STYLE="fork">
            <node TEXT="点击下面的工作表，转到工作表界面" ID="c1a11a5d0b14a2b1c1e4ac1f5078d0b9" STYLE="fork"/>
            <node TEXT="维度概念" ID="24144b15c5b37cbb8f30daace0910710" STYLE="fork">
              <node TEXT="维度是用于分类和描述数据的字段。它们通常是一些具有离散值的类别型变量，比如这里的成交日期、产品等。维度可以帮助我们从不同的角度对数据进行分组和筛选。相当于Excel数据透视表中放在行和列的那些字段。" ID="491bd4389ecda4d0fc54daa32bed5b25" STYLE="fork"/>
            </node>
            <node TEXT="度量概念" ID="2e7f585250533562a06646cdc1b658fd" STYLE="fork">
              <node TEXT="度量是可以进行计算和聚合的数值型数据字段。可以进行求和、平均值、计数等数学运算的数据，比如这里的成交金额、成交客户数等。度量的值会根据维度的划分而变化。相当于Excel数据表中放在值的那些字段。" ID="f92bdff0d3981746fb31f192ef1f7d24" STYLE="fork"/>
            </node>
            <node TEXT="销售工号应该作为维度存在，把销售工号拖到维度中，再点击井字符号改成字符串格式" ID="a0f194bdc7f3d6463db48f1c26ad65af" STYLE="fork"/>
          </node>
          <node TEXT="制作交叉表" ID="e34592e74e399a617be66737fbe4bfd7" STYLE="fork">
            <node TEXT="省份拖至行，成交金额放在表Abc这里，形成每个省份成交金额的表" ID="ce985020d50fff9c78509ef639e6ade8" STYLE="fork">
              <node TEXT="" ID="413352a97fd889f64a28e2d3e06b6458" STYLE="fork"/>
            </node>
            <node TEXT="把成交金额直接放入标记也可以做出交叉表" ID="f869f9dcf6d0a9f87eda35a278babbd9" STYLE="fork"/>
            <node TEXT="成交金额的聚合方式是总和，右键选择度量，还有很多其他聚合计算方式，和Excel数据透视表中的值汇总依据一样。" ID="ab8a7d8d6ee090c5b664c48e0ebf1dda" STYLE="fork"/>
            <node TEXT="区域字段放在省份字段前，期数字段放入列中。" ID="a317b5c344f13a88d9f4d8b07064400e" STYLE="fork">
              <node TEXT="" ID="3fd03121c57acdaa4142e64a55e1e2ce" STYLE="fork"/>
            </node>
            <node TEXT="此时的交叉表按照行列的维度将度量成交金额进行了划分，因此每一个数值单元格代表不同区域下不同省份不同期数的成交金额。" ID="d389b21042beb3185a530b0f4f66870c" STYLE="fork"/>
          </node>
          <node TEXT="合计和小计" ID="267ea2a2fb25117685dfb531d1486f9e" STYLE="fork">
            <node TEXT="添加行列汇总和区域的分类汇总，点击功能区中的分析-合计，选择显示行总计、显示列总计、添加全部小计。" ID="c854562590466a83ec19e68dbf53949f" STYLE="fork"/>
            <node TEXT="若要将行总计放在最左边，列总计放在顶端，可以选择到左侧行合计、到顶部的列合计，比较适合表特别长特别宽的时候，就不用拉到表的右边界和下边界才能看到合计值了。" ID="576e5c4dfd0ef1b21e1d62cea6ce7994" STYLE="fork"/>
            <node TEXT="点击合计值，可以选择总和及合计值的聚合方式，一般默认为自动求和。" ID="4acd2533e4c503ab3426af09521b04ed" STYLE="fork"/>
            <node TEXT="总和合计值和字段值的聚合方式是分开选择的，Excel这两者的聚合方式是一致的。" ID="f6c7e06119a5f95e9e9ac68589d78540" STYLE="fork"/>
          </node>
          <node TEXT="字段排序" ID="d298985e8922a9c0fb8e8f84933b9f14" STYLE="fork">
            <node TEXT="快速排序" ID="cf6ef76843978701c988941212d0d63c" STYLE="fork">
              <node TEXT="对表中数据进行排序。最快的方式是点击列旁的排序符号直接完成升序货降序。或者选中列点击功能区里的降序排序。" ID="25f9ca09b67e66f85e44a829187725ae" STYLE="fork">
                <node TEXT="降序" ID="c5c6cb90d386d8bdcad171cb7bb6098a" STYLE="fork">
                  <node TEXT="数值从大到小排列，或者首字母按顺序从后往前排列" ID="309fee43f5c0be57c6cca66211d1a36b" STYLE="fork"/>
                </node>
                <node TEXT="升序" ID="2fdea412ff02d3c0e20422036b7a1ff2" STYLE="fork">
                  <node TEXT="数值从小到大排列，或者首字母按顺序从前往后排列" ID="550d4900953194f2db415bbdc2aabb96" STYLE="fork"/>
                </node>
              </node>
              <node TEXT="但是这种排序方法只能依据字段自己排序，且只对最里面一层的数据排序有用，比如对省份、成交金额排序是无法改变区域的排序的，局限性比较大，一般只在查看图表做快速排序的时候使用，制作图表特别是制作比较复杂的图表时用的比较少。" ID="f0b42212ffa230caa6ca1adcdf1ae2dc" STYLE="fork"/>
            </node>
            <node TEXT="排序设置" ID="829b1671eae25f9ae5f122e5b81767e9" STYLE="fork">
              <node TEXT="右键表中维度字段的字段名，或行中的维度字段胶囊，选择排序，出现排序设置窗口。通过选择排序依据和排序顺序来完成符合需求的排序结果。" ID="a0d7086910eae55390ebffb001a062b1" STYLE="fork"/>
              <node TEXT="比如区域要按成交金额总和升序排序。排序依据选择字段，排序顺序选择升序，字段选择成交金额，聚合方式选择总和。数据会显示实时效果，确认表中的排序符合要求后，点击叉关闭。" ID="9d00fc463348898539102664d527fb4d" STYLE="fork"/>
              <node TEXT="区域里的省份想要按照成交金额降序排序，右键选择排序，和区域一样，排序依据选择字段，排序顺序选择降序，字段选择成交金额，完成。" ID="071ecbca5638ae70c0e5863d31a21084" STYLE="fork"/>
              <node TEXT="再提一下另外几个常见排序依据" ID="f92c500392a76c35b204efb174123b00" STYLE="fork">
                <node TEXT="排序依据-数据源顺序" ID="c439ecd00c26b52aa527a0df525190cd" STYLE="fork">
                  <node TEXT="在数据源中是什么顺序，这里排序就是什么顺序，默认是这个。" ID="fa85c6cee9800b50ec23f09e2969994b" STYLE="fork"/>
                </node>
                <node TEXT="排序依据-字母" ID="c443a79579b0ed977a716f5bf594bef5" STYLE="fork">
                  <node TEXT="按字母拼音首字母排序。" ID="a965deb7140096fd033fceeed595db67" STYLE="fork"/>
                </node>
                <node TEXT="排序依据-手动" ID="8b5af7eab34c430942c4c0b5f04bba83" STYLE="fork">
                  <node TEXT="手动调整字段顺序，适合春夏秋冬，或者公司有默认排序要求这类的情况。" ID="e9097f6f5d129bafd76e845122d01c87" STYLE="fork"/>
                </node>
                <node TEXT="排序依据-嵌套" ID="169b956606a6f42c63abe037c04c48f7" STYLE="fork">
                  <node TEXT="指要排序的值出现在多个区中时，单独考虑各个区中独立的值，而不是跨区聚合中的值。比如，将期数放到省份字段后面，这样每个省份区都有这几个期数。演示个错误的，右键期数选择排序，排序依据选择字段，排序顺序选择降序，字段选择成交金额，观察表，发现排序错误。修改排序依据为嵌套，此时，排序就正常了。" ID="770c6d66f165d8b858f72c02a804d9dc" STYLE="fork">
                    <node TEXT="" ID="dea963ab88edb95f9bec7e30d06feda8" STYLE="fork"/>
                  </node>
                  <node TEXT="字段按总和进行排序，嵌套按分区排序。" ID="e771afc3548f2da197cb71c68b5cc470" STYLE="fork">
                    <node TEXT="" ID="29722d074c4c50b67aa5892c035ed150" STYLE="fork"/>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node TEXT="自动生成字段-度量名称、度量值和计数" ID="06c8ab19246c1f77504cfecdcf62643d" STYLE="fork">
            <node TEXT="拖动成交客户数字段至表中数据部分，出现黑色实框时放下字段，得到多度量交叉表" ID="7ecb1b942471309844d8b07a251ca400" STYLE="fork"/>
            <node TEXT="标记卡和行列中，文本这里变成了度量值，成交金额和成交客户数字段放在了度量值这个框里，列和筛选器中出现了度量名称字段。" ID="0f8d3fbca10bf0a1323d39480207cbf9" STYLE="fork"/>
            <node TEXT="数据窗格中，度量名称、度量值和计数字段三个斜体字段，是Tabelau自动生成的字段。" ID="4a2604947860558d4563399c51575e11" STYLE="fork"/>
            <node TEXT="度量名称包含了所有的维度字段，度量值包含了所有的度量字段，这个计数是计算数据源中有多少行数据。" ID="acd6039e36611fd5b025bded27a641db" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="筛选数据" ID="251481f88d9b388afdb114767f59e0f3" STYLE="fork">
          <node TEXT="认识维度筛选器" ID="0a5a189b3ce45e9df0c1e085c71521bc" STYLE="fork">
            <node TEXT="维度字段作为筛选器，类似Excel数据透视表中的切片器。" ID="a5961d656ac673a3da543bdc93e00651" STYLE="fork"/>
          </node>
          <node TEXT="维度筛选器-控件类型" ID="692666dda37749c56a1fa008569cbeda" STYLE="fork">
            <node TEXT="多值(列表)" ID="e801c049c848bc3df4bd8c9fa4608bd0" STYLE="fork"/>
            <node TEXT="单值(列表)" ID="09f01ef6b2ad7924ae4078e7004d2b65" STYLE="fork"/>
            <node TEXT="单值(下拉列表)" ID="8ba45c4c0bfbe3b4012ae81077678e5e" STYLE="fork"/>
            <node TEXT="单值(滑块)" ID="3205149f4bf7368f15c969cd5fa803a9" STYLE="fork"/>
            <node TEXT="多值(下拉列表)" ID="d13782d63258a6a0b337d466dd98530e" STYLE="fork"/>
            <node TEXT="多值(自定义列表)" ID="1a5853bafc33d311d88757cb1b572316" STYLE="fork"/>
            <node TEXT="通配符匹配" ID="9153e11b3a7fc102ef160e8b2e81cf9c" STYLE="fork"/>
            <node TEXT="其中(列表)和(下拉列表)相对最常用。" ID="559309a8cb199054f6b12c0fb6ca30d5" STYLE="fork"/>
          </node>
          <node TEXT="维度筛选器-包括/排除" ID="fd3819fcbb176da8a54830ee0f5de30a" STYLE="fork">
            <node TEXT="选择排除值后，勾选的选项会被筛掉，并且选项会显示删除横杠线。" ID="8829111a749cf86be09cf7a728a6ed13" STYLE="fork"/>
          </node>
          <node TEXT="认识度量筛选器" ID="9b520792c2800804b7de422b98adc515" STYLE="fork">
            <node TEXT="度量字段作为筛选器。" ID="d6d2739a558bffbf2ab61510d3c07bca" STYLE="fork"/>
            <node TEXT="可以选择对聚合后的度量值做筛选，也可以对源数据的度量值做筛选" ID="88f2e888f95e5c19d975cc0fa1db15ef" STYLE="fork"/>
            <node TEXT="聚合后的度量值做筛选时，会直接减少行数，小计（合计）值及总和值也减少对应数值" ID="bd1cb7eca620262117d5f7875163429b" STYLE="fork"/>
            <node TEXT="源数据的度量值做筛选时，减少对应数据项的值，小计（合计）值及总和值也减少对应数值" ID="411aea09b750d9eed7622c138b6956d0" STYLE="fork"/>
            <node TEXT="切换维度时，需要注意度量筛选器的范围" ID="888b8a7faf4cddafeb33d8ddf78be26f" STYLE="fork"/>
          </node>
          <node TEXT="详细级别" ID="c1e0ca36cdae50be2fb5c2fbf95c6221" STYLE="fork">
            <node TEXT="详细级别 标准定义：是指数据聚合的程度。它决定了在可视化和计算过程中，数据是基于何种细节程度进行展示和分析的，用于控制数据的颗粒度。" ID="63cc9ca7cda39e1014056904175d8a0b" STYLE="fork"/>
            <node TEXT="通俗的说，就是维度对度量值的划分程度。维度越多，数据越详细。" ID="a5efb0ade843da20d5a3f8941eb84b03" STYLE="fork"/>
          </node>
          <node TEXT="度量筛选器-所有值" ID="4af25bda998f1f321f3d6ea0bd8ef258" STYLE="fork">
            <node TEXT="筛选的是源数据的数据行" ID="91ef83469c6cced0726924d7ba5f7ddd" STYLE="fork"/>
          </node>
          <node TEXT="度量筛选器-控件类型" ID="49ba50232b692e5aac10308eb1af3a9c" STYLE="fork">
            <node TEXT="值范围" ID="57d8a880a653b65e5e8865bf01b6c4be" STYLE="fork">
              <node TEXT="自定义最大最小值" ID="4677e1992b4090ecb036ff70729d3673" STYLE="fork"/>
            </node>
            <node TEXT="至少" ID="7277c42616bf20d7a2ce1702523ef35d" STYLE="fork">
              <node TEXT="指定值到最大值之间的范围" ID="42a417c11a0486cc6fcba66210a7b890" STYLE="fork"/>
            </node>
            <node TEXT="至多" ID="1c9076eb7daf08345152d59abca0bf7d" STYLE="fork">
              <node TEXT="最小值到指定值之间的范围" ID="2d303da8c193dc49df25385ffe4b99ce" STYLE="fork"/>
            </node>
            <node TEXT="特殊值" ID="56d2aa72b12b9a7b1252a0e993ecb7c6" STYLE="fork">
              <node TEXT="是否包含Null值" ID="0ac7703ffe25d739e39ff4926606bc8d" STYLE="fork"/>
            </node>
          </node>
        </node>
        <node TEXT="环比计算" ID="09e62fecfa7c9f31c2222950406d8106" STYLE="fork">
          <node TEXT="认识离散和连续" ID="f104a0fe3c081e72a18b5913f5c73350" STYLE="fork">
            <node TEXT="绿底字段为连续型。蓝底字段为离散型。" ID="bffa0e7a1f87cbd0bdebdcd9f64c2b2f" STYLE="fork"/>
            <node TEXT="连续指可在区间内任意取值、有无限可分性，由测量得到，数据点间有无限可能值且无明显间隔，一般度量都是连续的。" ID="196055e516e1b1db115647c45b2e65af" STYLE="fork"/>
            <node TEXT="离散指特定孤立值，数据间有间隔，一般维度都是离散的。" ID="e111fba42f226b5a8bf7708a33f71510" STYLE="fork"/>
          </node>
          <node TEXT="日期字段" ID="42ad4f89e9fd650082ce071acaf9b242" STYLE="fork">
            <node TEXT="日期格式默认为维度离散型字段。" ID="9f5f5dbce4a6453961260eab8b4c281d" STYLE="fork"/>
            <node TEXT="日期格式既可以作为连续型，也可以作为离散型。根据具体情况来选择。" ID="59a9e5d0d31eb0d27cf8b47822792332" STYLE="fork"/>
            <node TEXT="日期字段既可以选择使用日期的单位，获取原日期中的一部分；也可以选择使用日期的格式，指定显示到年月日的精度。根据具体分析需求来选择。" ID="74f757b5a96949962cccaaf037d1368f" STYLE="fork"/>
          </node>
          <node TEXT="计算字段-计算客单价" ID="9ae2eb09cc102a092d05d94bce462e21" STYLE="fork">
            <node TEXT="创建计算字段" ID="faa9245c507f79d0fe531c749e9154fc" STYLE="fork">
              <node TEXT="数据窗格中点击三角下拉框，选择创建计算字段。" ID="f60bbb48fe8cf7ae969301b7985085e9" STYLE="fork"/>
              <node TEXT="字段右键在创建中选择创建计算字段，可以在计算字段中带入该字段。" ID="9d2d8b0bb22cf933189b5d0487c70ca9" STYLE="fork"/>
            </node>
            <node TEXT="总客单价公式：SUM([成交金额])/SUM([成交客户数])" ID="186c961848a2760f248eb701b2bc2fd2" STYLE="fork"/>
            <node TEXT="注意客单价先计算各自总和再相除，与先计算每行客单价再求和，这两者的结果不同。" ID="e66ea35825176cb7bbb51b7d4d98f37c" STYLE="fork"/>
          </node>
          <node TEXT="快速表计算-计算月环比" ID="1d9726659564e3ca2e5776db03994755" STYLE="fork">
            <node TEXT="快速表计算" ID="7d8cf6308404913ef6a2f0418fc09a61" STYLE="fork">
              <node TEXT="表计算是特殊类型的计算字段。" ID="da89a3efb62c1874108452ad4ad06759" STYLE="fork"/>
              <node TEXT="表计算是根据当前可视化项中的内容（即当前工作表能看到哪些数据哪些数据就参与计算，看不到的不参与计算）对值进行转换，比如差值、排名、总额占比、移动平均等。" ID="58a54c7627736d4770ea504ab2203b6c" STYLE="fork"/>
              <node TEXT="快速表计算指使用某个常用表计算类型的最典型设置将该计算应用于当前可视化项。" ID="64fe926252c4165f0ab2c14c804d460a" STYLE="fork"/>
            </node>
            <node TEXT="百分比差异（差异百分比）" ID="a43c25b5d8ef5eabafc0071b6336ca78" STYLE="fork">
              <node TEXT="百分比差异公式=(当前值-基准值)/基准值" ID="78a5925c72ede0e12e0004ff196e51ce" STYLE="fork"/>
              <node TEXT="月环比公式=(本月值-上月值)/上月值" ID="bc701a9e2e9a11067210726fbe3d1941" STYLE="fork"/>
            </node>
            <node TEXT="右键成交金额字段，选择快速表计算中的百分比差异，计算依据选择区(向下)，得到月环比" ID="d485f924655862be252b18467a3f926c" STYLE="fork"/>
          </node>
          <node TEXT="参数&amp;DATETRUNC函数" ID="cae3ae350a5ed5e7cbd3913814ead903" STYLE="fork">
            <node TEXT="参数" ID="5c4282234218726d3d486f92f02ae23d" STYLE="fork">
              <node TEXT="参数是工作簿变量，是一个可以被配置的值。" ID="31cb08f662a428f836ea0727e637919d" STYLE="fork"/>
              <node TEXT="可以在计算字段、筛选器、仪表板动作等多个地方使用。" ID="d0555af33fa085aa5c9f935fcadb874f" STYLE="fork"/>
            </node>
            <node TEXT="DATETRUNC函数" ID="62c05b696abe4771cb0cd90ac0a273f2" STYLE="fork">
              <node TEXT="说明" ID="2a0d481112e64fa4711660fd0dddee0f" STYLE="fork">
                <node TEXT="日期舍入函数，按日期部分（date_part）所指定的精确度截断并舍入至最小值，返回一个新的日期" ID="4024f1a979093cbca9ff9c76b90a4479" STYLE="fork"/>
              </node>
              <node TEXT="语法" ID="93f0210a9106fe87acb8f6644feda8a8" STYLE="fork">
                <node TEXT="DATETRUNC(date_part, date, [start_of_week])" ID="1bcad3f8cc5a6cdef7b8412a9b39d17f" STYLE="fork"/>
                <node TEXT="DATETRUNC(日期部分, 日期, [周开始日])" ID="5710b19c33e9a762c6c6f58239ef9daa" STYLE="fork"/>
              </node>
              <node TEXT="示例" ID="cda73e466959470e7ee0aa93b2d0f90c" STYLE="fork">
                <node TEXT="DATETRUNC(&apos;month&apos;, #2004-09-02#)=2004-09-01 00:00:00" ID="699fd32cd766f5d9797302b208d9cbae" STYLE="fork">
                  <node TEXT="date_part为month，截断至9月并舍入至9月最小值" ID="25d3b07e25d6af804948c0a4f1482c5a" STYLE="fork"/>
                </node>
                <node TEXT="DATETRUNC(&apos;quarter&apos;, #2004-09-02#)=2004-07-01 00:00:00" ID="058ce990f12c925be78c550e988d20e3" STYLE="fork">
                  <node TEXT="date_part为quarter，截断至9月所属季度的最小值，也就是第三季的第一天7月1日" ID="bceb0cbd1ea4cc308d4dea663c95ebb1" STYLE="fork"/>
                </node>
              </node>
            </node>
            <node TEXT="成交月份公式：DATETRUNC(&apos;month&apos;,[成交日期])" ID="7cc8c52357d56ac3822c126f71672497" STYLE="fork"/>
            <node TEXT="右键成交月份字段，选择创建中的参数" ID="7dc2f4d50b8a62055d6c796ca24ae7e7" STYLE="fork">
              <node TEXT="参数命名：成交月份 参数" ID="471b49b28f1d87271cc4f6b2221fcb36" STYLE="fork"/>
              <node TEXT="数据类型:（默认）日期时间" ID="17072abe7b61fe2d58243d48406612e0" STYLE="fork"/>
              <node TEXT="显示格式：自定义 yyyy-mm" ID="3b8988f98513a976045e705a982a90be" STYLE="fork"/>
              <node TEXT="允许值：工作簿打开时 成交月份" ID="161dd1851ead0284d5cc044aa41f808f" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="计算字段中添加参数&amp;IF、DATEADD函数" ID="8630bb6638a910155e2eebc41c4f4208" STYLE="fork">
            <node TEXT="IF函数" ID="bb077299488aea43126dc778f198d933" STYLE="fork">
              <node TEXT="说明" ID="44076b6056cf91e4169848109c726445" STYLE="fork">
                <node TEXT="依次对表达式做判断，直至判断结果为真，返回then后的值" ID="dbfe0e973aa87ccacef3e32725815bb0" STYLE="fork"/>
              </node>
              <node TEXT="语法" ID="60862b8d78b6a420bcf0e344481338c1" STYLE="fork">
                <node TEXT="IF &lt;test1&gt; THEN &lt;then1&gt;" ID="20aab2441987a905e78d4f6f6ed20c66" STYLE="fork"/>
                <node TEXT="[ELSEIF &lt;test2&gt; THEN &lt;then2&gt;...]" ID="14a67ee3f18694489dad5e228c50a455" STYLE="fork"/>
                <node TEXT="[ELSE &lt;default&gt;]" ID="64bf0e31de6634bb4eed8709dca7fbc9" STYLE="fork"/>
                <node TEXT="END" ID="2f54a33b3a7873ac6bd3534bd4f7dd5e" STYLE="fork"/>
              </node>
              <node TEXT="示例" ID="9e4cd8a263422eb19a336190d79ca50e" STYLE="fork">
                <node TEXT="IF [Season] = &quot;Summer&quot; THEN &apos;Sandals&apos; " ID="2afe40036c919ff3111f3cc3bd9d4fb0" STYLE="fork"/>
                <node TEXT="ELSEIF [Season] = &quot;Winter&quot; THEN &apos;Boots&apos; " ID="b80d0621532294bdb8be3f5cc548e8bb" STYLE="fork"/>
                <node TEXT="ELSE &apos;Sneakers&apos; " ID="cff8a266f5b981f7605056b7931e4138" STYLE="fork"/>
                <node TEXT="END" ID="b4d04a436a1499943d82e019b093f725" STYLE="fork"/>
                <node TEXT="解释：" ID="d426c61ed6037e0efd0469ddf8cfd721" STYLE="fork"/>
                <node TEXT="如果 Season = Summer,，则返回 Sandals。" ID="78e37dec2a169d3f1a58e45305c214c1" STYLE="fork"/>
                <node TEXT="否则，请查看下一个表达式。如果 Season = Winter，则返回 Boots。" ID="bc59403550f065a7b063e70fdeb9c5b9" STYLE="fork"/>
                <node TEXT="如果两个表达式都不为 true，则返回 Sneakers" ID="c419d734663e1859c59b1b34880449ab" STYLE="fork"/>
              </node>
              <node TEXT="注意：不要忘记结尾加END" ID="1748168699a37a30d4a45fdd8d4472e4" STYLE="fork"/>
            </node>
            <node TEXT="DATEADD函数" ID="1ca28513fb9c09a0c754eef87d534077" STYLE="fork">
              <node TEXT="说明" ID="3565705e3de4ec880a4eb77b2b1fe8c0" STYLE="fork">
                <node TEXT="日期加减函数，在指定的日期部分加减间隔的数值，返回计算后的日期" ID="1dff54bfd543f7bd72e43a31e602e8d4" STYLE="fork"/>
              </node>
              <node TEXT="语法" ID="d2e52292e6d2cee7c8beb13f1a6f822b" STYLE="fork">
                <node TEXT="DATEADD(date_part, interval, date)" ID="ec213513c060200c68af78bd9c46c242" STYLE="fork"/>
                <node TEXT="DATEADD(日期部分, 间隔, 日期)" ID="590d8489a1c88633dccf4a571cbdb1f9" STYLE="fork"/>
              </node>
              <node TEXT="示例" ID="5bcaf1d07a502dc82b624df426724ad7" STYLE="fork">
                <node TEXT="DATEADD(&apos;day&apos;, 7, #2020-04-12#)=2020-04-19" ID="dba6bda7690ea72b79919902156bdc54" STYLE="fork">
                  <node TEXT="在2020-04-12的日份上加7" ID="5c82cb4a6dee7265ecb167b68992d1c4" STYLE="fork"/>
                </node>
                <node TEXT="DATEADD(&apos;month&apos;, -2, #2020-04-12#)=2020-02-12" ID="1a216324f464357c872dce6436792c94" STYLE="fork">
                  <node TEXT="在2020-04-12的月份上减2" ID="cb3372b4886e14866c0e99a9a77385ab" STYLE="fork"/>
                </node>
              </node>
            </node>
            <node TEXT="计算字段增添参数" ID="dd26402efad77a7d7d20c75bf34b419b" STYLE="fork">
              <node TEXT="在计算字段中加入参数，通过成交月份参数的变化，得到对应月的月环比值。" ID="de29906f910a17f94f629c4644aed06e" STYLE="fork"/>
              <node TEXT="本月成交金额公式：IF [成交月份]=[成交月份 参数] THEN [成交金额] END" ID="13d39e79dac36c4f0c84b36ae9e5cc81" STYLE="fork"/>
              <node TEXT="上月成交金额公式：IF [成交月份]=DATEADD(&apos;month&apos;,-1,[成交月份 参数]) THEN [成交金额] END" ID="873a0d96bf3fc0761ea29954675d349d" STYLE="fork"/>
            </node>
            <node TEXT="成交金额月环比公式：SUM([本月成交金额])/SUM([上月成交金额])-1" ID="0683775cc9d6f35e2be47ef902925e96" STYLE="fork"/>
          </node>
          <node TEXT="创建新的工作表&amp;设置数字格式" ID="2e9044af5a5fed390f3247f4dedb5a10" STYLE="fork">
            <node TEXT="创建新工作表" ID="9faaf61e7b17c44915d9b56b39ba9275" STYLE="fork">
              <node TEXT="底边栏点击第一个加号图标，新建工作表。" ID="470e4f876afcffcd226ce454da7bcf45" STYLE="fork"/>
              <node TEXT="右键重命名工作表为【销售成交数据表】。" ID="ba94eb0cd74060c301ef5b0b90af5c94" STYLE="fork"/>
              <node TEXT="将销售层级拖入行，本月成交金额和成交金额月环比拖入标签创建度量区。" ID="d4e0f5381d11faac102ff03f963e3d5d" STYLE="fork"/>
            </node>
            <node TEXT="设置数字格式" ID="7232c7c12403c624bba373072d99bee9" STYLE="fork">
              <node TEXT="只有度量字段可以设置数字格式。" ID="67aee74085b87fa80ab7db11b1b071df" STYLE="fork"/>
              <node TEXT="度量值功能区右键成交金额月环比字段选择设置格式，选择百分比，小数位改为0。" ID="5a7b39af1c51a663629ee3c84eca2c29" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="临时计算字段&amp;ZN函数" ID="b8a324d1ab24c6f9fc7f1d8df12fbfe9" STYLE="fork">
            <node TEXT="临时计算字段" ID="d3bf42e6599efa2d9fd43e1924f935fc" STYLE="fork">
              <node TEXT="双击字段的胶囊，直接修改公式得到的字段为临时计算字段。" ID="36c8d8ebb0df518e585822ad36a5a4cd" STYLE="fork"/>
              <node TEXT="只存在于当前工作表中，不在左边的数据窗格中，无法被复用。" ID="e45965e4a4e644004668d04978ce684d" STYLE="fork"/>
              <node TEXT="拖动临时字段至数据窗格中，可以变为正常的计算字段被使用。" ID="09eaf8856e7e6aab5ed592c23ffaf6b6" STYLE="fork"/>
              <node TEXT="放胶囊字段的地方的空白处，双击直接创建一个空白的临时计算字段编写公式。" ID="2a4cfb0d3e26b2117303251e1e8c8a38" STYLE="fork"/>
            </node>
            <node TEXT="ZN函数" ID="aa9af64762db6fedc6fc6c8a0502b484" STYLE="fork">
              <node TEXT="说明" ID="248ec07ba65b8eb60e7e873a64d02cc6" STYLE="fork">
                <node TEXT="判断表达式最后返回的值，不为null，则返回该表达式结果，否则返回0。" ID="8ccb06bdcc180ac576b9c7f1cd144704" STYLE="fork"/>
              </node>
              <node TEXT="语法" ID="8ee97237902cc8e5382fcede4a73d9d6" STYLE="fork">
                <node TEXT="ZN(expression)" ID="74077081ab7d90e0a4e1c25b1e09c12e" STYLE="fork"/>
                <node TEXT="ZN(表达式)" ID="36265e5516994719814ff33dc3a5d423" STYLE="fork"/>
              </node>
            </node>
          </node>
          <node TEXT="拷贝计算字段" ID="272b70fd9077cfb4f2e54df0881a625a" STYLE="fork">
            <node TEXT="拷贝和复制的区别" ID="d006f563797f7d676b987059102a2434" STYLE="fork">
              <node TEXT="拷贝会直接生成复制的结果。" ID="039633b365dea1e193e51a3b8f54852c" STYLE="fork"/>
              <node TEXT="复制不生成任何的结果，必须再右键选择粘贴才会生成一个新的字段。" ID="7f0a35bdf556a352738d33e468cc27c4" STYLE="fork"/>
              <node TEXT="因此拷贝同时完成了复制粘贴两步。" ID="62e25d3fc38bb4d0f4baad962dfcaf32" STYLE="fork"/>
            </node>
            <node TEXT="通过拷贝，完成如下计算字段" ID="0c3ddc1ad4fcc2bb72214d86cab7f759" STYLE="fork">
              <node TEXT="上月成交客户数公式：IF [成交月份]=DATEADD(&apos;month&apos;,-1,[成交月份 参数]) THEN [成交客户数] END" ID="35770e7ebb833584b24a1bf2854778a9" STYLE="fork"/>
              <node TEXT="本月成交客户数公式：IF [成交月份]=[成交月份 参数] THEN [成交客户数] END" ID="68d8c8491edfda1a5e28c233a99aebbf" STYLE="fork"/>
              <node TEXT="成交客户数月环比公式：ZN(SUM([本月成交客户数])/SUM([上月成交客户数])-1)" ID="d33f337056d663265a5ced520f9a5257" STYLE="fork"/>
            </node>
            <node TEXT="本月成交客户数和成交客户数月环比放入度量值区。" ID="a957a67094ae81148440b988e4a758a0" STYLE="fork"/>
          </node>
          <node TEXT="字段默认属性" ID="57b1b28b8068425f2e2873f197907844" STYLE="fork">
            <node TEXT="修改字段默认属性后，字段的展示方式优先以默认属性进行展示。" ID="9dd291bb192e0b24a61a74390053b786" STYLE="fork"/>
            <node TEXT="右键环比字段中默认属性的数字格式，选择百分比，小数位为0。" ID="1aa6f493abcef6f45f6ac1b497a50309" STYLE="fork"/>
          </node>
          <node TEXT="计算字段-客单价月环比" ID="82be408e4e773c6ca7d71242f059e08d" STYLE="fork">
            <node TEXT="上月客单价公式：ZN(SUM([上月成交金额])/SUM([上月成交客户数]))" ID="845ee7feaf8d6d0d6a7a551a963925c3" STYLE="fork"/>
            <node TEXT="本月客单价公式：ZN(SUM([本月成交金额])/SUM([本月成交客户数]))" ID="d8b3a244be7fbad63bf031a2e2a34570" STYLE="fork"/>
            <node TEXT="客单价月环比公式：ZN([本月客单价]/[上月客单价]-1)" ID="f218a8f0a8add2f21186c5ff3508b185" STYLE="fork"/>
            <node TEXT="客单价月环比公式中不再使用SUM函数，因为本月客单价和上月客单价本身已包含SUM函数。" ID="92dee07f945700994fe341f1d940ae87" STYLE="fork"/>
            <node TEXT="将本月客单价和客单价月环比放入度量区。" ID="78645ea9f04fd6c6f2b6d10851554a6e" STYLE="fork"/>
            <node TEXT="完成【销售成交数据表】！" ID="cd1160d5b4f01cbeb79a21f921f56c4d" STYLE="fork"/>
          </node>
          <node TEXT="拷贝工作表" ID="e9d1b55327f639a2a1bf74212bae469d" STYLE="fork">
            <node TEXT="右键【销售成交数据表】，选择拷贝。右键重命名表格名为【期数成交数据表】。" ID="d015859ef073258efce105a3c781371c" STYLE="fork"/>
            <node TEXT="拖动期数字段替换区域字段。" ID="9acbfd5033ee2e4605832ed9ba9f0851" STYLE="fork"/>
          </node>
          <node TEXT="快速表计算-计算占比" ID="cfb023f905ed8fd32039caa964408887" STYLE="fork">
            <node TEXT="右键本月成交金额字段，选择快速表计算中的合计百分比，计算依据是表(向下)。" ID="1b6c6686f26aa1a95bd523155b152a1e" STYLE="fork"/>
            <node TEXT="拖入一个新的本月成交金额字段放在度量值区的最上面。" ID="8908a1d35716ccfb4bc39ee5eac8d774" STYLE="fork"/>
            <node TEXT="完成【期数成交数据表】！" ID="3c9035b2db33bb40311381b0c6dc1484" STYLE="fork"/>
          </node>
        </node>
      </node>
      <node TEXT="任务二：了解表连接，搭建数据模型" ID="3187e5984cc88e3991f51c6843a9fa1c" STYLE="fork">
        <node TEXT="搭建模型" ID="a7f98ff1e01340f82545ca842c8a8cd5" STYLE="fork">
          <node TEXT="数据模型" ID="43a93edfcfb4e65ada5ade31c4e2dedb" STYLE="fork">
            <node TEXT="数据模型就是对数据的结构、关系以及数据的约束条件的描述，使数据能被有效的管理和利用。说人话就是有很多零散的表，通过合并或者连接的方式让这些表之间有关系，以便我们拿来做多表之间数据的分析。" ID="c9cef2c8f9ec9d58b101f102275fecaf" STYLE="fork"/>
            <node TEXT="本次的数据模型为，4-7月销售数据与8月及未来新增月份的数据做并表，再连接每月最新的销售人员表，按销售工号匹配。" ID="aab945eb7286876a6e5b320c34523580" STYLE="fork"/>
          </node>
          <node TEXT="并集" ID="83630291d22ef382b999871d72a97bb9" STYLE="fork">
            <node TEXT="并集分为手动和自动。手动用于合并一个工作簿中的多个工作表；自动使用星号通配符在连接的表路径中找到所有符合条件的表。" ID="1963339222bf055df3514c9991d6a440" STYLE="fork"/>
            <node TEXT="右键销售数据，选择转换为并集。或者移除表，连接中选择销售表，将左边的新建并集拖入，都会出现并集操作窗口。" ID="d8161f363dfa7bb716c606268be0124a" STYLE="fork"/>
            <node TEXT="选择自动，在工作簿处输入 *销售成交汇总数据.xlsx，点击确定。" ID="9c749628ef32c045e60610d4a3e671fb" STYLE="fork"/>
            <node TEXT="并表后，数据生成Path(路径)和Sheet(工作表)字段，分别存储路径和表名。" ID="8e591dfdc8d15db1ac9bf7d64e3838c6" STYLE="fork"/>
          </node>
          <node TEXT="物理连接&amp;逻辑连接" ID="247db59debad11b95e7daa245e542e6a" STYLE="fork">
            <node TEXT="Tableau数据模型中有逻连层和物理层，在各自层的表连接分别为逻辑链连接和物理连接。默认显示的是逻辑层，双击表，就可以看到物理层。" ID="af99886aead03dc4ba4670a39964a4d5" STYLE="fork"/>
            <node TEXT="表连接演示" ID="a4672d9b82e053eb11313d91b150aef9" STYLE="fork">
              <node TEXT="双击订单表1进入物理层，右键转换为并集，输入 订单表* 将订单表1和订单表2合并。再将商品表和订单表在物理层做连接，连接键为商品id。" ID="3e705e6781f25bf1a11d13e3c1e15956" STYLE="fork"/>
              <node TEXT="数据预览中，蓝色字段来自蓝色表，橙色在字段来自橙色表。" ID="3a4e01d95e34a318bfc64526beef3d2c" STYLE="fork"/>
              <node TEXT="左连接" ID="c6018e6d7a4069246b78f091d95c4600" STYLE="fork">
                <node TEXT="联接中点击左侧，左连接。" ID="9f3610dd54ad90dede8d2ed6ae233f6e" STYLE="fork"/>
                <node TEXT="连接结果" ID="827fe73d9a6a16f933014547f61dcaee" STYLE="fork">
                  <node TEXT="" ID="48088b20c7affbdd3f7c26fa38e43bf8" STYLE="fork"/>
                </node>
                <node TEXT="联接两张表时，根据你选择的连接键，对两张表中的数据做匹配，匹配上就会将两张表中的数据放在一行。" ID="bbe7fcb1caed232cce3b017156dcdcf8" STYLE="fork"/>
                <node TEXT="订单id为A101、A102、A103的商品id都为a，因此商品表中商品id为a的数据行总共连接了3次，这种重复联接的情况叫笛卡尔积。" ID="603df5035320f9dc00990df041d3b3d5" STYLE="fork"/>
                <node TEXT="左连接即保证左表数据的完整性，所以左表保留了A107订单数据行，商品表中没有匹配数据就显示为NULL值。" ID="c1afb89b013bb35308229bddfa2701bf" STYLE="fork"/>
                <node TEXT="商品表中有abcde四种商品，但是订单表中没有商品d，未被匹配上所以被排除了。" ID="8714fe5614b9d8714f6857062f07d06f" STYLE="fork"/>
              </node>
              <node TEXT="右连接" ID="8734682fcbe1e534bf4dc97cccd4dec0" STYLE="fork">
                <node TEXT="联接中点击右侧，右连接。" ID="e61d76ecd31b07bb8b48ab36b533da8d" STYLE="fork"/>
                <node TEXT="连接结果" ID="485ca9c860743d7ea8ddb0c385add547" STYLE="fork">
                  <node TEXT="" ID="c72389d00e8c78e064bc1fecf255d8b9" STYLE="fork"/>
                </node>
                <node TEXT="右连接保证右侧商品表数据的完整性，所以右侧有商品d行，对应的左边数据为NULL，同时左侧订单A107行被排除。" ID="c406d73215845ea3cb6827c31f271506" STYLE="fork"/>
              </node>
              <node TEXT="内连接" ID="821ea7b27a7cfe4497afadf56990f544" STYLE="fork">
                <node TEXT="联接中点击内部，内连接。" ID="2ee5bbf5bf57f91589edcfbf56136448" STYLE="fork"/>
                <node TEXT="连接结果" ID="2e10e4e79b4c1af3c4f1b63ea57864ec" STYLE="fork">
                  <node TEXT="" ID="c64a62aaae072f39ee11fcede7d6be40" STYLE="fork"/>
                </node>
                <node TEXT="内连接是需要左右两侧的表互相都匹配上，因此左表的订单A107和右侧的商品d都被排除了。" ID="58a710f7a3b186b74196cb2a5d91c674" STYLE="fork"/>
              </node>
              <node TEXT="全连接" ID="9f616c0df8b8c1676ddc98f3b40353cc" STYLE="fork">
                <node TEXT="联接中点击完全外部，全连接。" ID="92d7c777abc7d72fd61d46a15b845d86" STYLE="fork"/>
                <node TEXT="连接结果" ID="2975f22a31f4288441aa1034edc85663" STYLE="fork">
                  <node TEXT="" ID="3c0c4df6e4b4f45a8b53ed34c6825064" STYLE="fork"/>
                </node>
                <node TEXT="全连接同时保证左右两张表的数据完整性，因此左侧订单A107和右侧商品d的数据行都存在。" ID="dd71f8f0cd1e4aba35d15c917de0bc10" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="数据源名称重命名为【物理连接】。" ID="624918f75976ca2ddab87f580c417c81" STYLE="fork"/>
            <node TEXT="新建数据源，连接至订单表1，数据源重命名为【逻辑连接】。" ID="1d5dad9cde26238276a31d87a17ebe55" STYLE="fork"/>
            <node TEXT="依然先做订单表合并，右键表选择转换为并集，输入 订单表* ，点击确定，重命名为【订单表】。" ID="bcda88b8b013dad310f4cd6382c750aa" STYLE="fork"/>
            <node TEXT="再添加商品表，这次直接在逻辑层连接表，表重命名为【商品表】" ID="56b0bd40dae8db763b9168e84777a129" STYLE="fork"/>
            <node TEXT="点击连接的线，连接键为商品i。" ID="d3452d762dafd3a508dbf8e1769ec356" STYLE="fork"/>
            <node TEXT="逻辑连接只要配置连接键，不需要选择连接关系。预览的数据也是独立的，并没有生成新表。" ID="6974c65c40a360f8e76c3364f47e5db9" STYLE="fork"/>
          </node>
          <node TEXT="物理和逻辑连接区别" ID="8a883f092e3445219873005572bfc778" STYLE="fork">
            <node TEXT="物理连接" ID="0e714e21ff09e07440aee8d8cbe8c2fb" STYLE="fork">
              <node TEXT="在执行连接操作时，会立即根据所选方式连接数据，生成一张实际的实体结果表。后续所有分析都直接基于此实体表进行。" ID="8be07ecfa15a87bf0d4773262f355cbf" STYLE="fork"/>
              <node TEXT="使用内连接时，未匹配的数据行会被永久排除，导致结果表数据量可能少于源表。" ID="9183246bd6f43e45e3b8e86b24643919" STYLE="fork"/>
              <node TEXT="使用全连接时，未匹配的部分会引入 Null 值。即使后续分析只涉及单表字段，这些 Null 值也会存在。" ID="9125193c46fa2a8a4bf8987a9fa0af36" STYLE="fork"/>
              <node TEXT="连接操作在分析流程早期完成，生成了物理表，后续步骤无法改变其结构和内容。" ID="e668c4c2272c615cc49fa24c966213cf" STYLE="fork"/>
            </node>
            <node TEXT="逻辑连接" ID="80bf88838a7a246fd0ad4631e4d22a8b" STYLE="fork">
              <node TEXT="仅在数据模型层面建立表之间的关联关系，并不立即执行实质性的数据连接。" ID="d8d48f4fd4d9baf4f9f25ad4afd0de5b" STYLE="fork"/>
              <node TEXT="只有当使用字段同时涉及关联表中的字段时，系统才会按需进行连接。" ID="17ef16aac78d82a185eab7f2cd8b805a" STYLE="fork"/>
              <node TEXT="如果使用字段仅使用单表字段，会直接读取该表数据，不触发连接操作。" ID="f05f3be9e4e56c1df1def92588e97854" STYLE="fork"/>
              <node TEXT="该操作避免了不必要的数据缺失和引入 Null 值，最大程度保持表独立性和避免笛卡尔积。" ID="ed7491ca881076faf75d46019f2ccaf9" STYLE="fork"/>
            </node>
            <node TEXT="Excel使用Vlookup函数将人员信息匹配进销售成交表，贴近于物理连接。数据库的表连接、PowerQuery的合并数据都是物理连接。" ID="aeabf365db85b65c9401bf5ddd8f744e" STYLE="fork"/>
            <node TEXT="大多情况下在Tableau中会选择使用逻辑连接，尽可能保证单表分析的数据独立性和多表分析的数据完整性。" ID="ed633b44f4ad77cc0e8fb49b50638e77" STYLE="fork"/>
          </node>
          <node TEXT="连接实操" ID="61c4db67554b0449df9954fa362b7e04" STYLE="fork">
            <node TEXT="回到销售数据的工作簿。点击左边的添加，选择到文件中的Excel，选择销售人员表。" ID="02d58e8e92192a891d08e61433645691" STYLE="fork"/>
            <node TEXT="拖入数据模型中，重命名为【销售人员表】。使用逻辑连接，连接键为销售工号。" ID="15eec41cdc81d2e6ed20c6427905639c" STYLE="fork"/>
            <node TEXT="如果出现因为类型不匹配，点击编辑计算，使用类型转换函数STR，将类型转换为字符串格式，输入公式：STR([销售工号])。" ID="47112b80f95eb1ede1e748e18fc02626" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="处理数据" ID="8bf784c58ab94bd5286089e3d362ce09" STYLE="fork">
          <node TEXT="修复无效字段" ID="8890b4e1edb6809e568308a065b789f0" STYLE="fork">
            <node TEXT="点击回到工作表，处理感叹号无效字段。" ID="3bc60575dad10073598aa51aa844df7f" STYLE="fork"/>
            <node TEXT="右键本月成交金额字段，点击编辑，查看右下角显示的错误，这里提示[成交月份]无效。右键成交月份字段点击编辑，查看错误，原来是因为成交日期现在是字符串格式，但是公式调用必须是日期格式。将该字段修改成日期格式即可。" ID="513af69115c3215a6166be66fefb1aa4" STYLE="fork"/>
          </node>
          <node TEXT="调整作废字段" ID="20f12b296783a83b5e5c097783d531e1" STYLE="fork">
            <node TEXT="因为搭建了新的数据模型，区域、省份、小组、业务组、职务类别采用新人员表中的字段，产品类型和期数字段需要重新处理。" ID="5ce14875ff97f87be7fbf6809bf93efe" STYLE="fork"/>
            <node TEXT="对原有区域、省份、小组、业务组、职务类别、产品类型和期数这7个字段添加作废标记，以免混用导致错误。" ID="8e7b2a3dfc103446f3e4d58954fac29e" STYLE="fork"/>
            <node TEXT="人员表中的字段去掉所属两字。" ID="d373b916d2b64225a3ecbbdeeb72f021" STYLE="fork"/>
            <node TEXT="业务组公式：[省份]+[小组]" ID="2deee84816a52490259af2068647a5aa" STYLE="fork"/>
            <node TEXT="区域、省份、业务组、人员表中的销售工号放入销售层级。" ID="d59214fecd912067577854c8d62f421e" STYLE="fork"/>
            <node TEXT="销售表中的销售工号改为字符串格式且改名为【销售工号-连接】。" ID="379ab03bd3a6f32d051ecd3a7f9c6ff1" STYLE="fork"/>
            <node TEXT="职务类别公式：" ID="0775eb8e610592b2c536a09c00678822" STYLE="fork">
              <node TEXT="IF [职务类别 (Sheet1)]=&apos;1&apos; then &apos;普通员工&apos;" ID="7d73ebc5cdff96291c6763ba6add93d8" STYLE="fork"/>
              <node TEXT="ELSEIF [职务类别 (Sheet1)]=&apos;2&apos; then &apos;管理人员&apos;" ID="29620be6978f344afe73783d8614a6a0" STYLE="fork"/>
              <node TEXT="ELSE &apos;未知&apos;" ID="19de65f3c5c3ec70c5cdd87b2721d954" STYLE="fork"/>
              <node TEXT="END" ID="f266a41ee73a2b6732022ce9cad0b6f1" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="字符串函数LEFT&amp;MID" ID="b05baff9e79dbfa2681f410b9b174b88" STYLE="fork">
            <node TEXT="LEFT函数" ID="44c94f78bce0f23a23f520b7a91a027d" STYLE="fork">
              <node TEXT="说明" ID="1a4328cdcacfaf8b9640073fc51c64ee" STYLE="fork">
                <node TEXT="从左截取指定长度的字符串函数" ID="da7736db3e9d4076a12791defc5e0e30" STYLE="fork"/>
              </node>
              <node TEXT="语法" ID="676c98fc08f69b561a0f5ade53cfd9d0" STYLE="fork">
                <node TEXT="LEFT(string, number)" ID="f53b116c1bb199e1346aad8875dc2050" STYLE="fork"/>
                <node TEXT="LEFT(字符串, 截取长度)" ID="5bd0523fdc4d1a450bd2ac01c1eca6a2" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="MID函数" ID="224b6db3b9a898da288af0a6f29fa7d6" STYLE="fork">
              <node TEXT="说明" ID="871d3aba422207019fd831213b37deb2" STYLE="fork">
                <node TEXT="从指定位置开始截取指定长度的字符串函数" ID="b104bb1cbf70cd69cfb20cf46bf1d3d4" STYLE="fork"/>
              </node>
              <node TEXT="语法" ID="7ba6b091f3e0fa16ef0642cb4af69fc3" STYLE="fork">
                <node TEXT="MID(string, start, [length])" ID="52458315b0b4a54978a6e41e93c66ae2" STYLE="fork"/>
                <node TEXT="MID(字符串, 开始位置, [截取长度])" ID="043ca255a9b5d0337e1f47203190b20b" STYLE="fork"/>
                <node TEXT="截取长度参数为空时，截取至字符串的末尾" ID="0add48b2e6aa9aeb40a2f58155d3ccfe" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="产品类型公式：LEFT([产品],2)" ID="2a5750fbd79eb7deab3fdd01f17a91f9" STYLE="fork"/>
            <node TEXT="期数公式：MID([产品],3)" ID="64ba4f87d71ef4e2ac3d8207923cb04c" STYLE="fork"/>
          </node>
          <node TEXT="替换引用" ID="8472bdbc03128eba44d3327294a3ede9" STYLE="fork">
            <node TEXT="替换引用将字段在所有工作表中存在的，替换成指定字段。" ID="e96b8b1f2c2d58466beaa9a1893e5471" STYLE="fork"/>
            <node TEXT="比如省份-作废字段右键替换引用，选择省份字段完成替换。同样的操作替换完【销售成交数据表】中的区域-作废和【期数成交数据表】中的期数-作废字段" ID="4dd4f973fed7fbaac43e5f5cba164ec5" STYLE="fork"/>
          </node>
          <node TEXT="隐藏字段" ID="d3c43a3ea3c26e7692129615a45140c3" STYLE="fork">
            <node TEXT="点击作废字段，右键选择隐藏。" ID="19bccc67b0ff848011030719f2f44f23" STYLE="fork"/>
            <node TEXT="若字段无法被隐藏，是因为被工作表占用了，对该字段使用替换引用即可。" ID="872e50aaa3e6531882d41a331ff5d267" STYLE="fork"/>
            <node TEXT="要想显示隐藏的字段，点击数据窗格中的下拉三角，勾选显示隐藏字段。出现划掉的小眼睛标记表示该字段被隐藏，不想隐藏就点击眼睛标记或者右键取消隐藏即可。" ID="15d68c7523e25a972a61c32a8c135fd1" STYLE="fork"/>
          </node>
          <node TEXT="数据源筛选器" ID="c0ea3463d22617ac40f6c25a601c1191" STYLE="fork">
            <node TEXT="筛选器-应用于工作表 使用此数据源的所有项" ID="75727fe11e1b6cd02af49bc21df44d7d" STYLE="fork">
              <node TEXT="工作表中的筛选器功能区，右键应用于工作表中的使用此数据源的所有项。" ID="a99718c42006f1d51c42f73cd4a1d1c4" STYLE="fork"/>
              <node TEXT="所有使用该数据源的工作表都会默认应用这个筛选器。" ID="9912b459175d451baa7c74025371c676" STYLE="fork"/>
              <node TEXT="比较方便修改，适用于筛选的数据可能参与或可能不参与分析的情况。" ID="ed9d17bc707b494836ab3ba80569ce0e" STYLE="fork"/>
            </node>
            <node TEXT="数据源筛选器" ID="ff782899a526c7a5a183e69b7875479e" STYLE="fork">
              <node TEXT="在数据源界面添加筛选器，直接在数据源层面对数据做筛选，筛掉的数据不进入后续工作表的视图中。" ID="95896a003ad910d09c96f7e516e382b3" STYLE="fork"/>
              <node TEXT="数据源筛选器的优先级高于工作表中的筛选器。" ID="c5714e46af4710cc7bfd6979963e219d" STYLE="fork"/>
              <node TEXT="在数据量特别大的情况下，数据源优先筛掉一部分不必要的数据，能够显著提升工作表的计算效率。" ID="c4a667f16661212b21f813d1153e577d" STYLE="fork"/>
            </node>
            <node TEXT="点击数据源界面，右上角筛选器点击添加，窗口中点击添加，查出省份字段，点击确定，勾选排除，勾选Null，点击确定。" ID="508b9e44bdf8485f2c681777a7b633ca" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="保存文件" ID="2332971510b01521c9ed8a5f65924981" STYLE="fork">
          <node TEXT="文件类型" ID="567c7bbf82144bd261efc0578c15ee57" STYLE="fork">
            <node TEXT="twb是工作簿文件，包含所有工作表和仪表盘，保存和源数据的连接，但是不含实际数据；" ID="955a14200728c2d04e0b4576d1d53882" STYLE="fork"/>
            <node TEXT="twbx是打包工作簿文件，在twb的基础上包含所有数据的副本。" ID="57ff76aebfeb4267650545308384cfd4" STYLE="fork"/>
            <node TEXT="twbx更方便在没有源数据表时打开查看，但是要注意数据泄露的问题。" ID="dda1ce11af84fb59ad48a6e90b124b46" STYLE="fork"/>
          </node>
          <node TEXT="点击文件中的保存，保存为twbx文件，文件命名为【Tableau月度成交仪表盘】。" ID="155f1cb23449445b593f43f176de28c8" STYLE="fork"/>
        </node>
      </node>
      <node TEXT="任务三：学习可视化，构建仪表盘" ID="f570fc003d427fc32ebc4115e18c9445" STYLE="fork">
        <node TEXT="探索可视化" ID="1c9bd0419fbba3ff8e9d525ec43d3cbf" STYLE="fork">
          <node TEXT="柱状图" ID="5c5579c00ec10853edde935f12ea495c" STYLE="fork">
            <node TEXT="行列构建横纵轴，标记控制图型。" ID="063377c5a30c5eca7cb6b55d86bea508" STYLE="fork"/>
            <node TEXT="新建工作表。" ID="412a8c90d66a7cc581f3b4b3e0cee776" STYLE="fork"/>
            <node TEXT="制作省份成交金额柱状图" ID="55ccd1e199eb0e64d2a476f14ec6ec78" STYLE="fork">
              <node TEXT="行：成交金额（总和(成交金额)）" ID="99305a3111c7734a641905b512821c1c" STYLE="fork"/>
              <node TEXT="列：省份" ID="db597d9aa67edc88bc81c3a5b5d0dd5b" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="标记" ID="9b98a45c584e7a98f5df1f39c81cfbbe" STYLE="fork">
            <node TEXT="文本/标签" ID="60e7496ea175827db1b3eaf76bbd8a14" STYLE="fork">
              <node TEXT="维度字段显示对应数据项" ID="b29da1f8faf9d33163c6aa9c2bc9d100" STYLE="fork"/>
              <node TEXT="度量字段显示对应的聚合值" ID="ae5a8d8d931ac69d2e83a20848522d20" STYLE="fork"/>
              <node TEXT="点击标签中的... 对文本内容进行编辑" ID="cd9eefec1d49044a448a763f3cfa8f49" STYLE="fork"/>
            </node>
            <node TEXT="大小" ID="3905888495c6c8b6bb75c35cdd0cfcee" STYLE="fork">
              <node TEXT="直接调整时，共同放大或缩小图型" ID="be816510a4227602d1ddba39a9a8b323" STYLE="fork"/>
              <node TEXT="度量字段放入时，根据聚合值的大小来安排图形的相对大小" ID="bc7f3994ae3b7323d026a9ba32bdc2c5" STYLE="fork"/>
              <node TEXT="一般不放维度字段" ID="223e2e04fda4a767b5f0720e716ef7c4" STYLE="fork"/>
            </node>
            <node TEXT="颜色" ID="27e61f49eed1e1c51fdc0906249f3ae0" STYLE="fork">
              <node TEXT="直接调整时，修改整体图型颜色" ID="7047c6242ea88608f0345ad4d591f2c9" STYLE="fork"/>
              <node TEXT="度量（连续）字段放入时，图型变成渐变色，可以选择颜色变化区间" ID="5b045e218c2e3c020e1b9f57059ebbe1" STYLE="fork"/>
              <node TEXT="维度（离散）字段放入时，每个数据项都能被分配一种颜色" ID="72d1db0a06b5dcf6111f20f4f5f26a01" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="堆积柱状图" ID="1251cc335d099ab9784fbee25b9562c7" STYLE="fork">
            <node TEXT="柱状图的基础上，维度字段有层级时，在标记的颜色处展开可以使用不同颜色二次划分图型。" ID="b1426814d44c9e554abbcad8dd28acd4" STYLE="fork"/>
          </node>
          <node TEXT="百分比柱状图" ID="0f8160e4c8f5d7c027cd3035498b668a" STYLE="fork">
            <node TEXT="堆积柱状图的基础上，行/列中的度量字段使用快速表计算中的合计百分比。" ID="238ec568793667479244bf31dd363cde" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="制图实操" ID="44a3e1a860d1e1dbad90fcaba8bce95f" STYLE="fork">
          <node TEXT="条形图-销售成交数据" ID="9091742326dba7b0bbac45dead8b6e05" STYLE="fork">
            <node TEXT="柱状图行列交换变为条形图" ID="962b44aa818ae7847c14c864d1a986cd" STYLE="fork"/>
            <node TEXT="制作【销售成交数据】" ID="47c2aaff735a12fe27b57d0a62f08c50" STYLE="fork">
              <node TEXT="行：区域、省份" ID="ea8ce7b98b8d7b91872cd05efd777706" STYLE="fork"/>
              <node TEXT="列：本月成交金额、成交金额月环比、本月成交客户数、成交客户数月环比、本月客单价、客单价月环比" ID="ee4eca3b4d728c44e6697cd231bc617f" STYLE="fork"/>
              <node TEXT="标记" ID="a82e28e95db43842d341a8e15fe7b052" STYLE="fork">
                <node TEXT="标签：每个度量字段的标记卡都放入自己对应的度量标签字段。标签勾选允许覆盖，对齐方式为水平左侧，垂直中部。" ID="21e50a9a1a8d3faac0219e2f2565bab1" STYLE="fork"/>
                <node TEXT="颜色：环比字段都使用渐变色，对增长的字段标绿，下降的字段标红。颜色设置为红绿色，高级中设置中心为0。" ID="57839a942982730b27849546dafe40c7" STYLE="fork"/>
              </node>
            </node>
          </node>
          <node TEXT="柱状图-期数客单价" ID="cf9451dc46b7fb86433846686fb3593f" STYLE="fork">
            <node TEXT="制作【客单价柱状图】" ID="2a261faba48d9f4c3a65647929712996" STYLE="fork">
              <node TEXT="行：本月客单价" ID="cc635f6d28f0d79f30bb4cfa2b08057a" STYLE="fork"/>
              <node TEXT="列：期数" ID="42687129d39d452e06414fb53a272303" STYLE="fork"/>
              <node TEXT="标记" ID="4867ae6dc3f1830740425c2fafefd90d" STYLE="fork">
                <node TEXT="标签：本月客单价和期数字段。对齐方式垂直底部。" ID="bb7bf2ba82894f3c02e55928efb4664c" STYLE="fork"/>
              </node>
              <node TEXT="颜色：橙色" ID="665c0026d0d63c42b50f6ee60f1beaf3" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="条形图-期数成交数据" ID="63b5b37345480ff71c4956ba9b44363d" STYLE="fork">
            <node TEXT="拷贝【销售成交数据】工作表，行中的维度替换为期数。" ID="99662e57652ac40dfb9b8a02ce711f24" STYLE="fork"/>
            <node TEXT="添加成交金额占比" ID="a3455530c14a0326351d3915869a3a77" STYLE="fork">
              <node TEXT="复制本月成交金额字段，右键表计算为合计百分比，计算依据为表向下" ID="6720afbf4d980f5e7810204636fafc0c" STYLE="fork"/>
              <node TEXT="复制字段至标签，设置格式为百分比，小数位为0" ID="a92caa8ea7d5b621d49e6b29871c1dc2" STYLE="fork"/>
            </node>
            <node TEXT="成交金额占比的色阶" ID="8000f4c5c20feb639bae874ee1dfacf3" STYLE="fork">
              <node TEXT="右键行字段已经完成合计百分比快速表计算的本月成交金额字段，计算依据改为单元格。" ID="cefe31c029a8088475762bda16cfd37c" STYLE="fork"/>
              <node TEXT="标签放入颜色，颜色修改为红色。" ID="794c51d4cb1da990f7658c0c242bc064" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="折线图-销售成交趋势" ID="8c2c46c1fe5822e23383bba539b01c22" STYLE="fork">
            <node TEXT="新建工作表" ID="e51f7d7bfaff064f97734116dab04814" STYLE="fork"/>
            <node TEXT="制作【销售成交趋势折线图】" ID="25f39573823397332be1e836ba7e9bb7" STYLE="fork">
              <node TEXT="行：本月成交金额" ID="ddef200dd3685001c3c7193f1e3c4a11" STYLE="fork"/>
              <node TEXT="列：成交日期，并修改为天" ID="31c144a27b46380065b69d922c5a6c24" STYLE="fork"/>
              <node TEXT="标记" ID="5240345e1b6130d42a6c1a851220d4a9" STYLE="fork">
                <node TEXT="颜色：放入区域字段" ID="da8b00acb63c9da5968bb3f3b341e402" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="右下角筛选数据，点击排除null值" ID="0465115b0a7ca465aebfd8ef843b1961" STYLE="fork"/>
          </node>
          <node TEXT="堆积面积图-产品成交趋势" ID="7e333d95f1c48e42d2792d6f1adb2e41" STYLE="fork"/>
        </node>
        <node TEXT="简单组合图" ID="171af9d2323680d1487ccc672c2d19ad" STYLE="fork">
          <node TEXT="柱状&amp;折线双轴图" ID="169d3931bf21dd6da7a9578b46adf68e" STYLE="fork">
            <node TEXT="新建工作表" ID="618ad7a12d096c49eb6d3447691b3d35" STYLE="fork"/>
            <node TEXT="制作【成交金额&amp;环比双轴图】" ID="3d7f7ac0095d06c5d00e053f24803302" STYLE="fork">
              <node TEXT="行：本月成交金额、成交金额月环比" ID="0a7bc09f356fb0421ea7764c66dfc61c" STYLE="fork"/>
              <node TEXT="列：区域、省份" ID="474aa8e062f79a58a58fac2705812987" STYLE="fork"/>
              <node TEXT="右键成交金额字段选择双轴" ID="4e414f366679c66fa753686b61474a5f" STYLE="fork"/>
              <node TEXT="本月成交金额 标记类型：条形图" ID="18cbf5eb96ca4ecd5011193a3baa8518" STYLE="fork"/>
              <node TEXT="成交金额月环比 标记类型：线" ID="f6aa80f4390ceb6c30cf0e803d716819" STYLE="fork"/>
            </node>
            <node TEXT="需要两边的度量轴范围一致，可以右键字段选择同步轴" ID="2a499f3889ca6408ef15164672682097" STYLE="fork"/>
          </node>
          <node TEXT="合并轴图" ID="df9502d9759ebf00ce0381c9f686de32" STYLE="fork">
            <node TEXT="制作【环比合并轴图】" ID="56d776dccbcb3d4710943cca5674c55e" STYLE="fork">
              <node TEXT="列：区域" ID="56179aeb2483bbb1f455506a7d19ba8f" STYLE="fork"/>
              <node TEXT="行：放入三个环比字段，字段往度量轴上放，形成度量值" ID="4cebbd194ff5d1e437bf761f106c2bb9" STYLE="fork"/>
              <node TEXT="标记类型：线" ID="221104b8d109924c2cfcbf48725f4f91" STYLE="fork"/>
              <node TEXT="标记" ID="5cc23745651b26be7d74216d4f3e6805" STYLE="fork">
                <node TEXT="标签：度量值" ID="b3196873c631e7ab2845f7b79a435fd9" STYLE="fork"/>
              </node>
            </node>
          </node>
          <node TEXT="合并轴图和双轴图的区别" ID="d1a53901596934938108c03fa165c8c1" STYLE="fork">
            <node TEXT="双轴只能合并两个度量值的轴；合并轴可以合并多个度量值。" ID="f198233424b14e156bb23e1360a3e79d" STYLE="fork"/>
            <node TEXT="双轴有主次轴，轴的范围不同；合并轴直接共用一个度量轴。" ID="dfb498051ef61fb252e12ecb37f0e642" STYLE="fork"/>
            <node TEXT="双轴每个度量字段可以选择独立的图型；合并轴所有度量字段只能选择同一个图型。" ID="b1da8dd70e1b8464c92e108ec72e9a61" STYLE="fork"/>
            <node TEXT="合并轴（度量值字段）可以和一个度量字段做双轴。" ID="4f379735cdbdab3c3049e8c005f59c3d" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="饼图、环形图和指标卡" ID="d10318a5a84ec8bbfc408739eece3a30" STYLE="fork">
          <node TEXT="饼图" ID="4b6a63d3f9fbd52a909d8611411ec9e1" STYLE="fork">
            <node TEXT="新建工作表" ID="bbf7a7313e907bc6ee5806ab6f260da1" STYLE="fork"/>
            <node TEXT="制作【成交金额占比饼图】" ID="818178ad72df1c33ed9823a9e94044b5" STYLE="fork">
              <node TEXT="标记类型：饼图" ID="45a7cf59c3da6d84ae9bf2e9a88970d3" STYLE="fork"/>
              <node TEXT="标记" ID="4ef08e37a130f4efa00e401896988ee4" STYLE="fork">
                <node TEXT="角度：本月成交金额（快速表计算-合计百分比）" ID="0572e08cbe7ceb2d1e95193a578fb13d" STYLE="fork"/>
                <node TEXT="颜色：区域" ID="e1a7c76736852d4f3d3f30d2203908c0" STYLE="fork"/>
                <node TEXT="标签：本月成交金额（快速表计算-合计百分比），设置格式为百分比，0位小数。" ID="db5282760121cac98a5c1539ccbeaf93" STYLE="fork"/>
              </node>
            </node>
          </node>
          <node TEXT="树状图" ID="f0452a172d42c10bd7db81673be0b8b9" STYLE="fork">
            <node TEXT="制作【成交金额占比树状图】" ID="23c2cb915e1045b4b7f1da9e41dbc7b5" STYLE="fork">
              <node TEXT="拷贝【成交金额占比饼图】，重命名为【成交金额占比树状图】。" ID="aacf05be6b054d5c00c4d4b7edcbe6c7" STYLE="fork"/>
              <node TEXT="标记类型：方形" ID="bbf09255645d99ad885b465bdb4c36d1" STYLE="fork"/>
              <node TEXT="标记" ID="6950beb97fa8b0b16baa47546510e8e8" STYLE="fork">
                <node TEXT="大小：本月成交金额（快速表计算-合计百分比）" ID="656b7a10004e6701601906af5ed39aad" STYLE="fork"/>
                <node TEXT="标签：本月成交金额（快速表计算-合计百分比）" ID="3a372c8d04201ae5b2b8fbff3412111c" STYLE="fork"/>
                <node TEXT="颜色：区域" ID="9d1020653915b34f122a74c79391f531" STYLE="fork"/>
              </node>
            </node>
          </node>
          <node TEXT="环型图" ID="fa860d69568a95b364770e39830e2a92" STYLE="fork">
            <node TEXT="在饼图的基础上，行/列创建两个0值的临时字段，第二个圆移除所有标记中的字段，颜色选择白色下，双轴两个圆。" ID="f367d713e9af81d1a3f6064fec6ca933" STYLE="fork"/>
            <node TEXT="点击中间白色圆，标签放入本月成交金额字段和成交金额月环比字段。点击编辑文本，第一行添加文本：成交金额" ID="3f27b1efab9fbad0716e72bc7e4841da" STYLE="fork"/>
            <node TEXT="成交金额月环比右键设置格式，选择自定义，输入：▲0%;▼-0%" ID="b2d9bf09491d18ebc57761b28d12230b" STYLE="fork"/>
          </node>
          <node TEXT="环型图-环比正负值颜色变动" ID="4715a5196794772a442fff21bfb324ad" STYLE="fork">
            <node TEXT="成交金额月环比-正值 公式：IF [成交金额月环比]&gt;0 then [成交金额月环比] END" ID="2bc907223024b055ca5cdb83a9a862c0" STYLE="fork"/>
            <node TEXT="成交金额月环比-负值 公式：IF [成交金额月环比]&lt;=0 then [成交金额月环比] END" ID="9e5a36f5c792d7bed46b7c0feea75979" STYLE="fork"/>
            <node TEXT="正负值字段都右键默认属性的数字格式中选择自定义，输入：▲0%;▼-0%" ID="e2504943c50dd495386b3a72a397e185" STYLE="fork"/>
            <node TEXT="字段放入标记的标签中，编辑文本，正值字段使用绿色，负值字段使用红色，删除换行，将两个字段放在同一行。" ID="c6f221363a71dee811aa7ba459e5f58b" STYLE="fork"/>
            <node TEXT="工作表重命名为【成交金额占比环形图】。" ID="685b6a3eea499c264d776dc670041bc6" STYLE="fork"/>
            <node TEXT="成交客户数占比环形图同理。" ID="195ee076cf11e247abaf98e7210a86f5" STYLE="fork"/>
            <node TEXT="成交客户数月环比-正值 公式：IF [成交客户数月环比]&gt;0 THEN [成交客户数月环比] END" ID="2ed36d51257123e5158b82b8e454b5d5" STYLE="fork"/>
            <node TEXT="成交客户数月环比-负值 公式：IF [成交客户数月环比]&lt;=0 THEN [成交客户数月环比] END" ID="f35a875fed12bba6296243fe7209b378" STYLE="fork"/>
          </node>
          <node TEXT="指标卡" ID="b1f691c6419974f43e93e8ab1d22d48d" STYLE="fork">
            <node TEXT="新建工作表。" ID="4b4594574fa68a01f27f24d579a61d3c" STYLE="fork"/>
            <node TEXT="本月客单价和客单价月环比放入标签。编辑文本，添加文本：客单价。对齐方式水平选择居中，垂直选择中部。" ID="4b8719c8742d93695aaf12ee1a6e89e6" STYLE="fork"/>
            <node TEXT="环比颜色变化的制作和环形图中的环比字段同理。" ID="d1cedc6147d3176b4be80753f3ec782a" STYLE="fork"/>
            <node TEXT="客单价月环比-正值：IF [客单价月环比]&gt;0 THEN [客单价月环比] END" ID="47b5b5ad87a768c689b02fb9006f2907" STYLE="fork"/>
            <node TEXT="客单价月环比-负值：IF [客单价月环比]&lt;=0 THEN [客单价月环比] END" ID="4b71106ca9be9f8ec814f345cf2f4856" STYLE="fork"/>
            <node TEXT="工作表重命名为【客单价指标卡】。" ID="1a6d16caea22002de1729fd86a4fa713" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="搭建仪表盘" ID="1b097d2195f69fe824d886419b1a342b" STYLE="fork">
          <node TEXT="搭建仪表盘" ID="1b104dd9b372e50031135c4ab550fd9a" STYLE="fork">
            <node TEXT="新建仪表板，命名为【月度销售数据监控】。" ID="71e1c6f5d4a3147330255f22c6cfb895" STYLE="fork"/>
            <node TEXT="仪表板操作界面" ID="c34b9962d76866daaeaaa4cd82ae36a2" STYLE="fork">
              <node TEXT="左侧的边栏最上方是不同设备的布局方式。" ID="8e03cca23d313c429a7dc2311566ff53" STYLE="fork"/>
              <node TEXT="左侧下面是调整仪板画布大小。" ID="9c613a2da5afb143675cf18fda6438fc" STYLE="fork"/>
              <node TEXT="左侧再下面是工作表对象。" ID="47b8d2a1df81b27b843161a5b15141d4" STYLE="fork"/>
              <node TEXT="左侧最后一部分是特殊模块对象。" ID="e2cc3c12b82583b2b1630461f47ce235" STYLE="fork"/>
              <node TEXT="右侧是仪表板工作区。" ID="3d3659ca36c5e3bbe591377f8dd7294d" STYLE="fork"/>
            </node>
            <node TEXT="仪表板排布" ID="a4e4480834c29be8dc1f1a2bcd6e2d7e" STYLE="fork">
              <node TEXT="画布大小宽度为1000px，高度为1800px。" ID="da6de0d5be7627b6112bf89f54fda174" STYLE="fork"/>
              <node TEXT="选择平铺。" ID="11738761d95f7ccc1445d3548541b724" STYLE="fork"/>
              <node TEXT="先左右放入【成交金额占比环形图】和【成交客户数占比环形图】，中间放入【客单价柱状图】，柱状图上方放入【客单价指标卡】" ID="c17f002bcfbdb5c2481103e2683ce9a9" STYLE="fork"/>
              <node TEXT="在最下方开始依次放入【销售成交数据】、【销售成交趋势折线图】、【期数成交数据】、【期数成交趋势面积图】。" ID="a9cebe46d348e2a0b2e8ccd84d0a1ebc" STYLE="fork"/>
              <node TEXT="删除右上角的图例，只保留成交月份参数。" ID="cfd0250ad2af890473f2c45fc3aacea8" STYLE="fork"/>
            </node>
            <node TEXT="动态标题" ID="c0bf2d5dc142ebfc62cde6854f0676c0" STYLE="fork">
              <node TEXT="从对象工具栏中选择文本对象，拖到最上方，在编辑文本框中输入：XX公司【】月度销售数据监控。【】中插入成交月份参数。对齐方式选择居中。" ID="59b84f2f46ad40b891929639bd5a71fd" STYLE="fork"/>
              <node TEXT="成交月份参数移动到标题文本右侧。" ID="24f777423ad55d1f2002e93838bff3a0" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="美化仪表盘" ID="39e85d8b4c76a8fb0c5284859e189032" STYLE="fork">
            <node TEXT="调整全局字体。" ID="9b13f2c9dff82a21c79ab90e87c147b5" STYLE="fork">
              <node TEXT="选择顶部功能栏设置格式中的工作簿，字体全部中选择微软雅黑。" ID="46a6e06341ade1a63a8db21ab5d3e2e8" STYLE="fork"/>
            </node>
            <node TEXT="调整标题。" ID="5087db0ced1d60e7f5a037488b714a55" STYLE="fork">
              <node TEXT="单击标题文本，在左边栏选择布局，在背景的更多颜色中选择橙色。" ID="6b52e33961ceaf409374e2985b8b6c23" STYLE="fork"/>
              <node TEXT="外边距改为0。" ID="793c48251e3b08b759eec014102af7e5" STYLE="fork"/>
              <node TEXT="双击标题，字体颜色改为白色，字号20，加粗。" ID="2ea405e399310d4848dd3602eb26e0bf" STYLE="fork"/>
            </node>
            <node TEXT="调整筛选器。" ID="2c777669a6789abae844a3f1d1e1ba8f" STYLE="fork">
              <node TEXT="单击筛选器，布局中的背景色改为橙色，外边距改为0。" ID="2f7dec8069b70438e01609f02b9ae7c0" STYLE="fork"/>
              <node TEXT="双击筛选器，标题改为成交月份，颜色白色，字号9，居中对齐。" ID="cbf3c2a0919e5d652296608d8f90c042" STYLE="fork"/>
            </node>
            <node TEXT="添加区域筛选器" ID="770c187c94ef347ebb02a47aa0a385f6" STYLE="fork">
              <node TEXT="点击任意工作表，比如【销售成交数据】工作表，区域字段放入筛选器功能区，右键应用于工作表选择使用此数据源的所有项，完成对所有工作表区域筛选器的添加。" ID="874c8c0a837f753eec8eebf9f2455f0b" STYLE="fork"/>
              <node TEXT="回到仪表板。点击比如环形图，点击三角出现下拉菜单栏，在筛选器中选择区域。区域筛选器放在成交月份下方。" ID="2bc57947c2e1d039604b56036130696b" STYLE="fork"/>
              <node TEXT="单击筛选器，布局中的背景色改为橙色，外边距改为0。" ID="0c55ee709d15fe02e1e192fdddcc369b" STYLE="fork"/>
              <node TEXT="双击筛选器，字号9，居中对齐，颜色白色。" ID="9070cf275f215bb724d68a393e45a3cc" STYLE="fork"/>
              <node TEXT="拖入一个空白对象放在标题旁，布局背景色选择橙色，边距调整为0，调整大小。" ID="0c4fa62b87c1be5a457e27195f0eb4fc" STYLE="fork"/>
            </node>
            <node TEXT="调整总览数据部分" ID="46c1322e73e78bfb77cbda79fbf745f2" STYLE="fork">
              <node TEXT="右键成交金额占比环形图的标题，选择隐藏标题。也隐藏其他3张图表的标题。" ID="39277c26c4bbc3dff832a2a0ddc0f62a" STYLE="fork"/>
              <node TEXT="调整环形图。" ID="3138631d5180326904d120fbbc51de44" STYLE="fork">
                <node TEXT="点击环形图边上转到工作表，跳转到环形图的工作表。" ID="975024c62fd92dee2b842d2af7f8b316" STYLE="fork"/>
                <node TEXT="点击度量轴，右键取消勾选显示标题。" ID="f29ef80c5d86fbefe391b66c4cf60dfb" STYLE="fork"/>
                <node TEXT="点击图表，右键选择设置格式。点击线图标，0值线选择无。点击边界图标，行分隔符-区 选择无，列分隔符-区 选择无。" ID="5ab2da070843166d9458954f8bce3c5a" STYLE="fork"/>
                <node TEXT="右键区域字段设置默认属性颜色。华东为粉色，华南为绿色，华西北为橙色，；标记卡中的颜色不透明度改为50%。" ID="e1a4e92a9536eb12a8e1668f825918ce" STYLE="fork"/>
                <node TEXT="调整环形图中的标签，编辑文本。前两行字号为12号，后一行字号10号，后两行加粗。" ID="98f60d464d9439b1d8edfe81869b36aa" STYLE="fork"/>
                <node TEXT="环形图外圈标签，字号为9，标签移动至环上。" ID="5215fa7709d50472eed1d8ca4a525806" STYLE="fork"/>
                <node TEXT="成交客户数环形图调整同上。" ID="4263463ea1ca9475ac800a5f128d8f8b" STYLE="fork"/>
              </node>
              <node TEXT="调整客单价指标卡。" ID="13baa4a7c8b9362239eff19fb3097d41" STYLE="fork">
                <node TEXT="回到仪表盘。单击客单价指标卡对象，点击整个视图。点击转到工作表。" ID="9e0619615d6e40839363ae995c40881a" STYLE="fork"/>
                <node TEXT="点击编辑文本。客单价和值字号14，加粗。正负环比值字号12，加粗。" ID="641d0a5c6cacb2984fd53bbe677e4a55" STYLE="fork"/>
              </node>
              <node TEXT="调整客单价柱状图。" ID="aec4fed483d7c780c49557a6400d0d2b" STYLE="fork">
                <node TEXT="回到仪表盘，单击客单价柱状图。选择整个视图。右键度量轴，取消勾选显示标题。右键期数标签，点击旋转标签。右键列字段标签，选择隐藏。" ID="f2a76de0799240b836a6c7253ba0810a" STYLE="fork"/>
                <node TEXT="点击转到工作表。右键图表设置格式，点击线，工作表中零值线和轴标尺改为无，行中的网格线选择无。" ID="21af627bd2be9a1fcfebde8f2eb7e455" STYLE="fork"/>
              </node>
              <node TEXT="总览数据加框" ID="57e2bbe02e69e3c363e8b98a3eb7c260" STYLE="fork">
                <node TEXT="点击环形图，双击选择框上方的移动控制块，选择框同时包住环形图柱状图和指标卡，布局中的边界选择实线，左边起第二粗，颜色为橙色。" ID="7f7475313c30f6c05896f4e06e537851" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="调整销售成交数据" ID="3ea237a837b297ab28c61c27aad9e0f9" STYLE="fork">
              <node TEXT="点击销售成交数据，选择整个视图，再点击转到工作表。标题右键选择设置标题格式，标题阴影选择橙色。双击标题，工作表名改为省份成交明细，颜色为白色，居中，加粗，字号为12。" ID="d7844e0ea8cb042d9899d943b17ce13a" STYLE="fork"/>
              <node TEXT="点击图表，右键选择设置格式，点击线的标识，列中的网格线选择无。点击边界标识，工作表中的列分隔符改为无。" ID="29c82b9d7d15123e26574b2aa9bbb711" STYLE="fork"/>
              <node TEXT="右键区域字段设置格式，对齐方式水平居中，垂直中部。" ID="5ba714b442542a3dd95edc9aa543130b" STYLE="fork"/>
              <node TEXT="右键省份字段设置格式，对齐方式水平居中，垂直中部。" ID="87c68445f0bf5d2620bc26d7be370a47" STYLE="fork"/>
              <node TEXT="调整一下区域省份列的宽度，多留一些空间给右边的条形图部分。" ID="a25505209ea2915a7f7a78e2d5677b71" STYLE="fork"/>
              <node TEXT="回到仪表盘，点击省份成交明细对象，布局中边界选择实线，第二粗，颜色为橙色。" ID="3acd59fae304fced2445de026b24d410" STYLE="fork"/>
              <node TEXT="外边距改为0。" ID="ca6a1196972fb7cd8f32ac381193fb30" STYLE="fork"/>
            </node>
            <node TEXT="调整趋势图" ID="9c2bfa49f50c475e858689f0d24695a2" STYLE="fork">
              <node TEXT="点击销售趋势图，选择整个视图，再点击转到工作表。标题右键选择设置标题格式，标题阴影选择橙色。双击标题，工作表名改为区域成交趋势，颜色为白色，居中，加粗，字号为12" ID="fef7ef660c4d35b10e8890c37a58aea6" STYLE="fork"/>
              <node TEXT="点击标记中标签，勾选显示标记标签，要标注的标记中选择最小/最大，范围选择区。" ID="4ab8d46c5306898ffa6ce91643e175f7" STYLE="fork"/>
              <node TEXT="右键日期轴选择编辑轴，清除轴标题。" ID="3b40a516ac9b03989c6fa6dea38c0293" STYLE="fork"/>
              <node TEXT="回到仪表盘，点击区域成交趋势对象，布局中边界选择实线，第二粗，颜色为橙色。" ID="3f2d88a1c1f406747603b5f1fac73c85" STYLE="fork"/>
              <node TEXT="外边距改为0。" ID="fc9b916a424568a5d443b170c4c27554" STYLE="fork"/>
            </node>
            <node TEXT="调整期数成交数据" ID="7887ca84067521af46e4e56348e37c7d" STYLE="fork">
              <node TEXT="点击期数成交数据，选择整个视图，再点击转到工作表。标题右键选择设置标题格式，标题阴影选择橙色。双击标题，工作表名改为期数成交明细，颜色为白色，居中，加粗，字号为12。" ID="5387e0aa29e6813b5a75352db2cff919" STYLE="fork"/>
              <node TEXT="点击图表，右键选择设置格式，点击线的标识，列中的网格线选择无。点击边界标识，工作表中的行分隔符改为无，列分隔符中的标题改为无。" ID="e46d451ba02c14c446313484aea53cbf" STYLE="fork"/>
              <node TEXT="回到仪表盘，点击期数成交明细，布局中边界选择实线，第二粗，颜色为橙色。外边距改为0。" ID="c89ae9cc0cd7686c6cf9bc06ddccc539" STYLE="fork"/>
            </node>
            <node TEXT="调整期数成交趋势图" ID="1cb33c2b57e4f554ddab9249a307577a" STYLE="fork">
              <node TEXT="点击期数趋势图，选择整个视图，再点击转到工作表。标题右键选择设置标题格式，标题阴影选择橙色。双击标题，工作表名改为期数成交趋势，颜色为白色，居中，加粗，字号为12。" ID="f959ea59617e0a57cb72194627bde655" STYLE="fork"/>
              <node TEXT="右键日期轴选择编辑轴，清除轴标题。" ID="8abd29e207fb71da02fbdc7d8fe7250d" STYLE="fork"/>
              <node TEXT="回到仪表盘，点击期数成交趋势对象，布局中边界选择实线，第二粗，颜色为橙色。" ID="a779090fcf34cbea4205faa25991115e" STYLE="fork"/>
              <node TEXT="外边距改为0。" ID="9157fabf692d1c5dfca6c36080d57d82" STYLE="fork"/>
            </node>
            <node TEXT="微调每张图表的高度，使得仪表盘布局分配合理。【销售成交数据】和【期数成交数据】最好选择整个视图来适应填充整个容器。" ID="806d858b89e6d5ba92a1ce7734478b5e" STYLE="fork"/>
            <node TEXT="切换月份和区域，测试图表。" ID="22c60aaac43fe8693d54ae942dac7008" STYLE="fork"/>
          </node>
          <node TEXT="仪表盘交互" ID="322a12c65967fb92ab357c97ee51b894" STYLE="fork">
            <node TEXT="点击图表筛选" ID="ec245315264439a4dc4d8455c829fcd2" STYLE="fork">
              <node TEXT="单击期数客单价柱状图，点击右侧用作筛选器的图标，完成图表筛选动作的创建。" ID="53e900a6a5ad360e9e017bb56c41988f" STYLE="fork"/>
              <node TEXT="点击期数柱状图即可对仪表板中的数据进行筛选。" ID="4c4894a01c48b9ea7a99a0ae4244460b" STYLE="fork"/>
              <node TEXT="再次点击取消筛选。" ID="a0fd7c7132571e8db9402b73a48fdb6a" STYLE="fork"/>
            </node>
            <node TEXT="突出显示" ID="76cbefd45c1199baf799413647e9c590" STYLE="fork">
              <node TEXT="顶边栏中有突出显示标识，点击下拉选择区域。" ID="dd3b347a1582c5ce10a5f162000bf815" STYLE="fork"/>
              <node TEXT="比如点击环形图中的华西北，华西北数据都被凸显出来。" ID="9424caa77696a981cf16d4cff4099097" STYLE="fork"/>
              <node TEXT="再次点击取消突出显示。" ID="a2fbc5057ff29750426d68d3df3a6ea4" STYLE="fork"/>
            </node>
          </node>
        </node>
      </node>
      <node TEXT="课后作业" ID="b414c36f800fd285b31426eb7788643c" STYLE="fork">
        <node TEXT="数据源及答案下载在课程文件中的~" ID="0153b8b5cf0851775666440db78bfb3d" STYLE="fork"/>
        <node TEXT="记得先动手练习再看答案哦~" ID="eb281156a34a33d6762e136f9ce0d627" STYLE="fork"/>
        <node TEXT="作业1-交叉表" ID="bc245025da50c986b389b72ef38a68ea" STYLE="fork">
          <node TEXT="1.1 创建Tableau工作簿，连接【数据源】，在工作表中搭建如下交叉表，度量字段为成交客户数" ID="f3b3fe4f07ca0bd40d9c2d8462dd7927" STYLE="fork">
            <node TEXT="" ID="a6c6e33bccc9bcc9dcf30d41b8dc6387" STYLE="fork"/>
          </node>
          <node TEXT="2.1 创建分层结构【年-月层级】，层级中依次是成交日期的年份，成交日期的月份，且格式都是字符串格式" ID="9749e689f1ced0e4d2abaadf7b2e2009" STYLE="fork">
            <node TEXT="" ID="cada6a6e55609a704d1900819bb3fe09" STYLE="fork"/>
          </node>
          <node TEXT="2.2 使用年-月层级，在工作表中搭建如下工作表，按总和降序排序，度量字段为成交金额，小数位为1位，显示单位为k" ID="ab77c4368f203e40b2ec612b00350541" STYLE="fork">
            <node TEXT="" ID="4580036224b093e2c8b49c4dd50abec0" STYLE="fork"/>
          </node>
          <node TEXT="3.1 创建计算字段【销售数量】,对销售工号进行去重计数（countd）" ID="3eaed414337c596a10d0f33c918ca160" STYLE="fork"/>
          <node TEXT="3.2 在工作表中搭建如下交叉表，普通员工排在管理人员前面，按照普通员工中的成交金额降序排序" ID="66ceeaf1a62ab03480c7b16f2c5d075f" STYLE="fork">
            <node TEXT="" ID="9a00899ac2c30e8370860a18494127b1" STYLE="fork"/>
          </node>
          <node TEXT="4.1 在工作表中搭建如下交叉表，仅筛选出7月且成交金额总和大于100w的数据，排序按成交金额降序" ID="5d30d6813e23b542db141055f979dde9" STYLE="fork">
            <node TEXT="" ID="a4d30464c3814b9f098e509f9bfb3db9" STYLE="fork"/>
          </node>
          <node TEXT="4.2 在工作表中搭建如下交叉表，仅筛选出7月且成交金额数据大于1w的数据，业务组排序按成交金额降序，注意检查数据是否都正常排序" ID="dc33597110f8221023aea731de61704a" STYLE="fork">
            <node TEXT="" ID="93eae5d25c14bd4b4d6147c230eb74b0" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="作业2-表连接" ID="c114ae02e973bee1dc8eefd96d969d6a" STYLE="fork">
          <node TEXT="1.1 创建工作簿，使用物理连接搭建数据模型，连接【订单表】和【用户表】，选择正确的联接关系得到如下预览数据" ID="4c663fd8a64091d696e486136f958d02" STYLE="fork">
            <node TEXT="" ID="da22a927f6152440f8010971fa6c55a4" STYLE="fork"/>
            <node TEXT="Q：所以订单表和用户表的联接关系可以是？" ID="decf2c1ec52737f5866d59305eb87c36" STYLE="fork"/>
          </node>
          <node TEXT="1.2 使用物理连接搭建数据模型，连接【订单表】和【用户表】，选择正确的联接关系得到如下预览数据" ID="c91d12580d32f37a748004d88abd40b6" STYLE="fork">
            <node TEXT="" ID="692abfcc3dbf0bb48867242f4cb2804c" STYLE="fork"/>
            <node TEXT="Q：所以订单表和用户表的联接关系可以是？" ID="da76d0247601bddc4b1da12202cc43ff" STYLE="fork"/>
          </node>
          <node TEXT="2.1 在1.2的基础上智能连接【销售表】，并在工作表中搭建如下交叉表" ID="035d3bbbc56f2b39f33809721f101de7" STYLE="fork">
            <node TEXT="" ID="cb1f39bbac099dca079643260c5d0700" STYLE="fork"/>
          </node>
          <node TEXT="2.2 创建计算字段订单数和用户数，并在工作表中搭建如下交叉表" ID="09301e6f063bc6bbc0a746698027ffcc" STYLE="fork">
            <node TEXT="" ID="a1cb46b53f46418d6e7128d772f4913c" STYLE="fork"/>
            <node TEXT="Q：用户数总和为什么不是9？到底用户数是8正确还是9正确呢？" ID="d541a4cb3ab237fd1312e644cdcc6ea3" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="作业3-可视化" ID="325d041c9a7d48672198fb58acb53b9e" STYLE="fork">
          <node TEXT="1.1 打开Tableua工作簿【作业3-可视化】，筛选出8月份成交金额在100万以上的销售人员，制作如下条形图，按成交金额降序排序，并且颜色按区域划分" ID="95689815f0e4e4a7596c47d65701277b" STYLE="fork">
            <node TEXT="" ID="30398645c77900bc53e84c318d9e2d8b" STYLE="fork"/>
          </node>
          <node TEXT="1.2 查看不同职务类别，每个月在不同区域的成交客户数占比，制作如下堆积柱状图" ID="3a6863ecc5bf41001cf8321766f182c5" STYLE="fork">
            <node TEXT="" ID="794e49420f02c8eb484e22960aaec9a2" STYLE="fork"/>
          </node>
          <node TEXT="1.3 将上一题的堆积柱状图修改为如下百分比柱状图" ID="f4985b46f780d43fb5f5c64f9147a5f7" STYLE="fork">
            <node TEXT="" ID="ae084423fabd347628a8fa69d5df27f8" STYLE="fork"/>
          </node>
          <node TEXT="2.1 创建计算字段销售人数（按销售工号去重计算），制作如下折线图，查看不同区域销售人员每月入职人数" ID="5e4220519c476850aa228e0a18a2a8b8" STYLE="fork">
            <node TEXT="" ID="2c408cafd529ed31baa8078795237827" STYLE="fork"/>
          </node>
          <node TEXT="2.2 制作如下折线图，查看每月入职销售人数月环比增长率" ID="95567794a611dfb4afa3ac87e474610f" STYLE="fork">
            <node TEXT="" ID="b8081c865aecc8cf92dc2cf32d3e1210" STYLE="fork"/>
          </node>
          <node TEXT="2.3 制作如下双轴图，将2.2的折线图和每月销售入职人数柱状图做双轴" ID="a4ef77c4b3be06db1b4fe4976e5e3cea" STYLE="fork">
            <node TEXT="" ID="994cf1656b6e19f6e4f7e6e6e06e1886" STYLE="fork"/>
          </node>
          <node TEXT="3.2 制作如下职务类别占比饼图" ID="c76a8c710011f949f398636686533374" STYLE="fork">
            <node TEXT="" ID="fdc76917c5d3291ca86cf000f6e1521c" STYLE="fork"/>
          </node>
        </node>
      </node>
    </node>
  </node>
</map>