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


#questions for section #3;
insert into section_questions(section_id,`order`,question_id) values(3,1,61);
insert into section_questions(section_id,`order`,question_id) values(3,2,62);
insert into section_questions(section_id,`order`,question_id) values(3,3,63);
insert into section_questions(section_id,`order`,question_id) values(3,4,64);
insert into section_questions(section_id,`order`,question_id) values(3,5,65);
insert into section_questions(section_id,`order`,question_id) values(3,6,66);
insert into section_questions(section_id,`order`,question_id) values(3,7,67);
insert into section_questions(section_id,`order`,question_id) values(3,8,68);
insert into section_questions(section_id,`order`,question_id) values(3,9,69);
insert into section_questions(section_id,`order`,question_id) values(3,10,70);
insert into section_questions(section_id,`order`,question_id) values(3,11,71);
insert into section_questions(section_id,`order`,question_id) values(3,12,72);
insert into section_questions(section_id,`order`,question_id) values(3,13,73);
insert into section_questions(section_id,`order`,question_id) values(3,14,74);
insert into section_questions(section_id,`order`,question_id) values(3,15,75);
insert into section_questions(section_id,`order`,question_id) values(3,16,76);
insert into section_questions(section_id,`order`,question_id) values(3,17,77);
insert into section_questions(section_id,`order`,question_id) values(3,18,78);
insert into section_questions(section_id,`order`,question_id) values(3,19,79);
insert into section_questions(section_id,`order`,question_id) values(3,20,80);
insert into section_questions(section_id,`order`,question_id) values(3,21,81);
insert into section_questions(section_id,`order`,question_id) values(3,22,82);
insert into section_questions(section_id,`order`,question_id) values(3,23,83);
insert into section_questions(section_id,`order`,question_id) values(3,24,84);
insert into section_questions(section_id,`order`,question_id) values(3,25,85);
insert into section_questions(section_id,`order`,question_id) values(3,26,86);
insert into section_questions(section_id,`order`,question_id) values(3,27,87);

