-- 部门表
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` int(10) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) DEFAULT NULL,
  `function_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '开发1部', 'java开发');
INSERT INTO `department` VALUES ('2', '开发2部', 'java开发');


-- 员工表
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL COMMENT '员工号',
  `employee_name` varchar(10) DEFAULT NULL,
  `employee_sex` int(1) DEFAULT NULL COMMENT '1男2女',
  `employee_age` varchar(10) DEFAULT NULL,
  `employee_phone` varchar(20) DEFAULT NULL,
  `employee_jobname` varchar(100) DEFAULT NULL COMMENT '岗位描述',
  `employee_department` int(10) DEFAULT NULL COMMENT '员工部门',
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '小王', '1', '20', '13744444333', '测试', '1');
INSERT INTO `employee` VALUES ('2', '张三', '2', '30', '13955555444', '测试', '1');
INSERT INTO `employee` VALUES ('3', '李四', '1', '34', '13966666222', '测试', '2');

-- 手机号脱敏查询
select e.employee_name,CONCAT(LEFT(employee_phone, 3), '****' , RIGHT(employee_phone, 4)) AS employee_phone FROM employee e;

-- 统计各部门人数
select d.department_name,count(*) from employee e,department d where e.employee_department = d.department_id GROUP BY d.department_name;

-- 查询每个部门年龄最大的员工
select e.employee_name,d.department_name,MAX(e.employee_age) from employee e,department d where e.employee_department = d.department_id GROUP BY d.department_id;
-- 手机号模糊查询
select employee_name,employee_sex,employee_age,CONCAT(LEFT(employee_phone, 3), '****' , RIGHT(employee_phone, 4)) AS employee_phone,employee_jobname,d.department_name FROM employee e,department d WHERE d.department_id=e.employee_department AND employee_phone LIKE '%模糊查询条件%'; 

