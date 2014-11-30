delete from user where id <10;

select * from user;

delete from user where username = 'test@guv.org';

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

update passage set description = 'Read the paragraph and answer the questions.<br/> Fatima was very good at studies and always stood first in her class. She and her sisters studied in a government school. She was in class 10 while her younger sisters were in class 7 & class 5. Their school was almost 3 kilometers away from their house but they walked everyday to save on transport money. The sisters were not very good at studies so Fatima requested her parents to send them for extra tuition classes after school hours. Her parents did not earn so much to send all 3 daughters for tuitions so Fatima chose to study on her own. Because of this sacrifice, everyone in the house respected her very much.' where id =1;

update passage set description = 'Read the paragraph and answer the questions.<br/> Fatima did not have many friends because she never got any time to play. She however loved to spend time with an elderly lady who stayed in their neighbourhood. Her name was Savitri and she was a doctor.  Savitri was a very simple woman who had converted her house into a dispensary. Her husband was a doctor too but had passed away couple of years back. Savitri served all the patients in the neighbourhood with great love and care. Because all her patients were very poor, she never charged them any fee rather allowed them to pay her whatever they could afford.' where id =2;

update passage set description = 'Listen to the audio, and find appropriate English word after reading the text above.<br/> He decided to steal. He saw a rich lady shopping at a road-side stall. She was wearing a necklace. Rahim went close to her, snatched it and ran away. The lady started shouting for help. When people heard the lady screaming, they chased Rahim and caught him. They grabbed him by his neck, pushed him, punched him, slapped him and beat him so much that he broke his left hand. They recovered the stolen necklace and dropped him by the roadside. People then tied him with a rope and dragged him to the police station. The lady reported the crime and police arrested him. They put him in jail. Rahim was badly hurt, his hand was broken and his left eye was swollen. He began vomiting and became unconscious. In the morning when he woke up he saw Fatima and her sisters standing outside the jail. He was very ashamed and started crying. Fatima held his hand and told him that the hospital had thrown out their mother because he failed to pay the remaining money. Rahim started crying and fell down on the floor. He knew that Waheeda would die if she found out that police had arrested him and his daughters would never forgive him for letting their mother die.' where id =3;

insert into passage(description) values ('Fill in the blanks below with the following options: <b>see, find, get, leave, ask</b>');

insert into passage(description) values ('Fill in the blanks below with the following options: <b>buy, forget, tear, elect, purchase</b>');

insert into passage(description) values ('Fill in the blanks below with the following options: <b>steal, go, pay, tie, fill</b>');






select * from test;

insert into test(name,description) values('English Language Certification Test','English Language Certification Test');

select * from section;

insert into section(name,type) values('Section #1','fixed');
insert into section(name,type) values('Section #2','fixed');
insert into section(name,type) values('Section #3','fixed');

insert into section(name,type) values('Section #4','fixed');
insert into section(name,type) values('Section #5','fixed');

select * from test_section;

insert into test_section(test_id,section_id,`order`) values(1,1,1);
insert into test_section(test_id,section_id,`order`) values(1,2,2);
insert into test_section(test_id,section_id,`order`) values(1,3,3);
insert into test_section(test_id,section_id,`order`) values(1,4,4);
insert into test_section(test_id,section_id,`order`) values(1,5,5);

select * from question;

select * from passage;

insert into question_set(passage_id,question_id) values(1,10);
insert into question_set(passage_id,question_id) values(1,11);
insert into question_set(passage_id,question_id) values(1,12);
insert into question_set(passage_id,question_id) values(1,13);
insert into question_set(passage_id,question_id) values(1,14);

update question_set_definition set name = 'Section#2 passage1' where id = 4;
update question_set_definition set name = 'Section#2 passage2' where id = 5;
update question_set_definition set name = 'Section#2 passage3' where id = 6;

insert into question_set(passage_id,question_id) values(2,15);
insert into question_set(passage_id,question_id) values(2,16);
insert into question_set(passage_id,question_id) values(2,17);
insert into question_set(passage_id,question_id) values(2,18);
insert into question_set(passage_id,question_id) values(2,19);

insert into question_set_definition(name) values('Section#2 passage1');
insert into question_set_definition(name) values('Section#2 passage2');
insert into question_set_definition(name) values('Section#2 passage3');

select * from passage;

insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(4,168,4,1);
insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(4,169,4,2);
insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(4,170,4,3);
insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(4,171,4,4);
insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(4,172,4,5);

insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(5,173,5,1);
insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(5,174,5,2);
insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(5,175,5,3);
insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(5,176,5,4);
insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(5,177,5,5);

insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(6,178,6,1);
insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(6,179,6,2);
insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(6,180,6,3);
insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(6,181,6,4);
insert into question_set(passage_id,question_id,question_set_definition_id,`order`) values(6,182,6,5);


select * from question_set_definition;

select * from section_questions;

select * from question_set;

select * from question;

insert into question(id,text,number) values(20,'Enter the english words in the text area below','1');

update question_set set question_set_definition_id = passage_id where passage_id>0;

insert into question_set_definition(name) values("Passage 1");
insert into question_set_definition(name) values("Passage 2");
insert into question_set_definition(name) values("Passage 3");

insert into section_questions(section_id,`order`,question_set_definition_id) values(1,1,1);
insert into section_questions(section_id,`order`,question_set_definition_id) values(1,2,2);
insert into section_questions(section_id,`order`,question_set_definition_id) values(1,3,3);