#questions for section #4;
insert into section_questions(section_id,`order`,question_id) values(4,1,88);
insert into section_questions(section_id,`order`,question_id) values(4,2,89);
insert into section_questions(section_id,`order`,question_id) values(4,3,90);
insert into section_questions(section_id,`order`,question_id) values(4,4,91);
insert into section_questions(section_id,`order`,question_id) values(4,5,92);
insert into section_questions(section_id,`order`,question_id) values(4,6,93);
insert into section_questions(section_id,`order`,question_id) values(4,7,94);
insert into section_questions(section_id,`order`,question_id) values(4,8,95);
insert into section_questions(section_id,`order`,question_id) values(4,9,96);
insert into section_questions(section_id,`order`,question_id) values(4,10,97);
insert into section_questions(section_id,`order`,question_id) values(4,11,98);
insert into section_questions(section_id,`order`,question_id) values(4,12,99);
insert into section_questions(section_id,`order`,question_id) values(4,13,100);
insert into section_questions(section_id,`order`,question_id) values(4,14,101);
insert into section_questions(section_id,`order`,question_id) values(4,15,102);
insert into section_questions(section_id,`order`,question_id) values(4,16,103);
insert into section_questions(section_id,`order`,question_id) values(4,17,104);
insert into section_questions(section_id,`order`,question_id) values(4,18,105);
insert into section_questions(section_id,`order`,question_id) values(4,19,106);
insert into section_questions(section_id,`order`,question_id) values(4,20,107);
insert into section_questions(section_id,`order`,question_id) values(4,21,108);
insert into section_questions(section_id,`order`,question_id) values(4,22,109);
insert into section_questions(section_id,`order`,question_id) values(4,23,110);
insert into section_questions(section_id,`order`,question_id) values(4,24,111);
insert into section_questions(section_id,`order`,question_id) values(4,25,112);
insert into section_questions(section_id,`order`,question_id) values(4,26,113);
insert into section_questions(section_id,`order`,question_id) values(4,27,114);
insert into section_questions(section_id,`order`,question_id) values(4,28,115);
insert into section_questions(section_id,`order`,question_id) values(4,29,116);
insert into section_questions(section_id,`order`,question_id) values(4,30,117);
insert into section_questions(section_id,`order`,question_id) values(4,31,118);
insert into section_questions(section_id,`order`,question_id) values(4,32,119);
insert into section_questions(section_id,`order`,question_id) values(4,33,120);
insert into section_questions(section_id,`order`,question_id) values(4,34,121);
insert into section_questions(section_id,`order`,question_id) values(4,35,122);
insert into section_questions(section_id,`order`,question_id) values(4,36,123);
insert into section_questions(section_id,`order`,question_id) values(4,37,124);
insert into section_questions(section_id,`order`,question_id) values(4,38,125);
insert into section_questions(section_id,`order`,question_id) values(4,39,126);
insert into section_questions(section_id,`order`,question_id) values(4,40,127);
insert into section_questions(section_id,`order`,question_id) values(4,41,128);
insert into section_questions(section_id,`order`,question_id) values(4,42,129);
insert into section_questions(section_id,`order`,question_id) values(4,43,130);
insert into section_questions(section_id,`order`,question_id) values(4,44,131);
insert into section_questions(section_id,`order`,question_id) values(4,45,132);
insert into section_questions(section_id,`order`,question_id) values(4,46,133);
insert into section_questions(section_id,`order`,question_id) values(4,47,134);
insert into section_questions(section_id,`order`,question_id) values(4,48,135);
insert into section_questions(section_id,`order`,question_id) values(4,49,136);
insert into section_questions(section_id,`order`,question_id) values(4,50,137);
insert into section_questions(section_id,`order`,question_id) values(4,51,138);
insert into section_questions(section_id,`order`,question_id) values(4,52,139);
insert into section_questions(section_id,`order`,question_id) values(4,53,140);
insert into section_questions(section_id,`order`,question_id) values(4,54,141);
insert into section_questions(section_id,`order`,question_id) values(4,55,142);

#questions for section #5;
insert into section_questions(section_id,`order`,question_id) values(5,1,143);
insert into section_questions(section_id,`order`,question_id) values(5,2,144);
insert into section_questions(section_id,`order`,question_id) values(5,3,145);
insert into section_questions(section_id,`order`,question_id) values(5,4,146);
insert into section_questions(section_id,`order`,question_id) values(5,5,147);
insert into section_questions(section_id,`order`,question_id) values(5,6,148);
insert into section_questions(section_id,`order`,question_id) values(5,7,149);
insert into section_questions(section_id,`order`,question_id) values(5,8,150);
insert into section_questions(section_id,`order`,question_id) values(5,9,151);
insert into section_questions(section_id,`order`,question_id) values(5,10,152);
insert into section_questions(section_id,`order`,question_id) values(5,11,153);
insert into section_questions(section_id,`order`,question_id) values(5,12,154);
insert into section_questions(section_id,`order`,question_id) values(5,13,155);
insert into section_questions(section_id,`order`,question_id) values(5,14,156);
insert into section_questions(section_id,`order`,question_id) values(5,15,157);
insert into section_questions(section_id,`order`,question_id) values(5,16,158);
insert into section_questions(section_id,`order`,question_id) values(5,17,159);
insert into section_questions(section_id,`order`,question_id) values(5,18,160);
insert into section_questions(section_id,`order`,question_id) values(5,19,161);
insert into section_questions(section_id,`order`,question_id) values(5,20,162);
insert into section_questions(section_id,`order`,question_id) values(5,21,163);
insert into section_questions(section_id,`order`,question_id) values(5,22,164);
insert into section_questions(section_id,`order`,question_id) values(5,23,165);
insert into section_questions(section_id,`order`,question_id) values(5,24,166);
insert into section_questions(section_id,`order`,question_id) values(5,25,167);

