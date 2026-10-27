# Nacos 达梦数据源插件

用于当前仓库的 Nacos 2.2.x SPI，平台标识为 `dameng`。
已使用 Nacos 2.2.3、DM8 20260414 构建、大小写不敏感（CASE_SENSITIVE=0）、
UTF-8 实例完成验证；不需要修改数据库 COMPATIBLE_MODE。

## 构建和部署

使用 JDK 8，在仓库根目录执行：

```bash
mvn -pl nacos-datasource-plugin-ext/nacos-dameng-datasource-plugin-ext -am -DskipTests package
```

将 target/nacos-dameng-datasource-plugin-ext-1.0.0-SNAPSHOT.jar 放到 Nacos 的
plugins 目录，重启 Nacos。不要使用 original- 前缀的 JAR。
最终 JAR 已包含公共适配层、SPI、Spring 错误码映射和达梦 JDBC 驱动，无需单独放驱动。
默认驱动为 Maven Central 发布的 DmJdbcDriver18 8.1.3.140。
IAP Context 的 8.2.2.70 来自其 vendor 仓库，不表示该版本不兼容；如需通过
-Ddameng.version=8.2.2.70 构建，需先提供对应 Maven 依赖来源。
不要同时加载同一插件的多个版本；其他数据库插件共用的 Base 层应保持版本一致。

## 数据库和配置

先创建 nacos_config schema，再执行 src/main/resources/schema/nacos-dameng.sql。
SQL 使用 identity、CLOB、BIT、唯一约束和配额默认值，不包含 DROP TABLE。
在现有交付介质中，将该 SQL 放到 middleware/dameng/init/，按 schema 创建脚本之后执行。

Nacos application.properties 配置：

```properties
spring.sql.init.platform=dameng
db.num=1
db.url.0=jdbc:dm://iap-dameng:5236?schema=nacos_config&clobAsString=true
db.user.0=SYSDBA
db.password.0=<SYSDBA密码>
db.pool.config.driverClassName=dm.jdbc.driver.DmDriver
```

现有 Nacos Docker 镜像使用以下环境变量对应上述配置：
SPRING_DATASOURCE_PLATFORM、DB_URL_0、DB_USER_0、DB_PASSWORD_0、
DB_POOL_CONFIG_DRIVER_CLASS_NAME。密码仍从部署环境的 .env 注入。
clobAsString=true 用于保持大文本读取与 Nacos 现有映射一致。

达梦重复键错误码 -6602 通过 sql-error-codes.xml 映射为 Spring 的
DuplicateKeyException，保证 Nacos 插入遇到已有配置时能正确转为更新。

## 验证记录（2026-10-27）

- JDK 8 Maven reactor 编译、Shade 打包和内置驱动检查通过。
- 初始化 SQL 在真实 DM8 实例执行通过，Nacos 2.2.3 以外部达梦存储启动成功。
- 120048 字节中文 CLOB 配置发布、完整读取、标签写入、配置更新通过。
- 配置分页、模糊查询、历史查询、命名空间创建通过。
- 重建 Nacos 容器后仍能读取原有达梦配置，数据库数据保留。
- 14 条配额插入/增减/校正 SQL 在真实达梦执行通过。
- 历史清理按 nid 分批删除，保留同一配置未过期历史；测试事务已回滚。

本模块不包含 IAP 业务、工作流或 XXL Job 的 Flyway 迁移。
