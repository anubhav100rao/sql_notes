select *
from employee
where (department, salary) in (
        select department,
            max(salary) as salary
        from employee
        group by department
    )
order by department asc;
select *
FROM department
where department not in (
        select distinct department
        from employee
    );
-- correlated subquery
-- find all employee having their salary greater than the average of their department
select *
from employee e1
where salary > (
        select avg(salary) as salary
        from employee e2
        where e2.department = e1.department
    );



DROP TABLE IF EXISTS `Sales`;

CREATE TABLE `Sales` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `store` TEXT default NULL,
  `product_name` TEXT default NULL,
  `price` mediumint default NULL,
  `quantity` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `Sales` (`store`,`product_name`,`price`,`quantity`)
VALUES
  ("Store8","Pro",4889,3),
  ("Store1","iPad",8030,2),
  ("Store6","iPad",4795,6),
  ("Store3","MacBook",3827,4),
  ("Store7","iPad",5489,3),
  ("Store1","iMac",3655,4),
  ("Store8","iPad",8328,1),
  ("Store4","Pro",3796,2),
  ("Store5","iWatch",5809,1),
  ("Store2","iPad",9110,2),
  ("Store5","Pro",5579,9),
  ("Store4","Pro",3868,4),
  ("Store1","Pro",9505,6),
  ("Store8","Mac",4638,6),
  ("Store5","Mac",9914,4),
  ("Store8","Pro",7825,5),
  ("Store4","Mac",5276,7),
  ("Store5","iMac",5801,3),
  ("Store8","iWatch",4212,8),
  ("Store4","Pro",3822,4);