select * from question;

select * from section_questions where section_id = 5;


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
     where sq.section_id = 3
       and q.id = question_id
     order by sq.`order`;
     
    select q.id,
           q.text,
           q.number,
           q.type,
           q.evaluating_class as evaluatingClass,
           q.rendering_class as renderingClass
       from question q 
 where not exists
       (select 1 
          from question_set qs 
		where qs.question_id = q.id
        );


select * From question where `text` like '%#answer%';

update question set type = 'fill_blank' where `text` like '%#answer%';

update question set number = '55' where id = 182;

select  * from passage;

update passage set description ='Listen to the audio, and find appropriate English word after reading the text below.<br/><br/>He decided to steal. He saw a rich lady shopping at a road-side stall. She was wearing a necklace. Rahim went close to her, snatched it and ran away. The lady started shouting for help. When people heard the lady screaming, they chased Rahim and caught him. They grabbed him by his neck, pushed him, punched him, slapped him and beat him so much that he broke his left hand. They recovered the stolen necklace and dropped him by the roadside. People then tied him with a rope and dragged him to the police station. The lady reported the crime and police arrested him. They put him in jail. Rahim was badly hurt, his hand was broken and his left eye was swollen. He began vomiting and became unconscious. In the morning when he woke up he saw Fatima and her sisters standing outside the jail. He was very ashamed and started crying. Fatima held his hand and told him that the hospital had thrown out their mother because he failed to pay the remaining money. Rahim started crying and fell down on the floor. He knew that Waheeda would die if she found out that police had arrested him and his daughters would never forgive him for letting their mother die.'
 where id = 3;

select * from answer where question_id = 20;

delete from answer where question_id = 20;

insert into answer(text,correct,question_id) values('decided,steal,snatched,lady,chased,grabbed,beat,dropped,dragged,crime,unconscious,ashamed,failed,remaining,forgive',1,20);

select * from section_questions where section_id = 3;

select * From section;

update section set evaluatingClass = 'SectionOneEvaluator',timeLimit = 900 where id = 1;
update section set evaluatingClass = 'SectionTwoEvaluator',timeLimit = 1320 where id = 2;
update section set evaluatingClass = 'SectionThreeEvaluator',timeLimit = 600 where id = 3;
update section set evaluatingClass = 'SectionFourEvaluator',timeLimit = 1200 where id = 4;
update section set evaluatingClass = 'SectionFiveEvaluator',timeLimit = 840 where id = 5;

select * from test_attempt_analytics;

select * from test_attempt;

select id,
       date,
       test_id as testId,
       overall_grade as overallGrade,
       communication_grade as communicationGrade,
       comprehension_grade as comprehensionGrade
  from test_attempt
 where user_id = 5;  
  

delete from test_attempt;

update question set evaluating_class = 'FillInTheBlankEvaluator' where type='fill_blank';

select * from question;

select * from answer where question_id = 20;

update question set text = 'Enter the english words in the text area below separated by comma(,) ' where id = 20;

select * from question q where not exists (select 1 from answer a where a.question_id = q.id);

insert into answer(text,correct,question_id) values('living,want to',1,144);
insert into answer(text,correct,question_id) values('lived,were,saw,had been',1,150);
insert into answer(text,correct,question_id) values('felt,decided,left,came',1,154);
insert into answer(text,correct,question_id) values('was listening,rememberd,had asked',1,162);
insert into answer(text,correct,question_id) values('the,the,the,a,the,the,the,an,a,a',1,167);

update question set text = '' where id = 167;

select * from question where id >=21 order by id;

select * from question_attribute;



delete from question_attribute;

insert into question_attribute(question_id,attribute,value) values(21,'topic','Preposition');

insert into question_attribute(question_id,attribute,`value`) values(100,'topic','Preposition');


