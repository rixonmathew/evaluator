delete from user where id <10;

select * from users;

#create initial users in the script
insert into user(username,first_name,last_name,admin) values('naik.pranil@gmail.com','pranil','naik',true);
insert into user(username,first_name,last_name,admin) values('rixonmathew@gmail.com','rixon','mathew',true);

select * from question;

select * From answer;

delete from answer where id=36;

delete from question where id>0;



select * from passage;

insert into passage(description) values('Fatima was very good at studies and always stood first in her class. She and her sisters studied in a government school. She was in class 10 while her younger sisters were in class 7 & class 5. Their school was almost 3 kilometers away from their house but they walked everyday to save on transport money. The sisters were not very good at studies so Fatima requested her parents to send them for extra tuition classes after school hours. Her parents did not earn so much to send all 3 daughters for tuitions so Fatima chose to study on her own. Because of this sacrifice, everyone in the house respected her very much.');

insert into passage(description) values('Fatima did not have many friends because she never got any time to play. She however loved to spend time with an elderly lady who stayed in their neighbourhood. Her name was Savitri and she was a doctor.  Savitri was a very simple woman who had converted her house into a dispensary. Her husband was a doctor too but had passed away couple of years back. Savitri served all the patients in the neighbourhood with great love and care. Because all her patients were very poor, she never charged them any fee rather allowed them to pay her whatever they could afford.');

insert into passage(description) values('Listen to the audio, and find appropriate English word after reading the text above
He decided to steal. He saw a rich lady shopping at a road-side stall. She was wearing a necklace. Rahim went close to her, snatched it and ran away. The lady started shouting for help. When people heard the lady screaming, they chased Rahim and caught him. They grabbed him by his neck, pushed him, punched him, slapped him and beat him so much that he broke his left hand. They recovered the stolen necklace and dropped him by the roadside. People then tied him with a rope and dragged him to the police station. The lady reported the crime and police arrested him. They put him in jail. Rahim was badly hurt, his hand was broken and his left eye was swollen. He began vomiting and became unconscious. In the morning when he woke up he saw Fatima and her sisters standing outside the jail. He was very ashamed and started crying. Fatima held his hand and told him that the hospital had thrown out their mother because he failed to pay the remaining money. Rahim started crying and fell down on the floor. He knew that Waheeda would die if she found out that police had arrested him and his daughters would never forgive him for letting their mother die.');

select * from test;

insert into test(name,description) values('English Language Certification Test','English Language Certification Test');

select * from section;

insert into section(name,type) values('Section #1','fixed');
insert into section(name,type) values('Section #2','fixed');
insert into section(name,type) values('Section #3','fixed');

select * from test_section;

insert into test_section(test_id,section_id,`order`) values(1,1,1);
insert into test_section(test_id,section_id,`order`) values(1,2,2);
insert into test_section(test_id,section_id,`order`) values(1,3,3);

select * from question;

select * from passage;

insert into question_set(passage_id,question_id) values(1,10);
insert into question_set(passage_id,question_id) values(1,11);
insert into question_set(passage_id,question_id) values(1,12);
insert into question_set(passage_id,question_id) values(1,13);
insert into question_set(passage_id,question_id) values(1,14);


insert into question_set(passage_id,question_id) values(2,15);
insert into question_set(passage_id,question_id) values(2,16);
insert into question_set(passage_id,question_id) values(2,17);
insert into question_set(passage_id,question_id) values(2,18);
insert into question_set(passage_id,question_id) values(2,19);


select * from question_set_definition;

select * from section_questions;

select * from question_set;

update question_set set question_set_definition_id = passage_id where passage_id>0;

insert into question_set_definition(name) values("Passage 1");
insert into question_set_definition(name) values("Passage 2");
insert into question_set_definition(name) values("Passage 3");

insert into section_questions(section_id,`order`,question_set_definition_id) values(1,1,1);
insert into section_questions(section_id,`order`,question_set_definition_id) values(1,2,2);
insert into section_questions(section_id,`order`,question_set_definition_id) values(1,3,3);

select * from passage;


select t.id as test_id,
	   t.name as test_name,
       s.name as section_name,
       p.description as passage_text,
       q.id as question_id,
       q.text as question_test,
       a.id as answer_id,
       a.text as answer_text,
       a.correct as is_correct
  from test t,
	   test_section ts,
	   section_questions sq,
       section s,
       question_set_definition qsd,
       question_set qs,
       passage p,
       question q,
	   answer a
 where ts.test_id = t.id
   and sq.section_id = ts.section_id
   and qsd.id = sq.question_set_definition_id
   and qs.question_set_definition_id = qsd.id
   and s.id = sq.section_id
   and q.id = qs.question_id
   and p.id = qs.passage_id
   and a.question_id = q.id
 order by ts.`order`,sq.`order`,qs.id;
 
 select * from section_questions;
 
 select s.id,
        s.name,
		s.type
   from section s,
        test_section ts
  where ts.test_id = 1
    and s.id = ts.section_id;
    
    select p.id,
           p.description
	  from section_questions sq,
           question_set_definition qsd,
           question_set qs,
           passage p
     where sq.section_id = 1
	   and qsd.id = sq.question_set_definition_id
       and qs.question_set_definition_id = qsd.id
       and p.id = qs.passage_id
	  group by p.id,p.description
      order by sq.`order`;
       
       
select * from question_set_definition;

select q.* 
  from question_set qs,
       question q
 where qs.passage_id = 1
   and q.id = qs.question_id
   order by qs.`order`;

select * from section_questions;
	   
update question_Set set `order` = id where id>0;      

update answer set `order` = id where id > 0;

select a.*
  from answer a
 where a.question_id = 10
   order by a.`order`;
  
select a.id,a.text,a.question_id,
    @answer_rn:=case when @q_id<>a.id then 1 else @answer_rn+1 end as rnk,
    @q_id = a.id
 from 
   (select @answer_rn :=-1 ) ar,
   (select @q_id:=-1) qq,
   (select * from answer order by question_id,id) a;
   
select * from passage;

update passage set number = id where id > 0;   

select * from question;

update question set number = id-14 where id>14;

select * from answer;

update answer set number = 'a' where mod(id,3)=0 and id>0;