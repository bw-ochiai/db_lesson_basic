Q1
  create table departments(
       department_id int unsigned auto_increment primary key,
       name varchar(20) not null,
       created_at timestamp default current_timestamp,
       updated_at timestamp default current_timestamp on update current_timestamp
       );

Q2
  alter table people add department_id int unsigned after email;

Q3
  insert into departments (name)
    -> values
    -> ('営業'),
    -> ('開発'),
    -> ('経理'),
    -> ('人事'),
    -> ('情報システム');

  insert into people (name, email, age, gender)
    -> values
    -> ('御茶柱たつみ','ochabashira@beyond-works.co.jp',28,2),
    -> ('溢咲えみ','ahurezaki@beyond-works.co.jp',17,2),
    -> ('銀木らぎん','ging@beyond-works.co.jp',21,1),
    -> ('月欠みちる','tsukikake@beyond-works.co.jp',23,1),
    -> ('憶録しるる','shiruru@beyond-works.co.jp',49,1),
    -> ('樹月まお','mao@beyond-works.co.jp',35,2),
    -> ('零一はじめ','zeroichi@beyond-works.co.jp',30,1),
    -> ('天心すばり','tenshin@beyond-works.co.jp',88,1),
    -> ('無量ただつね','muryou@beyond-works.co.jp',77,1),
    -> ('千鈴かざね','kazane@beyond-works.co.jp',38,2);

  insert into reports (person_id, content)
    -> values
    ->  (7,'森の中で熊さんに出会った'),
    -> (7,'花咲く森の道で熊さんに出会った'),
    -> (8,'その熊さんが言うには'),
    -> (9,'それを聞いてから一体何のことを言ってるか分からなかったが'),
    -> (9,'ただひたすら全速力でその場を離れようと走った'),
    -> (10,'ふと走りながら、熊が喋るなんてあり得るのかと思った'),
    -> (10,'100m走ったあたりで後ろを振り返ると'),
    -> (11,'さっきの熊さんが獲物を狩る眼光で駆けてくるではありませんか'),
    -> (11,'お嬢さん待ちなさいと、'),
    -> (12,'その熊さんが息切れ切れになりながらも近づいてくる'),
    -> (12,'もう駄目だと餌になる覚悟を決めた彼女だが'),
    -> (13,'彼女の肩にソフトタッチで触れて'),
    -> (13,'ほらこれお嬢さんが落としたものだろうと言う'),
    -> (14,'熊さんの手を見ると、彼女が大切に保管していたはずの白い粉が'),
    -> (14,'さっき走った時に落としたんだわと彼女は察した'),
    -> (15,'少し前からこの辺りに警察がうろついていると、熊さんが言う'),
    -> (15,'危うくお縄につく所だった彼女は熊さんに感謝を言う'),
    -> (16,'彼女は最高にハイになりながら歌った'),
    -> (16,'ララララララララララ'); 

Q4
  update people set department_id =1 where 7 <= person_id and (age < 30 or 80 <= age) AND gender != 2;
  update people set department_id =2 where 7 <= person_id and gender = 2;
  update people set department_id =3 where 7 <= person_id and age between 30 and 40 AND gender != 2;
  update people set department_id =4 where 7 <= person_id and name like '%ね' AND gender != 2;
  update people set department_id =5 where 7 <= person_id and age between 40 and 50 AND gender != 2;


Q5
  select name, age  from people where gender=1 order by age desc;

Q6
  peopleテーブル内のレコードが作製された日時の昇順で営業を対象に名前,メールアドレス,年齢の３つのカラムを取得しようとしている。

Q7
  select name from people where (age between 20 and 30 and gender=2) or (age between 40 and 50 and gender=1);

Q8
  select name from people where department_id=1 order by age;   

Q9
  select avg(age) as average_age from people  where department_id=2;

Q10
  select p.name,d.name,r.content from people p join reports r using (person_id) join departments d using (department_id) where p.name is null;

Q11
  select name from people left join reports using(person_id) where content is null;