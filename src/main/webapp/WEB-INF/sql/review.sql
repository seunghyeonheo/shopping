use webtest;
drop table review;
-- review

   create table review(
   rnum 			int not null auto_increment primary key,
   content 			varchar(500) not null,
   regdate 			date not null,
   id 				varchar(10) not null,
   contentsno 		int(7) not null,
					foreign key(contentsno) references contents(contentsno)
);


select * from review;

-- create
insert into review(content, regdate, id, contentsno)
values('디자인이 예뻐요', '2022-06-21', 'user1', 12); 
insert into review(content, regdate, id, contentsno)
values('사이즈가 커요', '2022-06-17', 'abc', 12);
insert into review(content, regdate, id, contentsno)
values('배송이 빨라요', '2022-06-17', '초코우유', 12);

-- read
select * from review;

-- list
select rnum, content, regdate, id, contentsno
		from review
		where contentsno = 12
		order by rnum DESC
		limit 0,2;
        
-- total
	select
		count(*) from review
		where rnum = 1;


-- update
update review
set content = '디자인이 마음에 들어요'
where rnum = 1;

-- delete
delete from review
where rnum=1;