#script to populate question attribute
insert into question_attribute(question_id,attribute,value) values(22,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(23,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(24,'topic','Preposition');
insert into question_attribute(question_id,attribute,value) values(25,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(26,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(27,'topic','Preposition');
insert into question_attribute(question_id,attribute,value) values(28,'topic','Preposition');
insert into question_attribute(question_id,attribute,value) values(29,'topic','Preposition');
insert into question_attribute(question_id,attribute,value) values(30,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(31,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(32,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(33,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(34,'topic','Preposition');
insert into question_attribute(question_id,attribute,value) values(35,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(36,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(37,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(38,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(39,'topic','Preposition');
insert into question_attribute(question_id,attribute,value) values(40,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(41,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(42,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(43,'topic','Preposition');
insert into question_attribute(question_id,attribute,value) values(44,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(45,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(46,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(47,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(48,'topic','Preposition');
insert into question_attribute(question_id,attribute,value) values(49,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(50,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(51,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(52,'topic','Preposition');
insert into question_attribute(question_id,attribute,value) values(53,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(54,'topic','Preposition');
insert into question_attribute(question_id,attribute,value) values(55,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(56,'topic','Preposition');
insert into question_attribute(question_id,attribute,value) values(57,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(58,'topic','Preposition');
insert into question_attribute(question_id,attribute,value) values(59,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(60,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(61,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(62,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(63,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(64,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(65,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(66,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(67,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(68,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(69,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(70,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(71,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(72,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(73,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(74,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(75,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(76,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(77,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(78,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(79,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(80,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(81,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(82,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(83,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(84,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(85,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(86,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(87,'topic','Pronouns');
insert into question_attribute(question_id,attribute,value) values(88,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(89,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(90,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(91,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(92,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(93,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(94,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(95,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(96,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(97,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(98,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(99,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(100,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(101,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(102,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(103,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(104,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(105,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(106,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(107,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(108,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(109,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(110,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(111,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(112,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(113,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(114,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(115,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(116,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(117,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(118,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(119,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(120,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(121,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(122,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(123,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(124,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(125,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(126,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(127,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(128,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(129,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(130,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(131,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(132,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(133,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(134,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(135,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(136,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(137,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(138,'topic','Modals');
insert into question_attribute(question_id,attribute,value) values(139,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(140,'topic','Quantifiers');
insert into question_attribute(question_id,attribute,value) values(141,'topic','SVA');
insert into question_attribute(question_id,attribute,value) values(142,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(143,'topic','Gerund');
insert into question_attribute(question_id,attribute,value) values(144,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(145,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(146,'topic','Gerund');
insert into question_attribute(question_id,attribute,value) values(147,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(148,'topic','Gerund');
insert into question_attribute(question_id,attribute,value) values(149,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(150,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(151,'topic','Gerund');
insert into question_attribute(question_id,attribute,value) values(152,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(153,'topic','Gerund');
insert into question_attribute(question_id,attribute,value) values(154,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(155,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(156,'topic','Gerund');
insert into question_attribute(question_id,attribute,value) values(157,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(158,'topic','Gerund');
insert into question_attribute(question_id,attribute,value) values(159,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(160,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(161,'topic','Gerund');
insert into question_attribute(question_id,attribute,value) values(162,'topic','Tenses');
insert into question_attribute(question_id,attribute,value) values(163,'topic','Gerund');
insert into question_attribute(question_id,attribute,value) values(164,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(165,'topic','Gerund');
insert into question_attribute(question_id,attribute,value) values(166,'topic','Conjunction');
insert into question_attribute(question_id,attribute,value) values(167,'topic','Article');
insert into question_attribute(question_id,attribute,value) values(168,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(169,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(170,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(171,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(172,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(173,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(174,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(175,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(176,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(177,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(178,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(179,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(180,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(181,'topic','Verbs');
insert into question_attribute(question_id,attribute,value) values(182,'topic','Verbs');