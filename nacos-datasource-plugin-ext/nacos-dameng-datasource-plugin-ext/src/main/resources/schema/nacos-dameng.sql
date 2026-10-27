-- 在 nacos_config schema 中初始化 Nacos 2.2.x 表结构。
SET SCHEMA nacos_config;

/*
 * Copyright 1999-2018 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
CREATE TABLE "config_info" (
  "id" BIGINT IDENTITY(1,1) NOT NULL,
  "data_id" varchar(255)  NOT NULL,
  "group_id" varchar(255) ,
  "content" CLOB  NOT NULL,
  "md5" varchar(32) ,
  "gmt_create" timestamp(6) NOT NULL,
  "gmt_modified" timestamp(6) NOT NULL,
  "src_user" CLOB ,
  "src_ip" varchar(20) ,
  "app_name" varchar(128) ,
  "tenant_id" varchar(128) ,
  "c_desc" varchar(256) ,
  "c_use" varchar(64) ,
  "effect" varchar(64) ,
  "type" varchar(64) ,
  "c_schema" CLOB ,
  "encrypted_data_key" CLOB  NOT NULL
)
;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
CREATE TABLE "config_info_aggr" (
  "id" BIGINT IDENTITY(1,1) NOT NULL,
  "data_id" varchar(255)  NOT NULL,
  "group_id" varchar(255)  NOT NULL,
  "datum_id" varchar(255)  NOT NULL,
  "content" CLOB  NOT NULL,
  "gmt_modified" timestamp(6) NOT NULL,
  "app_name" varchar(128) ,
  "tenant_id" varchar(128) 
)
;
-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------
COMMIT;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
CREATE TABLE "config_info_beta" (
  "id" BIGINT IDENTITY(1,1) NOT NULL,
  "data_id" varchar(255)  NOT NULL,
  "group_id" varchar(128)  NOT NULL,
  "app_name" varchar(128) ,
  "content" CLOB  NOT NULL,
  "beta_ips" varchar(1024) ,
  "md5" varchar(32) ,
  "gmt_create" timestamp(6) NOT NULL,
  "gmt_modified" timestamp(6) NOT NULL,
  "src_user" CLOB ,
  "src_ip" varchar(20) ,
  "tenant_id" varchar(128) ,
  "encrypted_data_key" CLOB  NOT NULL
)
;
-- ----------------------------
-- Records of config_info_beta
-- ----------------------------
COMMIT;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
CREATE TABLE "config_info_tag" (
  "id" BIGINT IDENTITY(1,1) NOT NULL,
  "data_id" varchar(255)  NOT NULL,
  "group_id" varchar(128)  NOT NULL,
  "tenant_id" varchar(128) ,
  "tag_id" varchar(128)  NOT NULL,
  "app_name" varchar(128) ,
  "content" CLOB  NOT NULL,
  "md5" varchar(32) ,
  "gmt_create" timestamp(6) NOT NULL,
  "gmt_modified" timestamp(6) NOT NULL,
  "src_user" CLOB ,
  "src_ip" varchar(20) 
)
;
-- ----------------------------
-- Records of config_info_tag
-- ----------------------------
COMMIT;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
CREATE TABLE "config_tags_relation" (
  "id" BIGINT NOT NULL,
  "tag_name" varchar(128)  NOT NULL,
  "tag_type" varchar(64) ,
  "data_id" varchar(255)  NOT NULL,
  "group_id" varchar(128)  NOT NULL,
  "tenant_id" varchar(128) ,
  "nid" BIGINT IDENTITY(1,1) NOT NULL
)
;
-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
COMMIT;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
CREATE TABLE "group_capacity" (
  "id" BIGINT IDENTITY(1,1) NOT NULL,
  "group_id" varchar(128)  NOT NULL,
  "quota" INTEGER NOT NULL,
  "usage" INTEGER NOT NULL,
  "max_size" INTEGER NOT NULL,
  "max_aggr_count" INTEGER NOT NULL,
  "max_aggr_size" INTEGER NOT NULL,
  "max_history_count" INTEGER NOT NULL DEFAULT 0,
  "gmt_create" timestamp(6) NOT NULL,
  "gmt_modified" timestamp(6) NOT NULL
)
;
-- ----------------------------
-- Records of group_capacity
-- ----------------------------
COMMIT;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
CREATE TABLE "his_config_info" (
  "id" BIGINT NOT NULL,
  "nid" BIGINT IDENTITY(1,1) NOT NULL,
  "data_id" varchar(255)  NOT NULL,
  "group_id" varchar(128)  NOT NULL,
  "app_name" varchar(128) ,
  "content" CLOB  NOT NULL,
  "md5" varchar(32) ,
  "gmt_create" timestamp(6) NOT NULL  DEFAULT TIMESTAMP '2010-05-05 00:00:00',
  "gmt_modified" timestamp(6) NOT NULL,
  "src_user" CLOB ,
  "src_ip" varchar(20) ,
  "op_type" char(10) ,
  "tenant_id" varchar(128) ,
  "encrypted_data_key" CLOB  NOT NULL
)
;
-- ----------------------------
-- Table structure for permissions
-- ----------------------------
CREATE TABLE "permissions" (
  "role" varchar(50)  NOT NULL,
  "resource" varchar(512)  NOT NULL,
  "action" varchar(8)  NOT NULL
)
;

-- ----------------------------
-- Records of permissions
-- ----------------------------
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
CREATE TABLE "roles" (
  "username" varchar(50)  NOT NULL,
  "role" varchar(50)  NOT NULL
)
;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "roles" VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
CREATE TABLE "tenant_capacity" (
  "id" BIGINT IDENTITY(1,1) NOT NULL,
  "tenant_id" varchar(128)  NOT NULL,
  "quota" INTEGER NOT NULL,
  "usage" INTEGER NOT NULL,
  "max_size" INTEGER NOT NULL,
  "max_aggr_count" INTEGER NOT NULL,
  "max_aggr_size" INTEGER NOT NULL,
  "max_history_count" INTEGER NOT NULL DEFAULT 0,
  "gmt_create" timestamp(6) NOT NULL,
  "gmt_modified" timestamp(6) NOT NULL
)
;
-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------
COMMIT;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
CREATE TABLE "tenant_info" (
  "id" BIGINT IDENTITY(1,1) NOT NULL,
  "kp" varchar(128)  NOT NULL,
  "tenant_id" varchar(128) ,
  "tenant_name" varchar(128) ,
  "tenant_desc" varchar(256) ,
  "create_source" varchar(32) ,
  "gmt_create" BIGINT NOT NULL,
  "gmt_modified" BIGINT NOT NULL
)
;
-- ----------------------------
-- Records of tenant_info
-- ----------------------------
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE "users" (
  "username" varchar(50)  NOT NULL,
  "password" varchar(500)  NOT NULL,
  "enabled" BIT NOT NULL
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "users" VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
COMMIT;

-- ----------------------------
-- Indexes structure for table config_info
-- ----------------------------
CREATE UNIQUE INDEX "uk_configinfo_datagrouptenant" ON "config_info" ("data_id","group_id","tenant_id");

-- ----------------------------
-- Primary Key structure for table config_info
-- ----------------------------
ALTER TABLE "config_info" ADD CONSTRAINT "config_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table config_info_aggr
-- ----------------------------
CREATE UNIQUE INDEX "uk_configinfoaggr_datagrouptenantdatum" ON "config_info_aggr"  ("data_id","group_id","tenant_id","datum_id");

-- ----------------------------
-- Primary Key structure for table config_info_aggr
-- ----------------------------
ALTER TABLE "config_info_aggr" ADD CONSTRAINT "config_info_aggr_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table config_info_beta
-- ----------------------------
CREATE UNIQUE INDEX "uk_configinfobeta_datagrouptenant" ON "config_info_beta"  ("data_id","group_id","tenant_id");

-- ----------------------------
-- Primary Key structure for table config_info_beta
-- ----------------------------
ALTER TABLE "config_info_beta" ADD CONSTRAINT "config_info_beta_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table config_info_tag
-- ----------------------------
CREATE UNIQUE INDEX "uk_configinfotag_datagrouptenanttag" ON "config_info_tag"  ("data_id","group_id","tenant_id","tag_id");

-- ----------------------------
-- Primary Key structure for table config_info_tag
-- ----------------------------
ALTER TABLE "config_info_tag" ADD CONSTRAINT "config_info_tag_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table config_tags_relation
-- ----------------------------
CREATE INDEX "idx_tenant_id" ON "config_tags_relation"  (
  "tenant_id"
);
CREATE UNIQUE INDEX "uk_configtagrelation_configidtag" ON "config_tags_relation"  (
  "id",
  "tag_name",
  "tag_type"
);

-- ----------------------------
-- Primary Key structure for table config_tags_relation
-- ----------------------------
ALTER TABLE "config_tags_relation" ADD CONSTRAINT "config_tags_relation_pkey" PRIMARY KEY ("nid");

-- ----------------------------
-- Indexes structure for table group_capacity
-- ----------------------------
CREATE UNIQUE INDEX "uk_group_id" ON "group_capacity"  (
  "group_id"
);

-- ----------------------------
-- Primary Key structure for table group_capacity
-- ----------------------------
ALTER TABLE "group_capacity" ADD CONSTRAINT "group_capacity_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table his_config_info
-- ----------------------------
CREATE INDEX "idx_did" ON "his_config_info"  (
  "data_id"
);
CREATE INDEX "idx_gmt_create" ON "his_config_info"  (
  "gmt_create"
);
CREATE INDEX "idx_gmt_modified" ON "his_config_info"  (
  "gmt_modified"
);

-- ----------------------------
-- Primary Key structure for table his_config_info
-- ----------------------------
ALTER TABLE "his_config_info" ADD CONSTRAINT "his_config_info_pkey" PRIMARY KEY ("nid");

-- ----------------------------
-- Indexes structure for table permissions
-- ----------------------------
CREATE UNIQUE INDEX "uk_role_permission" ON "permissions"  (
  "role",
  "resource",
  "action"
);

-- ----------------------------
-- Indexes structure for table roles
-- ----------------------------
CREATE UNIQUE INDEX "uk_username_role" ON "roles"  (
  "username",
  "role"
);

-- ----------------------------
-- Indexes structure for table tenant_capacity
-- ----------------------------
CREATE UNIQUE INDEX "uk_tenant_id" ON "tenant_capacity"  (
  "tenant_id"
);

-- ----------------------------
-- Primary Key structure for table tenant_capacity
-- ----------------------------
ALTER TABLE "tenant_capacity" ADD CONSTRAINT "tenant_capacity_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tenant_info
-- ----------------------------
CREATE UNIQUE INDEX "uk_tenant_info_kptenantid" ON "tenant_info"  (
  "kp",
  "tenant_id"
);
