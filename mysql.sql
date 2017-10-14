
CREATE DATABASE education_system;

USE education_system;



SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `collegeID` INT(11) NOT NULL,
  `collegeName` VARCHAR(200) NOT NULL COMMENT '课程名',
  PRIMARY KEY (`collegeID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES ('1', '计算机系');
INSERT INTO `college` VALUES ('2', '设计系');
INSERT INTO `college` VALUES ('3', '财经系');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseID` INT(11) NOT NULL,
  `courseName` VARCHAR(200) NOT NULL COMMENT '课程名称',
  `teacherID` INT(11) NOT NULL,
  `courseTime` VARCHAR(200) DEFAULT NULL COMMENT '开课时间',
  `classRoom` VARCHAR(200) DEFAULT NULL COMMENT '开课地点',
  `courseWeek` INT(200) DEFAULT NULL COMMENT '学时',
  `courseType` VARCHAR(20) DEFAULT NULL COMMENT '课程类型',
  `collegeID` INT(11) NOT NULL COMMENT '所属院系',
  `score` INT(11) NOT NULL COMMENT '学分',
  PRIMARY KEY (`courseID`),
  KEY `collegeID` (`collegeID`),
  KEY `teacherID` (`teacherID`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`userID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'C语言程序设计', '1001', '周二', '科401', '18', '必修课', '1', '3');
INSERT INTO `course` VALUES ('2', 'Python爬虫技巧', '1001', '周四', 'X402', '18', '必修课', '1', '3');
INSERT INTO `course` VALUES ('3', '数据结构', '1001', '周四', '科401', '18', '必修课', '1', '2');
INSERT INTO `course` VALUES ('4', 'Java程序设计', '1002', '周五', '科401', '18', '必修课', '1', '2');
INSERT INTO `course` VALUES ('5', '英语', '1002', '周四', 'X302', '18', '必修课', '2', '2');
INSERT INTO `course` VALUES ('6', '服装设计', '1003', '周一', '科401', '18', '选修课', '2', '2');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleID` INT(11) NOT NULL,
  `roleName` VARCHAR(20) NOT NULL,
  `permissions` VARCHAR(255) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`roleID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('0', 'admin', NULL);
INSERT INTO `role` VALUES ('1', 'teacher', NULL);
INSERT INTO `role` VALUES ('2', 'student', NULL);

-- ----------------------------
-- Table structure for selectedcourse
-- ----------------------------
DROP TABLE IF EXISTS `selectedcourse`;
CREATE TABLE `selectedcourse` (
  `courseID` INT(11) NOT NULL,
  `studentID` INT(11) NOT NULL,
  `mark` INT(11) DEFAULT NULL COMMENT '成绩',
  KEY `courseID` (`courseID`),
  KEY `studentID` (`studentID`),
  CONSTRAINT `selectedcourse_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`),
  CONSTRAINT `selectedcourse_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`userID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of selectedcourse
-- ----------------------------
INSERT INTO `selectedcourse` VALUES ('2', '10001', '12');
INSERT INTO `selectedcourse` VALUES ('1', '10001', '95');
INSERT INTO `selectedcourse` VALUES ('1', '10002', '66');
INSERT INTO `selectedcourse` VALUES ('1', '10003', NULL);
INSERT INTO `selectedcourse` VALUES ('2', '10003', '99');
INSERT INTO `selectedcourse` VALUES ('5', '10001', NULL);
INSERT INTO `selectedcourse` VALUES ('3', '10001', NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(200) NOT NULL,
  `sex` VARCHAR(20) DEFAULT NULL,
  `birthYear` DATE DEFAULT NULL COMMENT '出生日期',
  `grade` DATE DEFAULT NULL COMMENT '入学时间',
  `collegeID` INT(11) NOT NULL COMMENT '院系id',
  PRIMARY KEY (`userID`),
  KEY `collegeID` (`collegeID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`)
) ENGINE=INNODB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('10001', '小黄', '男', '1996-09-02', '2015-09-02', '1');
INSERT INTO `student` VALUES ('10002', '小米', '女', '1995-09-14', '2015-09-02', '3');
INSERT INTO `student` VALUES ('10003', '小陈', '女', '1996-09-02', '2015-09-02', '2');
INSERT INTO `student` VALUES ('10004', '小华', '男', '1996-09-02', '2015-09-02', '2');
INSERT INTO `student` VALUES ('10005', '小左', '女', '1996-09-02', '2015-09-02', '2');
INSERT INTO `student` VALUES ('10006', '小拉', '女', '1996-09-02', '2015-09-02', '1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(200) NOT NULL,
  `sex` VARCHAR(20) DEFAULT NULL,
  `birthYear` DATE NOT NULL,
  `degree` VARCHAR(20) DEFAULT NULL COMMENT '学历',
  `title` VARCHAR(255) DEFAULT NULL COMMENT '职称',
  `grade` DATE DEFAULT NULL COMMENT '入职时间',
  `collegeID` INT(11) NOT NULL COMMENT '院系',
  PRIMARY KEY (`userID`),
  KEY `collegeID` (`collegeID`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`)
) ENGINE=INNODB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1001', '刘老师', '女', '1990-03-08', '硕士', '副教授', '2015-09-02', '2');
INSERT INTO `teacher` VALUES ('1002', '张老师', '男', '1996-09-02', '本科', '普通教师', '2015-09-02', '1');
INSERT INTO `teacher` VALUES ('1003', '软老师', '男', '1996-09-02', '硕士', '助教', '2017-07-07', '1');

-- ----------------------------
-- Table structure for userlogin
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(200) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `role` INT(11) NOT NULL DEFAULT '2' COMMENT '角色权限',
  PRIMARY KEY (`userID`),
  KEY `role` (`role`),
  CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`roleID`)
) ENGINE=INNODB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlogin
-- ----------------------------
INSERT INTO `userlogin` VALUES ('1', 'admin', '123', '0');
INSERT INTO `userlogin` VALUES ('8', '10001', '123', '2');
INSERT INTO `userlogin` VALUES ('9', '10002', '123', '2');
INSERT INTO `userlogin` VALUES ('10', '10003', '123', '2');
INSERT INTO `userlogin` VALUES ('11', '10005', '123', '2');
INSERT INTO `userlogin` VALUES ('12', '10004', '123', '2');
INSERT INTO `userlogin` VALUES ('13', '10006', '123', '2');
INSERT INTO `userlogin` VALUES ('14', '1001', '123', '1');
INSERT INTO `userlogin` VALUES ('15', '1002', '123', '1');
INSERT INTO `userlogin` VALUES ('16', '1003', '123', '1');
SET FOREIGN_KEY_CHECKS=1;