#questions for section #2;
insert into section_questions(section_id,`order`,question_id) values(2,1,21);
insert into section_questions(section_id,`order`,question_id) values(2,2,22);
insert into section_questions(section_id,`order`,question_id) values(2,3,23);
insert into section_questions(section_id,`order`,question_id) values(2,4,24);
insert into section_questions(section_id,`order`,question_id) values(2,5,25);
insert into section_questions(section_id,`order`,question_id) values(2,6,26);
insert into section_questions(section_id,`order`,question_id) values(2,7,27);
insert into section_questions(section_id,`order`,question_id) values(2,8,28);
insert into section_questions(section_id,`order`,question_id) values(2,9,29);
insert into section_questions(section_id,`order`,question_id) values(2,10,30);
insert into section_questions(section_id,`order`,question_set_definition_id) values(2,11,4);
insert into section_questions(section_id,`order`,question_id) values(2,12,31);
insert into section_questions(section_id,`order`,question_id) values(2,13,32);
insert into section_questions(section_id,`order`,question_id) values(2,14,33);
insert into section_questions(section_id,`order`,question_id) values(2,15,34);
insert into section_questions(section_id,`order`,question_id) values(2,16,35);
insert into section_questions(section_id,`order`,question_id) values(2,17,36);
insert into section_questions(section_id,`order`,question_id) values(2,18,37);
insert into section_questions(section_id,`order`,question_id) values(2,19,38);
insert into section_questions(section_id,`order`,question_id) values(2,20,39);
insert into section_questions(section_id,`order`,question_id) values(2,21,40);
insert into section_questions(section_id,`order`,question_set_definition_id) values(2,22,5);
insert into section_questions(section_id,`order`,question_id) values(2,23,41);
insert into section_questions(section_id,`order`,question_id) values(2,24,42);
insert into section_questions(section_id,`order`,question_id) values(2,25,43);
insert into section_questions(section_id,`order`,question_id) values(2,26,44);
insert into section_questions(section_id,`order`,question_id) values(2,27,45);
insert into section_questions(section_id,`order`,question_id) values(2,28,46);
insert into section_questions(section_id,`order`,question_id) values(2,29,47);
insert into section_questions(section_id,`order`,question_id) values(2,30,48);
insert into section_questions(section_id,`order`,question_id) values(2,31,49);
insert into section_questions(section_id,`order`,question_id) values(2,32,50);
insert into section_questions(section_id,`order`,question_id) values(2,33,51);
insert into section_questions(section_id,`order`,question_id) values(2,34,52);
insert into section_questions(section_id,`order`,question_id) values(2,35,53);
insert into section_questions(section_id,`order`,question_id) values(2,36,54);
insert into section_questions(section_id,`order`,question_id) values(2,37,55);
insert into section_questions(section_id,`order`,question_id) values(2,38,56);
insert into section_questions(section_id,`order`,question_id) values(2,39,57);
insert into section_questions(section_id,`order`,question_id) values(2,40,58);
insert into section_questions(section_id,`order`,question_id) values(2,41,59);
insert into section_questions(section_id,`order`,question_id) values(2,42,60);
insert into section_questions(section_id,`order`,question_set_definition_id) values(2,43,6);


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
	   
select * from question_set;
       
update question_Set set `order` = id where id>0;      

update answer set `order` = id where id > 0;

select a.*
  from answer a
 where a.question_id = 10
   order by a.`order`;
  
select * from question_set;

insert into question_set values(11,3,20,3,11);
  
select * from answer;  
  
select a.id,a.text,a.question_id,
    @answer_rn:=case when @q_id<>a.question_id then 1 else @answer_rn+1 end as rnk,
    @q_id:=a.question_id,
 from 
   (select @answer_rn :=-1 ) ar,
   (select @q_id:=-1) qq,
   (select * from answer order by question_id,id) a;


update answer a set `order` = (select rnk from (select a.id,a.text,a.question_id,
    @answer_rn:=case when @q_id<>a.question_id then 1 else @answer_rn+1 end as rnk,
    @q_id:=a.question_id
 from 
   (select @answer_rn :=-1 ) ar,
   (select @q_id:=-1) qq,
   (select * from answer order by question_id,id) a
) ra where ra.id = a.id);   
   
select * from passage;

select * from answer;

update answer set `number` = 'a' where `order`='1';
update answer set `number` = 'b' where `order`='2';
update answer set `number` = 'c' where `order`='3';
update answer set `number` = 'd' where `order`='4';

update passage set number = id where id > 0;   

select * from question;

update question set evaluating_class = 'AudioSection1Evaluator',rendering_class='AudioSection1Renderer' where id = 20;

update question set type = 'special' where id = 20;

update question set number = id-14 where id>14;

select * from answer;

update answer set number = 'a' where mod(id,3)=0 and id>0;


    select q.id,
           q.text,
           q.number,
           q.type,
           q.evaluating_class as evaluatingClass,
           q.rendering_class as renderingClass
      from question_set qs,
           question q
     where qs.passage_id in (1,2,3)
     
       and q.id = qs.question_id
       order by qs.`order`;
       
       
select * from section_questions;       

select * From question_set_definition;

select * from question q where not exists(select 1 from answer a where a.question_id = q.id and a.correct=1);

select * from `test`;


select * from question_Set;


select * from section;

    select sq.id,
		   sq.section_id as sectionId,
           sq.question_id as questionId,
           sq.`order`,
           sq.question_set_definition_id as questionSetDefinitionId
      from section_questions sq
     where sq.section_id = 2
     order by sq.`order`;

    select q.*
      from section_questions sq,
           question q
     where sq.section_id = 2
       and q.id = question_id
     order by sq.`order`

