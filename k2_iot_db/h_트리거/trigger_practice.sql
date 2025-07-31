
USE `baseball_league`;
ALTER TABLE teams ADD COLUMN player_count INT DEFAULT 0;
/*
문제1
	선수(players)가 삭제될 때, 
	해당 선수의 이름과 삭제 시각을 player_delete_logs 테이블에 기록하는 트리거를 생성
    
	>> 로그 테이블이 없으면 먼저 생성하고, 트리거명: after_player_delete*/
drop table if exists player_delete_logs;
create table if not exists player_delete_logs(
	log_id int auto_increment primary key,
    player_name varchar(10),
    log_time datetime
);

drop trigger if exists after_player_delete;
delimiter $$
create trigger after_player_delete
	after delete
    on players
    for each row
begin
	insert into player_delete_logs(player_name, log_time)
    values
		(name,  now());
end $$
delimiter ;

/*
문제2
	선수(players)의 포지션(position)이 변경될 경우
		, 이전 포지션과 변경된 포지션, 선수 이름을 player_position_logs에 기록하는 트리거를 생성
	
    >> 로그 테이블이 없으면 먼저 생성하고,트리거명: after_player_position_update
*/

drop table if exists player_position_logs;
create table if not exists player_position_logs(
	log_id int auto_increment primary key,
    player_name varchar(10),
    player_before_position varchar(20),
    player_after_position varchar(20),
    changed_time datetime
);
drop trigger if exists after_player_position_update;
delimiter $$
create trigger after_player_position_update
	after update
    on players
    for each row
begin
	insert into player_position_logs(player_name, player_before_position, player_after_position, changed_time)
    values
		(name, position, concat('update position', player_after_position), now());
end$$
delimiter ;

/*
문제3
	선수가 추가되거나 삭제될 때마다 해당 팀의 선수 수(player_count)를 자동으로 업데이트하는 트리거 2개	
    (after_player_insert_count, after_player_delete_count)
	
    >> ※ teams 테이블에 player_count 컬럼이 이미 존재한다고 가정함
	
    ALTER TABLE teams ADD COLUMN player_count INT DEFAULT 0;
*/
drop trigger if exists after_player_insert_count;
delimiter $$
create trigger after_player_insert_count
	after insert
    on teams
    for each row
	begin
		insert into teams(player_count)
		values
			(player_count = auto_increment);
	end$$
delimiter ;

drop trigger if exists after_player_delete_count;
delimiter $$
create trigger after_player_delete_count;
delimiter ;

































