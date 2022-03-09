# Easy Rent (易租)

完结于大三(2020/05)上学期

架构：Flutter + gRPC + tonic + PostgreSQL

## UI 界面

| ![1](./screenshots/register.png)   | ![2](./screenshots//home.png)   | ![3](./screenshots/details.png)   |
|----------------------------------------------------------|----------------------------------------------------------|----------------------------------------------------------|
| ![4](./screenshots/members.png)   | ![5](./screenshots/select.png)   | ![6](./screenshots/rent-1.png)   |
| ![7](./screenshots/rent.png)   | ![8](./screenshots/help-1.png)   | ![9](./screenshots/help.png) |
| ![10](./screenshots/user.png) |

## 模拟数据和日志

```shell
sqlx migrate run # 还原所有的表结构
cargo run --release --bin json2db # 生成模拟数据并插入数据库
```



| ![1](./screenshots/fake_data.png) | ![2](./screenshots/log.png) |
| ----------- | ----------- |
