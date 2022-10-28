-- DB作成
CREATE DATABASE hogedb;

-- 作成したDBへ切り替え
\c hogedb

-- スキーマ作成
CREATE SCHEMA hogeschema;

-- ロールの作成
CREATE ROLE hoge WITH LOGIN PASSWORD 'password';

-- 権限追加
GRANT ALL PRIVILEGES ON SCHEMA hogeschema TO hoge;
