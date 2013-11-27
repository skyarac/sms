--CREATE DATABASE 学生信息管理系统;
--DELETE 学生信息管理系统;
USE 学生信息管理系统;
CREATE TABLE student(
sid  VARCHAR(15) NOT NULL,
sname CHAR(10) NOT NULL,
age SMALLINT,
sex CHAR(4),
PRIMARY KEY(sid)
);
CREATE TABLE teacher(
tid VARCHAR(15) NOT NULL,
tname CHAR(10) NOT NULL,
title CHAR(8),
PRIMARY KEY(tid)
);
CREATE TABLE course(
cid VARCHAR(15),
cname VARCHAR(20) NOT NULL,
tid VARCHAR(15),
PRIMARY KEY(cid),
FOREIGN KEY(tid) REFERENCES teacher(tid)
);
CREATE TABLE sc(
sid VARCHAR(15),
cid VARCHAR(15),
score SMALLINT,
PRIMARY KEY(sid,cid),
FOREIGN KEY(sid) REFERENCES student(sid),
FOREIGN KEY(cid) REFERENCES course(cid)
);

CREATE TABLE users(  --mssqlserver2005 的保留字user
uid       SMALLINT identity(1,1) NOT NULL ,
uname     VARCHAR(10),
upassword VARCHAR(20),
PRIMARY   KEY(uid)
);