# Easy Rent (易租)

大三(2020/04)上学期的课堂大作业

架构：Flutter + gRPC + tonic + PostgreSQL

## UI 界面

| ![1](https://backup-1257461215.cos.ap-nanjing.myqcloud.com/easyrent/register.png)   | ![2](https://backup-1257461215.cos.ap-nanjing.myqcloud.com/easyrent/home.png)   | ![3](https://backup-1257461215.cos.ap-nanjing.myqcloud.com/easyrent/details.png)   |
|----------------------------------------------------------|----------------------------------------------------------|----------------------------------------------------------|
| ![4](https://backup-1257461215.cos.ap-nanjing.myqcloud.com/easyrent/members.png)   | ![5](https://backup-1257461215.cos.ap-nanjing.myqcloud.com/easyrent/select.png)   | ![6](https://backup-1257461215.cos.ap-nanjing.myqcloud.com/easyrent/rent-1.png)   |
| ![7](https://backup-1257461215.cos.ap-nanjing.myqcloud.com/easyrent/rent.png)   | ![8](https://backup-1257461215.cos.ap-nanjing.myqcloud.com/easyrent/help-1.png)   | ![9](https://backup-1257461215.cos.ap-nanjing.myqcloud.com/easyrent/help.png) |
| ![10](https://backup-1257461215.cos.ap-nanjing.myqcloud.com/easyrent/user.png) |

## 模拟数据和日志

```shell
sqlx migrate run # 还原所有的表结构
cargo run --release --bin json2db # 生成模拟数据并插入数据库
```



|      |  |
| ----------- | ----------- |
| ![1](./screenshots/fake_data.png) | ![2](https://backup-1257461215.cos.ap-nanjing.myqcloud.com/easyrent/log.png) |
