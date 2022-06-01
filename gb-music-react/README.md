# Cloud-Music

## **`一个基于React+TypeScript的音乐播放器，后端采用Express+MySQL`**<br/>

## 后端接口来源于

**[Express+mySQL](https://github.com/Bug-codergb/gb-music-be.git)** （个人开发） <br/>
本系统所有请求使用 http2.0 证书使用阿里云 ssl 免费证书，详情见后端接口[Express+mySQL](https://github.com/Bug-codergb/gb-music-be.git)
所有请求请使用`https`

## 数据库表(37 个表)

![gb-music](https://wx4.sinaimg.cn/large/008asUO8ly1h1ilz7vgpmj31fj0o8npd.jpg)

## 运行效果

### 1. **登录页**

登录页采用滑动验证，后端使用 jwt 生成 token,前端使用 redux+localStorage 管理用户信息

![login](https://wx4.sinaimg.cn/large/008asUO8ly1h1imj4cgnyj31h90ps1kx.jpg)

### 2. **首页**

主要展示 **热门音乐** , **热门歌单** ，**最新专辑**，
**热门歌手**，**新歌上架**，**最新专辑** ，**热门电台**，**推荐视频** <br/>

推荐视频主要使用协同过滤算法

![运行](https://wx2.sinaimg.cn/large/008asUO8ly1h1imkkl277g31gl0r87ww.gif)

<br/>

### 3. **视频**

主要分类有 **视频 (现场,电音)** , **MV(日韩，欧美，华语)** <br/>

- 视频
  ![视频](https://wx1.sinaimg.cn/large/008asUO8ly1h1imjke4ghj31hc0q1no8.jpg)
  <br/>
- MV

![MV](https://wx3.sinaimg.cn/large/008asUO8ly1h1imj6k109j31hc0pwh9x.jpg)

### 4. **视频播放** <br/>

视频 video 的所有控件来自于自定义结合 [AntDesign](https://ant.design/index-cn)

![播放](https://wx4.sinaimg.cn/large/008asUO8ly1h1imji9ijoj31ha0px7jl.jpg) <br/>

### 5. **音乐动态** <br/>

![动态](https://wx3.sinaimg.cn/large/008asUO8ly1h1imj8ctkkj31hc0pwgzi.jpg)

### 6. **排行榜**

飙升榜的实现使用 redis 记录每一天歌曲的累计播放量，与前一天歌曲播放量进行对比，筛选飙升最高的 50 首。
图片使用 **`可画`** 制作，制作较简单。

![排行榜](https://wx3.sinaimg.cn/large/008asUO8ly1h1imjgorpyj31hc0pw4d0.jpg) <br/>

### 7. **电台**

![电台](https://wx4.sinaimg.cn/large/008asUO8ly1h1imj7jar3j31hc0pwk4h.jpg)

### 8. **歌单**

![歌单](https://wx3.sinaimg.cn/large/008asUO8ly1h1imjax7kjj31hc0r77wh.jpg)

### 9. **歌曲播放页面**

![播放](https://wx1.sinaimg.cn/large/008asUO8ly1h1imjblc2wj31h80pwdr7.jpg)

### 10. **歌手页面**

拼音的筛选使用工具 pinyinUtil

![歌手](https://wx2.sinaimg.cn/large/008asUO8ly1h1imjemdpjj31hc0q04o0.jpg)

### 11. **话题页面**

![话题](https://wx3.sinaimg.cn/large/008asUO8ly1h1imjfnhypj31hc0pvk47.jpg)

### 12. **会员信息**

用户开通 VIP 选择套餐支付时，采用支付宝沙箱模拟支付(详情见后端接口)。

![会员信息](https://wx4.sinaimg.cn/large/008asUO8ly1h1imjg4lhej31hc0pu7c1.jpg)

### 13. **搜索页面**

![搜索页面](https://wx3.sinaimg.cn/large/008asUO8ly1h1imkl9cmzj31hc0pugwb.jpg)

### 14. **用户个人音乐**

![个人音乐](https://wx2.sinaimg.cn/large/008asUO8ly1h1imklxob1j31hc0psaly.jpg)

### 15. **消息通知**

![消息](https://wx3.sinaimg.cn/large/008asUO8ly1h1imknosfyj31ha0pw1d3.jpg)

### 16. **消息通知详情页**

![消息通知](https://wx2.sinaimg.cn/large/008asUO8ly1h1imkolax3j31hb0pvtow.jpg)

### 17. **用户个人管理页面**

![管理](https://wx2.sinaimg.cn/large/008asUO8ly1h1imkp7nn3j31h90pwwon.jpg)

## 主要用到的 npm 包

```
antd
axios
craco-less
immutable
jsonwebtoken
prettier
redux
redux-immutable
redux-thunk
streamsaver(文件下载结合fetch实现实时获取文件下载流)
styled-components
```

tip

### `由于服务端内存不足，build操作在本地进行，请忽略build文件夹`

### `后端接口地址在src/config/index.ts中进行配置，可以配置生产环境也可以配置开发环境`

### `webocket url路径在constant/host中进行配置`

### `视频url地址和音频url地址都进行了非对称加密(虽然在控制台不能防盗，但是网络请求中加密) 在utils/verify中进行了解密`

## **`项目clone后(或下载)`**

1. 执行 yarn install 安装依赖
2. 执行 yarn start 启动项目（3000 端口）
