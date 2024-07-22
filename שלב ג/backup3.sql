prompt PL/SQL Developer import file
prompt Created on יום שלישי 23 יולי 2024 by This_user
set feedback off
set define off
prompt Creating COSTUMER...
create table COSTUMER
(
  id_sender NUMBER(3) not null,
  email     VARCHAR2(15),
  phone     NUMBER(10) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COSTUMER
  add primary key (ID_SENDER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references, alter, index on COSTUMER to MORIA;

prompt Creating APPOINTMENTS...
create table APPOINTMENTS
(
  app_date  DATE not null,
  appid     NUMBER(3) not null,
  lengthapp NUMBER(2) default 5 not null,
  id_sender NUMBER(3) not null,
  wid       NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table APPOINTMENTS
  add primary key (APPID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table APPOINTMENTS
  add foreign key (ID_SENDER)
  references COSTUMER (ID_SENDER);

prompt Creating CITY...
create table CITY
(
  cityname VARCHAR2(15) not null,
  citynum  NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CITY
  add primary key (CITYNUM)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references, alter, index on CITY to MORIA;

prompt Creating CREDIT_RESULTS_TEMP...
create global temporary table CREDIT_RESULTS_TEMP
(
  packageid  NUMBER,
  customerid NUMBER,
  price      NUMBER
)
on commit delete rows;

prompt Creating JOB...
create table JOB
(
  jobnum              NUMBER(2) not null,
  jobname             VARCHAR2(15) not null,
  hourorpackagesalary FLOAT not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table JOB
  add primary key (JOBNUM)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table JOB
  add constraint UNIQUE_JOBNAME unique (JOBNAME)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references, alter, index on JOB to MORIA;

prompt Creating ORDERSTATUS...
create table ORDERSTATUS
(
  statusnum   NUMBER(3) not null,
  statusname  VARCHAR2(15) not null,
  chronoorder NUMBER(1) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERSTATUS
  add primary key (STATUSNUM)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references, alter, index on ORDERSTATUS to MORIA;

prompt Creating STREET...
create table STREET
(
  streetnum  NUMBER(3) not null,
  streetname VARCHAR2(15) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STREET
  add primary key (STREETNUM)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references, alter, index on STREET to MORIA;

prompt Creating PACKAGES...
create table PACKAGES
(
  idpackege      NUMBER(4) not null,
  deliveryphone  NUMBER(10) not null,
  recipientname  VARCHAR2(15),
  weight         FLOAT,
  packsize       FLOAT,
  price          FLOAT default 5,
  buildingnumber NUMBER(2) not null,
  housenumber    NUMBER(2),
  id_sender      NUMBER(3) not null,
  wid            NUMBER(3) not null,
  streetnum      NUMBER(3) not null,
  is_split       NUMBER default 0,
  is_splitable   NUMBER default 0
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PACKAGES
  add primary key (IDPACKEGE)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PACKAGES
  add foreign key (ID_SENDER)
  references COSTUMER (ID_SENDER);
alter table PACKAGES
  add foreign key (STREETNUM)
  references STREET (STREETNUM);
alter table PACKAGES
  add constraint CHK_WEIGHT_POSITIVE
  check (weight >= 0);
grant select, insert, update, delete, references, alter, index on PACKAGES to MORIA;

prompt Creating TRACKINGSHIPMENTS...
create table TRACKINGSHIPMENTS
(
  idtracship   NUMBER(3) not null,
  orderdate    DATE not null,
  sortdate     DATE,
  sendingdate  DATE,
  deliverydate DATE,
  statusnum    NUMBER(3) default 1 not null,
  idpackege    NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRACKINGSHIPMENTS
  add primary key (IDTRACSHIP)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRACKINGSHIPMENTS
  add foreign key (STATUSNUM)
  references ORDERSTATUS (STATUSNUM);
alter table TRACKINGSHIPMENTS
  add foreign key (IDPACKEGE)
  references PACKAGES (IDPACKEGE);
grant select, insert, update, delete, references, alter, index on TRACKINGSHIPMENTS to MORIA;

prompt Creating WORKERS...
create table WORKERS
(
  wid       NUMBER(3) not null,
  firstname VARCHAR2(15) not null,
  lastname  VARCHAR2(15) not null,
  email     VARCHAR2(15),
  phone     NUMBER(10) not null,
  jobnum    NUMBER(2) not null,
  citynum   NUMBER(3),
  streetnum NUMBER(3),
  bonus     FLOAT,
  workhours FLOAT
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKERS
  add primary key (WID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKERS
  add foreign key (JOBNUM)
  references JOB (JOBNUM);
alter table WORKERS
  add foreign key (STREETNUM)
  references STREET (STREETNUM);
grant select, insert, update, delete, references, alter, index on WORKERS to MORIA;

prompt Disabling triggers for COSTUMER...
alter table COSTUMER disable all triggers;
prompt Disabling triggers for APPOINTMENTS...
alter table APPOINTMENTS disable all triggers;
prompt Disabling triggers for CITY...
alter table CITY disable all triggers;
prompt Disabling triggers for CREDIT_RESULTS_TEMP...
alter table CREDIT_RESULTS_TEMP disable all triggers;
prompt Disabling triggers for JOB...
alter table JOB disable all triggers;
prompt Disabling triggers for ORDERSTATUS...
alter table ORDERSTATUS disable all triggers;
prompt Disabling triggers for STREET...
alter table STREET disable all triggers;
prompt Disabling triggers for PACKAGES...
alter table PACKAGES disable all triggers;
prompt Disabling triggers for TRACKINGSHIPMENTS...
alter table TRACKINGSHIPMENTS disable all triggers;
prompt Disabling triggers for WORKERS...
alter table WORKERS disable all triggers;
prompt Disabling foreign key constraints for APPOINTMENTS...
alter table APPOINTMENTS disable constraint SYS_C007491;
prompt Disabling foreign key constraints for PACKAGES...
alter table PACKAGES disable constraint SYS_C007514;
alter table PACKAGES disable constraint SYS_C007515;
prompt Disabling foreign key constraints for TRACKINGSHIPMENTS...
alter table TRACKINGSHIPMENTS disable constraint SYS_C007522;
alter table TRACKINGSHIPMENTS disable constraint SYS_C007523;
prompt Disabling foreign key constraints for WORKERS...
alter table WORKERS disable constraint SYS_C007530;
alter table WORKERS disable constraint SYS_C007531;
prompt Deleting WORKERS...
delete from WORKERS;
commit;
prompt Deleting TRACKINGSHIPMENTS...
delete from TRACKINGSHIPMENTS;
commit;
prompt Deleting PACKAGES...
delete from PACKAGES;
commit;
prompt Deleting STREET...
delete from STREET;
commit;
prompt Deleting ORDERSTATUS...
delete from ORDERSTATUS;
commit;
prompt Deleting JOB...
delete from JOB;
commit;
prompt Deleting CREDIT_RESULTS_TEMP...
delete from CREDIT_RESULTS_TEMP;
commit;
prompt Deleting CITY...
delete from CITY;
commit;
prompt Deleting APPOINTMENTS...
delete from APPOINTMENTS;
commit;
prompt Deleting COSTUMER...
delete from COSTUMER;
commit;
prompt Loading COSTUMER...
insert into COSTUMER (id_sender, email, phone)
values (1, 'mmerchant@ubp.e', 544138119);
insert into COSTUMER (id_sender, email, phone)
values (2, 'cliff.c@adeasol', 563271722);
insert into COSTUMER (id_sender, email, phone)
values (3, 'gord@ipsadvisor', 569345597);
insert into COSTUMER (id_sender, email, phone)
values (4, 'hazel.shatner@i', 565195112);
insert into COSTUMER (id_sender, email, phone)
values (5, 'bette.coburn@gr', 551337459);
insert into COSTUMER (id_sender, email, phone)
values (6, 'giovanni.chesnu', 579484482);
insert into COSTUMER (id_sender, email, phone)
values (7, 'robin.d@ams.de', 585856744);
insert into COSTUMER (id_sender, email, phone)
values (8, 'morgan.danes@an', 525258858);
insert into COSTUMER (id_sender, email, phone)
values (9, 'norm.dooley@clu', 539546635);
insert into COSTUMER (id_sender, email, phone)
values (10, 'nicholas.yorn@s', 511837721);
insert into COSTUMER (id_sender, email, phone)
values (11, 'rodney@cascadeb', 556824364);
insert into COSTUMER (id_sender, email, phone)
values (12, 'carole.wopat@ex', 555892361);
insert into COSTUMER (id_sender, email, phone)
values (13, 'vivicac@aldensy', 578776683);
insert into COSTUMER (id_sender, email, phone)
values (14, 'drew.piven@ogio', 514459673);
insert into COSTUMER (id_sender, email, phone)
values (15, 'emma.p@mms.uk', 519117782);
insert into COSTUMER (id_sender, email, phone)
values (16, 'm.brolin@timevi', 531175868);
insert into COSTUMER (id_sender, email, phone)
values (17, 'patty.allison@g', 566113417);
insert into COSTUMER (id_sender, email, phone)
values (18, 'm.raitt@procter', 595685832);
insert into COSTUMER (id_sender, email, phone)
values (19, 'tracy.keitel@nr', 577469859);
insert into COSTUMER (id_sender, email, phone)
values (20, 'alc@ach.com', 566517274);
insert into COSTUMER (id_sender, email, phone)
values (21, 'vickie.pesci@di', 511447327);
insert into COSTUMER (id_sender, email, phone)
values (22, 'christopher@gag', 546735239);
insert into COSTUMER (id_sender, email, phone)
values (23, 'austin.suchet@l', 568665799);
insert into COSTUMER (id_sender, email, phone)
values (24, 'brad.stevenson@', 587866322);
insert into COSTUMER (id_sender, email, phone)
values (25, 'victoria.tate@a', 598928481);
insert into COSTUMER (id_sender, email, phone)
values (26, 'salma.smurfit@d', 517524775);
insert into COSTUMER (id_sender, email, phone)
values (27, 'jerry.c@scherin', 593838711);
insert into COSTUMER (id_sender, email, phone)
values (28, 'renel@generalel', 556268995);
insert into COSTUMER (id_sender, email, phone)
values (29, 's.diaz@ceom.com', 544149647);
insert into COSTUMER (id_sender, email, phone)
values (30, 'oro.m@ahl.com', 572115461);
insert into COSTUMER (id_sender, email, phone)
values (31, 'maxine.dalton@e', 594368185);
insert into COSTUMER (id_sender, email, phone)
values (32, 'jean.w@kiamotor', 578267173);
insert into COSTUMER (id_sender, email, phone)
values (33, 'garry.aiken@uni', 528118617);
insert into COSTUMER (id_sender, email, phone)
values (34, 'roger.mcdowell@', 596621845);
insert into COSTUMER (id_sender, email, phone)
values (35, 'i.wainwright@hc', 545234173);
insert into COSTUMER (id_sender, email, phone)
values (36, 'breckin@egroup.', 598262421);
insert into COSTUMER (id_sender, email, phone)
values (37, 'nastassja.colem', 523184712);
insert into COSTUMER (id_sender, email, phone)
values (38, 'patty.stiller@b', 514756557);
insert into COSTUMER (id_sender, email, phone)
values (39, 'v.klugh@oss.com', 574434764);
insert into COSTUMER (id_sender, email, phone)
values (40, 'juice.w@northhi', 528943176);
insert into COSTUMER (id_sender, email, phone)
values (41, 'twillis@bestbuy', 571749827);
insert into COSTUMER (id_sender, email, phone)
values (42, 'ann.p@limitedbr', 568248741);
insert into COSTUMER (id_sender, email, phone)
values (43, 'davis.weber@nbs', 523154619);
insert into COSTUMER (id_sender, email, phone)
values (44, 'geoff.cumming@a', 538923593);
insert into COSTUMER (id_sender, email, phone)
values (45, 'nik.vai@hershey', 559845564);
insert into COSTUMER (id_sender, email, phone)
values (46, 'donald.brooke@g', 532288454);
insert into COSTUMER (id_sender, email, phone)
values (47, 'miki.bratt@dora', 589342323);
insert into COSTUMER (id_sender, email, phone)
values (48, 'morgan.duvall@i', 552119765);
insert into COSTUMER (id_sender, email, phone)
values (49, 'hugh.kadison@sm', 569739879);
insert into COSTUMER (id_sender, email, phone)
values (50, 'domingo.a@smi.m', 554111379);
insert into COSTUMER (id_sender, email, phone)
values (51, 'connie@infopros', 553314437);
insert into COSTUMER (id_sender, email, phone)
values (52, 'zooey@hfn.com', 588939365);
insert into COSTUMER (id_sender, email, phone)
values (53, 'd.kirkwood@worl', 525555691);
insert into COSTUMER (id_sender, email, phone)
values (54, 'nile.b@mathis.b', 589119241);
insert into COSTUMER (id_sender, email, phone)
values (55, 'clintd@als.ca', 549793348);
insert into COSTUMER (id_sender, email, phone)
values (56, 'jodiel@exinomte', 597572676);
insert into COSTUMER (id_sender, email, phone)
values (57, 'lindsey.walker@', 537324594);
insert into COSTUMER (id_sender, email, phone)
values (58, 'l.delta@bioanal', 538989634);
insert into COSTUMER (id_sender, email, phone)
values (59, 'h.caldwell@mag.', 512957866);
insert into COSTUMER (id_sender, email, phone)
values (60, 'pierce.gilliam@', 527113932);
insert into COSTUMER (id_sender, email, phone)
values (61, 'suzym@americane', 576642167);
insert into COSTUMER (id_sender, email, phone)
values (62, 'jeroen.g@viacel', 523891723);
insert into COSTUMER (id_sender, email, phone)
values (63, 'brendanh@privat', 599783246);
insert into COSTUMER (id_sender, email, phone)
values (64, 'javon.david@gra', 592519497);
insert into COSTUMER (id_sender, email, phone)
values (65, 'robert.t@tastef', 577492176);
insert into COSTUMER (id_sender, email, phone)
values (66, 'n.paul@allegian', 563653227);
insert into COSTUMER (id_sender, email, phone)
values (67, 'selmat@advertis', 573253288);
insert into COSTUMER (id_sender, email, phone)
values (68, 'merillee@invisi', 553733863);
insert into COSTUMER (id_sender, email, phone)
values (69, 'jason.goldberg@', 561821163);
insert into COSTUMER (id_sender, email, phone)
values (70, 'pete.stowe@sear', 529589735);
insert into COSTUMER (id_sender, email, phone)
values (71, 'alana.lucien@su', 544224789);
insert into COSTUMER (id_sender, email, phone)
values (72, 'genam@actechnol', 571159844);
insert into COSTUMER (id_sender, email, phone)
values (73, 'rebecca.ramirez', 557754653);
insert into COSTUMER (id_sender, email, phone)
values (74, 'odedm@faef.com', 588577184);
insert into COSTUMER (id_sender, email, phone)
values (75, 'rebecca@aventis', 559553828);
insert into COSTUMER (id_sender, email, phone)
values (76, 'rod.perry@jma.c', 549775915);
insert into COSTUMER (id_sender, email, phone)
values (77, 'dermot.rankin@p', 529884947);
insert into COSTUMER (id_sender, email, phone)
values (78, 'rachel.osment@y', 577278559);
insert into COSTUMER (id_sender, email, phone)
values (79, 'remy.tarantino@', 598495279);
insert into COSTUMER (id_sender, email, phone)
values (80, 'betted@shar.com', 534795619);
insert into COSTUMER (id_sender, email, phone)
values (81, 'barry.underwood', 565297799);
insert into COSTUMER (id_sender, email, phone)
values (82, 'matthews@marlab', 526164272);
insert into COSTUMER (id_sender, email, phone)
values (83, 'teena.r@vspan.u', 582342326);
insert into COSTUMER (id_sender, email, phone)
values (84, 'krish@capitolba', 561227362);
insert into COSTUMER (id_sender, email, phone)
values (85, 'donalc@fmt.fr', 535852462);
insert into COSTUMER (id_sender, email, phone)
values (86, 'scottg@colgatep', 582935637);
insert into COSTUMER (id_sender, email, phone)
values (87, 'joy.odonnell@bl', 592812186);
insert into COSTUMER (id_sender, email, phone)
values (88, 'wcooper@homedep', 599395427);
insert into COSTUMER (id_sender, email, phone)
values (89, 'w.oneill@nsd.de', 575573798);
insert into COSTUMER (id_sender, email, phone)
values (90, 'rhona.gere@pula', 566172472);
insert into COSTUMER (id_sender, email, phone)
values (91, 'sean.deejay@pri', 592389933);
insert into COSTUMER (id_sender, email, phone)
values (92, 'sissy.bragg@acs', 555454247);
insert into COSTUMER (id_sender, email, phone)
values (93, 'patty@hps.pl', 535641491);
insert into COSTUMER (id_sender, email, phone)
values (94, 'marylouise@mwp.', 572443467);
insert into COSTUMER (id_sender, email, phone)
values (95, 'naomi.snipes@in', 512229977);
insert into COSTUMER (id_sender, email, phone)
values (96, 'olympia.root@ve', 594134275);
insert into COSTUMER (id_sender, email, phone)
values (97, 'larry.gagnon@ly', 546382968);
insert into COSTUMER (id_sender, email, phone)
values (98, 'doug.belle@prin', 539832383);
insert into COSTUMER (id_sender, email, phone)
values (99, 'adina.hedaya@po', 572513451);
insert into COSTUMER (id_sender, email, phone)
values (100, 'joaquim.mitra@l', 586978236);
commit;
prompt 100 records committed...
insert into COSTUMER (id_sender, email, phone)
values (101, 'm.reubens@atase', 526975718);
insert into COSTUMER (id_sender, email, phone)
values (102, 'rebeka.m@signat', 539854588);
insert into COSTUMER (id_sender, email, phone)
values (103, 'rdayne@jewettca', 579555727);
insert into COSTUMER (id_sender, email, phone)
values (104, 'carrie.fishburn', 532215358);
insert into COSTUMER (id_sender, email, phone)
values (105, 'g.leguizamo@ele', 561262351);
insert into COSTUMER (id_sender, email, phone)
values (106, 'timothy.lupone@', 512863186);
insert into COSTUMER (id_sender, email, phone)
values (107, 'christmas@mre.u', 552986994);
insert into COSTUMER (id_sender, email, phone)
values (108, 'chelyw@vspan.co', 591555495);
insert into COSTUMER (id_sender, email, phone)
values (109, 'zooeyd@usdairyp', 518463619);
insert into COSTUMER (id_sender, email, phone)
values (110, 'c.rollins@unite', 528312884);
insert into COSTUMER (id_sender, email, phone)
values (111, 'julie.page@link', 564719123);
insert into COSTUMER (id_sender, email, phone)
values (112, 'spencer.harper@', 583828812);
insert into COSTUMER (id_sender, email, phone)
values (113, 'meryl.evanswood', 566897498);
insert into COSTUMER (id_sender, email, phone)
values (114, 'tia.buckingham@', 527529389);
insert into COSTUMER (id_sender, email, phone)
values (115, 'courtney.wong@g', 551188495);
insert into COSTUMER (id_sender, email, phone)
values (116, 'andy.callow@int', 567253533);
insert into COSTUMER (id_sender, email, phone)
values (117, 'dianea@kmart.co', 557323551);
insert into COSTUMER (id_sender, email, phone)
values (118, 'cate.n@cns.com', 515135263);
insert into COSTUMER (id_sender, email, phone)
values (119, 'ellen.reno@newt', 549511455);
insert into COSTUMER (id_sender, email, phone)
values (120, 'a.eatworld@cata', 564451423);
insert into COSTUMER (id_sender, email, phone)
values (121, 'kennyd@aventis.', 537976916);
insert into COSTUMER (id_sender, email, phone)
values (122, 'roy@kellogg.jp', 596522319);
insert into COSTUMER (id_sender, email, phone)
values (123, 'stewart.saintem', 563266832);
insert into COSTUMER (id_sender, email, phone)
values (124, 'jackson.broadbe', 578229513);
insert into COSTUMER (id_sender, email, phone)
values (125, 'kierand@globalw', 598286254);
insert into COSTUMER (id_sender, email, phone)
values (126, 'carole.bugnon@p', 531815946);
insert into COSTUMER (id_sender, email, phone)
values (127, 'dhudson@extreme', 546136891);
insert into COSTUMER (id_sender, email, phone)
values (128, 'shannyn.c@white', 573411769);
insert into COSTUMER (id_sender, email, phone)
values (129, 'rachid.lizzy@sc', 522667472);
insert into COSTUMER (id_sender, email, phone)
values (130, 'lydia.elliott@n', 592446372);
insert into COSTUMER (id_sender, email, phone)
values (131, 'jeffrey.richter', 548844232);
insert into COSTUMER (id_sender, email, phone)
values (132, 'anjelica@pharma', 598399532);
insert into COSTUMER (id_sender, email, phone)
values (133, 'edie.carradine@', 527944453);
insert into COSTUMER (id_sender, email, phone)
values (134, 'toshiroi@teoco.', 538259772);
insert into COSTUMER (id_sender, email, phone)
values (135, 'michael@scripne', 587525874);
insert into COSTUMER (id_sender, email, phone)
values (136, 'sdicaprio@horiz', 538558195);
insert into COSTUMER (id_sender, email, phone)
values (137, 'andrew.buffalo@', 526789578);
insert into COSTUMER (id_sender, email, phone)
values (138, 'a.quinn@veritek', 572641124);
insert into COSTUMER (id_sender, email, phone)
values (139, 'milla.schwimmer', 527815463);
insert into COSTUMER (id_sender, email, phone)
values (140, 'trey.harrelson@', 575227595);
insert into COSTUMER (id_sender, email, phone)
values (141, 'gino.cruise@sds', 586715642);
insert into COSTUMER (id_sender, email, phone)
values (142, 'michael.hartnet', 589881978);
insert into COSTUMER (id_sender, email, phone)
values (143, 'lucy.close@mona', 555433735);
insert into COSTUMER (id_sender, email, phone)
values (144, 'bnunn@atg.nl', 555177598);
insert into COSTUMER (id_sender, email, phone)
values (145, 'v.hawthorne@mar', 557793218);
insert into COSTUMER (id_sender, email, phone)
values (146, 'joaquim@lloydgr', 533712327);
insert into COSTUMER (id_sender, email, phone)
values (147, 'janev@pharmacia', 565765591);
insert into COSTUMER (id_sender, email, phone)
values (148, 'trini.morrison@', 585631341);
insert into COSTUMER (id_sender, email, phone)
values (149, 'sarah.breslin@s', 522639138);
insert into COSTUMER (id_sender, email, phone)
values (150, 'trinik@irissoft', 582962255);
insert into COSTUMER (id_sender, email, phone)
values (151, 'forest.kapanka@', 597344578);
insert into COSTUMER (id_sender, email, phone)
values (152, 'lance.c@philipm', 545129491);
insert into COSTUMER (id_sender, email, phone)
values (153, 'carla.gugino@ca', 595287479);
insert into COSTUMER (id_sender, email, phone)
values (154, 'adina@summitene', 536982919);
insert into COSTUMER (id_sender, email, phone)
values (155, 'boyd.f@elmco.co', 512949492);
insert into COSTUMER (id_sender, email, phone)
values (156, 'vendetta.g@ogi.', 515759796);
insert into COSTUMER (id_sender, email, phone)
values (157, 'terry@employers', 558922155);
insert into COSTUMER (id_sender, email, phone)
values (158, 'b.eckhart@dataw', 591595233);
insert into COSTUMER (id_sender, email, phone)
values (159, 'chet.rucker@gen', 514236266);
insert into COSTUMER (id_sender, email, phone)
values (160, 'nik.conway@spd.', 578265917);
insert into COSTUMER (id_sender, email, phone)
values (161, 'jack.secada@gra', 545397899);
insert into COSTUMER (id_sender, email, phone)
values (162, 'junior@nsd.ca', 582321524);
insert into COSTUMER (id_sender, email, phone)
values (163, 'edward.r@dbprof', 559256691);
insert into COSTUMER (id_sender, email, phone)
values (164, 'roscoe@hfn.dk', 548437385);
insert into COSTUMER (id_sender, email, phone)
values (165, 'madeline.collie', 511722238);
insert into COSTUMER (id_sender, email, phone)
values (166, 'randall.walsh@s', 536159165);
insert into COSTUMER (id_sender, email, phone)
values (167, 'brothers@waltdi', 539994639);
insert into COSTUMER (id_sender, email, phone)
values (168, 'm.kretschmann@a', 569325325);
insert into COSTUMER (id_sender, email, phone)
values (169, 'thora.lillard@p', 584789454);
insert into COSTUMER (id_sender, email, phone)
values (170, 'robint@insurmar', 598979786);
insert into COSTUMER (id_sender, email, phone)
values (171, 'loretta.travers', 585684816);
insert into COSTUMER (id_sender, email, phone)
values (172, 'rwong@bristolmy', 549254184);
insert into COSTUMER (id_sender, email, phone)
values (173, 'nicole.s@mainst', 578562611);
insert into COSTUMER (id_sender, email, phone)
values (174, 'shawn.garofalo@', 539789855);
insert into COSTUMER (id_sender, email, phone)
values (175, 'orlando.quinn@e', 554832429);
insert into COSTUMER (id_sender, email, phone)
values (176, 'morris.roundtre', 533281362);
insert into COSTUMER (id_sender, email, phone)
values (177, 'hgrier@spd.de', 584894748);
insert into COSTUMER (id_sender, email, phone)
values (178, 'bernard.law@ins', 562625453);
insert into COSTUMER (id_sender, email, phone)
values (179, 'mariaw@digitalm', 569995485);
insert into COSTUMER (id_sender, email, phone)
values (180, 'rufus.michael@c', 554921391);
insert into COSTUMER (id_sender, email, phone)
values (181, 'johnny.t@ntas.n', 592115278);
insert into COSTUMER (id_sender, email, phone)
values (182, 'lucy.tippe@conq', 593165128);
insert into COSTUMER (id_sender, email, phone)
values (183, 'glynne@alohanys', 596677376);
insert into COSTUMER (id_sender, email, phone)
values (184, 'wade.harper@mat', 528259799);
insert into COSTUMER (id_sender, email, phone)
values (185, 'cfavreau@ciwser', 558385926);
insert into COSTUMER (id_sender, email, phone)
values (186, 'v.slater@coadva', 585461377);
insert into COSTUMER (id_sender, email, phone)
values (187, 'sylvester@stone', 567797483);
insert into COSTUMER (id_sender, email, phone)
values (188, 'h.sandler@lms.a', 598989141);
insert into COSTUMER (id_sender, email, phone)
values (189, 'arturo.raybon@c', 576467494);
insert into COSTUMER (id_sender, email, phone)
values (190, 'nanci.d@smartro', 569257956);
insert into COSTUMER (id_sender, email, phone)
values (191, 'r.feuerstein@vi', 564691969);
insert into COSTUMER (id_sender, email, phone)
values (192, 'rawlins.rispoli', 566364976);
insert into COSTUMER (id_sender, email, phone)
values (193, 'clay@teamstudio', 514448314);
insert into COSTUMER (id_sender, email, phone)
values (194, 'karen.kretschma', 543689542);
insert into COSTUMER (id_sender, email, phone)
values (195, 'kristin.skarsga', 529829661);
insert into COSTUMER (id_sender, email, phone)
values (196, 'tony.mccoy@typh', 538544769);
insert into COSTUMER (id_sender, email, phone)
values (197, 'gordon.rundgren', 588988719);
insert into COSTUMER (id_sender, email, phone)
values (198, 'jodie@stmarylan', 514722137);
insert into COSTUMER (id_sender, email, phone)
values (199, 'judy.hidalgo@pf', 532487315);
insert into COSTUMER (id_sender, email, phone)
values (200, 'sal.sossamon@pu', 576112487);
commit;
prompt 200 records committed...
insert into COSTUMER (id_sender, email, phone)
values (201, 'beverley.llewel', 546519554);
insert into COSTUMER (id_sender, email, phone)
values (202, 'b.stewart@everg', 599232556);
insert into COSTUMER (id_sender, email, phone)
values (203, 'david.wiest@web', 511359638);
insert into COSTUMER (id_sender, email, phone)
values (204, 'balthazar.herrm', 557143863);
insert into COSTUMER (id_sender, email, phone)
values (205, 'sara.ferrell@gd', 558757334);
insert into COSTUMER (id_sender, email, phone)
values (206, 'rachael@pds.br', 516268651);
insert into COSTUMER (id_sender, email, phone)
values (207, 'saulc@swp.uk', 585616148);
insert into COSTUMER (id_sender, email, phone)
values (208, 'trini.p@restaur', 569698224);
insert into COSTUMER (id_sender, email, phone)
values (209, 'ecooper@campbel', 595191643);
insert into COSTUMER (id_sender, email, phone)
values (210, 'queen.s@conques', 595886726);
insert into COSTUMER (id_sender, email, phone)
values (211, 'carlene.r@viven', 575691169);
insert into COSTUMER (id_sender, email, phone)
values (212, 'marty.s@volkswa', 579299298);
insert into COSTUMER (id_sender, email, phone)
values (213, 'alec.levert@iri', 519742432);
insert into COSTUMER (id_sender, email, phone)
values (214, 'sonny.haysbert@', 519421297);
insert into COSTUMER (id_sender, email, phone)
values (215, 'gailard.gooding', 525567151);
insert into COSTUMER (id_sender, email, phone)
values (216, 'samantham@intel', 596373737);
insert into COSTUMER (id_sender, email, phone)
values (217, 'melanie.weiland', 521814528);
insert into COSTUMER (id_sender, email, phone)
values (218, 'kiefer.n@cns.co', 559117963);
insert into COSTUMER (id_sender, email, phone)
values (219, 'andy@simplycert', 597342861);
insert into COSTUMER (id_sender, email, phone)
values (220, 'gramis@afs.it', 585263836);
insert into COSTUMER (id_sender, email, phone)
values (221, 'a.birch@pharmaf', 597736856);
insert into COSTUMER (id_sender, email, phone)
values (222, 'paula.jovovich@', 562614552);
insert into COSTUMER (id_sender, email, phone)
values (223, 'cece.ryder@sara', 515953553);
insert into COSTUMER (id_sender, email, phone)
values (224, 'simon.pollack@u', 567813262);
insert into COSTUMER (id_sender, email, phone)
values (225, 'horace@boldtech', 596233267);
insert into COSTUMER (id_sender, email, phone)
values (226, 'sean@esoftsolut', 583942464);
insert into COSTUMER (id_sender, email, phone)
values (227, 'ddegraw@doctors', 597914962);
insert into COSTUMER (id_sender, email, phone)
values (228, 'dwhitford@procl', 591386641);
insert into COSTUMER (id_sender, email, phone)
values (229, 'mili.manning@pe', 544347353);
insert into COSTUMER (id_sender, email, phone)
values (230, 'curtis.blackwel', 595289323);
insert into COSTUMER (id_sender, email, phone)
values (231, 'barbarab@topics', 521771686);
insert into COSTUMER (id_sender, email, phone)
values (232, 'holly.neeson@di', 574899769);
insert into COSTUMER (id_sender, email, phone)
values (233, 'maggie.schneide', 544649531);
insert into COSTUMER (id_sender, email, phone)
values (234, 'b.mcgregor@pfiz', 576589478);
insert into COSTUMER (id_sender, email, phone)
values (235, 'matt.sanders@ct', 543986767);
insert into COSTUMER (id_sender, email, phone)
values (236, 'fharnes@zaiqtec', 578931993);
insert into COSTUMER (id_sender, email, phone)
values (237, 'delbert.lamond@', 531775142);
insert into COSTUMER (id_sender, email, phone)
values (238, 'glenn@vspan.es', 544115841);
insert into COSTUMER (id_sender, email, phone)
values (239, 'howie.kelly@car', 532778822);
insert into COSTUMER (id_sender, email, phone)
values (240, 'julia.jessee@gr', 558235441);
insert into COSTUMER (id_sender, email, phone)
values (241, 'dennis.mcgill@s', 537363234);
insert into COSTUMER (id_sender, email, phone)
values (242, 'rickie.farina@t', 546253666);
insert into COSTUMER (id_sender, email, phone)
values (243, 'carl.metcalf@ho', 532182551);
insert into COSTUMER (id_sender, email, phone)
values (244, 'vingr@cooktek.d', 565824947);
insert into COSTUMER (id_sender, email, phone)
values (245, 'btobolowsky@msd', 544719465);
insert into COSTUMER (id_sender, email, phone)
values (246, 'shirley.farris@', 594481266);
insert into COSTUMER (id_sender, email, phone)
values (247, 'april.furay@con', 525257271);
insert into COSTUMER (id_sender, email, phone)
values (248, 'trey.schock@kro', 555996742);
insert into COSTUMER (id_sender, email, phone)
values (249, 'lance.k@extreme', 586613197);
insert into COSTUMER (id_sender, email, phone)
values (250, 'k.brosnan@cardt', 553682824);
insert into COSTUMER (id_sender, email, phone)
values (251, 'rob.b@peerlessm', 584631645);
insert into COSTUMER (id_sender, email, phone)
values (252, 'j.monk@reckittb', 571236266);
insert into COSTUMER (id_sender, email, phone)
values (253, 'deanw@mission.s', 522327114);
insert into COSTUMER (id_sender, email, phone)
values (254, 'nathan.ranger@p', 581138859);
insert into COSTUMER (id_sender, email, phone)
values (255, 'frances.galecki', 591478218);
insert into COSTUMER (id_sender, email, phone)
values (256, 'sydney.swank@in', 581431679);
insert into COSTUMER (id_sender, email, phone)
values (257, 'a.keeslar@capit', 579941952);
insert into COSTUMER (id_sender, email, phone)
values (258, 'holland.w@outso', 511887112);
insert into COSTUMER (id_sender, email, phone)
values (259, 'harry.joli@psci', 557336333);
insert into COSTUMER (id_sender, email, phone)
values (260, 'h.conlee@toyota', 592396863);
insert into COSTUMER (id_sender, email, phone)
values (261, 'kyra@capitolban', 548512284);
insert into COSTUMER (id_sender, email, phone)
values (262, 'gloria@wendysin', 577348981);
insert into COSTUMER (id_sender, email, phone)
values (263, 'eric.mitra@bis.', 577954411);
insert into COSTUMER (id_sender, email, phone)
values (264, 'c.turturro@prog', 545485132);
insert into COSTUMER (id_sender, email, phone)
values (265, 'darren.a@max.co', 583914871);
insert into COSTUMER (id_sender, email, phone)
values (266, 'juan.bonham@ald', 592626413);
insert into COSTUMER (id_sender, email, phone)
values (267, 'jcoe@ait.es', 516637755);
insert into COSTUMER (id_sender, email, phone)
values (268, 'christopher.rot', 581459461);
insert into COSTUMER (id_sender, email, phone)
values (269, 'mary.rundgren@a', 561188742);
insert into COSTUMER (id_sender, email, phone)
values (270, 'darren.ticotin@', 551528334);
insert into COSTUMER (id_sender, email, phone)
values (271, 'o.palmieri@atxf', 517841647);
insert into COSTUMER (id_sender, email, phone)
values (272, 'rosario.d@grs.i', 553278574);
insert into COSTUMER (id_sender, email, phone)
values (273, 'b.hawn@ivci.br', 572945337);
insert into COSTUMER (id_sender, email, phone)
values (274, 'mthomas@outsour', 535312863);
insert into COSTUMER (id_sender, email, phone)
values (275, 'gordie@kingland', 543175543);
insert into COSTUMER (id_sender, email, phone)
values (276, 'gin.braugher@og', 597538869);
insert into COSTUMER (id_sender, email, phone)
values (277, 'emerson.coe@est', 597559787);
insert into COSTUMER (id_sender, email, phone)
values (278, 'danny.mac@infop', 545148523);
insert into COSTUMER (id_sender, email, phone)
values (279, 'kathy@drinkmore', 573345379);
insert into COSTUMER (id_sender, email, phone)
values (280, 'm.makowicz@whit', 575416437);
insert into COSTUMER (id_sender, email, phone)
values (281, 'allison.d@mse.h', 576373845);
insert into COSTUMER (id_sender, email, phone)
values (282, 'christopher.hun', 554256296);
insert into COSTUMER (id_sender, email, phone)
values (283, 'jconnery@mainst', 585762261);
insert into COSTUMER (id_sender, email, phone)
values (284, 'eugenem@aoe.jp', 528521273);
insert into COSTUMER (id_sender, email, phone)
values (285, 'sigourney.b@kim', 519578395);
insert into COSTUMER (id_sender, email, phone)
values (286, 'dionne@innovate', 582827688);
insert into COSTUMER (id_sender, email, phone)
values (287, 'angelina.oneill', 591899892);
insert into COSTUMER (id_sender, email, phone)
values (288, 'h.plummer@unger', 594986522);
insert into COSTUMER (id_sender, email, phone)
values (289, 'terry.o@sfgo.pt', 593317982);
insert into COSTUMER (id_sender, email, phone)
values (290, 'heather.murray@', 557366853);
insert into COSTUMER (id_sender, email, phone)
values (291, 'padams@sandyspr', 566486157);
insert into COSTUMER (id_sender, email, phone)
values (292, 'loreena@johnkee', 523911143);
insert into COSTUMER (id_sender, email, phone)
values (293, 'tal.greenwood@h', 525794824);
insert into COSTUMER (id_sender, email, phone)
values (294, 'jeanclaude.stan', 579543264);
insert into COSTUMER (id_sender, email, phone)
values (295, 'ushaye@sandyspr', 515984257);
insert into COSTUMER (id_sender, email, phone)
values (296, 'ice.westerberg@', 522884284);
insert into COSTUMER (id_sender, email, phone)
values (297, 'petula.addy@ons', 561939585);
insert into COSTUMER (id_sender, email, phone)
values (298, 'trini.bruce@at.', 516596126);
insert into COSTUMER (id_sender, email, phone)
values (299, 'rachael.carrere', 527622374);
insert into COSTUMER (id_sender, email, phone)
values (300, 'tarquette@harri', 573162926);
commit;
prompt 300 records committed...
insert into COSTUMER (id_sender, email, phone)
values (301, 'judd.d@telwares', 558322495);
insert into COSTUMER (id_sender, email, phone)
values (302, 'willie.krabbe@p', 526946161);
insert into COSTUMER (id_sender, email, phone)
values (303, 'ann.quaid@ositi', 586263778);
insert into COSTUMER (id_sender, email, phone)
values (304, 'a.phillips@alte', 578663142);
insert into COSTUMER (id_sender, email, phone)
values (305, 'sona.coburn@usp', 524328118);
insert into COSTUMER (id_sender, email, phone)
values (306, 'n.krumholtz@typ', 528868816);
insert into COSTUMER (id_sender, email, phone)
values (307, 'cyndi@cima.de', 577442529);
insert into COSTUMER (id_sender, email, phone)
values (308, 'cameron.haggard', 544544967);
insert into COSTUMER (id_sender, email, phone)
values (309, 'emilio@aoltimew', 549458662);
insert into COSTUMER (id_sender, email, phone)
values (310, 'jackson.b@grt.u', 557473899);
insert into COSTUMER (id_sender, email, phone)
values (311, 'karen@nbs.hk', 516918996);
insert into COSTUMER (id_sender, email, phone)
values (312, 'burton.cetera@p', 548835892);
insert into COSTUMER (id_sender, email, phone)
values (313, 'cuba.berenger@m', 536323625);
insert into COSTUMER (id_sender, email, phone)
values (314, 'petem@bis.ch', 573639515);
insert into COSTUMER (id_sender, email, phone)
values (315, 'kstiers@extreme', 572227218);
insert into COSTUMER (id_sender, email, phone)
values (316, 'rufus.sinise@is', 562566372);
insert into COSTUMER (id_sender, email, phone)
values (317, 'gaby.moriarty@v', 552581966);
insert into COSTUMER (id_sender, email, phone)
values (318, 'akeeslar@intras', 545718285);
insert into COSTUMER (id_sender, email, phone)
values (319, 'barry.w@ogi.com', 517662831);
insert into COSTUMER (id_sender, email, phone)
values (320, 'todd.blige@outs', 521232849);
insert into COSTUMER (id_sender, email, phone)
values (321, 'j.atlas@unit.il', 579124922);
insert into COSTUMER (id_sender, email, phone)
values (322, 'george.culkin@a', 515957976);
insert into COSTUMER (id_sender, email, phone)
values (323, 'julio.theron@ch', 556636353);
insert into COSTUMER (id_sender, email, phone)
values (324, 'mira.driver@abs', 576133649);
insert into COSTUMER (id_sender, email, phone)
values (325, 'vince.dalton@pr', 575639176);
insert into COSTUMER (id_sender, email, phone)
values (326, 'j.garber@integr', 553197715);
insert into COSTUMER (id_sender, email, phone)
values (327, 'alex.moraz@sens', 533381428);
insert into COSTUMER (id_sender, email, phone)
values (328, 'melanie.blossom', 552698358);
insert into COSTUMER (id_sender, email, phone)
values (329, 'wayman.leto@fab', 536132311);
insert into COSTUMER (id_sender, email, phone)
values (330, 'o.singletary@aq', 515787771);
insert into COSTUMER (id_sender, email, phone)
values (331, 'stevem@avs.jp', 598749146);
insert into COSTUMER (id_sender, email, phone)
values (332, 'jhouston@cowlit', 557665382);
insert into COSTUMER (id_sender, email, phone)
values (333, 'akretschmann@sa', 597456383);
insert into COSTUMER (id_sender, email, phone)
values (334, 'debra.royparnel', 596633895);
insert into COSTUMER (id_sender, email, phone)
values (335, 'thin.vaughan@ca', 571595558);
insert into COSTUMER (id_sender, email, phone)
values (336, 'jeanluc.nosewor', 547628956);
insert into COSTUMER (id_sender, email, phone)
values (337, 'bill.cervine@di', 541232778);
insert into COSTUMER (id_sender, email, phone)
values (338, 'luke@genextechn', 553699361);
insert into COSTUMER (id_sender, email, phone)
values (339, 'debi.edmunds@tr', 559521675);
insert into COSTUMER (id_sender, email, phone)
values (340, 'merrilee.viciou', 599957383);
insert into COSTUMER (id_sender, email, phone)
values (341, 'cheryl.pierce@d', 528168567);
insert into COSTUMER (id_sender, email, phone)
values (342, 'w.grant@telware', 579152119);
insert into COSTUMER (id_sender, email, phone)
values (343, 'pete.mortensen@', 557198651);
insert into COSTUMER (id_sender, email, phone)
values (344, 'delroyg@labrada', 526449168);
insert into COSTUMER (id_sender, email, phone)
values (345, 'fdelancie@tropi', 539213257);
insert into COSTUMER (id_sender, email, phone)
values (346, 'a.tobolowsky@gr', 517938619);
insert into COSTUMER (id_sender, email, phone)
values (347, 'e.atkins@onesou', 547999455);
insert into COSTUMER (id_sender, email, phone)
values (348, 'julio.bean@hotm', 595557951);
insert into COSTUMER (id_sender, email, phone)
values (349, 'rebeka.swayze@s', 513221895);
insert into COSTUMER (id_sender, email, phone)
values (350, 't.darren@sis.es', 514159595);
insert into COSTUMER (id_sender, email, phone)
values (351, 'martin.p@ameris', 561464182);
insert into COSTUMER (id_sender, email, phone)
values (352, 't.muellerstahl@', 585457312);
insert into COSTUMER (id_sender, email, phone)
values (353, 'lena.e@caliber.', 535538625);
insert into COSTUMER (id_sender, email, phone)
values (354, 'natasha@cooktek', 563472894);
insert into COSTUMER (id_sender, email, phone)
values (355, 'kyra.baldwin@ne', 596757379);
insert into COSTUMER (id_sender, email, phone)
values (356, 'j.frakes@freedo', 573318411);
insert into COSTUMER (id_sender, email, phone)
values (357, 'rsummer@bestbuy', 565278251);
insert into COSTUMER (id_sender, email, phone)
values (358, 'shelby.johansen', 552323385);
insert into COSTUMER (id_sender, email, phone)
values (359, 'garthm@accessus', 593776523);
insert into COSTUMER (id_sender, email, phone)
values (360, 'max@daimlerchry', 574823271);
insert into COSTUMER (id_sender, email, phone)
values (361, 'cmccoy@at.com', 561351413);
insert into COSTUMER (id_sender, email, phone)
values (362, 'd.stiles@cardtr', 594493121);
insert into COSTUMER (id_sender, email, phone)
values (363, 'merle@fns.com', 585717413);
insert into COSTUMER (id_sender, email, phone)
values (364, 'rosario.h@viace', 549383259);
insert into COSTUMER (id_sender, email, phone)
values (365, 'miles@wrgservic', 567589634);
insert into COSTUMER (id_sender, email, phone)
values (366, 'campbell.dorn@s', 585564488);
insert into COSTUMER (id_sender, email, phone)
values (367, 'connie.crowell@', 579265112);
insert into COSTUMER (id_sender, email, phone)
values (368, 'thorar@ogiointe', 538657582);
insert into COSTUMER (id_sender, email, phone)
values (369, 'wslater@alterna', 519168422);
insert into COSTUMER (id_sender, email, phone)
values (370, 'emm.tobolowsky@', 524565365);
insert into COSTUMER (id_sender, email, phone)
values (371, 'evalentin@credi', 539176661);
insert into COSTUMER (id_sender, email, phone)
values (372, 'wade.macneil@wa', 588845913);
insert into COSTUMER (id_sender, email, phone)
values (373, 'jhornsby@jma.co', 571569137);
insert into COSTUMER (id_sender, email, phone)
values (374, 'rita.blige@nest', 539251758);
insert into COSTUMER (id_sender, email, phone)
values (375, 'johnny@ois.jp', 568958344);
insert into COSTUMER (id_sender, email, phone)
values (376, 'saffronl@hatwor', 579933546);
insert into COSTUMER (id_sender, email, phone)
values (377, 'mia.s@montpelie', 518482479);
insert into COSTUMER (id_sender, email, phone)
values (378, 'forest@logistic', 516114758);
insert into COSTUMER (id_sender, email, phone)
values (379, 'emmylou.weir@te', 528579896);
insert into COSTUMER (id_sender, email, phone)
values (380, 'garth.owen@ssi.', 555398147);
insert into COSTUMER (id_sender, email, phone)
values (381, 'aimee.secada@mi', 593351293);
insert into COSTUMER (id_sender, email, phone)
values (382, 'j.saxon@infovis', 538817528);
insert into COSTUMER (id_sender, email, phone)
values (383, 'brittany.redgra', 582481284);
insert into COSTUMER (id_sender, email, phone)
values (384, 'courtney.osbour', 578498236);
insert into COSTUMER (id_sender, email, phone)
values (385, 'benjamin.dushku', 544372775);
insert into COSTUMER (id_sender, email, phone)
values (386, 'rip.sweet@mms.b', 522898176);
insert into COSTUMER (id_sender, email, phone)
values (387, 'kieran.boone@te', 594547126);
insert into COSTUMER (id_sender, email, phone)
values (388, 'hex.jackson@mwh', 551561979);
insert into COSTUMER (id_sender, email, phone)
values (389, 'gary.lightfoot@', 584463735);
insert into COSTUMER (id_sender, email, phone)
values (390, 'gran.unger@mave', 568757819);
insert into COSTUMER (id_sender, email, phone)
values (391, 'rueben@capitalb', 589173341);
insert into COSTUMER (id_sender, email, phone)
values (392, 'ernie.m@saltgro', 586117982);
insert into COSTUMER (id_sender, email, phone)
values (393, 'l.brown@usenerg', 558342321);
insert into COSTUMER (id_sender, email, phone)
values (394, 'cmcgoohan@sunst', 587713763);
insert into COSTUMER (id_sender, email, phone)
values (395, 'c.spader@mls.de', 572634341);
insert into COSTUMER (id_sender, email, phone)
values (396, 'denis.c@glaxosm', 569349576);
insert into COSTUMER (id_sender, email, phone)
values (397, 'gsupernaw@intra', 575293555);
insert into COSTUMER (id_sender, email, phone)
values (398, 'jeanluc.nichols', 585968418);
insert into COSTUMER (id_sender, email, phone)
values (399, 'jason.rush@idla', 513678552);
insert into COSTUMER (id_sender, email, phone)
values (400, 'roberta@kimberl', 526191197);
commit;
prompt 400 records committed...
insert into COSTUMER (id_sender, email, phone)
values (401, 'merillee.l@demo', 568296412);
insert into COSTUMER (id_sender, email, phone)
values (402, 'aaron@hatworld.', 543458129);
insert into COSTUMER (id_sender, email, phone)
values (403, 'ice.s@bedfordba', 547652168);
insert into COSTUMER (id_sender, email, phone)
values (404, 'barryz@integrat', 516862617);
insert into COSTUMER (id_sender, email, phone)
values (405, 'jennifer.lonsda', 537477973);
insert into COSTUMER (id_sender, email, phone)
values (406, 'connie.robinson', 529966988);
insert into COSTUMER (id_sender, email, phone)
values (407, 'thelma.wagner@t', 554745342);
insert into COSTUMER (id_sender, email, phone)
values (408, 'timothy.overstr', 532474729);
insert into COSTUMER (id_sender, email, phone)
values (409, 'morrism@sunstre', 548333131);
insert into COSTUMER (id_sender, email, phone)
values (410, 'miranda@airmeth', 532965568);
insert into COSTUMER (id_sender, email, phone)
values (411, 'robinp@shufflem', 546952585);
insert into COSTUMER (id_sender, email, phone)
values (412, 'darren.matheson', 529168868);
insert into COSTUMER (id_sender, email, phone)
values (413, 'ahmad.santana@k', 542124362);
insert into COSTUMER (id_sender, email, phone)
values (414, 'forest.kleinenb', 529958153);
insert into COSTUMER (id_sender, email, phone)
values (415, 'nweaving@cookte', 576696484);
insert into COSTUMER (id_sender, email, phone)
values (416, 'jena.hutch@ezec', 528311968);
insert into COSTUMER (id_sender, email, phone)
values (417, 'elisabeth.osmen', 538131174);
insert into COSTUMER (id_sender, email, phone)
values (418, 'sharons@ccfhold', 577869164);
insert into COSTUMER (id_sender, email, phone)
values (419, 'ellen@mitsubish', 583462733);
insert into COSTUMER (id_sender, email, phone)
values (420, 'armin.newman@pa', 551959911);
insert into COSTUMER (id_sender, email, phone)
values (421, 'goran.hershey@r', 578964245);
insert into COSTUMER (id_sender, email, phone)
values (422, 'brooke.roth@sta', 587839998);
insert into COSTUMER (id_sender, email, phone)
values (423, 'alih@envisionte', 599731281);
insert into COSTUMER (id_sender, email, phone)
values (424, 'nick.royparnell', 538451665);
insert into COSTUMER (id_sender, email, phone)
values (425, 'kelly.reeve@voi', 543537997);
insert into COSTUMER (id_sender, email, phone)
values (426, 'jacksonb@apexsy', 588262276);
insert into COSTUMER (id_sender, email, phone)
values (427, 'lorraines@white', 522385876);
insert into COSTUMER (id_sender, email, phone)
values (428, 'cary.dzundza@ex', 524572688);
insert into COSTUMER (id_sender, email, phone)
values (429, 'rposey@ris.com', 581918752);
insert into COSTUMER (id_sender, email, phone)
values (430, 'winona.spacek@p', 536188767);
insert into COSTUMER (id_sender, email, phone)
values (431, 'kim.deejay@accu', 512892974);
insert into COSTUMER (id_sender, email, phone)
values (432, 'lea.crewson@sar', 525942569);
insert into COSTUMER (id_sender, email, phone)
values (433, 'mitchell@aldens', 553864348);
insert into COSTUMER (id_sender, email, phone)
values (434, 'cesar.law@capit', 542529795);
insert into COSTUMER (id_sender, email, phone)
values (435, 'randall.dalley@', 581815195);
insert into COSTUMER (id_sender, email, phone)
values (436, 'ddempsey@base.d', 588933169);
insert into COSTUMER (id_sender, email, phone)
values (437, 'tzi.moraz@contr', 549497319);
insert into COSTUMER (id_sender, email, phone)
values (438, 'charlie.flemyng', 559654241);
insert into COSTUMER (id_sender, email, phone)
values (439, 'g.levert@daimle', 561415328);
insert into COSTUMER (id_sender, email, phone)
values (440, 'diamond@bioreli', 546618471);
insert into COSTUMER (id_sender, email, phone)
values (441, 'matthew.belle@p', 519335737);
insert into COSTUMER (id_sender, email, phone)
values (442, 'larry.m@novarti', 546528941);
insert into COSTUMER (id_sender, email, phone)
values (443, 'curtis.lamond@s', 595913913);
insert into COSTUMER (id_sender, email, phone)
values (444, 'illeana@cartere', 585583452);
insert into COSTUMER (id_sender, email, phone)
values (445, 'geoff.m@tripwir', 582567539);
insert into COSTUMER (id_sender, email, phone)
values (446, 'emm.law@hatworl', 599938796);
insert into COSTUMER (id_sender, email, phone)
values (447, 'davy.c@dancor.c', 598531698);
insert into COSTUMER (id_sender, email, phone)
values (448, 'suzannek@ass.co', 568322972);
insert into COSTUMER (id_sender, email, phone)
values (449, 'ryan.diesel@bay', 522471378);
insert into COSTUMER (id_sender, email, phone)
values (450, 'angie.stamp@glo', 587211787);
insert into COSTUMER (id_sender, email, phone)
values (451, 'salma.hector@da', 518947522);
insert into COSTUMER (id_sender, email, phone)
values (452, 'crispin.goldblu', 584329971);
insert into COSTUMER (id_sender, email, phone)
values (453, 'h.brock@mcdonal', 524252346);
insert into COSTUMER (id_sender, email, phone)
values (454, 'acaldwell@ositi', 595877278);
insert into COSTUMER (id_sender, email, phone)
values (455, 'scarlett.carter', 527713218);
insert into COSTUMER (id_sender, email, phone)
values (456, 'treat.armatradi', 536232929);
insert into COSTUMER (id_sender, email, phone)
values (457, 'w.mckellen@zone', 531431849);
insert into COSTUMER (id_sender, email, phone)
values (458, 'bridgets@datapr', 548878242);
insert into COSTUMER (id_sender, email, phone)
values (459, 'liquid.buffalo@', 538198851);
insert into COSTUMER (id_sender, email, phone)
values (460, 'suzanne@msdw.co', 554144593);
insert into COSTUMER (id_sender, email, phone)
values (461, 'kurtwood.colon@', 549968142);
insert into COSTUMER (id_sender, email, phone)
values (462, 'balthazar.benso', 596817569);
insert into COSTUMER (id_sender, email, phone)
values (463, 'sharon.tarantin', 544223245);
insert into COSTUMER (id_sender, email, phone)
values (464, 'vanessav@hershe', 571697624);
insert into COSTUMER (id_sender, email, phone)
values (465, 'dcaan@navigator', 544367485);
insert into COSTUMER (id_sender, email, phone)
values (466, 'kidc@capital.it', 578839576);
insert into COSTUMER (id_sender, email, phone)
values (467, 'brooke.union@ff', 584337841);
insert into COSTUMER (id_sender, email, phone)
values (468, 'breckin@fab.de', 546472162);
insert into COSTUMER (id_sender, email, phone)
values (469, 'b.hedaya@format', 566523729);
insert into COSTUMER (id_sender, email, phone)
values (470, 'cyndi.harnes@yu', 529786738);
insert into COSTUMER (id_sender, email, phone)
values (471, 'rachel.furtado@', 582156834);
insert into COSTUMER (id_sender, email, phone)
values (472, 'cesar.lindley@l', 554742516);
insert into COSTUMER (id_sender, email, phone)
values (473, 'david.m@valleyo', 524863965);
insert into COSTUMER (id_sender, email, phone)
values (474, 'ianc@smartdrawc', 593743624);
insert into COSTUMER (id_sender, email, phone)
values (475, 'alex.sheen@ssi.', 592294981);
insert into COSTUMER (id_sender, email, phone)
values (476, 'armin.broza@glt', 526426915);
insert into COSTUMER (id_sender, email, phone)
values (477, 'judd.cohn@lifel', 541726689);
insert into COSTUMER (id_sender, email, phone)
values (478, 'emilio.j@fra.il', 597668879);
insert into COSTUMER (id_sender, email, phone)
values (479, 'arichards@ccb.c', 596776984);
insert into COSTUMER (id_sender, email, phone)
values (480, 'liev.m@interfac', 576431167);
insert into COSTUMER (id_sender, email, phone)
values (481, 'william.boyle@n', 542324437);
insert into COSTUMER (id_sender, email, phone)
values (482, 'stockard.pfeiff', 549249263);
insert into COSTUMER (id_sender, email, phone)
values (483, 'lari.rubinek@di', 571154241);
insert into COSTUMER (id_sender, email, phone)
values (484, 'aaron.foster@he', 523951773);
insert into COSTUMER (id_sender, email, phone)
values (485, 'tzi.bogguss@vir', 539721984);
insert into COSTUMER (id_sender, email, phone)
values (486, 'debra.hingle@ff', 599964612);
insert into COSTUMER (id_sender, email, phone)
values (487, 'trace.wills@nor', 586396587);
insert into COSTUMER (id_sender, email, phone)
values (488, 'taryn.ponty@llo', 546335389);
insert into COSTUMER (id_sender, email, phone)
values (489, 'joey.w@younginn', 547883881);
insert into COSTUMER (id_sender, email, phone)
values (490, 'campbell.shaye@', 563779956);
insert into COSTUMER (id_sender, email, phone)
values (491, 's.ruffalo@airme', 568968717);
insert into COSTUMER (id_sender, email, phone)
values (492, 'jerry.malkovich', 585616739);
insert into COSTUMER (id_sender, email, phone)
values (493, 'caroline.wincot', 575143725);
insert into COSTUMER (id_sender, email, phone)
values (494, 'france.flatts@i', 592588448);
insert into COSTUMER (id_sender, email, phone)
values (495, 'billy@uem.br', 566925751);
insert into COSTUMER (id_sender, email, phone)
values (496, 'mauryw@supplyco', 598443312);
insert into COSTUMER (id_sender, email, phone)
values (497, 'hilary.gatlin@m', 584561523);
insert into COSTUMER (id_sender, email, phone)
values (498, 'bette.morton@ca', 543695293);
insert into COSTUMER (id_sender, email, phone)
values (499, 'terrence@bat.sg', 526459744);
insert into COSTUMER (id_sender, email, phone)
values (500, 'udo@coridiantec', 543395828);
commit;
prompt 500 records committed...
insert into COSTUMER (id_sender, email, phone)
values (501, 'emmylou@ubp.de', 525828491);
insert into COSTUMER (id_sender, email, phone)
values (502, 'sally.s@dvdt.co', 582921394);
insert into COSTUMER (id_sender, email, phone)
values (503, 'vonda.wariner@f', 561311447);
insert into COSTUMER (id_sender, email, phone)
values (504, 'maureen.cleary@', 558484199);
insert into COSTUMER (id_sender, email, phone)
values (505, 'ndench@speakeas', 594517476);
insert into COSTUMER (id_sender, email, phone)
values (506, 'kathleen.rowlan', 541153243);
insert into COSTUMER (id_sender, email, phone)
values (507, 'ronnie.moody@pa', 542366431);
insert into COSTUMER (id_sender, email, phone)
values (508, 'eugene.snider@p', 512761143);
insert into COSTUMER (id_sender, email, phone)
values (509, 'rita.dooley@llo', 587859437);
insert into COSTUMER (id_sender, email, phone)
values (510, 'pwheel@usgovern', 518196414);
insert into COSTUMER (id_sender, email, phone)
values (511, 'cameron.bassett', 516382868);
insert into COSTUMER (id_sender, email, phone)
values (512, 'deborahp@nrae.c', 514638798);
insert into COSTUMER (id_sender, email, phone)
values (513, 'natascha.blosso', 575138681);
insert into COSTUMER (id_sender, email, phone)
values (514, 'richardw@aop.co', 568319574);
insert into COSTUMER (id_sender, email, phone)
values (515, 'gil.russo@csi.c', 552926888);
insert into COSTUMER (id_sender, email, phone)
values (516, 'lesley.larter@n', 597421733);
insert into COSTUMER (id_sender, email, phone)
values (517, 'connie.shearer@', 582188979);
insert into COSTUMER (id_sender, email, phone)
values (518, 'gabriel@bayer.u', 562996794);
insert into COSTUMER (id_sender, email, phone)
values (519, 'rufus.goodall@s', 576691161);
insert into COSTUMER (id_sender, email, phone)
values (520, 'todd.cruz@verit', 594958149);
insert into COSTUMER (id_sender, email, phone)
values (521, 'sharon.eckhart@', 533264115);
insert into COSTUMER (id_sender, email, phone)
values (522, 'lsedgwick@airme', 525749452);
insert into COSTUMER (id_sender, email, phone)
values (523, 'j.pollak@wav.br', 599712812);
insert into COSTUMER (id_sender, email, phone)
values (524, 's.lee@prosum.dk', 595798327);
insert into COSTUMER (id_sender, email, phone)
values (525, 'lhunt@owm.com', 536699973);
insert into COSTUMER (id_sender, email, phone)
values (526, 'michelle.emmeri', 562953467);
insert into COSTUMER (id_sender, email, phone)
values (527, 'l.larter@mcdona', 577819682);
insert into COSTUMER (id_sender, email, phone)
values (528, 'williamn@ccfhol', 523297313);
insert into COSTUMER (id_sender, email, phone)
values (529, 'miki.zevon@best', 524755216);
insert into COSTUMER (id_sender, email, phone)
values (530, 'diamondg@vms.jp', 566897248);
insert into COSTUMER (id_sender, email, phone)
values (531, 'derek@aventis.c', 558224168);
insert into COSTUMER (id_sender, email, phone)
values (532, 'nancy.reno@fam.', 529783854);
insert into COSTUMER (id_sender, email, phone)
values (533, 'rmcintyre@progr', 566761678);
insert into COSTUMER (id_sender, email, phone)
values (534, 'wallacew@envisi', 539338355);
insert into COSTUMER (id_sender, email, phone)
values (535, 'hzappacosta@pro', 584341818);
insert into COSTUMER (id_sender, email, phone)
values (536, 'jeremy.harnes@a', 524339475);
insert into COSTUMER (id_sender, email, phone)
values (537, 'emerson.nelliga', 539285281);
insert into COSTUMER (id_sender, email, phone)
values (538, 'pablo.sutherlan', 599384874);
insert into COSTUMER (id_sender, email, phone)
values (539, 'jeanh@bestbuy.c', 577475817);
insert into COSTUMER (id_sender, email, phone)
values (540, 'paiken@microtek', 569218829);
insert into COSTUMER (id_sender, email, phone)
values (541, 'lukeh@air.dk', 576471773);
insert into COSTUMER (id_sender, email, phone)
values (542, 'nikka.oneal@nra', 598953519);
insert into COSTUMER (id_sender, email, phone)
values (543, 'kid.garza@grs.d', 522363237);
insert into COSTUMER (id_sender, email, phone)
values (544, 'halle.eckhart@n', 584534876);
insert into COSTUMER (id_sender, email, phone)
values (545, 'd.carlisle@spec', 554839843);
insert into COSTUMER (id_sender, email, phone)
values (546, 'sally.rock@inte', 532746982);
insert into COSTUMER (id_sender, email, phone)
values (547, 'judd@nhhc.com', 571783526);
insert into COSTUMER (id_sender, email, phone)
values (548, 'timothy.t@tlsse', 524248332);
insert into COSTUMER (id_sender, email, phone)
values (549, 'r.suvari@pacifi', 525752869);
insert into COSTUMER (id_sender, email, phone)
values (550, 'm.bachman@chips', 581879875);
insert into COSTUMER (id_sender, email, phone)
values (551, 'jonathanw@cardi', 594271113);
insert into COSTUMER (id_sender, email, phone)
values (552, 'j.kadison@kings', 555287238);
insert into COSTUMER (id_sender, email, phone)
values (553, 'tim@gha.com', 571587715);
insert into COSTUMER (id_sender, email, phone)
values (554, 'freddy.diehl@ca', 539687597);
insert into COSTUMER (id_sender, email, phone)
values (555, 'leelee.darren@d', 515123569);
insert into COSTUMER (id_sender, email, phone)
values (556, 'jim.gray@signat', 549277411);
insert into COSTUMER (id_sender, email, phone)
values (557, 'jude.kingsley@g', 582417766);
insert into COSTUMER (id_sender, email, phone)
values (558, 'shannyn.hampton', 538116567);
insert into COSTUMER (id_sender, email, phone)
values (559, 'b.ponce@doralde', 568864858);
insert into COSTUMER (id_sender, email, phone)
values (560, 'sanders@interfa', 591175138);
insert into COSTUMER (id_sender, email, phone)
values (561, 'wang.steiger@sm', 538459192);
insert into COSTUMER (id_sender, email, phone)
values (562, 'etta.f@bashen.c', 598952843);
insert into COSTUMER (id_sender, email, phone)
values (563, 'lesley.buckingh', 582821534);
insert into COSTUMER (id_sender, email, phone)
values (564, 'joy.t@aristotle', 571499848);
insert into COSTUMER (id_sender, email, phone)
values (565, 'ralph.hingle@ci', 551715198);
insert into COSTUMER (id_sender, email, phone)
values (566, 'rolando.reinhol', 529413774);
insert into COSTUMER (id_sender, email, phone)
values (567, 'gavin@marathonh', 524584114);
insert into COSTUMER (id_sender, email, phone)
values (568, 'maury.t@ceo.com', 572115711);
insert into COSTUMER (id_sender, email, phone)
values (569, 'nanci@efcbancor', 522461161);
insert into COSTUMER (id_sender, email, phone)
values (570, 'b.curtishall@og', 519677226);
insert into COSTUMER (id_sender, email, phone)
values (571, 'giovanni.jessee', 512886749);
insert into COSTUMER (id_sender, email, phone)
values (572, 'gilberto.bulloc', 541189141);
insert into COSTUMER (id_sender, email, phone)
values (573, 'rod.jane@hospit', 588672826);
insert into COSTUMER (id_sender, email, phone)
values (574, 'bill.moore@sds.', 535839481);
insert into COSTUMER (id_sender, email, phone)
values (575, 'bcarrere@midwes', 512246464);
insert into COSTUMER (id_sender, email, phone)
values (576, 'cyndi@monarchca', 515372859);
insert into COSTUMER (id_sender, email, phone)
values (577, 'charlie.schock@', 519149928);
insert into COSTUMER (id_sender, email, phone)
values (578, 'r.willard@north', 537145169);
insert into COSTUMER (id_sender, email, phone)
values (579, 'raymond.cartlid', 547282395);
insert into COSTUMER (id_sender, email, phone)
values (580, 'vlee@spectrum.c', 587483483);
insert into COSTUMER (id_sender, email, phone)
values (581, 'tobey.buckingha', 571523219);
insert into COSTUMER (id_sender, email, phone)
values (582, 'joe@kroger.com', 588449318);
insert into COSTUMER (id_sender, email, phone)
values (583, 'dick.curtis@oss', 533214268);
insert into COSTUMER (id_sender, email, phone)
values (584, 'mena.torn@pione', 583856514);
insert into COSTUMER (id_sender, email, phone)
values (585, 'kris.stowe@salt', 535131953);
insert into COSTUMER (id_sender, email, phone)
values (586, 'elias.archer@ta', 572178611);
insert into COSTUMER (id_sender, email, phone)
values (587, 'joely@atg.ch', 541986956);
insert into COSTUMER (id_sender, email, phone)
values (588, 'tony.g@ecopy.ca', 523683485);
insert into COSTUMER (id_sender, email, phone)
values (589, 'kris.s@north.cy', 559115919);
insert into COSTUMER (id_sender, email, phone)
values (590, 'ellel@sprint.de', 534319476);
insert into COSTUMER (id_sender, email, phone)
values (591, 'mark.rockwell@n', 589694524);
insert into COSTUMER (id_sender, email, phone)
values (592, 'm.bragg@lydiant', 571985729);
insert into COSTUMER (id_sender, email, phone)
values (593, 'sydney.estevez@', 593618836);
insert into COSTUMER (id_sender, email, phone)
values (594, 'vince.freeman@p', 596591141);
insert into COSTUMER (id_sender, email, phone)
values (595, 'curtis.matarazz', 543522572);
insert into COSTUMER (id_sender, email, phone)
values (596, 'curtis.aiken@fi', 565952123);
insert into COSTUMER (id_sender, email, phone)
values (597, 'seann.cetera@fm', 538514213);
insert into COSTUMER (id_sender, email, phone)
values (598, 'kate.kravitz@pd', 524616832);
insert into COSTUMER (id_sender, email, phone)
values (599, 'benicio.caine@m', 545149854);
insert into COSTUMER (id_sender, email, phone)
values (600, 'l.buckingham@ne', 542823441);
commit;
prompt 600 records committed...
insert into COSTUMER (id_sender, email, phone)
values (601, 'jonathan.keener', 534738722);
insert into COSTUMER (id_sender, email, phone)
values (602, 'derrick.h@gille', 592658162);
insert into COSTUMER (id_sender, email, phone)
values (603, 'r.rollins@alden', 573977482);
insert into COSTUMER (id_sender, email, phone)
values (604, 'seth.blige@ait.', 568134835);
insert into COSTUMER (id_sender, email, phone)
values (605, 'wharrelson@accu', 559814782);
insert into COSTUMER (id_sender, email, phone)
values (606, 'reese.scaggs@km', 595962993);
insert into COSTUMER (id_sender, email, phone)
values (607, 'terry.withers@p', 593898279);
insert into COSTUMER (id_sender, email, phone)
values (608, 'leslie.armatrad', 574877796);
insert into COSTUMER (id_sender, email, phone)
values (609, 'temuera@fab.de', 582182386);
insert into COSTUMER (id_sender, email, phone)
values (610, 'j.saucedo@fab.f', 512285721);
insert into COSTUMER (id_sender, email, phone)
values (611, 'sheryl.womack@a', 527485552);
insert into COSTUMER (id_sender, email, phone)
values (612, 'llynch@vertexso', 576697848);
insert into COSTUMER (id_sender, email, phone)
values (613, 'cnapolitano@alo', 587898242);
insert into COSTUMER (id_sender, email, phone)
values (614, 'taye.pierce@nes', 547736885);
insert into COSTUMER (id_sender, email, phone)
values (615, 'emerson.aykroyd', 588747295);
insert into COSTUMER (id_sender, email, phone)
values (616, 'chant@arkidata.', 555666195);
insert into COSTUMER (id_sender, email, phone)
values (617, 'carol.b@lms.com', 544927582);
insert into COSTUMER (id_sender, email, phone)
values (618, 'lily.mccabe@com', 545584235);
insert into COSTUMER (id_sender, email, phone)
values (619, 'judge.heatherly', 599998923);
insert into COSTUMER (id_sender, email, phone)
values (620, 'xander.diffie@p', 564837884);
insert into COSTUMER (id_sender, email, phone)
values (621, 'praga@knightsbr', 578254939);
insert into COSTUMER (id_sender, email, phone)
values (622, 'rpalmer@gdi.jp', 569679829);
insert into COSTUMER (id_sender, email, phone)
values (623, 'carole.conners@', 549138462);
insert into COSTUMER (id_sender, email, phone)
values (624, 'christine.s@kei', 593347873);
insert into COSTUMER (id_sender, email, phone)
values (625, 'ahmad.mcginley@', 564683981);
insert into COSTUMER (id_sender, email, phone)
values (626, 'wayne.burke@sar', 531954944);
insert into COSTUMER (id_sender, email, phone)
values (627, 'xander@evinco.d', 571872785);
insert into COSTUMER (id_sender, email, phone)
values (628, 'joely.ness@angi', 537129582);
insert into COSTUMER (id_sender, email, phone)
values (629, 'gabrielle.sprin', 586287118);
insert into COSTUMER (id_sender, email, phone)
values (630, 'cole@hps.com', 567171381);
insert into COSTUMER (id_sender, email, phone)
values (631, 'nancy.stiller@b', 555965834);
insert into COSTUMER (id_sender, email, phone)
values (632, 'adowney@ivci.fi', 546524242);
insert into COSTUMER (id_sender, email, phone)
values (633, 'chakaw@gna.nl', 553199552);
insert into COSTUMER (id_sender, email, phone)
values (634, 'sandra.lapointe', 583335714);
insert into COSTUMER (id_sender, email, phone)
values (635, 'suzi.chapman@ho', 516657974);
insert into COSTUMER (id_sender, email, phone)
values (636, 'rod@unilever.co', 526455368);
insert into COSTUMER (id_sender, email, phone)
values (637, 'ramsey.morse@vo', 521525294);
insert into COSTUMER (id_sender, email, phone)
values (638, 'carla@americane', 574455225);
insert into COSTUMER (id_sender, email, phone)
values (639, 'frankie.t@veriz', 517153499);
insert into COSTUMER (id_sender, email, phone)
values (640, 'karen.oates@wrg', 538739228);
insert into COSTUMER (id_sender, email, phone)
values (641, 'a.cruz@execuscr', 521881917);
insert into COSTUMER (id_sender, email, phone)
values (642, 'geggy.malkovich', 531478572);
insert into COSTUMER (id_sender, email, phone)
values (643, 'mena.firth@peer', 519548357);
insert into COSTUMER (id_sender, email, phone)
values (644, 'ellen.benet@ent', 576695392);
insert into COSTUMER (id_sender, email, phone)
values (645, 'dennis.w@irisso', 522116981);
insert into COSTUMER (id_sender, email, phone)
values (646, 'jeroen.freeman@', 529186378);
insert into COSTUMER (id_sender, email, phone)
values (647, 'kitty.danger@mi', 537477199);
insert into COSTUMER (id_sender, email, phone)
values (648, 'tara.gaynor@bra', 564272595);
insert into COSTUMER (id_sender, email, phone)
values (649, 'geggy@eagleone.', 532516433);
insert into COSTUMER (id_sender, email, phone)
values (650, 'cuba.wolf@tarra', 564947938);
insert into COSTUMER (id_sender, email, phone)
values (651, 'juliana.m@fetch', 511926662);
insert into COSTUMER (id_sender, email, phone)
values (652, 'lance@viacom.co', 556817557);
insert into COSTUMER (id_sender, email, phone)
values (653, 'warren@banfepro', 551375442);
insert into COSTUMER (id_sender, email, phone)
values (654, 's.tyson@questar', 588257998);
insert into COSTUMER (id_sender, email, phone)
values (655, 'noras@kis.com', 542279412);
insert into COSTUMER (id_sender, email, phone)
values (656, 'gaustin@timevis', 557674421);
insert into COSTUMER (id_sender, email, phone)
values (657, 'matthew.niven@n', 536766314);
insert into COSTUMER (id_sender, email, phone)
values (658, 'lili@seiaarons.', 549175923);
insert into COSTUMER (id_sender, email, phone)
values (659, 'anniek@abatix.c', 541965615);
insert into COSTUMER (id_sender, email, phone)
values (660, 'epayne@alogent.', 556557129);
insert into COSTUMER (id_sender, email, phone)
values (661, 'lizzy.quinn@wal', 575713993);
insert into COSTUMER (id_sender, email, phone)
values (662, 'holly.tucci@fsf', 539455157);
insert into COSTUMER (id_sender, email, phone)
values (663, 't.wilkinson@ade', 569737978);
insert into COSTUMER (id_sender, email, phone)
values (664, 'annette.pony@ve', 554364517);
insert into COSTUMER (id_sender, email, phone)
values (665, 'ceaston@staffon', 525237767);
insert into COSTUMER (id_sender, email, phone)
values (666, 'merrill.mccabe@', 595736434);
insert into COSTUMER (id_sender, email, phone)
values (667, 'joey.ellis@dis.', 533569447);
insert into COSTUMER (id_sender, email, phone)
values (668, 'nenehg@stonebre', 562376963);
insert into COSTUMER (id_sender, email, phone)
values (669, 'colin.rollins@k', 597792966);
insert into COSTUMER (id_sender, email, phone)
values (670, 'patti.mac@doral', 567198925);
insert into COSTUMER (id_sender, email, phone)
values (671, 'a.osbourne@tlss', 513526634);
insert into COSTUMER (id_sender, email, phone)
values (672, 'praga.francis@n', 582487883);
insert into COSTUMER (id_sender, email, phone)
values (673, 'penelope.sayer@', 544847563);
insert into COSTUMER (id_sender, email, phone)
values (674, 'donald.garcia@a', 555879197);
insert into COSTUMER (id_sender, email, phone)
values (675, 'rade.zellweger@', 514755597);
insert into COSTUMER (id_sender, email, phone)
values (676, 'maggie.thewlis@', 588795133);
insert into COSTUMER (id_sender, email, phone)
values (677, 'michael.child@s', 586769682);
insert into COSTUMER (id_sender, email, phone)
values (678, 'cheryl.tucci@he', 577157745);
insert into COSTUMER (id_sender, email, phone)
values (679, 'b.ricci@gtp.at', 555383412);
insert into COSTUMER (id_sender, email, phone)
values (680, 'thora.lupone@fd', 534197667);
insert into COSTUMER (id_sender, email, phone)
values (681, 'lou.franks@webg', 519855628);
insert into COSTUMER (id_sender, email, phone)
values (682, 'graham.domino@o', 549869487);
insert into COSTUMER (id_sender, email, phone)
values (683, 'msayer@softworl', 557476128);
insert into COSTUMER (id_sender, email, phone)
values (684, 'r.gano@componen', 597174862);
insert into COSTUMER (id_sender, email, phone)
values (685, 'stephen.curfman', 537261178);
insert into COSTUMER (id_sender, email, phone)
values (686, 'natacha@gci.it', 553182641);
insert into COSTUMER (id_sender, email, phone)
values (687, 'brothers.u@dire', 534964173);
insert into COSTUMER (id_sender, email, phone)
values (688, 'jonny.macdonald', 572866255);
insert into COSTUMER (id_sender, email, phone)
values (689, 'chely.c@globalw', 579544124);
insert into COSTUMER (id_sender, email, phone)
values (690, 'merrill.t@mqsof', 556382855);
insert into COSTUMER (id_sender, email, phone)
values (691, 'rhea.kravitz@co', 529945947);
insert into COSTUMER (id_sender, email, phone)
values (692, 'merle.romijnsta', 589356793);
insert into COSTUMER (id_sender, email, phone)
values (693, 'apesci@safehome', 513799751);
insert into COSTUMER (id_sender, email, phone)
values (694, 'kate.vannelli@k', 552233898);
insert into COSTUMER (id_sender, email, phone)
values (695, 'l.michaels@amer', 588189232);
insert into COSTUMER (id_sender, email, phone)
values (696, 'drew@peerlessma', 561636442);
insert into COSTUMER (id_sender, email, phone)
values (697, 'martha.isaak@ge', 538357717);
insert into COSTUMER (id_sender, email, phone)
values (698, 'lenny.englund@c', 534847415);
insert into COSTUMER (id_sender, email, phone)
values (699, 'lesliev@sm.fr', 522877283);
insert into COSTUMER (id_sender, email, phone)
values (700, 'alex.place@sign', 516618811);
commit;
prompt 700 records committed...
insert into COSTUMER (id_sender, email, phone)
values (701, 'dick.blanchett@', 545996977);
insert into COSTUMER (id_sender, email, phone)
values (702, 'chazz.belles@la', 543471543);
insert into COSTUMER (id_sender, email, phone)
values (703, 'oliver.wheel@ta', 535269748);
insert into COSTUMER (id_sender, email, phone)
values (704, 'trini.eastwood@', 536225458);
insert into COSTUMER (id_sender, email, phone)
values (705, 'jaredw@walmarts', 518232886);
insert into COSTUMER (id_sender, email, phone)
values (706, 'howard.k@denali', 536498184);
insert into COSTUMER (id_sender, email, phone)
values (707, 'halle.m@globalw', 527354655);
insert into COSTUMER (id_sender, email, phone)
values (708, 'roberta.lattimo', 514943374);
insert into COSTUMER (id_sender, email, phone)
values (709, 'cherrym@dcgroup', 516158971);
insert into COSTUMER (id_sender, email, phone)
values (710, 'jrippy@hondamot', 599722833);
insert into COSTUMER (id_sender, email, phone)
values (711, 'stockard@pulask', 582758266);
insert into COSTUMER (id_sender, email, phone)
values (712, 'r.carmen@inzone', 546675817);
insert into COSTUMER (id_sender, email, phone)
values (713, 'alfred.deluise@', 517324878);
insert into COSTUMER (id_sender, email, phone)
values (714, 'charlize.kier@d', 549982177);
insert into COSTUMER (id_sender, email, phone)
values (715, 'merrill.benoit@', 543448415);
insert into COSTUMER (id_sender, email, phone)
values (716, 'rolando.h@wav.c', 591652543);
insert into COSTUMER (id_sender, email, phone)
values (717, 'eshort@pepsico.', 547637147);
insert into COSTUMER (id_sender, email, phone)
values (718, 'glenn.fehr@phar', 591845397);
insert into COSTUMER (id_sender, email, phone)
values (719, 'alfred.schiavel', 581456274);
insert into COSTUMER (id_sender, email, phone)
values (720, 'parker.myles@be', 585635888);
insert into COSTUMER (id_sender, email, phone)
values (721, 'nikka.mcgregor@', 596911785);
insert into COSTUMER (id_sender, email, phone)
values (722, 'jimmy.stiller@n', 575687952);
insert into COSTUMER (id_sender, email, phone)
values (723, 'mdepp@horizonor', 562782942);
insert into COSTUMER (id_sender, email, phone)
values (724, 'denzel.d@vitaco', 527115868);
insert into COSTUMER (id_sender, email, phone)
values (725, 'gordon@adeasolu', 547745182);
insert into COSTUMER (id_sender, email, phone)
values (726, 'olympia.mccoy@s', 567966933);
insert into COSTUMER (id_sender, email, phone)
values (727, 'jamie.salonga@m', 531234766);
insert into COSTUMER (id_sender, email, phone)
values (728, 'sydney.rifkin@a', 567398967);
insert into COSTUMER (id_sender, email, phone)
values (729, 'greg.carrington', 528245494);
insert into COSTUMER (id_sender, email, phone)
values (730, 'morgan.guest@co', 541439158);
insert into COSTUMER (id_sender, email, phone)
values (731, 'msinise@sis.com', 583615611);
insert into COSTUMER (id_sender, email, phone)
values (732, 'steven.a@axis.c', 537545242);
insert into COSTUMER (id_sender, email, phone)
values (733, 'teenab@palmbeac', 576132352);
insert into COSTUMER (id_sender, email, phone)
values (734, 'wes.rea@insurma', 557132384);
insert into COSTUMER (id_sender, email, phone)
values (735, 'lenny@outsource', 587648211);
insert into COSTUMER (id_sender, email, phone)
values (736, 'anne.saintemari', 581498431);
insert into COSTUMER (id_sender, email, phone)
values (737, 'emma.twilley@tr', 563449961);
insert into COSTUMER (id_sender, email, phone)
values (738, 'jason.scaggs@pr', 544577778);
insert into COSTUMER (id_sender, email, phone)
values (739, 'maury@atg.is', 597526484);
insert into COSTUMER (id_sender, email, phone)
values (740, 'gwyneth@america', 527395495);
insert into COSTUMER (id_sender, email, phone)
values (741, 'goran.tsettos@d', 572781479);
insert into COSTUMER (id_sender, email, phone)
values (742, 'emilio.applegat', 546152147);
insert into COSTUMER (id_sender, email, phone)
values (743, 'danny.byrne@cmi', 584885368);
insert into COSTUMER (id_sender, email, phone)
values (744, 'jeanclaude@sign', 524247979);
insert into COSTUMER (id_sender, email, phone)
values (745, 'mcooper@hencie.', 526399745);
insert into COSTUMER (id_sender, email, phone)
values (746, 'tal@peerlessman', 591949496);
insert into COSTUMER (id_sender, email, phone)
values (747, 'buffy.roberts@p', 587948862);
insert into COSTUMER (id_sender, email, phone)
values (748, 'g.tah@trusecure', 597344242);
insert into COSTUMER (id_sender, email, phone)
values (749, 'miles.ojeda@ter', 593147561);
insert into COSTUMER (id_sender, email, phone)
values (750, 'm.springfield@t', 545929462);
insert into COSTUMER (id_sender, email, phone)
values (751, 'cloris.numan@un', 582337171);
insert into COSTUMER (id_sender, email, phone)
values (752, 'e.duke@kellogg.', 519474327);
insert into COSTUMER (id_sender, email, phone)
values (753, 'daryl.ponty@ven', 515461239);
insert into COSTUMER (id_sender, email, phone)
values (754, 'george.irving@e', 522555494);
insert into COSTUMER (id_sender, email, phone)
values (755, 'sylvestera@soli', 517896362);
insert into COSTUMER (id_sender, email, phone)
values (756, 'l.swinton@matte', 582287576);
insert into COSTUMER (id_sender, email, phone)
values (757, 'gil.king@horizo', 581347134);
insert into COSTUMER (id_sender, email, phone)
values (758, 'chubby.westerbe', 596493271);
insert into COSTUMER (id_sender, email, phone)
values (759, 'diamond.wilkins', 562632115);
insert into COSTUMER (id_sender, email, phone)
values (760, 'percy.sinatra@e', 563291928);
insert into COSTUMER (id_sender, email, phone)
values (761, 'ann.lyonne@prom', 526313736);
insert into COSTUMER (id_sender, email, phone)
values (762, 'john.weiss@trac', 584148288);
insert into COSTUMER (id_sender, email, phone)
values (763, 'brian.northam@a', 573977625);
insert into COSTUMER (id_sender, email, phone)
values (764, 'dennis.brooke@s', 594317595);
insert into COSTUMER (id_sender, email, phone)
values (765, 'lindsay.jenkins', 519827936);
insert into COSTUMER (id_sender, email, phone)
values (766, 'n.garber@verite', 534744635);
insert into COSTUMER (id_sender, email, phone)
values (767, 'wcollie@tracert', 541332536);
insert into COSTUMER (id_sender, email, phone)
values (768, 'franco.baez@gen', 575914485);
insert into COSTUMER (id_sender, email, phone)
values (769, 'freda.evett@vms', 586574196);
insert into COSTUMER (id_sender, email, phone)
values (770, 'k.randal@sensor', 521871264);
insert into COSTUMER (id_sender, email, phone)
values (771, 'frederic.santan', 579973474);
insert into COSTUMER (id_sender, email, phone)
values (772, 'salma.balin@bae', 558875214);
insert into COSTUMER (id_sender, email, phone)
values (773, 'lydia@unicru.de', 533791675);
insert into COSTUMER (id_sender, email, phone)
values (774, 'merrilee.baldwi', 598363185);
insert into COSTUMER (id_sender, email, phone)
values (775, 'geggy.blanchett', 521435249);
insert into COSTUMER (id_sender, email, phone)
values (776, 'maggie.askew@ci', 534668341);
insert into COSTUMER (id_sender, email, phone)
values (777, 'danny.sobieski@', 535115296);
insert into COSTUMER (id_sender, email, phone)
values (778, 'd.utada@ptg.com', 515464258);
insert into COSTUMER (id_sender, email, phone)
values (779, 'aida.fehr@axis.', 558298529);
insert into COSTUMER (id_sender, email, phone)
values (780, 'balthazar.thoma', 564638691);
insert into COSTUMER (id_sender, email, phone)
values (781, 'scottf@contract', 524336793);
insert into COSTUMER (id_sender, email, phone)
values (782, 'reese.mcdonnell', 511848877);
insert into COSTUMER (id_sender, email, phone)
values (783, 'delroyl@mosaic.', 567122277);
insert into COSTUMER (id_sender, email, phone)
values (784, 'neneh.meyer@via', 513763355);
insert into COSTUMER (id_sender, email, phone)
values (785, 'hazel.wheel@can', 549639899);
insert into COSTUMER (id_sender, email, phone)
values (786, 'albertina.sheen', 584522459);
insert into COSTUMER (id_sender, email, phone)
values (787, 'chet@lfg.de', 547997745);
insert into COSTUMER (id_sender, email, phone)
values (788, 'elizabeth.jenki', 543919867);
insert into COSTUMER (id_sender, email, phone)
values (789, 'elvis.faithfull', 545524434);
insert into COSTUMER (id_sender, email, phone)
values (790, 'meredithm@pharm', 595332255);
insert into COSTUMER (id_sender, email, phone)
values (791, 'morgan@contract', 596213761);
insert into COSTUMER (id_sender, email, phone)
values (792, 'jake.church@aol', 575332185);
insert into COSTUMER (id_sender, email, phone)
values (793, 'bobbi.b@execusc', 599689535);
insert into COSTUMER (id_sender, email, phone)
values (794, 'lauren.seagal@v', 554612892);
insert into COSTUMER (id_sender, email, phone)
values (795, 'bonnie@lifeline', 543131453);
insert into COSTUMER (id_sender, email, phone)
values (796, 'danni.henriksen', 516575395);
insert into COSTUMER (id_sender, email, phone)
values (797, 'd.perry@tlsserv', 544296713);
insert into COSTUMER (id_sender, email, phone)
values (798, 'nwebb@scjohnson', 526557249);
insert into COSTUMER (id_sender, email, phone)
values (799, 'henry.glenn@eco', 556357351);
insert into COSTUMER (id_sender, email, phone)
values (800, 'isabella.goodin', 534287253);
commit;
prompt 800 records committed...
insert into COSTUMER (id_sender, email, phone)
values (801, 'famke.spector@j', 523773351);
insert into COSTUMER (id_sender, email, phone)
values (802, 'tony.solido@mar', 587416468);
insert into COSTUMER (id_sender, email, phone)
values (803, 'mfishburne@msdw', 576241321);
insert into COSTUMER (id_sender, email, phone)
values (804, 'jackie.g@dynacq', 525364577);
insert into COSTUMER (id_sender, email, phone)
values (805, 'lrowlands@wav.n', 592253484);
insert into COSTUMER (id_sender, email, phone)
values (806, 'owen.yankovic@y', 597449247);
insert into COSTUMER (id_sender, email, phone)
values (807, 'rfoxx@unilever.', 577733886);
insert into COSTUMER (id_sender, email, phone)
values (808, 'roger.emmerich@', 569947253);
insert into COSTUMER (id_sender, email, phone)
values (809, 'jessem@gdatechn', 547559782);
insert into COSTUMER (id_sender, email, phone)
values (810, 'suzanne@america', 541461686);
insert into COSTUMER (id_sender, email, phone)
values (811, 'udor@processplu', 584426547);
insert into COSTUMER (id_sender, email, phone)
values (812, 'viggo.estevez@r', 559673623);
insert into COSTUMER (id_sender, email, phone)
values (813, 's.leto@jollyent', 531263359);
insert into COSTUMER (id_sender, email, phone)
values (814, 'frances@arkidat', 534256784);
insert into COSTUMER (id_sender, email, phone)
values (815, 'corey@tilsonhr.', 592234126);
insert into COSTUMER (id_sender, email, phone)
values (816, 'fisher@wci.is', 545688678);
insert into COSTUMER (id_sender, email, phone)
values (817, 'patti.himmelman', 556444922);
insert into COSTUMER (id_sender, email, phone)
values (818, 'beverley.atkins', 531995281);
insert into COSTUMER (id_sender, email, phone)
values (819, 'queen@trm.com', 524673773);
insert into COSTUMER (id_sender, email, phone)
values (820, 'carlene@dps.com', 525818445);
insert into COSTUMER (id_sender, email, phone)
values (821, 'brooke.orbit@ci', 526228518);
insert into COSTUMER (id_sender, email, phone)
values (822, 'carla.nightinga', 514845111);
insert into COSTUMER (id_sender, email, phone)
values (823, 'wally.f@mre.pl', 593212849);
insert into COSTUMER (id_sender, email, phone)
values (824, 'aimee.landau@lo', 513497867);
insert into COSTUMER (id_sender, email, phone)
values (825, 'dlasalle@electr', 536922735);
insert into COSTUMER (id_sender, email, phone)
values (826, 'danni.muellerst', 592678632);
insert into COSTUMER (id_sender, email, phone)
values (827, 'c.connelly@chip', 534743812);
insert into COSTUMER (id_sender, email, phone)
values (828, 's.burns@mwp.nl', 553399747);
insert into COSTUMER (id_sender, email, phone)
values (829, 'sheena.mcgowan@', 547365314);
insert into COSTUMER (id_sender, email, phone)
values (830, 'ldunst@sears.co', 579289256);
insert into COSTUMER (id_sender, email, phone)
values (831, 'joely.clooney@y', 581627824);
insert into COSTUMER (id_sender, email, phone)
values (832, 'chaka.blades@mi', 566132566);
insert into COSTUMER (id_sender, email, phone)
values (833, 'lisa@merck.au', 546953595);
insert into COSTUMER (id_sender, email, phone)
values (834, 'laurence.oneill', 572567138);
insert into COSTUMER (id_sender, email, phone)
values (835, 'anna@sony.ch', 584796791);
insert into COSTUMER (id_sender, email, phone)
values (836, 'tcheky.hawkins@', 598968393);
insert into COSTUMER (id_sender, email, phone)
values (837, 'e.marin@dancor.', 594797349);
insert into COSTUMER (id_sender, email, phone)
values (838, 's.scaggs@ntas.c', 565165869);
insert into COSTUMER (id_sender, email, phone)
values (839, 'whoopi.preston@', 571713166);
insert into COSTUMER (id_sender, email, phone)
values (840, 'freddie.newman@', 584586929);
insert into COSTUMER (id_sender, email, phone)
values (841, 'sydney.wilder@p', 584177595);
insert into COSTUMER (id_sender, email, phone)
values (842, 'kay.mahood@ceo.', 558479633);
insert into COSTUMER (id_sender, email, phone)
values (843, 'willie.arkensto', 597486924);
insert into COSTUMER (id_sender, email, phone)
values (844, 'edgar.t@telesyn', 571886758);
insert into COSTUMER (id_sender, email, phone)
values (845, 'anna.plowright@', 525212992);
insert into COSTUMER (id_sender, email, phone)
values (846, 'johnette.belle@', 561346235);
insert into COSTUMER (id_sender, email, phone)
values (847, 'carlene.devito@', 528568656);
insert into COSTUMER (id_sender, email, phone)
values (848, 'rebecca.rebhorn', 594738957);
insert into COSTUMER (id_sender, email, phone)
values (849, 'candice.perrine', 569551389);
insert into COSTUMER (id_sender, email, phone)
values (850, 'jerry.holmes@fi', 586559555);
insert into COSTUMER (id_sender, email, phone)
values (851, 'cbroderick@3tsy', 523152824);
insert into COSTUMER (id_sender, email, phone)
values (852, 'crispin.h@pharm', 575556137);
insert into COSTUMER (id_sender, email, phone)
values (853, 'tanya.greenwood', 518251174);
insert into COSTUMER (id_sender, email, phone)
values (854, 'catherine.phoen', 534721851);
insert into COSTUMER (id_sender, email, phone)
values (855, 'derrick.cohn@nr', 542723561);
insert into COSTUMER (id_sender, email, phone)
values (856, 'rufus.valentin@', 549114443);
insert into COSTUMER (id_sender, email, phone)
values (857, 'g.hutch@grs.com', 569568682);
insert into COSTUMER (id_sender, email, phone)
values (858, 'g.berry@coldsto', 596352758);
insert into COSTUMER (id_sender, email, phone)
values (859, 'aaron.nunn@proc', 547937172);
insert into COSTUMER (id_sender, email, phone)
values (860, 'collin.hopper@p', 565138155);
insert into COSTUMER (id_sender, email, phone)
values (861, 'emerson.conroy@', 579878568);
insert into COSTUMER (id_sender, email, phone)
values (862, 'sylvester.h@mis', 569988579);
insert into COSTUMER (id_sender, email, phone)
values (863, 'jet.cross@chips', 546642892);
insert into COSTUMER (id_sender, email, phone)
values (864, 'marisa.e@dorald', 581597647);
insert into COSTUMER (id_sender, email, phone)
values (865, 'vgarofalo@unite', 569694637);
insert into COSTUMER (id_sender, email, phone)
values (866, 'adrient@thinkta', 512371311);
insert into COSTUMER (id_sender, email, phone)
values (867, 'morgan@meritage', 557677654);
insert into COSTUMER (id_sender, email, phone)
values (868, 'angelina.davis@', 556363365);
insert into COSTUMER (id_sender, email, phone)
values (869, 'freddie.cook@br', 556259142);
insert into COSTUMER (id_sender, email, phone)
values (870, 'spike.hewett@ax', 533484864);
insert into COSTUMER (id_sender, email, phone)
values (871, 'embeth.puckett@', 577969744);
insert into COSTUMER (id_sender, email, phone)
values (872, 'harvey.richards', 536478797);
insert into COSTUMER (id_sender, email, phone)
values (873, 'robp@neogen.com', 526424471);
insert into COSTUMER (id_sender, email, phone)
values (874, 'judy.weber@sbc.', 565628733);
insert into COSTUMER (id_sender, email, phone)
values (875, 'rita@staffforce', 535854155);
insert into COSTUMER (id_sender, email, phone)
values (876, 'gary.hirsch@nav', 558189663);
insert into COSTUMER (id_sender, email, phone)
values (877, 'carrieanne.maxw', 574373238);
insert into COSTUMER (id_sender, email, phone)
values (878, 'fred.rhodes@ast', 596123161);
insert into COSTUMER (id_sender, email, phone)
values (879, 'l.snider@dearbo', 557629737);
insert into COSTUMER (id_sender, email, phone)
values (880, 'gabriel.ali@gba', 598152869);
insert into COSTUMER (id_sender, email, phone)
values (881, 'joely.love@prag', 564771814);
insert into COSTUMER (id_sender, email, phone)
values (882, 'cary.short@carb', 518927311);
insert into COSTUMER (id_sender, email, phone)
values (883, 'terry.nivola@pr', 553471844);
insert into COSTUMER (id_sender, email, phone)
values (884, 'art.nightingale', 582428585);
insert into COSTUMER (id_sender, email, phone)
values (885, 'timothyo@aristo', 534341762);
insert into COSTUMER (id_sender, email, phone)
values (886, 'fgellar@educati', 592473454);
insert into COSTUMER (id_sender, email, phone)
values (887, 'rjamal@fns.com', 595952684);
insert into COSTUMER (id_sender, email, phone)
values (888, 'orlando.bosco@t', 558569992);
insert into COSTUMER (id_sender, email, phone)
values (889, 'sandra.peterson', 559289782);
insert into COSTUMER (id_sender, email, phone)
values (890, 'dball@refinery.', 536961733);
insert into COSTUMER (id_sender, email, phone)
values (891, 'sean@printtech.', 517778684);
insert into COSTUMER (id_sender, email, phone)
values (892, 'daryle.k@horizo', 584661354);
insert into COSTUMER (id_sender, email, phone)
values (893, 'holland.glenn@s', 524196764);
insert into COSTUMER (id_sender, email, phone)
values (894, 'roscoe@signalpe', 543461721);
insert into COSTUMER (id_sender, email, phone)
values (895, 'lenny@officedep', 559616313);
insert into COSTUMER (id_sender, email, phone)
values (896, 'd.graham@alohan', 531654614);
insert into COSTUMER (id_sender, email, phone)
values (897, 'lcrosby@data.co', 573171725);
insert into COSTUMER (id_sender, email, phone)
values (898, 'derrick.harmon@', 517633364);
insert into COSTUMER (id_sender, email, phone)
values (899, 'c.mcdowall@bis.', 581462868);
insert into COSTUMER (id_sender, email, phone)
values (900, 'gilberto.snow@u', 583953325);
commit;
prompt 900 records committed...
insert into COSTUMER (id_sender, email, phone)
values (901, 'micky@mag.com', 587975574);
insert into COSTUMER (id_sender, email, phone)
values (902, 'mekhi.cross@ver', 519626483);
insert into COSTUMER (id_sender, email, phone)
values (903, 'dharnes@aquasca', 519936247);
insert into COSTUMER (id_sender, email, phone)
values (904, 'ekotto@nexxtwor', 543345223);
insert into COSTUMER (id_sender, email, phone)
values (905, 'powers.milsap@w', 534179293);
insert into COSTUMER (id_sender, email, phone)
values (906, 'vin.b@pharmafab', 537618474);
insert into COSTUMER (id_sender, email, phone)
values (907, 'jake.collette@t', 513122485);
insert into COSTUMER (id_sender, email, phone)
values (908, 'jet.forrest@sal', 562395681);
insert into COSTUMER (id_sender, email, phone)
values (909, 'jeffery.krieger', 532673314);
insert into COSTUMER (id_sender, email, phone)
values (910, 'brent.dern@insp', 538457358);
insert into COSTUMER (id_sender, email, phone)
values (911, 'franz.a@bayer.j', 573729872);
insert into COSTUMER (id_sender, email, phone)
values (912, 'howard.wine@spa', 527361689);
insert into COSTUMER (id_sender, email, phone)
values (913, 'tanya.l@innovat', 537339124);
insert into COSTUMER (id_sender, email, phone)
values (914, 'jimmie.f@merita', 585571685);
insert into COSTUMER (id_sender, email, phone)
values (915, 'anita.dillon@gn', 585935442);
insert into COSTUMER (id_sender, email, phone)
values (916, 'g.nivola@sprint', 522583566);
insert into COSTUMER (id_sender, email, phone)
values (917, 'chely.wine@inzo', 544822227);
insert into COSTUMER (id_sender, email, phone)
values (918, 'shannon.elizabe', 584931882);
insert into COSTUMER (id_sender, email, phone)
values (919, 'ccoleman@evergr', 517284782);
insert into COSTUMER (id_sender, email, phone)
values (920, 'suzanne.wincott', 591319325);
insert into COSTUMER (id_sender, email, phone)
values (921, 'd.stuart@emt.jp', 553484154);
insert into COSTUMER (id_sender, email, phone)
values (922, 'kcantrell@techr', 575773914);
insert into COSTUMER (id_sender, email, phone)
values (923, 'miki.cox@isd.jp', 561591886);
insert into COSTUMER (id_sender, email, phone)
values (924, 's.whitwam@nbs.u', 538782814);
insert into COSTUMER (id_sender, email, phone)
values (925, 'brian@ass.at', 556225737);
insert into COSTUMER (id_sender, email, phone)
values (926, 'ty.wiest@mathis', 551212837);
insert into COSTUMER (id_sender, email, phone)
values (927, 'chazz@softworld', 591138522);
insert into COSTUMER (id_sender, email, phone)
values (928, 'c.clarkson@thin', 568614791);
insert into COSTUMER (id_sender, email, phone)
values (929, 'leslies@printte', 584189572);
insert into COSTUMER (id_sender, email, phone)
values (930, 'colin@vertexsol', 559367957);
insert into COSTUMER (id_sender, email, phone)
values (931, 'rick.c@ezecastl', 583513616);
insert into COSTUMER (id_sender, email, phone)
values (932, 'johnny.k@fetchl', 557355769);
insert into COSTUMER (id_sender, email, phone)
values (933, 'slerner@dvdt.co', 559946862);
insert into COSTUMER (id_sender, email, phone)
values (934, 'saul.mccracken@', 516458396);
insert into COSTUMER (id_sender, email, phone)
values (935, 'harry.gallagher', 574494283);
insert into COSTUMER (id_sender, email, phone)
values (936, 'maureen@fiberli', 592553485);
insert into COSTUMER (id_sender, email, phone)
values (937, 'dariusv@cowlitz', 533893924);
insert into COSTUMER (id_sender, email, phone)
values (938, 'laurie.dzundza@', 513433336);
insert into COSTUMER (id_sender, email, phone)
values (939, 'brooke.choice@e', 539485973);
insert into COSTUMER (id_sender, email, phone)
values (940, 'moe.sevigny@son', 525651895);
insert into COSTUMER (id_sender, email, phone)
values (941, 'debra.rucker@in', 516821589);
insert into COSTUMER (id_sender, email, phone)
values (942, 'lucyc@mathis.de', 556689373);
insert into COSTUMER (id_sender, email, phone)
values (943, 'warren.farrow@f', 557432668);
insert into COSTUMER (id_sender, email, phone)
values (944, 'annette.johnson', 545852791);
insert into COSTUMER (id_sender, email, phone)
values (945, 'lucy.chaplin@ca', 538828886);
insert into COSTUMER (id_sender, email, phone)
values (946, 'gilberto.duke@s', 597695139);
insert into COSTUMER (id_sender, email, phone)
values (947, 'thelma.beatty@r', 573544993);
insert into COSTUMER (id_sender, email, phone)
values (948, 'agiraldo@perfec', 538722992);
insert into COSTUMER (id_sender, email, phone)
values (949, 'samantha.parson', 578213971);
insert into COSTUMER (id_sender, email, phone)
values (950, 'robin.shalhoub@', 533291761);
insert into COSTUMER (id_sender, email, phone)
values (951, 'toshiro.allen@e', 512565513);
insert into COSTUMER (id_sender, email, phone)
values (952, 'kittyc@restaura', 536354268);
insert into COSTUMER (id_sender, email, phone)
values (953, 'franco.u@univer', 545821271);
insert into COSTUMER (id_sender, email, phone)
values (954, 'kenny.lawrence@', 523835999);
insert into COSTUMER (id_sender, email, phone)
values (955, 'l.gayle@glmt.co', 574183785);
insert into COSTUMER (id_sender, email, phone)
values (956, 'albertina.stanl', 516994959);
insert into COSTUMER (id_sender, email, phone)
values (957, 'grace@privateba', 511349191);
insert into COSTUMER (id_sender, email, phone)
values (958, 'matt.t@trinityh', 531297616);
insert into COSTUMER (id_sender, email, phone)
values (959, 'charles.h@hudso', 536512732);
insert into COSTUMER (id_sender, email, phone)
values (960, 'willem.sisto@pi', 565265172);
insert into COSTUMER (id_sender, email, phone)
values (961, 'machine.c@conag', 568378946);
insert into COSTUMER (id_sender, email, phone)
values (962, 'jimmy.minogue@k', 543628296);
insert into COSTUMER (id_sender, email, phone)
values (963, 'b.mccracken@pro', 512438414);
insert into COSTUMER (id_sender, email, phone)
values (964, 'azucar.ellis@ul', 531262629);
insert into COSTUMER (id_sender, email, phone)
values (965, 'gil.diaz@dell.c', 545416323);
insert into COSTUMER (id_sender, email, phone)
values (966, 'jet.stanley@lem', 568212438);
insert into COSTUMER (id_sender, email, phone)
values (967, 'midle@floorgrap', 524732711);
insert into COSTUMER (id_sender, email, phone)
values (968, 'pelvic.pastore@', 572548392);
insert into COSTUMER (id_sender, email, phone)
values (969, 'toni.shatner@id', 541298256);
insert into COSTUMER (id_sender, email, phone)
values (970, 'fkweller@evergr', 576619319);
insert into COSTUMER (id_sender, email, phone)
values (971, 'jbroderick@ceb.', 579829231);
insert into COSTUMER (id_sender, email, phone)
values (972, 'franco@monitron', 534294624);
insert into COSTUMER (id_sender, email, phone)
values (973, 'robbie.ohara@ms', 575641947);
insert into COSTUMER (id_sender, email, phone)
values (974, 'edward.watley@b', 582388321);
insert into COSTUMER (id_sender, email, phone)
values (975, 'crispin.w@ameri', 517428828);
insert into COSTUMER (id_sender, email, phone)
values (976, 'n.sampson@at.uk', 548135243);
insert into COSTUMER (id_sender, email, phone)
values (977, 'gaby.dourif@inn', 533146776);
insert into COSTUMER (id_sender, email, phone)
values (978, 'johnette.coliny', 534322675);
insert into COSTUMER (id_sender, email, phone)
values (979, 'tim.gleeson@eli', 518374677);
insert into COSTUMER (id_sender, email, phone)
values (980, 'tom@efcbancorp.', 544816631);
insert into COSTUMER (id_sender, email, phone)
values (981, 'stevie.uggams@u', 552391681);
insert into COSTUMER (id_sender, email, phone)
values (982, 'sara.shannon@ma', 563155354);
insert into COSTUMER (id_sender, email, phone)
values (983, 'k.diehl@lifelin', 535724576);
insert into COSTUMER (id_sender, email, phone)
values (984, 'jackie.teng@sta', 587918619);
insert into COSTUMER (id_sender, email, phone)
values (985, 'g.parsons@mains', 539191779);
insert into COSTUMER (id_sender, email, phone)
values (986, 'henryc@lemprodu', 512414938);
insert into COSTUMER (id_sender, email, phone)
values (987, 'l.stallone@cura', 558684725);
insert into COSTUMER (id_sender, email, phone)
values (988, 'dave.chaykin@as', 573871531);
insert into COSTUMER (id_sender, email, phone)
values (989, 'alessandro@fpf.', 598731411);
insert into COSTUMER (id_sender, email, phone)
values (990, 'collin.sinise@t', 564156135);
insert into COSTUMER (id_sender, email, phone)
values (991, 'fisher.clark@at', 562955943);
insert into COSTUMER (id_sender, email, phone)
values (992, 'tommy.h@iss.fr', 514938196);
insert into COSTUMER (id_sender, email, phone)
values (993, 'christina.kotea', 547546774);
insert into COSTUMER (id_sender, email, phone)
values (994, 'malexander@fab.', 591455414);
insert into COSTUMER (id_sender, email, phone)
values (995, 'hsnow@bestbuy.c', 591623719);
insert into COSTUMER (id_sender, email, phone)
values (996, 'harold.stallone', 587739372);
insert into COSTUMER (id_sender, email, phone)
values (997, 'jody.rubinek@se', 519391754);
insert into COSTUMER (id_sender, email, phone)
values (998, 'qmalkovich@outs', 526614339);
insert into COSTUMER (id_sender, email, phone)
values (999, 'sdamon@cocacola', 561546767);
commit;
prompt 999 records loaded
prompt Loading APPOINTMENTS...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-11-2023', 'dd-mm-yyyy'), 815, 5, 943, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-05-2024', 'dd-mm-yyyy'), 816, 5, 808, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-04-2024', 'dd-mm-yyyy'), 817, 10, 743, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-09-2023', 'dd-mm-yyyy'), 818, 5, 540, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-05-2024', 'dd-mm-yyyy'), 819, 15, 323, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-12-2023', 'dd-mm-yyyy'), 820, 15, 327, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-03-2023', 'dd-mm-yyyy'), 821, 15, 278, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-01-2023', 'dd-mm-yyyy'), 822, 5, 365, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-10-2023', 'dd-mm-yyyy'), 823, 10, 34, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-12-2023', 'dd-mm-yyyy'), 824, 10, 76, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-03-2023', 'dd-mm-yyyy'), 825, 15, 772, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-03-2023', 'dd-mm-yyyy'), 827, 5, 910, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-08-2023', 'dd-mm-yyyy'), 829, 10, 147, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-08-2023', 'dd-mm-yyyy'), 830, 15, 694, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 831, 5, 66, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-11-2023', 'dd-mm-yyyy'), 832, 5, 856, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-06-2023', 'dd-mm-yyyy'), 833, 5, 312, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-04-2023', 'dd-mm-yyyy'), 834, 15, 116, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-07-2023', 'dd-mm-yyyy'), 835, 10, 321, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-02-2023', 'dd-mm-yyyy'), 836, 15, 893, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-02-2024', 'dd-mm-yyyy'), 837, 15, 612, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-06-2024', 'dd-mm-yyyy'), 838, 5, 304, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-08-2023', 'dd-mm-yyyy'), 839, 15, 649, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-03-2024', 'dd-mm-yyyy'), 840, 15, 45, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-08-2023', 'dd-mm-yyyy'), 841, 10, 258, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-03-2023', 'dd-mm-yyyy'), 842, 10, 848, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-05-2023', 'dd-mm-yyyy'), 843, 5, 609, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-04-2024', 'dd-mm-yyyy'), 844, 10, 492, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-06-2023', 'dd-mm-yyyy'), 845, 10, 765, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-01-2024', 'dd-mm-yyyy'), 846, 15, 380, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-04-2023', 'dd-mm-yyyy'), 847, 5, 785, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-05-2024', 'dd-mm-yyyy'), 848, 10, 675, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-05-2023', 'dd-mm-yyyy'), 850, 5, 6, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-09-2023', 'dd-mm-yyyy'), 851, 10, 222, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-06-2023', 'dd-mm-yyyy'), 852, 5, 728, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 853, 15, 588, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2024', 'dd-mm-yyyy'), 854, 10, 749, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 855, 5, 865, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-12-2023', 'dd-mm-yyyy'), 856, 10, 920, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-08-2023', 'dd-mm-yyyy'), 857, 5, 401, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-04-2023', 'dd-mm-yyyy'), 858, 10, 985, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-02-2024', 'dd-mm-yyyy'), 859, 10, 996, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-02-2023', 'dd-mm-yyyy'), 860, 10, 95, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-06-2024', 'dd-mm-yyyy'), 861, 10, 950, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-02-2023', 'dd-mm-yyyy'), 862, 15, 880, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-08-2023', 'dd-mm-yyyy'), 863, 10, 672, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-04-2023', 'dd-mm-yyyy'), 864, 10, 99, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-03-2023', 'dd-mm-yyyy'), 865, 15, 843, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-05-2024', 'dd-mm-yyyy'), 866, 10, 826, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-02-2024', 'dd-mm-yyyy'), 867, 10, 160, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-01-2024', 'dd-mm-yyyy'), 868, 5, 228, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-03-2024', 'dd-mm-yyyy'), 869, 5, 617, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-03-2023', 'dd-mm-yyyy'), 870, 15, 881, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 871, 15, 377, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-12-2023', 'dd-mm-yyyy'), 872, 10, 663, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-05-2023', 'dd-mm-yyyy'), 873, 5, 180, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-11-2023', 'dd-mm-yyyy'), 874, 15, 206, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-04-2023', 'dd-mm-yyyy'), 875, 5, 329, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 876, 10, 904, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-08-2023', 'dd-mm-yyyy'), 877, 10, 241, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-02-2023', 'dd-mm-yyyy'), 878, 5, 500, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-06-2024', 'dd-mm-yyyy'), 879, 10, 545, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-03-2024', 'dd-mm-yyyy'), 880, 15, 212, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-09-2023', 'dd-mm-yyyy'), 881, 10, 757, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 882, 15, 443, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-02-2024', 'dd-mm-yyyy'), 883, 15, 514, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-01-2024', 'dd-mm-yyyy'), 884, 10, 42, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-08-2023', 'dd-mm-yyyy'), 885, 10, 365, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-06-2023', 'dd-mm-yyyy'), 886, 5, 128, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-09-2023', 'dd-mm-yyyy'), 887, 15, 129, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-06-2023', 'dd-mm-yyyy'), 888, 5, 482, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-01-2023', 'dd-mm-yyyy'), 889, 5, 816, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-05-2024', 'dd-mm-yyyy'), 890, 15, 499, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2023', 'dd-mm-yyyy'), 891, 10, 114, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-04-2024', 'dd-mm-yyyy'), 892, 10, 695, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-06-2024', 'dd-mm-yyyy'), 893, 5, 423, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-07-2023', 'dd-mm-yyyy'), 894, 10, 792, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-01-2024', 'dd-mm-yyyy'), 895, 5, 473, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-10-2023', 'dd-mm-yyyy'), 896, 5, 351, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-11-2023', 'dd-mm-yyyy'), 897, 5, 487, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-07-2023', 'dd-mm-yyyy'), 898, 15, 972, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-09-2023', 'dd-mm-yyyy'), 899, 10, 918, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-04-2023', 'dd-mm-yyyy'), 900, 10, 65, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-04-2024', 'dd-mm-yyyy'), 901, 10, 742, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-04-2023', 'dd-mm-yyyy'), 902, 15, 167, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-06-2023', 'dd-mm-yyyy'), 903, 5, 314, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-11-2023', 'dd-mm-yyyy'), 904, 10, 837, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-07-2023', 'dd-mm-yyyy'), 905, 15, 789, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-03-2023', 'dd-mm-yyyy'), 906, 15, 107, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-06-2024', 'dd-mm-yyyy'), 908, 10, 489, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2023', 'dd-mm-yyyy'), 909, 5, 536, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-05-2024', 'dd-mm-yyyy'), 910, 10, 562, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-01-2024', 'dd-mm-yyyy'), 911, 5, 776, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-07-2023', 'dd-mm-yyyy'), 912, 5, 100, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2024', 'dd-mm-yyyy'), 914, 5, 781, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-06-2024', 'dd-mm-yyyy'), 915, 15, 254, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-04-2023', 'dd-mm-yyyy'), 916, 15, 447, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-04-2024', 'dd-mm-yyyy'), 917, 15, 912, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-05-2024', 'dd-mm-yyyy'), 918, 10, 928, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-10-2023', 'dd-mm-yyyy'), 919, 15, 377, 6);
commit;
prompt 100 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-10-2023', 'dd-mm-yyyy'), 920, 15, 439, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-05-2024', 'dd-mm-yyyy'), 921, 10, 822, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-07-2023', 'dd-mm-yyyy'), 922, 5, 520, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-05-2024', 'dd-mm-yyyy'), 923, 15, 318, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-01-2024', 'dd-mm-yyyy'), 924, 5, 558, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-06-2024', 'dd-mm-yyyy'), 925, 10, 868, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-04-2024', 'dd-mm-yyyy'), 926, 5, 860, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-06-2023', 'dd-mm-yyyy'), 927, 15, 24, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 928, 5, 294, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-02-2024', 'dd-mm-yyyy'), 929, 15, 48, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-11-2023', 'dd-mm-yyyy'), 930, 15, 485, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-01-2024', 'dd-mm-yyyy'), 931, 15, 652, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-07-2023', 'dd-mm-yyyy'), 933, 5, 291, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-02-2024', 'dd-mm-yyyy'), 934, 15, 591, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-12-2023', 'dd-mm-yyyy'), 935, 5, 14, 74);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 936, 5, 247, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-03-2024', 'dd-mm-yyyy'), 937, 10, 892, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-05-2024', 'dd-mm-yyyy'), 938, 10, 480, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-05-2023', 'dd-mm-yyyy'), 939, 15, 1, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-09-2023', 'dd-mm-yyyy'), 940, 10, 425, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-05-2023', 'dd-mm-yyyy'), 941, 10, 957, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-02-2024', 'dd-mm-yyyy'), 942, 15, 993, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-03-2023', 'dd-mm-yyyy'), 943, 10, 35, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-09-2023', 'dd-mm-yyyy'), 944, 15, 19, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-03-2024', 'dd-mm-yyyy'), 945, 15, 829, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-06-2024', 'dd-mm-yyyy'), 946, 15, 950, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-07-2023', 'dd-mm-yyyy'), 947, 15, 496, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-04-2023', 'dd-mm-yyyy'), 948, 10, 124, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-09-2023', 'dd-mm-yyyy'), 949, 5, 537, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-07-2023', 'dd-mm-yyyy'), 950, 15, 583, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-07-2023', 'dd-mm-yyyy'), 951, 15, 167, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-03-2023', 'dd-mm-yyyy'), 952, 15, 471, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-03-2023', 'dd-mm-yyyy'), 953, 5, 224, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-11-2023', 'dd-mm-yyyy'), 954, 10, 979, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-05-2024', 'dd-mm-yyyy'), 955, 10, 663, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-06-2024', 'dd-mm-yyyy'), 956, 5, 862, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-08-2023', 'dd-mm-yyyy'), 957, 15, 590, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-05-2023', 'dd-mm-yyyy'), 958, 15, 514, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-06-2024', 'dd-mm-yyyy'), 959, 5, 878, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-01-2023', 'dd-mm-yyyy'), 960, 5, 608, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-11-2023', 'dd-mm-yyyy'), 961, 15, 330, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-03-2024', 'dd-mm-yyyy'), 962, 10, 293, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-02-2024', 'dd-mm-yyyy'), 963, 10, 416, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-09-2023', 'dd-mm-yyyy'), 964, 10, 964, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-02-2024', 'dd-mm-yyyy'), 965, 10, 567, 75);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 966, 10, 583, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-12-2023', 'dd-mm-yyyy'), 967, 15, 31, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-06-2023', 'dd-mm-yyyy'), 968, 15, 572, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-10-2023', 'dd-mm-yyyy'), 969, 10, 294, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-02-2023', 'dd-mm-yyyy'), 970, 10, 258, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-06-2023', 'dd-mm-yyyy'), 971, 10, 804, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-03-2024', 'dd-mm-yyyy'), 972, 5, 262, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-05-2023', 'dd-mm-yyyy'), 973, 5, 960, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-04-2024', 'dd-mm-yyyy'), 974, 15, 54, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-12-2023', 'dd-mm-yyyy'), 975, 10, 724, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-03-2023', 'dd-mm-yyyy'), 976, 15, 81, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-04-2024', 'dd-mm-yyyy'), 977, 5, 152, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-06-2023', 'dd-mm-yyyy'), 978, 5, 962, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-05-2023', 'dd-mm-yyyy'), 979, 5, 825, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-10-2023', 'dd-mm-yyyy'), 980, 5, 190, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-10-2023', 'dd-mm-yyyy'), 981, 15, 661, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-05-2023', 'dd-mm-yyyy'), 983, 15, 620, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-03-2024', 'dd-mm-yyyy'), 984, 10, 680, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-03-2024', 'dd-mm-yyyy'), 985, 10, 496, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-04-2023', 'dd-mm-yyyy'), 986, 5, 20, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-03-2024', 'dd-mm-yyyy'), 987, 15, 750, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 988, 10, 38, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-04-2023', 'dd-mm-yyyy'), 989, 10, 418, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-11-2023', 'dd-mm-yyyy'), 990, 5, 870, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-06-2024', 'dd-mm-yyyy'), 991, 10, 78, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-03-2023', 'dd-mm-yyyy'), 992, 5, 75, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-06-2023', 'dd-mm-yyyy'), 993, 5, 874, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-05-2023', 'dd-mm-yyyy'), 994, 5, 942, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-07-2023', 'dd-mm-yyyy'), 995, 10, 620, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-04-2024', 'dd-mm-yyyy'), 996, 15, 870, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-11-2023', 'dd-mm-yyyy'), 997, 5, 939, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-05-2024', 'dd-mm-yyyy'), 998, 15, 800, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-05-2023', 'dd-mm-yyyy'), 545, 5, 657, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-03-2024', 'dd-mm-yyyy'), 546, 15, 367, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-03-2023', 'dd-mm-yyyy'), 547, 15, 689, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-04-2024', 'dd-mm-yyyy'), 548, 5, 488, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-01-2024', 'dd-mm-yyyy'), 549, 15, 149, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-04-2024', 'dd-mm-yyyy'), 550, 10, 602, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-01-2023', 'dd-mm-yyyy'), 551, 5, 527, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-04-2023', 'dd-mm-yyyy'), 553, 10, 445, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-05-2023', 'dd-mm-yyyy'), 554, 5, 200, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-11-2023', 'dd-mm-yyyy'), 555, 15, 911, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-04-2024', 'dd-mm-yyyy'), 556, 15, 626, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-04-2024', 'dd-mm-yyyy'), 557, 15, 392, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-04-2023', 'dd-mm-yyyy'), 559, 15, 687, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-07-2023', 'dd-mm-yyyy'), 560, 15, 87, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-08-2023', 'dd-mm-yyyy'), 561, 10, 631, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2023', 'dd-mm-yyyy'), 562, 10, 317, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-05-2024', 'dd-mm-yyyy'), 563, 5, 590, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-04-2024', 'dd-mm-yyyy'), 564, 15, 601, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-02-2024', 'dd-mm-yyyy'), 565, 10, 787, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-10-2023', 'dd-mm-yyyy'), 566, 5, 478, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-03-2024', 'dd-mm-yyyy'), 567, 10, 429, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-11-2023', 'dd-mm-yyyy'), 568, 5, 465, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-01-2024', 'dd-mm-yyyy'), 569, 10, 651, 66);
commit;
prompt 200 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-10-2023', 'dd-mm-yyyy'), 570, 10, 662, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-12-2023', 'dd-mm-yyyy'), 571, 15, 276, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-06-2023', 'dd-mm-yyyy'), 572, 15, 159, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-02-2024', 'dd-mm-yyyy'), 573, 15, 374, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-01-2024', 'dd-mm-yyyy'), 575, 15, 652, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-12-2023', 'dd-mm-yyyy'), 577, 15, 645, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-05-2023', 'dd-mm-yyyy'), 578, 10, 636, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-08-2023', 'dd-mm-yyyy'), 579, 10, 719, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-02-2024', 'dd-mm-yyyy'), 580, 5, 999, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-03-2023', 'dd-mm-yyyy'), 581, 15, 891, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-03-2024', 'dd-mm-yyyy'), 582, 5, 295, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-01-2023', 'dd-mm-yyyy'), 583, 10, 462, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-11-2023', 'dd-mm-yyyy'), 585, 10, 455, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-05-2023', 'dd-mm-yyyy'), 586, 5, 90, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-05-2023', 'dd-mm-yyyy'), 587, 15, 877, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-04-2024', 'dd-mm-yyyy'), 588, 10, 776, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-05-2024', 'dd-mm-yyyy'), 589, 15, 784, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-02-2024', 'dd-mm-yyyy'), 590, 15, 402, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-03-2023', 'dd-mm-yyyy'), 591, 15, 164, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-03-2023', 'dd-mm-yyyy'), 592, 5, 394, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-03-2024', 'dd-mm-yyyy'), 593, 10, 624, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-04-2024', 'dd-mm-yyyy'), 594, 10, 328, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-11-2023', 'dd-mm-yyyy'), 595, 10, 907, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-07-2023', 'dd-mm-yyyy'), 596, 10, 95, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-06-2024', 'dd-mm-yyyy'), 597, 15, 200, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2023', 'dd-mm-yyyy'), 598, 10, 867, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-06-2024', 'dd-mm-yyyy'), 599, 10, 269, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 600, 15, 898, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-07-2023', 'dd-mm-yyyy'), 601, 5, 404, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-03-2023', 'dd-mm-yyyy'), 602, 15, 110, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-03-2023', 'dd-mm-yyyy'), 605, 5, 986, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-05-2023', 'dd-mm-yyyy'), 606, 10, 425, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-10-2023', 'dd-mm-yyyy'), 607, 10, 490, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-07-2023', 'dd-mm-yyyy'), 608, 15, 515, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-03-2023', 'dd-mm-yyyy'), 609, 10, 743, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-10-2023', 'dd-mm-yyyy'), 610, 5, 646, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-02-2024', 'dd-mm-yyyy'), 611, 5, 235, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-02-2024', 'dd-mm-yyyy'), 612, 10, 543, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-04-2024', 'dd-mm-yyyy'), 613, 10, 699, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-08-2023', 'dd-mm-yyyy'), 614, 5, 262, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-07-2023', 'dd-mm-yyyy'), 615, 5, 743, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-02-2024', 'dd-mm-yyyy'), 616, 15, 482, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-04-2024', 'dd-mm-yyyy'), 617, 5, 298, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-03-2023', 'dd-mm-yyyy'), 618, 10, 601, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-01-2023', 'dd-mm-yyyy'), 619, 10, 865, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-09-2023', 'dd-mm-yyyy'), 620, 10, 651, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-11-2023', 'dd-mm-yyyy'), 621, 5, 592, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-04-2024', 'dd-mm-yyyy'), 622, 15, 21, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-03-2023', 'dd-mm-yyyy'), 623, 15, 150, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-12-2023', 'dd-mm-yyyy'), 624, 5, 991, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-02-2024', 'dd-mm-yyyy'), 626, 15, 93, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-10-2023', 'dd-mm-yyyy'), 627, 5, 34, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-04-2023', 'dd-mm-yyyy'), 628, 5, 256, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-08-2023', 'dd-mm-yyyy'), 629, 5, 626, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-07-2023', 'dd-mm-yyyy'), 630, 5, 793, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-02-2023', 'dd-mm-yyyy'), 631, 15, 31, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-04-2024', 'dd-mm-yyyy'), 632, 5, 190, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-10-2023', 'dd-mm-yyyy'), 634, 10, 691, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-07-2023', 'dd-mm-yyyy'), 635, 10, 914, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-01-2023', 'dd-mm-yyyy'), 636, 15, 727, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-10-2023', 'dd-mm-yyyy'), 637, 5, 464, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-03-2023', 'dd-mm-yyyy'), 638, 5, 130, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-09-2023', 'dd-mm-yyyy'), 639, 15, 911, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 640, 10, 173, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-09-2023', 'dd-mm-yyyy'), 642, 10, 420, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-02-2024', 'dd-mm-yyyy'), 643, 15, 884, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-04-2023', 'dd-mm-yyyy'), 644, 10, 391, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-02-2024', 'dd-mm-yyyy'), 645, 10, 470, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-03-2023', 'dd-mm-yyyy'), 646, 5, 28, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-04-2023', 'dd-mm-yyyy'), 647, 10, 522, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 648, 10, 992, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-05-2023', 'dd-mm-yyyy'), 649, 15, 374, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-04-2024', 'dd-mm-yyyy'), 650, 5, 757, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-08-2023', 'dd-mm-yyyy'), 651, 5, 525, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-05-2024', 'dd-mm-yyyy'), 652, 10, 524, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-01-2024', 'dd-mm-yyyy'), 653, 10, 713, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-04-2024', 'dd-mm-yyyy'), 654, 5, 942, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-06-2023', 'dd-mm-yyyy'), 655, 10, 794, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-01-2024', 'dd-mm-yyyy'), 656, 5, 653, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-06-2023', 'dd-mm-yyyy'), 657, 15, 435, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-03-2024', 'dd-mm-yyyy'), 658, 15, 632, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-08-2023', 'dd-mm-yyyy'), 659, 5, 619, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-10-2023', 'dd-mm-yyyy'), 660, 15, 358, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-06-2024', 'dd-mm-yyyy'), 661, 15, 966, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-06-2023', 'dd-mm-yyyy'), 662, 5, 780, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-04-2023', 'dd-mm-yyyy'), 663, 5, 862, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-04-2024', 'dd-mm-yyyy'), 664, 15, 113, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-01-2023', 'dd-mm-yyyy'), 665, 15, 404, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-03-2024', 'dd-mm-yyyy'), 666, 5, 429, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-08-2023', 'dd-mm-yyyy'), 668, 5, 77, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-04-2024', 'dd-mm-yyyy'), 669, 15, 703, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-11-2023', 'dd-mm-yyyy'), 671, 10, 66, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-11-2023', 'dd-mm-yyyy'), 672, 10, 281, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-03-2024', 'dd-mm-yyyy'), 673, 5, 859, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-05-2024', 'dd-mm-yyyy'), 675, 10, 317, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-04-2023', 'dd-mm-yyyy'), 676, 5, 816, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-11-2023', 'dd-mm-yyyy'), 677, 10, 103, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-09-2023', 'dd-mm-yyyy'), 678, 15, 116, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-12-2023', 'dd-mm-yyyy'), 679, 5, 945, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-04-2023', 'dd-mm-yyyy'), 680, 15, 22, 99);
commit;
prompt 300 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-03-2023', 'dd-mm-yyyy'), 681, 10, 80, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-07-2023', 'dd-mm-yyyy'), 682, 15, 582, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-03-2023', 'dd-mm-yyyy'), 683, 15, 504, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-06-2023', 'dd-mm-yyyy'), 684, 15, 668, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-04-2023', 'dd-mm-yyyy'), 685, 15, 46, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-04-2023', 'dd-mm-yyyy'), 686, 5, 692, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-12-2023', 'dd-mm-yyyy'), 687, 15, 246, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-05-2024', 'dd-mm-yyyy'), 688, 10, 152, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-02-2023', 'dd-mm-yyyy'), 689, 10, 49, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-06-2024', 'dd-mm-yyyy'), 690, 5, 971, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-04-2024', 'dd-mm-yyyy'), 691, 15, 310, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-10-2023', 'dd-mm-yyyy'), 692, 10, 675, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-07-2023', 'dd-mm-yyyy'), 693, 5, 117, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-11-2023', 'dd-mm-yyyy'), 694, 10, 350, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-08-2023', 'dd-mm-yyyy'), 695, 5, 913, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-07-2023', 'dd-mm-yyyy'), 696, 15, 441, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-12-2023', 'dd-mm-yyyy'), 697, 5, 450, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-03-2024', 'dd-mm-yyyy'), 698, 5, 347, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-03-2024', 'dd-mm-yyyy'), 699, 10, 535, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-09-2023', 'dd-mm-yyyy'), 700, 15, 833, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-05-2024', 'dd-mm-yyyy'), 701, 15, 603, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-12-2023', 'dd-mm-yyyy'), 702, 10, 260, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-06-2024', 'dd-mm-yyyy'), 703, 10, 102, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-06-2024', 'dd-mm-yyyy'), 704, 10, 612, 75);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 705, 10, 675, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-07-2023', 'dd-mm-yyyy'), 706, 5, 355, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-06-2024', 'dd-mm-yyyy'), 707, 5, 180, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-06-2024', 'dd-mm-yyyy'), 708, 5, 94, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-06-2023', 'dd-mm-yyyy'), 709, 15, 496, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-03-2024', 'dd-mm-yyyy'), 710, 15, 49, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-01-2024', 'dd-mm-yyyy'), 711, 10, 162, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-06-2023', 'dd-mm-yyyy'), 712, 15, 342, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-04-2024', 'dd-mm-yyyy'), 713, 10, 815, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-12-2023', 'dd-mm-yyyy'), 714, 10, 99, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-11-2023', 'dd-mm-yyyy'), 715, 5, 451, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-06-2024', 'dd-mm-yyyy'), 716, 5, 357, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-02-2024', 'dd-mm-yyyy'), 717, 15, 488, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-05-2023', 'dd-mm-yyyy'), 718, 15, 793, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-06-2023', 'dd-mm-yyyy'), 719, 15, 652, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-03-2023', 'dd-mm-yyyy'), 720, 10, 260, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-11-2023', 'dd-mm-yyyy'), 721, 10, 665, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-06-2023', 'dd-mm-yyyy'), 722, 15, 134, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-07-2023', 'dd-mm-yyyy'), 723, 15, 757, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-08-2023', 'dd-mm-yyyy'), 724, 10, 481, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-10-2023', 'dd-mm-yyyy'), 725, 15, 977, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-12-2023', 'dd-mm-yyyy'), 726, 5, 27, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-04-2024', 'dd-mm-yyyy'), 727, 15, 333, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-05-2023', 'dd-mm-yyyy'), 729, 5, 724, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-11-2023', 'dd-mm-yyyy'), 730, 10, 468, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-04-2023', 'dd-mm-yyyy'), 731, 10, 709, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-06-2023', 'dd-mm-yyyy'), 732, 5, 273, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-11-2023', 'dd-mm-yyyy'), 733, 15, 63, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-03-2023', 'dd-mm-yyyy'), 734, 15, 733, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-01-2024', 'dd-mm-yyyy'), 735, 5, 167, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-02-2023', 'dd-mm-yyyy'), 736, 15, 940, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-06-2024', 'dd-mm-yyyy'), 737, 10, 194, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-05-2023', 'dd-mm-yyyy'), 738, 10, 562, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-07-2023', 'dd-mm-yyyy'), 739, 5, 123, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-03-2024', 'dd-mm-yyyy'), 740, 15, 496, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-12-2023', 'dd-mm-yyyy'), 741, 5, 548, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-12-2023', 'dd-mm-yyyy'), 742, 5, 350, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-10-2023', 'dd-mm-yyyy'), 743, 10, 320, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-01-2024', 'dd-mm-yyyy'), 745, 15, 977, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-12-2023', 'dd-mm-yyyy'), 746, 10, 331, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-09-2023', 'dd-mm-yyyy'), 747, 15, 15, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-02-2023', 'dd-mm-yyyy'), 748, 5, 864, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-07-2023', 'dd-mm-yyyy'), 749, 10, 939, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-11-2023', 'dd-mm-yyyy'), 750, 5, 768, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-07-2023', 'dd-mm-yyyy'), 751, 10, 163, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-04-2024', 'dd-mm-yyyy'), 752, 15, 752, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-05-2023', 'dd-mm-yyyy'), 753, 10, 685, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-02-2024', 'dd-mm-yyyy'), 754, 10, 142, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-10-2023', 'dd-mm-yyyy'), 755, 15, 607, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 756, 10, 48, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-06-2023', 'dd-mm-yyyy'), 757, 10, 446, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 758, 15, 334, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-11-2023', 'dd-mm-yyyy'), 759, 15, 267, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-02-2024', 'dd-mm-yyyy'), 760, 10, 407, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-05-2023', 'dd-mm-yyyy'), 761, 15, 625, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-01-2023', 'dd-mm-yyyy'), 762, 10, 816, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-02-2024', 'dd-mm-yyyy'), 763, 5, 324, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-05-2023', 'dd-mm-yyyy'), 764, 10, 667, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-11-2023', 'dd-mm-yyyy'), 765, 5, 980, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-03-2023', 'dd-mm-yyyy'), 766, 5, 841, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-04-2024', 'dd-mm-yyyy'), 767, 15, 409, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-01-2024', 'dd-mm-yyyy'), 768, 5, 40, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-01-2024', 'dd-mm-yyyy'), 770, 10, 627, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-02-2024', 'dd-mm-yyyy'), 771, 15, 863, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-03-2023', 'dd-mm-yyyy'), 772, 10, 11, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-10-2023', 'dd-mm-yyyy'), 773, 10, 739, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-02-2024', 'dd-mm-yyyy'), 774, 5, 556, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-06-2024', 'dd-mm-yyyy'), 776, 5, 757, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-01-2024', 'dd-mm-yyyy'), 777, 5, 261, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-08-2023', 'dd-mm-yyyy'), 779, 15, 128, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-03-2024', 'dd-mm-yyyy'), 780, 15, 465, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-05-2023', 'dd-mm-yyyy'), 781, 10, 57, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-12-2023', 'dd-mm-yyyy'), 782, 15, 243, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-08-2023', 'dd-mm-yyyy'), 783, 5, 464, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-05-2024', 'dd-mm-yyyy'), 784, 10, 933, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-03-2024', 'dd-mm-yyyy'), 785, 5, 995, 2);
commit;
prompt 400 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-04-2023', 'dd-mm-yyyy'), 786, 5, 116, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-02-2024', 'dd-mm-yyyy'), 787, 15, 762, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-07-2023', 'dd-mm-yyyy'), 788, 10, 658, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-07-2023', 'dd-mm-yyyy'), 789, 15, 129, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-03-2023', 'dd-mm-yyyy'), 790, 15, 545, 87);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-04-2023', 'dd-mm-yyyy'), 791, 5, 78, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-10-2023', 'dd-mm-yyyy'), 792, 15, 267, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-03-2023', 'dd-mm-yyyy'), 793, 5, 125, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-05-2023', 'dd-mm-yyyy'), 794, 5, 766, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-03-2023', 'dd-mm-yyyy'), 795, 10, 801, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 796, 15, 959, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-03-2024', 'dd-mm-yyyy'), 797, 5, 705, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-01-2024', 'dd-mm-yyyy'), 798, 10, 804, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-02-2024', 'dd-mm-yyyy'), 799, 10, 99, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2024', 'dd-mm-yyyy'), 800, 5, 945, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-03-2023', 'dd-mm-yyyy'), 801, 10, 88, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-01-2023', 'dd-mm-yyyy'), 802, 15, 911, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-01-2023', 'dd-mm-yyyy'), 803, 10, 348, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-06-2024', 'dd-mm-yyyy'), 804, 10, 880, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-04-2023', 'dd-mm-yyyy'), 805, 15, 421, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-08-2023', 'dd-mm-yyyy'), 807, 5, 574, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-04-2023', 'dd-mm-yyyy'), 808, 10, 303, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2024', 'dd-mm-yyyy'), 809, 10, 220, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-01-2024', 'dd-mm-yyyy'), 810, 15, 105, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-02-2023', 'dd-mm-yyyy'), 811, 10, 893, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-09-2023', 'dd-mm-yyyy'), 812, 15, 73, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-08-2023', 'dd-mm-yyyy'), 813, 15, 805, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-10-2023', 'dd-mm-yyyy'), 275, 5, 408, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 276, 5, 790, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-04-2023', 'dd-mm-yyyy'), 277, 5, 182, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-06-2024', 'dd-mm-yyyy'), 278, 10, 820, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-03-2023', 'dd-mm-yyyy'), 279, 15, 309, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-10-2023', 'dd-mm-yyyy'), 280, 15, 454, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-07-2023', 'dd-mm-yyyy'), 281, 10, 129, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-12-2023', 'dd-mm-yyyy'), 282, 10, 289, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-11-2023', 'dd-mm-yyyy'), 283, 15, 474, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-04-2024', 'dd-mm-yyyy'), 284, 5, 438, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-06-2023', 'dd-mm-yyyy'), 285, 10, 732, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2023', 'dd-mm-yyyy'), 286, 10, 375, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 287, 15, 965, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-05-2023', 'dd-mm-yyyy'), 288, 15, 832, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-01-2023', 'dd-mm-yyyy'), 289, 10, 101, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-03-2024', 'dd-mm-yyyy'), 290, 15, 771, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-01-2024', 'dd-mm-yyyy'), 291, 5, 174, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-05-2024', 'dd-mm-yyyy'), 292, 5, 412, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-04-2024', 'dd-mm-yyyy'), 293, 15, 643, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-05-2024', 'dd-mm-yyyy'), 294, 15, 323, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-09-2023', 'dd-mm-yyyy'), 295, 5, 758, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-10-2023', 'dd-mm-yyyy'), 296, 15, 579, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-12-2023', 'dd-mm-yyyy'), 297, 15, 1, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2024', 'dd-mm-yyyy'), 298, 10, 973, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-04-2023', 'dd-mm-yyyy'), 299, 10, 579, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-08-2023', 'dd-mm-yyyy'), 301, 15, 990, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 302, 10, 695, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 303, 5, 642, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-05-2024', 'dd-mm-yyyy'), 304, 10, 42, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-11-2023', 'dd-mm-yyyy'), 305, 5, 538, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-11-2023', 'dd-mm-yyyy'), 306, 15, 433, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 307, 10, 29, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-11-2023', 'dd-mm-yyyy'), 308, 10, 708, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-02-2024', 'dd-mm-yyyy'), 309, 15, 617, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-07-2023', 'dd-mm-yyyy'), 310, 5, 39, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-03-2023', 'dd-mm-yyyy'), 311, 15, 837, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-02-2024', 'dd-mm-yyyy'), 312, 5, 582, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-01-2024', 'dd-mm-yyyy'), 313, 5, 187, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-06-2023', 'dd-mm-yyyy'), 314, 5, 206, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-06-2024', 'dd-mm-yyyy'), 315, 5, 124, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-04-2023', 'dd-mm-yyyy'), 316, 15, 258, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-04-2023', 'dd-mm-yyyy'), 317, 10, 130, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-03-2024', 'dd-mm-yyyy'), 318, 15, 414, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-09-2023', 'dd-mm-yyyy'), 319, 15, 831, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-04-2024', 'dd-mm-yyyy'), 320, 5, 581, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2023', 'dd-mm-yyyy'), 321, 5, 188, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-04-2024', 'dd-mm-yyyy'), 322, 5, 861, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-08-2023', 'dd-mm-yyyy'), 323, 5, 735, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-08-2023', 'dd-mm-yyyy'), 324, 10, 585, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-08-2023', 'dd-mm-yyyy'), 325, 15, 901, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-04-2023', 'dd-mm-yyyy'), 326, 5, 402, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-03-2024', 'dd-mm-yyyy'), 328, 5, 432, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-01-2024', 'dd-mm-yyyy'), 329, 10, 546, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-03-2023', 'dd-mm-yyyy'), 330, 5, 486, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-09-2023', 'dd-mm-yyyy'), 331, 10, 996, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-08-2023', 'dd-mm-yyyy'), 332, 5, 343, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-09-2023', 'dd-mm-yyyy'), 333, 15, 70, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-12-2023', 'dd-mm-yyyy'), 334, 15, 95, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-03-2024', 'dd-mm-yyyy'), 336, 5, 544, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-04-2023', 'dd-mm-yyyy'), 337, 5, 33, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-03-2023', 'dd-mm-yyyy'), 338, 15, 680, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2024', 'dd-mm-yyyy'), 339, 5, 309, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-05-2024', 'dd-mm-yyyy'), 340, 10, 199, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 341, 15, 540, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-11-2023', 'dd-mm-yyyy'), 342, 15, 101, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-08-2023', 'dd-mm-yyyy'), 343, 15, 448, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-12-2023', 'dd-mm-yyyy'), 344, 15, 345, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-03-2023', 'dd-mm-yyyy'), 346, 15, 561, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-09-2023', 'dd-mm-yyyy'), 347, 5, 338, 75);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-06-2023', 'dd-mm-yyyy'), 348, 5, 835, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-05-2023', 'dd-mm-yyyy'), 349, 15, 982, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-09-2023', 'dd-mm-yyyy'), 350, 15, 547, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-01-2023', 'dd-mm-yyyy'), 351, 10, 808, 21);
commit;
prompt 500 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-04-2024', 'dd-mm-yyyy'), 352, 15, 274, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-03-2023', 'dd-mm-yyyy'), 353, 10, 306, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-07-2023', 'dd-mm-yyyy'), 354, 15, 762, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-11-2023', 'dd-mm-yyyy'), 355, 15, 15, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-11-2023', 'dd-mm-yyyy'), 356, 10, 952, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-06-2024', 'dd-mm-yyyy'), 357, 15, 830, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 358, 15, 72, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-12-2023', 'dd-mm-yyyy'), 359, 15, 382, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-09-2023', 'dd-mm-yyyy'), 360, 15, 789, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-10-2023', 'dd-mm-yyyy'), 361, 5, 464, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2023', 'dd-mm-yyyy'), 362, 10, 432, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-04-2024', 'dd-mm-yyyy'), 363, 10, 537, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-10-2023', 'dd-mm-yyyy'), 364, 5, 265, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-01-2024', 'dd-mm-yyyy'), 365, 10, 288, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-02-2024', 'dd-mm-yyyy'), 366, 10, 833, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-04-2024', 'dd-mm-yyyy'), 367, 10, 250, 74);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-06-2023', 'dd-mm-yyyy'), 368, 5, 363, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-04-2024', 'dd-mm-yyyy'), 369, 5, 492, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-10-2023', 'dd-mm-yyyy'), 370, 5, 234, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-10-2023', 'dd-mm-yyyy'), 371, 15, 368, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-07-2023', 'dd-mm-yyyy'), 372, 10, 503, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-07-2023', 'dd-mm-yyyy'), 373, 10, 319, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-04-2024', 'dd-mm-yyyy'), 374, 5, 501, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-06-2023', 'dd-mm-yyyy'), 375, 5, 756, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-01-2024', 'dd-mm-yyyy'), 376, 10, 483, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-01-2023', 'dd-mm-yyyy'), 377, 10, 990, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-03-2024', 'dd-mm-yyyy'), 378, 10, 347, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-04-2024', 'dd-mm-yyyy'), 379, 10, 234, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-03-2023', 'dd-mm-yyyy'), 380, 10, 413, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-08-2023', 'dd-mm-yyyy'), 381, 15, 656, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-06-2023', 'dd-mm-yyyy'), 382, 10, 265, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-07-2023', 'dd-mm-yyyy'), 383, 10, 513, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-01-2024', 'dd-mm-yyyy'), 384, 10, 654, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-08-2023', 'dd-mm-yyyy'), 385, 10, 324, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-06-2024', 'dd-mm-yyyy'), 386, 10, 467, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-07-2023', 'dd-mm-yyyy'), 388, 5, 755, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-11-2023', 'dd-mm-yyyy'), 389, 15, 799, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-06-2023', 'dd-mm-yyyy'), 390, 15, 825, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 391, 15, 396, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-01-2023', 'dd-mm-yyyy'), 392, 15, 394, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-01-2024', 'dd-mm-yyyy'), 393, 10, 623, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-03-2023', 'dd-mm-yyyy'), 394, 15, 805, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-01-2023', 'dd-mm-yyyy'), 395, 5, 318, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-06-2023', 'dd-mm-yyyy'), 396, 15, 309, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-03-2023', 'dd-mm-yyyy'), 398, 5, 403, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-11-2023', 'dd-mm-yyyy'), 399, 15, 549, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-04-2024', 'dd-mm-yyyy'), 400, 15, 239, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-07-2023', 'dd-mm-yyyy'), 402, 15, 87, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-01-2024', 'dd-mm-yyyy'), 403, 15, 321, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-04-2024', 'dd-mm-yyyy'), 404, 10, 864, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-10-2023', 'dd-mm-yyyy'), 405, 10, 320, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-07-2023', 'dd-mm-yyyy'), 406, 10, 731, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-02-2023', 'dd-mm-yyyy'), 407, 5, 380, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-06-2023', 'dd-mm-yyyy'), 408, 15, 739, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-02-2023', 'dd-mm-yyyy'), 409, 5, 471, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-06-2024', 'dd-mm-yyyy'), 410, 10, 555, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-06-2024', 'dd-mm-yyyy'), 411, 10, 929, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-11-2023', 'dd-mm-yyyy'), 412, 15, 233, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-03-2024', 'dd-mm-yyyy'), 413, 15, 520, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-10-2023', 'dd-mm-yyyy'), 414, 15, 60, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-03-2024', 'dd-mm-yyyy'), 415, 5, 562, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-04-2024', 'dd-mm-yyyy'), 416, 5, 462, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-10-2023', 'dd-mm-yyyy'), 417, 15, 109, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-08-2023', 'dd-mm-yyyy'), 418, 15, 967, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-09-2023', 'dd-mm-yyyy'), 419, 5, 201, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-11-2023', 'dd-mm-yyyy'), 420, 10, 236, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-06-2023', 'dd-mm-yyyy'), 421, 5, 175, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-09-2023', 'dd-mm-yyyy'), 422, 15, 155, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-02-2024', 'dd-mm-yyyy'), 423, 5, 35, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-02-2024', 'dd-mm-yyyy'), 424, 5, 988, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-02-2024', 'dd-mm-yyyy'), 425, 15, 891, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-06-2023', 'dd-mm-yyyy'), 426, 15, 596, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-03-2024', 'dd-mm-yyyy'), 427, 10, 457, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-12-2023', 'dd-mm-yyyy'), 428, 5, 715, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-02-2024', 'dd-mm-yyyy'), 429, 15, 607, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-11-2023', 'dd-mm-yyyy'), 431, 10, 3, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-05-2024', 'dd-mm-yyyy'), 432, 15, 915, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-09-2023', 'dd-mm-yyyy'), 433, 5, 778, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-07-2023', 'dd-mm-yyyy'), 434, 15, 232, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-07-2023', 'dd-mm-yyyy'), 435, 5, 286, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-06-2023', 'dd-mm-yyyy'), 436, 10, 525, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-05-2023', 'dd-mm-yyyy'), 437, 15, 909, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-05-2023', 'dd-mm-yyyy'), 438, 5, 283, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-04-2024', 'dd-mm-yyyy'), 440, 5, 856, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-02-2024', 'dd-mm-yyyy'), 441, 15, 493, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-07-2023', 'dd-mm-yyyy'), 442, 5, 178, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-12-2023', 'dd-mm-yyyy'), 443, 15, 541, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-11-2023', 'dd-mm-yyyy'), 444, 5, 536, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-08-2023', 'dd-mm-yyyy'), 445, 15, 940, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-07-2023', 'dd-mm-yyyy'), 446, 10, 425, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-01-2024', 'dd-mm-yyyy'), 447, 10, 573, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-01-2024', 'dd-mm-yyyy'), 448, 5, 441, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-02-2023', 'dd-mm-yyyy'), 449, 15, 526, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-08-2023', 'dd-mm-yyyy'), 450, 10, 255, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-02-2024', 'dd-mm-yyyy'), 451, 15, 341, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-04-2023', 'dd-mm-yyyy'), 452, 5, 636, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-03-2023', 'dd-mm-yyyy'), 453, 10, 322, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-12-2023', 'dd-mm-yyyy'), 454, 5, 552, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-05-2024', 'dd-mm-yyyy'), 455, 15, 914, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-05-2023', 'dd-mm-yyyy'), 456, 5, 314, 46);
commit;
prompt 600 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-05-2023', 'dd-mm-yyyy'), 457, 10, 135, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-11-2023', 'dd-mm-yyyy'), 458, 10, 798, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-06-2024', 'dd-mm-yyyy'), 459, 5, 71, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-10-2023', 'dd-mm-yyyy'), 460, 10, 727, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-12-2023', 'dd-mm-yyyy'), 461, 15, 443, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-10-2023', 'dd-mm-yyyy'), 462, 15, 7, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-03-2023', 'dd-mm-yyyy'), 463, 10, 227, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-05-2024', 'dd-mm-yyyy'), 464, 15, 134, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-11-2023', 'dd-mm-yyyy'), 465, 5, 338, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-04-2023', 'dd-mm-yyyy'), 466, 10, 660, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-05-2023', 'dd-mm-yyyy'), 467, 10, 380, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-12-2023', 'dd-mm-yyyy'), 468, 5, 726, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-01-2024', 'dd-mm-yyyy'), 469, 10, 457, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-02-2024', 'dd-mm-yyyy'), 470, 10, 648, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-10-2023', 'dd-mm-yyyy'), 471, 5, 839, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-11-2023', 'dd-mm-yyyy'), 472, 15, 582, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-06-2023', 'dd-mm-yyyy'), 473, 10, 609, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-06-2023', 'dd-mm-yyyy'), 474, 10, 884, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-02-2024', 'dd-mm-yyyy'), 475, 5, 184, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-01-2024', 'dd-mm-yyyy'), 477, 15, 733, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-09-2023', 'dd-mm-yyyy'), 478, 5, 795, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 479, 15, 161, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-02-2024', 'dd-mm-yyyy'), 480, 10, 915, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-09-2023', 'dd-mm-yyyy'), 481, 10, 413, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-05-2023', 'dd-mm-yyyy'), 482, 15, 956, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-06-2023', 'dd-mm-yyyy'), 483, 5, 492, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-03-2024', 'dd-mm-yyyy'), 484, 5, 464, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-08-2023', 'dd-mm-yyyy'), 485, 15, 267, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-03-2023', 'dd-mm-yyyy'), 486, 5, 947, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-01-2023', 'dd-mm-yyyy'), 487, 15, 109, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-09-2023', 'dd-mm-yyyy'), 488, 15, 157, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-09-2023', 'dd-mm-yyyy'), 489, 10, 333, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-06-2024', 'dd-mm-yyyy'), 490, 10, 191, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-01-2023', 'dd-mm-yyyy'), 491, 15, 454, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-03-2024', 'dd-mm-yyyy'), 492, 15, 406, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-08-2023', 'dd-mm-yyyy'), 493, 15, 256, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-05-2024', 'dd-mm-yyyy'), 494, 10, 139, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-03-2023', 'dd-mm-yyyy'), 495, 5, 671, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-06-2023', 'dd-mm-yyyy'), 496, 15, 247, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-12-2023', 'dd-mm-yyyy'), 497, 10, 475, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 498, 5, 456, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-07-2023', 'dd-mm-yyyy'), 499, 15, 792, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-02-2024', 'dd-mm-yyyy'), 500, 15, 524, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-12-2023', 'dd-mm-yyyy'), 501, 15, 411, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-08-2023', 'dd-mm-yyyy'), 502, 15, 214, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-02-2024', 'dd-mm-yyyy'), 504, 10, 81, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-01-2023', 'dd-mm-yyyy'), 505, 10, 653, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-02-2023', 'dd-mm-yyyy'), 506, 15, 73, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-09-2023', 'dd-mm-yyyy'), 508, 15, 942, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-04-2024', 'dd-mm-yyyy'), 509, 10, 146, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-11-2023', 'dd-mm-yyyy'), 510, 15, 471, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-06-2024', 'dd-mm-yyyy'), 511, 5, 136, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-08-2023', 'dd-mm-yyyy'), 512, 15, 507, 74);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-12-2023', 'dd-mm-yyyy'), 513, 10, 379, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-03-2023', 'dd-mm-yyyy'), 514, 5, 814, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-05-2023', 'dd-mm-yyyy'), 515, 10, 496, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-06-2024', 'dd-mm-yyyy'), 516, 10, 734, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-02-2024', 'dd-mm-yyyy'), 517, 10, 574, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-03-2023', 'dd-mm-yyyy'), 518, 5, 660, 87);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-08-2023', 'dd-mm-yyyy'), 519, 15, 792, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-03-2023', 'dd-mm-yyyy'), 520, 15, 327, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-05-2023', 'dd-mm-yyyy'), 521, 15, 870, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-03-2023', 'dd-mm-yyyy'), 522, 15, 908, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-07-2023', 'dd-mm-yyyy'), 523, 10, 320, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-05-2023', 'dd-mm-yyyy'), 524, 10, 927, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-12-2023', 'dd-mm-yyyy'), 525, 5, 515, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-05-2023', 'dd-mm-yyyy'), 526, 5, 984, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-05-2023', 'dd-mm-yyyy'), 527, 10, 573, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-12-2023', 'dd-mm-yyyy'), 528, 5, 295, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-09-2023', 'dd-mm-yyyy'), 529, 5, 48, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-05-2024', 'dd-mm-yyyy'), 530, 5, 34, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-07-2023', 'dd-mm-yyyy'), 532, 15, 502, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 533, 5, 490, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-02-2024', 'dd-mm-yyyy'), 534, 5, 101, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-10-2023', 'dd-mm-yyyy'), 535, 15, 363, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-03-2024', 'dd-mm-yyyy'), 536, 10, 118, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-01-2024', 'dd-mm-yyyy'), 537, 10, 534, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-04-2024', 'dd-mm-yyyy'), 538, 15, 325, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-10-2023', 'dd-mm-yyyy'), 539, 5, 578, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-09-2023', 'dd-mm-yyyy'), 540, 10, 394, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-12-2023', 'dd-mm-yyyy'), 541, 15, 726, 87);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-06-2024', 'dd-mm-yyyy'), 542, 15, 119, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-04-2024', 'dd-mm-yyyy'), 543, 15, 251, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-12-2023', 'dd-mm-yyyy'), 544, 15, 456, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-06-2023', 'dd-mm-yyyy'), 16, 10, 581, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-06-2023', 'dd-mm-yyyy'), 17, 5, 568, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-06-2023', 'dd-mm-yyyy'), 18, 15, 782, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-02-2024', 'dd-mm-yyyy'), 19, 10, 760, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-11-2023', 'dd-mm-yyyy'), 20, 5, 328, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-06-2023', 'dd-mm-yyyy'), 21, 10, 718, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-06-2024', 'dd-mm-yyyy'), 22, 10, 596, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-04-2023', 'dd-mm-yyyy'), 23, 15, 190, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-08-2023', 'dd-mm-yyyy'), 24, 10, 984, 74);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-05-2024', 'dd-mm-yyyy'), 25, 15, 907, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-04-2023', 'dd-mm-yyyy'), 26, 10, 863, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-09-2023', 'dd-mm-yyyy'), 27, 10, 544, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-12-2023', 'dd-mm-yyyy'), 28, 5, 788, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-10-2023', 'dd-mm-yyyy'), 29, 15, 458, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-02-2023', 'dd-mm-yyyy'), 30, 15, 81, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-04-2024', 'dd-mm-yyyy'), 31, 5, 727, 56);
commit;
prompt 700 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-07-2023', 'dd-mm-yyyy'), 32, 15, 875, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-06-2024', 'dd-mm-yyyy'), 33, 5, 226, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-02-2024', 'dd-mm-yyyy'), 34, 15, 725, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-09-2023', 'dd-mm-yyyy'), 35, 10, 262, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-04-2023', 'dd-mm-yyyy'), 36, 5, 775, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-10-2023', 'dd-mm-yyyy'), 37, 15, 777, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-05-2024', 'dd-mm-yyyy'), 38, 5, 489, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-01-2024', 'dd-mm-yyyy'), 39, 5, 115, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-05-2024', 'dd-mm-yyyy'), 40, 10, 949, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-03-2024', 'dd-mm-yyyy'), 41, 10, 341, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-04-2024', 'dd-mm-yyyy'), 42, 10, 711, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-08-2023', 'dd-mm-yyyy'), 44, 15, 225, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-12-2023', 'dd-mm-yyyy'), 45, 15, 250, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-10-2023', 'dd-mm-yyyy'), 46, 15, 816, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-05-2023', 'dd-mm-yyyy'), 47, 5, 502, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-12-2023', 'dd-mm-yyyy'), 48, 15, 235, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-05-2024', 'dd-mm-yyyy'), 49, 10, 376, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-06-2023', 'dd-mm-yyyy'), 50, 5, 756, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-06-2023', 'dd-mm-yyyy'), 51, 5, 142, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-09-2023', 'dd-mm-yyyy'), 52, 15, 857, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-01-2024', 'dd-mm-yyyy'), 53, 5, 569, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-01-2023', 'dd-mm-yyyy'), 54, 10, 445, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-06-2024', 'dd-mm-yyyy'), 55, 5, 184, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-12-2023', 'dd-mm-yyyy'), 56, 5, 651, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-06-2024', 'dd-mm-yyyy'), 58, 15, 193, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-04-2023', 'dd-mm-yyyy'), 59, 15, 389, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-03-2024', 'dd-mm-yyyy'), 60, 5, 290, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-04-2024', 'dd-mm-yyyy'), 61, 10, 72, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-11-2023', 'dd-mm-yyyy'), 62, 5, 149, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-03-2024', 'dd-mm-yyyy'), 63, 10, 590, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-07-2023', 'dd-mm-yyyy'), 64, 15, 7, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-03-2023', 'dd-mm-yyyy'), 65, 15, 905, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-01-2024', 'dd-mm-yyyy'), 66, 5, 737, 75);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-10-2023', 'dd-mm-yyyy'), 67, 10, 130, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-10-2023', 'dd-mm-yyyy'), 68, 5, 26, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-10-2023', 'dd-mm-yyyy'), 69, 15, 731, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-05-2023', 'dd-mm-yyyy'), 70, 15, 94, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-03-2024', 'dd-mm-yyyy'), 71, 5, 985, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-05-2023', 'dd-mm-yyyy'), 72, 10, 678, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-06-2023', 'dd-mm-yyyy'), 73, 10, 462, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-01-2024', 'dd-mm-yyyy'), 74, 15, 196, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-08-2023', 'dd-mm-yyyy'), 75, 5, 445, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-09-2023', 'dd-mm-yyyy'), 76, 5, 56, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-04-2023', 'dd-mm-yyyy'), 77, 5, 46, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-07-2023', 'dd-mm-yyyy'), 78, 10, 612, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-06-2023', 'dd-mm-yyyy'), 79, 5, 766, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-02-2024', 'dd-mm-yyyy'), 80, 10, 429, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 81, 5, 998, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-06-2023', 'dd-mm-yyyy'), 82, 5, 713, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-03-2024', 'dd-mm-yyyy'), 83, 15, 352, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-09-2023', 'dd-mm-yyyy'), 84, 15, 50, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-08-2023', 'dd-mm-yyyy'), 86, 5, 457, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-07-2023', 'dd-mm-yyyy'), 87, 15, 168, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-02-2023', 'dd-mm-yyyy'), 88, 5, 750, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-10-2023', 'dd-mm-yyyy'), 89, 10, 338, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-07-2023', 'dd-mm-yyyy'), 91, 10, 902, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-06-2024', 'dd-mm-yyyy'), 92, 15, 632, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-10-2023', 'dd-mm-yyyy'), 93, 15, 526, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-05-2023', 'dd-mm-yyyy'), 94, 10, 507, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2024', 'dd-mm-yyyy'), 95, 10, 658, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-06-2024', 'dd-mm-yyyy'), 96, 10, 758, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-05-2023', 'dd-mm-yyyy'), 97, 10, 61, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-02-2023', 'dd-mm-yyyy'), 98, 15, 609, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-03-2023', 'dd-mm-yyyy'), 99, 15, 635, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2023', 'dd-mm-yyyy'), 100, 10, 835, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-03-2023', 'dd-mm-yyyy'), 101, 15, 574, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-09-2023', 'dd-mm-yyyy'), 102, 10, 316, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-09-2023', 'dd-mm-yyyy'), 103, 15, 818, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-12-2023', 'dd-mm-yyyy'), 104, 15, 901, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-04-2024', 'dd-mm-yyyy'), 105, 10, 827, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-01-2024', 'dd-mm-yyyy'), 106, 5, 590, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-01-2024', 'dd-mm-yyyy'), 107, 10, 667, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-04-2024', 'dd-mm-yyyy'), 108, 5, 19, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-12-2023', 'dd-mm-yyyy'), 109, 15, 400, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-09-2023', 'dd-mm-yyyy'), 110, 15, 262, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-06-2023', 'dd-mm-yyyy'), 111, 15, 801, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-01-2024', 'dd-mm-yyyy'), 112, 5, 954, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-08-2023', 'dd-mm-yyyy'), 113, 5, 376, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-09-2023', 'dd-mm-yyyy'), 115, 15, 692, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-01-2023', 'dd-mm-yyyy'), 116, 5, 872, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-01-2023', 'dd-mm-yyyy'), 117, 5, 31, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-01-2024', 'dd-mm-yyyy'), 118, 10, 555, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-08-2023', 'dd-mm-yyyy'), 119, 5, 343, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-05-2023', 'dd-mm-yyyy'), 120, 5, 20, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 121, 10, 521, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-08-2023', 'dd-mm-yyyy'), 122, 10, 342, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 123, 10, 983, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-05-2023', 'dd-mm-yyyy'), 124, 10, 413, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-10-2023', 'dd-mm-yyyy'), 125, 5, 570, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-10-2023', 'dd-mm-yyyy'), 126, 15, 232, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-07-2023', 'dd-mm-yyyy'), 127, 10, 753, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-03-2024', 'dd-mm-yyyy'), 128, 15, 527, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-03-2023', 'dd-mm-yyyy'), 129, 5, 158, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-01-2024', 'dd-mm-yyyy'), 130, 15, 685, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-08-2023', 'dd-mm-yyyy'), 131, 15, 392, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-11-2023', 'dd-mm-yyyy'), 132, 5, 984, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-08-2023', 'dd-mm-yyyy'), 133, 15, 203, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-05-2023', 'dd-mm-yyyy'), 134, 10, 155, 87);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-12-2023', 'dd-mm-yyyy'), 135, 10, 924, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-08-2023', 'dd-mm-yyyy'), 136, 15, 239, 20);
commit;
prompt 800 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-09-2023', 'dd-mm-yyyy'), 137, 15, 257, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-03-2023', 'dd-mm-yyyy'), 138, 10, 768, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 139, 5, 348, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-10-2023', 'dd-mm-yyyy'), 140, 5, 262, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-07-2023', 'dd-mm-yyyy'), 141, 15, 188, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-04-2023', 'dd-mm-yyyy'), 142, 15, 19, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-05-2023', 'dd-mm-yyyy'), 143, 10, 323, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-10-2023', 'dd-mm-yyyy'), 144, 10, 239, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 145, 5, 869, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-10-2023', 'dd-mm-yyyy'), 146, 5, 450, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-06-2024', 'dd-mm-yyyy'), 147, 5, 856, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-06-2024', 'dd-mm-yyyy'), 148, 5, 246, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-03-2023', 'dd-mm-yyyy'), 149, 15, 866, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-10-2023', 'dd-mm-yyyy'), 150, 15, 344, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-05-2024', 'dd-mm-yyyy'), 151, 10, 994, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-04-2024', 'dd-mm-yyyy'), 153, 10, 124, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-01-2023', 'dd-mm-yyyy'), 154, 15, 413, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-11-2023', 'dd-mm-yyyy'), 155, 5, 505, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-06-2023', 'dd-mm-yyyy'), 156, 5, 266, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-12-2023', 'dd-mm-yyyy'), 157, 15, 654, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-10-2023', 'dd-mm-yyyy'), 158, 10, 480, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-05-2023', 'dd-mm-yyyy'), 159, 5, 565, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-07-2023', 'dd-mm-yyyy'), 160, 5, 100, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-07-2023', 'dd-mm-yyyy'), 161, 10, 226, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-08-2023', 'dd-mm-yyyy'), 162, 15, 171, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-05-2023', 'dd-mm-yyyy'), 163, 15, 455, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-07-2023', 'dd-mm-yyyy'), 164, 15, 979, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-04-2023', 'dd-mm-yyyy'), 165, 15, 48, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-05-2023', 'dd-mm-yyyy'), 166, 15, 602, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-06-2023', 'dd-mm-yyyy'), 167, 5, 237, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-04-2023', 'dd-mm-yyyy'), 168, 15, 774, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-08-2023', 'dd-mm-yyyy'), 169, 10, 461, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-12-2023', 'dd-mm-yyyy'), 170, 5, 66, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-06-2023', 'dd-mm-yyyy'), 171, 10, 470, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-08-2023', 'dd-mm-yyyy'), 172, 5, 73, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-05-2023', 'dd-mm-yyyy'), 173, 15, 714, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-07-2023', 'dd-mm-yyyy'), 174, 15, 648, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-12-2023', 'dd-mm-yyyy'), 175, 15, 114, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-05-2023', 'dd-mm-yyyy'), 176, 15, 339, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-10-2023', 'dd-mm-yyyy'), 177, 10, 872, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-01-2024', 'dd-mm-yyyy'), 178, 15, 674, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-10-2023', 'dd-mm-yyyy'), 179, 5, 338, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-09-2023', 'dd-mm-yyyy'), 180, 15, 49, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-12-2023', 'dd-mm-yyyy'), 181, 5, 134, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-03-2023', 'dd-mm-yyyy'), 182, 15, 317, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-04-2024', 'dd-mm-yyyy'), 183, 5, 40, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-12-2023', 'dd-mm-yyyy'), 184, 5, 449, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-01-2024', 'dd-mm-yyyy'), 185, 15, 924, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-03-2024', 'dd-mm-yyyy'), 186, 5, 242, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-01-2023', 'dd-mm-yyyy'), 187, 5, 742, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-04-2023', 'dd-mm-yyyy'), 188, 10, 105, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-11-2023', 'dd-mm-yyyy'), 189, 10, 596, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-02-2024', 'dd-mm-yyyy'), 190, 10, 895, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-02-2023', 'dd-mm-yyyy'), 191, 5, 859, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-02-2024', 'dd-mm-yyyy'), 192, 5, 830, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-11-2023', 'dd-mm-yyyy'), 193, 5, 361, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-11-2023', 'dd-mm-yyyy'), 194, 5, 445, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-03-2024', 'dd-mm-yyyy'), 196, 15, 628, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-11-2023', 'dd-mm-yyyy'), 197, 15, 226, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2024', 'dd-mm-yyyy'), 198, 5, 713, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2023', 'dd-mm-yyyy'), 199, 10, 75, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-04-2024', 'dd-mm-yyyy'), 200, 15, 628, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-12-2023', 'dd-mm-yyyy'), 201, 5, 937, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-02-2024', 'dd-mm-yyyy'), 1, 5, 733, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-02-2024', 'dd-mm-yyyy'), 2, 10, 31, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-03-2023', 'dd-mm-yyyy'), 3, 15, 705, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-05-2023', 'dd-mm-yyyy'), 4, 15, 204, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-12-2023', 'dd-mm-yyyy'), 5, 10, 36, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-05-2023', 'dd-mm-yyyy'), 6, 15, 11, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-09-2023', 'dd-mm-yyyy'), 7, 10, 313, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-02-2023', 'dd-mm-yyyy'), 8, 5, 129, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-09-2023', 'dd-mm-yyyy'), 9, 15, 674, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-02-2024', 'dd-mm-yyyy'), 10, 10, 745, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-01-2024', 'dd-mm-yyyy'), 11, 10, 146, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-02-2023', 'dd-mm-yyyy'), 12, 5, 588, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-07-2023', 'dd-mm-yyyy'), 13, 10, 957, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-02-2024', 'dd-mm-yyyy'), 14, 15, 14, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-02-2023', 'dd-mm-yyyy'), 15, 15, 914, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-01-2024', 'dd-mm-yyyy'), 202, 10, 119, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-03-2023', 'dd-mm-yyyy'), 203, 15, 895, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-03-2023', 'dd-mm-yyyy'), 204, 5, 22, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-07-2023', 'dd-mm-yyyy'), 205, 10, 911, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-12-2023', 'dd-mm-yyyy'), 206, 10, 612, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-06-2023', 'dd-mm-yyyy'), 207, 5, 453, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-04-2024', 'dd-mm-yyyy'), 208, 10, 3, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 209, 10, 177, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-04-2024', 'dd-mm-yyyy'), 210, 5, 614, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-06-2024', 'dd-mm-yyyy'), 211, 5, 679, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-02-2024', 'dd-mm-yyyy'), 212, 5, 702, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-04-2023', 'dd-mm-yyyy'), 213, 5, 308, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-01-2023', 'dd-mm-yyyy'), 214, 5, 952, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-03-2024', 'dd-mm-yyyy'), 215, 15, 28, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-08-2023', 'dd-mm-yyyy'), 216, 10, 129, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-07-2023', 'dd-mm-yyyy'), 217, 5, 365, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-02-2023', 'dd-mm-yyyy'), 218, 10, 798, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-05-2024', 'dd-mm-yyyy'), 219, 15, 401, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-02-2024', 'dd-mm-yyyy'), 220, 15, 104, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-10-2023', 'dd-mm-yyyy'), 221, 15, 832, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-07-2023', 'dd-mm-yyyy'), 222, 15, 608, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-10-2023', 'dd-mm-yyyy'), 223, 10, 97, 100);
commit;
prompt 900 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-12-2023', 'dd-mm-yyyy'), 224, 10, 199, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 225, 5, 554, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-07-2023', 'dd-mm-yyyy'), 226, 5, 56, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-06-2023', 'dd-mm-yyyy'), 227, 5, 740, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-01-2023', 'dd-mm-yyyy'), 228, 10, 675, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-10-2023', 'dd-mm-yyyy'), 229, 15, 672, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-05-2024', 'dd-mm-yyyy'), 230, 10, 970, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2024', 'dd-mm-yyyy'), 231, 10, 225, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-09-2023', 'dd-mm-yyyy'), 232, 10, 419, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-01-2024', 'dd-mm-yyyy'), 233, 5, 564, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2024', 'dd-mm-yyyy'), 234, 10, 282, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 235, 5, 646, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-04-2024', 'dd-mm-yyyy'), 236, 15, 881, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-08-2023', 'dd-mm-yyyy'), 237, 15, 779, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-07-2023', 'dd-mm-yyyy'), 238, 10, 946, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-07-2023', 'dd-mm-yyyy'), 239, 15, 243, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-08-2023', 'dd-mm-yyyy'), 240, 5, 13, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-06-2023', 'dd-mm-yyyy'), 241, 15, 977, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-03-2023', 'dd-mm-yyyy'), 242, 10, 892, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-01-2023', 'dd-mm-yyyy'), 243, 10, 331, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-08-2023', 'dd-mm-yyyy'), 244, 5, 203, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-06-2024', 'dd-mm-yyyy'), 245, 5, 867, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-05-2023', 'dd-mm-yyyy'), 246, 15, 955, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-03-2023', 'dd-mm-yyyy'), 247, 15, 245, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-10-2023', 'dd-mm-yyyy'), 248, 5, 217, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-08-2023', 'dd-mm-yyyy'), 249, 5, 144, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-08-2023', 'dd-mm-yyyy'), 250, 5, 816, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-10-2023', 'dd-mm-yyyy'), 251, 10, 273, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-07-2023', 'dd-mm-yyyy'), 252, 5, 135, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-08-2023', 'dd-mm-yyyy'), 253, 15, 422, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-08-2023', 'dd-mm-yyyy'), 254, 5, 937, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-10-2023', 'dd-mm-yyyy'), 255, 5, 593, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 256, 15, 286, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-10-2023', 'dd-mm-yyyy'), 258, 15, 500, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-11-2023', 'dd-mm-yyyy'), 259, 10, 215, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-05-2023', 'dd-mm-yyyy'), 261, 5, 689, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-04-2024', 'dd-mm-yyyy'), 262, 5, 344, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-10-2023', 'dd-mm-yyyy'), 263, 10, 913, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-05-2023', 'dd-mm-yyyy'), 264, 5, 489, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-03-2024', 'dd-mm-yyyy'), 265, 15, 962, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-03-2023', 'dd-mm-yyyy'), 266, 5, 902, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-10-2023', 'dd-mm-yyyy'), 268, 5, 893, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-07-2023', 'dd-mm-yyyy'), 269, 15, 682, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-12-2023', 'dd-mm-yyyy'), 270, 5, 144, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-03-2023', 'dd-mm-yyyy'), 271, 15, 100, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-06-2023', 'dd-mm-yyyy'), 272, 15, 112, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-09-2023', 'dd-mm-yyyy'), 273, 15, 142, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-03-2023', 'dd-mm-yyyy'), 274, 5, 501, 99);
commit;
prompt 948 records loaded
prompt Loading CITY...
insert into CITY (cityname, citynum)
values ('Pajak', 1);
insert into CITY (cityname, citynum)
values ('Mikhn?vo', 2);
insert into CITY (cityname, citynum)
values ('Dampek', 3);
insert into CITY (cityname, citynum)
values ('Garden Grove', 4);
insert into CITY (cityname, citynum)
values ('Lagunillas', 5);
insert into CITY (cityname, citynum)
values ('Ust’ye', 6);
insert into CITY (cityname, citynum)
values ('Phichai', 7);
insert into CITY (cityname, citynum)
values ('H?ssleholm', 9);
insert into CITY (cityname, citynum)
values ('Yorii', 10);
insert into CITY (cityname, citynum)
values ('Buriram', 11);
insert into CITY (cityname, citynum)
values ('Tilcara', 12);
insert into CITY (cityname, citynum)
values ('Al ‘Alamayn', 13);
insert into CITY (cityname, citynum)
values ('Mark?poulo', 15);
insert into CITY (cityname, citynum)
values ('Sirnasari', 16);
insert into CITY (cityname, citynum)
values ('T?kest?n', 17);
insert into CITY (cityname, citynum)
values ('Diamantina', 18);
insert into CITY (cityname, citynum)
values ('Helsingborg', 19);
commit;
prompt 17 records loaded
prompt Loading CREDIT_RESULTS_TEMP...
prompt Table is empty
prompt Loading JOB...
insert into JOB (jobnum, jobname, hourorpackagesalary)
values (67, 'פקיד', 35.9);
insert into JOB (jobnum, jobname, hourorpackagesalary)
values (68, 'מנהל', 50.2);
insert into JOB (jobnum, jobname, hourorpackagesalary)
values (69, 'משלוחן', 73.5);
insert into JOB (jobnum, jobname, hourorpackagesalary)
values (70, 'ממיין', 35.9);
insert into JOB (jobnum, jobname, hourorpackagesalary)
values (71, 'נהג', 50.2);
commit;
prompt 5 records loaded
prompt Loading ORDERSTATUS...
insert into ORDERSTATUS (statusnum, statusname, chronoorder)
values (35, 'נשלח', 3);
insert into ORDERSTATUS (statusnum, statusname, chronoorder)
values (36, 'נמסר', 4);
insert into ORDERSTATUS (statusnum, statusname, chronoorder)
values (33, 'התקבל', 1);
insert into ORDERSTATUS (statusnum, statusname, chronoorder)
values (34, 'במיון', 2);
commit;
prompt 4 records loaded
prompt Loading STREET...
insert into STREET (streetnum, streetname)
values (2, 'דקל');
insert into STREET (streetnum, streetname)
values (4, 'כלנית');
insert into STREET (streetnum, streetname)
values (6, 'פרחים');
insert into STREET (streetnum, streetname)
values (7, 'חבצלת');
insert into STREET (streetnum, streetname)
values (9, 'הגנה');
insert into STREET (streetnum, streetname)
values (10, 'רימון');
insert into STREET (streetnum, streetname)
values (11, 'רקפת');
insert into STREET (streetnum, streetname)
values (14, 'הרצל');
insert into STREET (streetnum, streetname)
values (15, 'שיטה');
insert into STREET (streetnum, streetname)
values (17, 'מנטה');
insert into STREET (streetnum, streetname)
values (20, 'איריס');
insert into STREET (streetnum, streetname)
values (23, 'מרגריט');
insert into STREET (streetnum, streetname)
values (27, 'אדמונית');
insert into STREET (streetnum, streetname)
values (29, 'נאגארה');
insert into STREET (streetnum, streetname)
values (30, 'בר');
insert into STREET (streetnum, streetname)
values (32, 'דולב');
insert into STREET (streetnum, streetname)
values (34, 'ארבל');
insert into STREET (streetnum, streetname)
values (35, 'לבנה');
insert into STREET (streetnum, streetname)
values (37, 'פיקוס');
insert into STREET (streetnum, streetname)
values (38, 'סביון');
insert into STREET (streetnum, streetname)
values (39, 'ספיון');
insert into STREET (streetnum, streetname)
values (41, 'אלרואי');
insert into STREET (streetnum, streetname)
values (42, 'אלרום');
insert into STREET (streetnum, streetname)
values (43, 'אמיר');
insert into STREET (streetnum, streetname)
values (46, 'אנה פרנק');
insert into STREET (streetnum, streetname)
values (47, 'אנקורים');
insert into STREET (streetnum, streetname)
values (48, 'אסף');
insert into STREET (streetnum, streetname)
values (49, 'אפרים');
insert into STREET (streetnum, streetname)
values (50, 'אצ"ל');
insert into STREET (streetnum, streetname)
values (53, 'ארנון');
insert into STREET (streetnum, streetname)
values (54, 'ארניה');
insert into STREET (streetnum, streetname)
values (55, 'אשתאול');
insert into STREET (streetnum, streetname)
values (57, 'באר אורה');
insert into STREET (streetnum, streetname)
values (58, 'באר שבע');
insert into STREET (streetnum, streetname)
values (59, 'בדנר');
insert into STREET (streetnum, streetname)
values (60, 'בועז');
insert into STREET (streetnum, streetname)
values (61, 'בורסה');
insert into STREET (streetnum, streetname)
values (62, 'ביאליק');
insert into STREET (streetnum, streetname)
values (63, 'בית אל');
insert into STREET (streetnum, streetname)
values (64, 'בית הלל');
insert into STREET (streetnum, streetname)
values (67, 'בית לחם');
insert into STREET (streetnum, streetname)
values (68, 'בית שמאי');
insert into STREET (streetnum, streetname)
values (70, 'בן יוסף');
insert into STREET (streetnum, streetname)
values (71, 'בן סרוק');
insert into STREET (streetnum, streetname)
values (72, 'בן שמן');
insert into STREET (streetnum, streetname)
values (74, 'בני משה');
insert into STREET (streetnum, streetname)
values (75, 'בניהו');
insert into STREET (streetnum, streetname)
values (76, 'בנימין');
insert into STREET (streetnum, streetname)
values (79, 'בצלאל');
insert into STREET (streetnum, streetname)
values (81, 'בר גיורא');
insert into STREET (streetnum, streetname)
values (82, 'בר יוחאי');
insert into STREET (streetnum, streetname)
values (83, 'בר כוכבא');
insert into STREET (streetnum, streetname)
values (84, 'ברודצקי');
insert into STREET (streetnum, streetname)
values (85, 'ברוריה');
insert into STREET (streetnum, streetname)
values (86, 'ברוש');
insert into STREET (streetnum, streetname)
values (88, 'ברקאי');
insert into STREET (streetnum, streetname)
values (89, 'בשמת');
insert into STREET (streetnum, streetname)
values (90, 'בת שוע');
insert into STREET (streetnum, streetname)
values (91, 'גאולים');
insert into STREET (streetnum, streetname)
values (93, 'גבעתי');
insert into STREET (streetnum, streetname)
values (94, 'גדעון');
insert into STREET (streetnum, streetname)
values (95, 'גולומב');
insert into STREET (streetnum, streetname)
values (96, 'גולני');
insert into STREET (streetnum, streetname)
values (99, 'גפונוב');
insert into STREET (streetnum, streetname)
values (1, 'תאנה');
insert into STREET (streetnum, streetname)
values (3, 'נרקיס');
insert into STREET (streetnum, streetname)
values (5, 'שושנה');
insert into STREET (streetnum, streetname)
values (8, 'ברוש');
insert into STREET (streetnum, streetname)
values (12, 'רשבי');
insert into STREET (streetnum, streetname)
values (13, 'בראנד');
insert into STREET (streetnum, streetname)
values (16, 'בלבל');
insert into STREET (streetnum, streetname)
values (18, 'ציפורן');
insert into STREET (streetnum, streetname)
values (19, 'חרצית');
insert into STREET (streetnum, streetname)
values (21, 'לבנדר');
insert into STREET (streetnum, streetname)
values (22, 'לילך');
insert into STREET (streetnum, streetname)
values (24, 'סחלב');
insert into STREET (streetnum, streetname)
values (25, 'ורד');
insert into STREET (streetnum, streetname)
values (26, 'סיגלית');
insert into STREET (streetnum, streetname)
values (28, 'הדר');
insert into STREET (streetnum, streetname)
values (31, 'אילן');
insert into STREET (streetnum, streetname)
values (33, 'כליל');
insert into STREET (streetnum, streetname)
values (36, 'סיגלון');
commit;
prompt 82 records loaded
prompt Loading PACKAGES...
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (1, 589121154, 'McDonaldTori', 1.1, 1.5, 4.45, 75, 7, 684, 46, 15, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (2, 554521282, 'LeighLoretta', 7.1, 10.5, 29.95, 43, 46, 746, 72, 91, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (3, 582539439, 'HartnettNatacha', 7.1, 1.5, 16.45, 97, 39, 163, 1, 20, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (4, 531718254, 'CozierRip', 1.1, 1.5, 4.45, 84, 20, 532, 47, 68, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (6, 564391568, 'StevensGwyneth', .5, 3.5, 6.25, 45, 48, 888, 37, 93, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (7, 581676772, 'HimmelmanNeil', 2.5, 2.5, 8.75, 54, 19, 483, 51, 7, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (8, 575462716, 'McGriffSara', .6, 2.5, 4.95, 71, 20, 410, 28, 90, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (9, 527728938, 'TravoltaJay', 7.1, 1.5, 16.45, 52, 32, 614, 74, 13, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (10, 594813588, 'BarrymoreRowan', .6, 10.5, 16.95, 37, 35, 477, 73, 21, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (11, 532847774, 'TarantinoMeredi', .6, 2.5, 4.95, 89, 41, 539, 27, 95, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (12, 573187524, 'CarnesKiefer', .5, 1.5, 3.25, 82, 29, 843, 17, 41, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (5, 592712926, 'ColtraneJesus', .5, 10.5, 16.75, 85, 33, 414, 38, 28, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (13, 516819896, 'GuestGailard', 1.5, 4.5, 9.75, 24, 39, 40, 38, 81, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (14, 582535178, 'SchneiderMichae', 1.5, 3.5, 8.25, 19, 24, 196, 46, 64, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (15, 527654484, 'MonkRebecca', .5, 10.5, 16.75, 47, 12, 606, 80, 18, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (16, 527295712, 'GarciaTrey', 7.1, 12.1, 32.35, 74, 37, 207, 80, 67, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (17, 528513173, 'Sainte-MarieChr', 2.5, 4.5, 11.75, 29, 24, 994, 80, 67, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (18, 593618836, 'GrayCole', 1.1, 2.5, 5.95, 7, 8, 593, 46, 5, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (19, 599672655, 'CostelloKristin', 2.5, 10.5, 20.75, 40, 4, 418, 95, 6, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (20, 587411722, 'Angelina Brosna', 15, 23, 64.5, 96, 17, 7, 19, 74, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (21, 545766861, 'Pete Crow', 11, 0, 22, 17, 3, 78, 70, 12, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (22, 597792341, 'Terri Lovitz', 9, 22, 51, 93, 6, 571, 84, 34, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (23, 552148318, 'Dar Donovan', 7, 37, 69.5, 45, 17, 701, 95, 14, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (24, 574885167, 'Victoria Remar', 4, 44, 74, 63, 4, 333, 4, 57, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (25, 559224737, 'Arnold MacNeil', 18, 35, 88.5, 77, 41, 245, 17, 99, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (26, 565592551, 'Lynn Puckett', 2, 29, 47.5, 91, 3, 656, 41, 30, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (27, 582111884, 'Stephen Beck', 9, 24, 54, 32, 38, 47, 17, 37, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (28, 536278158, 'Stellan Rourke', 12, 4, 30, 14, 13, 315, 28, 86, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (29, 527536112, 'Humberto Borden', 11, 20, 52, 91, 36, 435, 25, 41, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (30, 556964425, 'Geoffrey Kingsl', 0, 9, 13.5, 47, 40, 425, 17, 41, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (31, 574612115, 'Emily Chao', 0, 25, 37.5, 86, 35, 455, 98, 28, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (32, 544975739, 'Sally Bosco', 16, 12, 50, 26, 17, 630, 13, 19, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (34, 545616254, 'Jerry Kramer', 7, 40, 74, 66, 46, 673, 73, 1, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (35, 593484327, 'Jeanne Felician', 17, 27, 74.5, 27, 20, 917, 72, 90, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (36, 561498917, 'Edwin Pullman', 16, 3, 36.5, 97, 5, 876, 24, 43, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (37, 542431779, 'Hector Garber', 5, 9, 23.5, 49, 11, 313, 73, 12, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (38, 592615451, 'Antonio McNeice', 7, 30, 59, 25, 48, 345, 25, 7, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (39, 583258599, 'Goldie Polley', 15, 32, 78, 98, 17, 721, 95, 79, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (40, 523377583, 'Alessandro Wied', 15, 1, 31.5, 26, 21, 927, 52, 64, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (41, 556732866, 'Paul Krieger', 12, 36, 78, 10, 23, 570, 24, 36, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (42, 575515625, 'Blair Preston', 16, 8, 44, 81, 35, 242, 24, 36, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (43, 532124693, 'Nils Lane', 16, 45, 99.5, 10, 46, 803, 58, 99, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (44, 594791392, 'Matt Margolyes', 14, 9, 41.5, 2, 12, 302, 81, 99, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (45, 554333436, 'Johnnie Berkley', 10, 1, 21.5, 73, 50, 191, 70, 54, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (46, 513314358, 'Franz Arkin', 3, 7, 16.5, 7, 5, 550, 25, 37, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (47, 567655281, 'Brian Smith', 8, 20, 46, 46, 9, 410, 81, 24, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (48, 569287796, 'Miko Hauer', 11, 0, 22, 40, 46, 341, 17, 16, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (49, 516714283, 'Kathy Monk', 19, 36, 92, 31, 24, 63, 37, 49, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (50, 527919165, 'Jimmy Klugh', 7, 33, 63.5, 62, 37, 168, 67, 42, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (51, 559925183, 'Rosanna Cartlid', 14, 32, 76, 64, 31, 70, 42, 74, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (52, 512585958, 'Belinda Hewitt', 20, 49, 113.5, 36, 15, 193, 58, 48, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (53, 598114534, 'Horace Danger', 1, 46, 71, 41, 24, 87, 55, 68, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (54, 527978716, 'Glen Rhys-Davie', 19, 27, 78.5, 93, 43, 854, 52, 55, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (55, 529151989, 'Elle Rollins', 13, 0, 26, 71, 2, 886, 52, 91, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (56, 525438346, 'Mindy Tobolowsk', 11, 46, 91, 59, 10, 624, 98, 72, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (57, 577611914, 'Millie Hutton', 8, 49, 89.5, 66, 38, 871, 38, 27, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (58, 526438288, 'Crispin Furtado', 16, 16, 56, 65, 46, 191, 4, 35, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (59, 511374556, 'Suzy Suvari', 15, 45, 97.5, 83, 21, 133, 22, 59, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (60, 555951126, 'Matthew Blossom', 14, 13, 47.5, 77, 31, 629, 70, 34, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (61, 563212391, 'Robby Curtis-Ha', 4, 11, 24.5, 99, 19, 739, 24, 43, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (62, 577999633, 'Roscoe Weaving', 14, 13, 47.5, 25, 43, 347, 47, 46, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (63, 583548447, 'Mekhi Ruiz', 5, 39, 68.5, 64, 1, 165, 52, 2, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (64, 554539388, 'Blair Summer', 1, 4, 8, 7, 15, 857, 73, 58, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (65, 566883716, 'Rhys Krabbe', 9, 7, 28.5, 70, 50, 44, 37, 32, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (66, 592439168, 'Bonnie Levine', 2, 44, 70, 98, 34, 671, 80, 95, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (67, 597437642, 'April Flack', 16, 47, 102.5, 44, 14, 648, 80, 95, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (68, 557194517, 'Owen Dupree', 9, 45, 85.5, 1, 6, 860, 37, 6, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (69, 527957968, 'Clay Oates', 4, 46, 77, 29, 10, 800, 84, 64, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (70, 596827821, 'Taylor Cooper', 17, 32, 82, 75, 23, 93, 72, 64, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (71, 593618836, 'Victor Nicholso', 0, 29, 43.5, 7, 3, 593, 6, 5, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (72, 535449767, 'Freda Satriani', 11, 5, 29.5, 68, 32, 803, 6, 1, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (73, 567147949, 'Devon Hannah', 17, 28, 76, 54, 28, 752, 98, 93, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (74, 571782261, 'Carrie Liu', 5, 41, 71.5, 63, 38, 124, 52, 54, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (75, 551638237, 'Harvey Hart', 3, 26, 45, 45, 46, 464, 98, 55, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (76, 565757525, 'Deborah Lynne', 12, 44, 90, 76, 15, 144, 95, 20, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (77, 577436793, 'Eddie Senior', 1, 19, 30.5, 15, 34, 386, 25, 23, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (78, 568724758, 'Halle Forster', 11, 43, 86.5, 62, 31, 328, 81, 89, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (79, 587617587, 'Greg Taylor', 17, 23, 68.5, 10, 17, 730, 28, 47, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (80, 569464189, 'Jonathan Lineba', 2, 35, 56.5, 67, 48, 592, 33, 67, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (81, 575777647, 'Terrence Sheare', 7, 12, 32, 54, 7, 638, 13, 17, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (82, 554973324, 'Cevin Gooding', 12, 14, 45, 78, 9, 443, 81, 13, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (83, 594128475, 'George Richter', 10, 42, 83, 22, 20, 992, 67, 49, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (84, 533432826, 'Rita Isaacs', 11, 25, 59.5, 32, 23, 662, 52, 22, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (85, 588944634, 'Ann Thornton', 10, 2, 23, 36, 44, 210, 6, 96, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (86, 587815684, 'Colleen Spacey', 20, 8, 52, 49, 42, 217, 98, 12, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (87, 585185123, 'Denny Douglas', 7, 1, 15.5, 47, 46, 815, 23, 12, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (88, 551652961, 'Guy McCabe', 18, 36, 90, 50, 37, 322, 67, 27, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (89, 531778768, 'Fairuza Palin', 12, 40, 84, 13, 25, 834, 40, 74, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (90, 511762525, 'Marc Head', 18, 6, 45, 88, 19, 804, 23, 94, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (91, 557984653, 'Sigourney Broli', 5, 9, 23.5, 63, 32, 317, 73, 53, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (92, 594612796, 'Raymond Briscoe', 8, 45, 83.5, 4, 44, 225, 22, 46, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (93, 585475987, 'Rhona Chaykin', 14, 11, 44.5, 12, 27, 518, 42, 63, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (94, 562152344, 'Wade Heron', 11, 40, 82, 67, 23, 396, 28, 74, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (95, 535314187, 'Gwyneth McCabe', 3, 27, 46.5, 87, 30, 560, 25, 99, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (96, 556811953, 'Pamela Cervine', 1, 32, 50, 86, 8, 243, 94, 9, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (97, 554525782, 'Rickie Clinton', 7, 29, 57.5, 48, 14, 590, 85, 8, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (98, 552275175, 'Treat Heatherly', 10, 31, 66.5, 85, 42, 165, 52, 34, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (99, 555335259, 'Martha Weston', 4, 42, 71, 34, 1, 764, 83, 50, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (100, 567264768, 'Daryl Sample', 9, 33, 67.5, 82, 15, 320, 6, 18, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (101, 527813425, 'Kelly Delta', 20, 3, 44.5, 71, 9, 573, 22, 17, 0, 0);
commit;
prompt 100 records committed...
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (102, 553612298, 'Keanu Brothers', 2, 47, 74.5, 19, 49, 519, 85, 67, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (103, 534139788, 'Shannyn Cusack', 5, 21, 41.5, 2, 27, 329, 46, 95, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (104, 569534544, 'Curt Sanchez', 1, 22, 35, 31, 30, 629, 47, 85, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (105, 535726552, 'Stanley Palmint', 3, 1, 7.5, 47, 35, 854, 23, 7, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (106, 576793874, 'Rebeka Foxx', 19, 21, 69.5, 50, 23, 675, 37, 74, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (107, 525182946, 'Don Apple', 6, 6, 21, 92, 19, 661, 22, 30, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (108, 562255279, 'Alfred Brolin', 9, 47, 88.5, 76, 18, 53, 72, 88, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (109, 516832188, 'Juan Blackmore', 1, 7, 12.5, 66, 44, 182, 84, 85, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (110, 513347416, 'Ethan Nicholas', 7, 39, 72.5, 79, 29, 531, 55, 96, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (111, 566588441, 'Laurie Coburn', 0, 3, 4.5, 60, 36, 829, 41, 36, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (112, 566362454, 'Dabney Diaz', 16, 38, 89, 91, 5, 962, 6, 54, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (113, 563197685, 'Joseph Willis', 4, 12, 26, 87, 20, 962, 6, 31, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (114, 586496263, 'Trey Ammons', 2, 40, 64, 18, 1, 866, 81, 75, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (115, 548726467, 'Sheena Conway', 1, 8, 14, 98, 44, 17, 41, 91, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (116, 528331388, 'Taylor Leoni', 17, 30, 79, 84, 4, 326, 55, 15, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (117, 582448787, 'Mekhi Bacharach', 17, 3, 38.5, 3, 7, 381, 73, 88, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (118, 556262237, 'Joan Wood', 2, 35, 56.5, 64, 26, 846, 4, 36, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (119, 527874715, 'Jean-Luc Franci', 2, 24, 40, 47, 46, 796, 51, 38, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (120, 532584467, 'Caroline Loeb', 9, 16, 42, 48, 19, 207, 74, 26, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (121, 567744917, 'Jessica Loring', 12, 42, 87, 36, 8, 432, 19, 35, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (122, 589125825, 'Arnold Henrikse', 19, 10, 53, 53, 42, 811, 27, 48, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (123, 514543235, 'Morris Martin', 5, 1, 11.5, 36, 27, 816, 85, 88, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (124, 582231232, 'Davy Lithgow', 18, 6, 45, 40, 11, 386, 58, 27, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (125, 591847114, 'Miguel Amos', 11, 27, 62.5, 49, 43, 282, 4, 84, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (126, 577132659, 'Maura Sepulveda', 14, 34, 79, 3, 12, 934, 25, 64, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (127, 547433928, 'Russell McIntyr', 2, 28, 46, 98, 25, 714, 51, 94, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (128, 544468772, 'Lizzy McKean', 7, 6, 23, 98, 16, 305, 6, 58, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (129, 599541893, 'Daryle Church', 2, 22, 37, 30, 22, 852, 81, 70, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (130, 533974157, 'Isaiah Law', 3, 35, 58.5, 90, 30, 866, 73, 1, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (131, 597473616, 'Mike Rain', 19, 12, 56, 21, 19, 466, 38, 95, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (132, 561264253, 'Xander Rea', 5, 50, 85, 70, 11, 731, 84, 74, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (133, 542274282, 'Kazem Wolf', 10, 27, 60.5, 74, 12, 424, 70, 20, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (134, 573713246, 'Mae Hawn', 6, 16, 36, 21, 34, 535, 95, 47, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (135, 521468338, 'Rebecca Orlando', 18, 25, 73.5, 82, 40, 839, 33, 32, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (136, 596248289, 'Clay Nolte', 16, 49, 105.5, 68, 43, 98, 24, 86, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (137, 556151416, 'Loreena Dunaway', 11, 24, 58, 95, 12, 692, 6, 5, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (138, 582188635, 'Colleen DeVito', 9, 32, 66, 46, 43, 502, 24, 22, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (139, 534186243, 'Ned Baldwin', 17, 21, 65.5, 56, 1, 624, 19, 27, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (140, 573983974, 'Moe Forrest', 17, 41, 95.5, 43, 17, 389, 33, 13, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (141, 529491462, 'Delroy Brothers', 11, 41, 83.5, 72, 33, 807, 28, 33, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (142, 589351716, 'Beth Newman', 11, 35, 74.5, 32, 20, 512, 67, 88, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (143, 572857172, 'Treat Crudup', 20, 7, 50.5, 31, 37, 76, 67, 60, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (144, 522814668, 'Steve Underwood', 14, 32, 76, 88, 19, 856, 22, 43, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (145, 511913981, 'Moe Hector', 11, 43, 86.5, 92, 36, 725, 81, 62, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (146, 569718467, 'Jake Gugino', 12, 34, 75, 50, 19, 859, 52, 5, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (147, 551315233, 'Robby Sedaka', 16, 25, 69.5, 7, 6, 670, 67, 89, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (148, 541798491, 'Barbara Burrows', 4, 23, 42.5, 80, 3, 538, 24, 67, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (149, 549571471, 'Seann Bonham', 12, 27, 64.5, 54, 15, 865, 42, 10, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (150, 596816381, 'Suzi Warden', 17, 25, 71.5, 15, 5, 567, 55, 54, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (151, 539244776, 'Lucinda Deejay', 2, 42, 67, 77, 37, 173, 41, 94, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (152, 524216318, 'Joaquim Kilmer', 5, 35, 62.5, 47, 22, 596, 52, 59, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (153, 544184236, 'Dabney Carrack', 18, 42, 99, 74, 37, 91, 74, 5, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (154, 517266677, 'Casey Olyphant', 10, 27, 60.5, 37, 7, 374, 13, 42, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (155, 566517274, 'Joseph Phillips', 3, 12, 24, 45, 7, 20, 27, 6, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (156, 563769126, 'Jimmie Hyde', 4, 20, 38, 70, 24, 454, 19, 1, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (157, 565156672, 'Alex Kweller', 1, 16, 26, 58, 38, 988, 84, 13, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (158, 562322114, 'Catherine Rock', 0, 47, 70.5, 15, 39, 541, 51, 81, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (159, 577251257, 'Tea Horizon', 9, 10, 33, 81, 44, 9, 13, 67, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (160, 548732159, 'Rowan Hawn', 13, 14, 47, 16, 35, 768, 74, 23, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (161, 583532881, 'Jamie Pony', 16, 8, 44, 58, 14, 477, 25, 33, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (162, 571462615, 'Rob Brandt', 0, 41, 61.5, 62, 16, 463, 47, 18, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (163, 536672718, 'Loreena Gaynor', 6, 15, 34.5, 24, 39, 310, 1, 68, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (164, 525869845, 'Anne Cruise', 14, 27, 68.5, 97, 14, 187, 67, 1, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (165, 565886128, 'Rupert Kattan', 19, 17, 63.5, 19, 25, 713, 55, 85, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (166, 583182925, 'Kieran Stevens', 10, 16, 44, 57, 28, 100, 74, 39, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (167, 563971998, 'Vern Saxon', 15, 23, 64.5, 8, 12, 779, 4, 24, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (168, 572276475, 'Lucy Whitmore', 2, 33, 53.5, 69, 41, 945, 94, 36, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (169, 587777421, 'Ashley Scheider', 7, 13, 33.5, 91, 43, 316, 6, 34, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (170, 571138648, 'Red Wood', 10, 13, 39.5, 29, 12, 213, 25, 54, 1, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (171, 596746493, 'Giovanni Bandy', 0, 21, 31.5, 36, 22, 591, 85, 11, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (172, 535887598, 'Jake Carter', 12, 38, 81, 53, 30, 254, 85, 31, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (173, 526318687, 'Spike Getty', 7, 30, 59, 37, 10, 908, 25, 99, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (174, 588539222, 'Stellan Keen', 19, 44, 104, 72, 34, 420, 42, 15, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (175, 538472419, 'Luke Holy', 17, 26, 73, 92, 22, 185, 94, 61, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (176, 528724571, 'Isaiah Tennison', 20, 1, 41.5, 96, 21, 510, 70, 35, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (177, 528143621, 'Eileen Campbell', 4, 24, 44, 18, 47, 962, 1, 96, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (178, 567244315, 'Nora Easton', 19, 45, 105.5, 97, 15, 64, 80, 89, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (179, 562996851, 'Earl Lerner', 19, 36, 92, 90, 30, 513, 23, 35, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (180, 519287546, 'Toshiro Vaughan', 15, 36, 84, 58, 1, 323, 74, 49, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (181, 568295835, 'Busta Haysbert', 1, 1, 3.5, 49, 14, 964, 37, 18, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (182, 548386236, 'Lindsey Jolie', 5, 14, 31, 7, 22, 882, 27, 58, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (183, 517435217, 'Jarvis Azaria', 5, 6, 19, 4, 4, 618, 52, 13, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (184, 561494772, 'Johnette Isaacs', 6, 7, 22.5, 29, 2, 343, 51, 91, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (185, 562415431, 'Lea Chinlund', 13, 9, 39.5, 55, 25, 886, 13, 82, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (186, 576915577, 'Andrae McLean', 5, 3, 14.5, 9, 45, 505, 38, 47, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (187, 579234253, 'Alicia Laurie', 10, 17.5, 46.25, 80, 18, 509, 23, 94, 1, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (188, 598225869, 'Dave Koyana', 16, 22, 65, 81, 26, 907, 80, 5, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (189, 524617926, 'Roger Lattimore', 20, 39, 98.5, 91, 15, 978, 17, 95, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (190, 539736325, 'Terrence Mattha', 17, 24, 70, 53, 3, 751, 13, 67, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (191, 554423839, 'Paul Schock', 11, 9, 35.5, 27, 2, 354, 55, 4, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (192, 567652688, 'Swoosie Nivola', 3, 2, 9, 52, 2, 506, 24, 24, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (193, 518154666, 'Nathan Singh', 7, 0, 14, 54, 13, 862, 24, 20, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (194, 577429287, 'Gabriel McElhon', 0, 35, 52.5, 7, 20, 751, 58, 9, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (195, 591129216, 'Julianne Lemmon', 17, 30, 79, 92, 18, 987, 4, 35, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (196, 588473627, 'Kid Baez', 6, 6, 21, 56, 17, 46, 27, 53, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (197, 516828284, 'Kenny Sherman', 5, 13, 29.5, 72, 18, 945, 95, 5, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (198, 557765136, 'Mia McKean', 10, 7.5, 31.25, 57, 37, 868, 28, 60, 1, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (199, 583917557, 'Jerry Aiken', 12, 42, 87, 16, 5, 730, 40, 26, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (200, 523628265, 'Denise Lindo', 6, 36, 66, 28, 28, 937, 37, 57, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (201, 547958366, 'Nora Diffie', 10, 3, 24.5, 73, 18, 150, 24, 67, 0, 1);
commit;
prompt 200 records committed...
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (202, 551447765, 'Robby Williamso', 0, 34, 51, 48, 50, 442, 23, 76, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (203, 563425386, 'Mae Kilmer', 7, 28, 56, 69, 15, 518, 67, 42, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (204, 512312316, 'Dick Hatchet', 12, 37, 79.5, 2, 50, 992, 13, 18, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (205, 578517666, 'Vanessa Logue', 3, 27, 46.5, 41, 30, 941, 25, 30, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (206, 542322489, 'Gladys Lipnicki', 4, 7, 18.5, 44, 24, 338, 67, 24, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (207, 515883993, 'Willie Oates', 5, 33, 59.5, 72, 12, 345, 17, 25, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (208, 529271825, 'Rosco Cruz', 6, 38, 69, 13, 24, 132, 24, 3, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (209, 558527789, 'Ritchie Elwes', 13, 2, 29, 46, 29, 687, 47, 63, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (210, 574885778, 'Remy Schreiber', 11, 45, 89.5, 29, 38, 318, 58, 31, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (211, 531726921, 'Gavin Jane', 0, 36, 54, 88, 17, 20, 4, 55, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (212, 532616296, 'Garth Bogguss', 13, 34, 77, 42, 9, 906, 19, 58, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (213, 522187644, 'Yaphet Humphrey', 2, 14, 25, 58, 33, 313, 37, 46, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (214, 526258254, 'Sissy Ripley', 4, 38, 65, 34, 6, 214, 72, 15, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (215, 536845731, 'Gil Dutton', 15, 47, 100.5, 11, 8, 234, 98, 36, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (216, 598337178, 'First Colon', 6, 4, 18, 77, 13, 833, 27, 81, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (217, 533128256, 'Derrick Goldber', 14, 25, 65.5, 48, 46, 278, 52, 14, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (218, 598441874, 'Ani Nugent', 9, 40, 78, 98, 26, 917, 55, 42, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (219, 536777616, 'Angelina Cross', 14, 27, 68.5, 30, 24, 584, 27, 24, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (220, 561946752, 'Rowan Mazzello', 20, 44, 106, 63, 7, 745, 22, 1, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (221, 566458357, 'Rose McPherson', 3, 9, 19.5, 85, 5, 148, 85, 46, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (222, 562948517, 'Rhea Fender', 13, 3, 30.5, 86, 22, 461, 22, 88, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (223, 511679427, 'Uma Cook', 20, 36, 94, 64, 5, 395, 17, 55, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (224, 564164169, 'Chi Osment', 19, 39, 96.5, 51, 8, 660, 13, 86, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (225, 595323792, 'Bonnie Schiff', 15, 13, 49.5, 85, 41, 175, 94, 27, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (226, 592242426, 'Trace Berenger', 6, 24, 48, 32, 19, 215, 70, 37, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (227, 586746519, 'Marie DeVita', 7, 46, 83, 60, 27, 340, 72, 1, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (228, 594426589, 'Rade Diggs', 8, 2, 19, 92, 20, 421, 41, 79, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (229, 573178975, 'Regina Vince', 18, 14, 57, 93, 33, 537, 84, 17, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (230, 512254822, 'Natasha Rundgre', 2, 16, 28, 17, 37, 447, 4, 12, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (231, 574674722, 'Talvin Tippe', 6, 4, 18, 70, 18, 291, 40, 67, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (233, 569527398, 'Aida von Sydow', 12, 26, 63, 32, 34, 185, 6, 89, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (234, 569928365, 'Fred Davidtz', 18, 35, 88.5, 53, 31, 870, 98, 72, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (235, 599485647, 'Oro Wopat', 1, 1, 3.5, 11, 43, 171, 23, 35, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (236, 549731935, 'Patty Mann', 10, 7, 30.5, 44, 6, 299, 95, 89, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (237, 546874516, 'Horace Loggia', 0, 25, 37.5, 39, 44, 325, 6, 75, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (238, 575998395, 'Rhona Duschel', 19, 25, 75.5, 7, 29, 307, 23, 90, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (239, 578475517, 'Leon Cassidy', 6, 27, 52.5, 93, 5, 570, 55, 53, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (240, 533637172, 'Paul Sweeney', 5, 14, 31, 63, 48, 944, 19, 35, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (241, 572211432, 'Jean O''Donnell', 16, 39, 90.5, 24, 20, 193, 94, 2, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (242, 593549485, 'Garry Keith', 13, 40, 86, 36, 26, 600, 38, 84, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (243, 523616412, 'Aaron Pierce', 12, 26, 63, 69, 34, 173, 41, 13, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (244, 579137325, 'Raymond Gilliam', 1, 23, 36.5, 77, 5, 817, 22, 68, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (245, 577788987, 'Raymond Fichtne', 20, 31, 86.5, 69, 8, 639, 80, 18, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (246, 561146144, 'Howard Foley', 18, 13, 55.5, 10, 39, 838, 95, 10, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (247, 578444633, 'James Weller', 8, 35, 68.5, 21, 48, 997, 23, 50, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (248, 563293786, 'Jarvis Kershaw', 15, 49, 103.5, 72, 45, 575, 58, 63, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (249, 524937559, 'Nile MacIsaac', 11, 29, 65.5, 51, 7, 521, 73, 32, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (250, 579167698, 'Henry Gellar', 13, 11, 42.5, 13, 14, 892, 6, 86, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (251, 594283874, 'Miguel McIntosh', 12, 19, 52.5, 76, 41, 453, 58, 8, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (252, 569241931, 'Crispin Wayans', 12, 25, 61.5, 67, 6, 419, 70, 81, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (253, 589538494, 'Maria Barkin', 11, 36, 76, 99, 15, 917, 22, 9, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (254, 518931473, 'Pete Bogguss', 13, 36, 80, 27, 30, 265, 13, 25, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (255, 594516127, 'Rhett Logue', 9, 43, 82.5, 53, 8, 196, 73, 36, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (256, 588239362, 'Olga Reeve', 3, 12, 24, 65, 26, 352, 38, 75, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (257, 513924693, 'Julie Pastore', 11, 38, 79, 83, 46, 145, 24, 9, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (258, 529528438, 'Rene Roundtree', 1, 50, 77, 98, 16, 254, 13, 39, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (259, 557349933, 'Udo Bedelia', 10, 32, 68, 43, 33, 819, 98, 62, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (260, 546136431, 'Leslie Washingt', 10, 9, 33.5, 81, 17, 740, 47, 47, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (261, 558973794, 'Maria O''Donnell', 20, 0, 40, 34, 28, 594, 81, 5, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (262, 552761142, 'Todd Wincott', 6, 22, 45, 79, 12, 424, 22, 30, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (263, 555335175, 'Demi Drive', 11, 33, 71.5, 18, 22, 331, 95, 48, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (264, 524624559, 'Lance Lithgow', 15, 1, 31.5, 54, 41, 202, 4, 30, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (265, 526681237, 'Chazz Secada', 16, 3, 36.5, 89, 32, 378, 27, 75, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (266, 597517673, 'Melba Sobieski', 14, 32, 76, 59, 37, 399, 37, 39, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (267, 514726578, 'Malcolm Saxon', 10, 0, 20, 72, 1, 467, 38, 99, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (268, 545313257, 'Mary-Louise Sch', 17, 0, 34, 41, 43, 795, 98, 67, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (269, 512933534, 'Toni Field', 17, 21, 65.5, 83, 26, 788, 46, 70, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (270, 554759811, 'Rosanna Harriso', 11, 42, 85, 73, 12, 955, 38, 23, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (271, 553779899, 'Will Wong', 19, 41, 99.5, 93, 49, 800, 81, 6, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (272, 515787875, 'Jeroen Stamp', 20, 21, 71.5, 90, 41, 527, 42, 86, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (273, 572914643, 'Derrick Magnuso', 14, 42, 91, 52, 3, 566, 67, 71, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (274, 561664354, 'Roscoe Hawn', 1, 33, 51.5, 87, 34, 439, 83, 55, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (275, 522634941, 'Dylan Byrd', 11, 32, 70, 70, 8, 668, 47, 6, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (276, 586327392, 'Dorry McFerrin', 12, 10, 39, 96, 5, 168, 52, 33, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (277, 516546254, 'Maura McCready', 1, 20, 32, 83, 1, 990, 6, 14, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (278, 542286931, 'Ali Fender', 6, 12, 30, 73, 49, 487, 80, 67, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (279, 572253225, 'Jeremy Crow', 1, 42, 65, 24, 18, 919, 70, 9, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (280, 567338558, 'Loren Rauhofer', 10, 23, 54.5, 37, 7, 387, 40, 30, 1, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (281, 548688212, 'Teena Matarazzo', 18, 35, 88.5, 89, 32, 768, 52, 18, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (282, 592981425, 'Taylor Raye', 6, 27, 52.5, 60, 39, 68, 98, 17, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (283, 531847787, 'Spike Williamso', 1, 38, 59, 75, 35, 457, 22, 90, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (284, 592194582, 'Greg Myers', 3, 1, 7.5, 92, 9, 194, 13, 41, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (285, 514754394, 'Billy Rosas', 15, 23, 64.5, 14, 6, 750, 47, 75, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (286, 584415997, 'Ritchie Bandy', 4, 4, 14, 67, 1, 825, 19, 75, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (287, 538634988, 'Kimberly Crimso', 11, 30, 67, 42, 23, 611, 28, 95, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (288, 597393461, 'Melba Roth', 19, 26, 77, 38, 16, 692, 81, 1, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (289, 588994415, 'Hilary Rodrigue', 3, 14, 27, 73, 25, 447, 27, 38, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (290, 534386143, 'Boz Henstridge', 7, 50, 89, 18, 35, 748, 42, 82, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (291, 526252149, 'Dennis Evanswoo', 3, 17, 31.5, 69, 27, 315, 47, 88, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (292, 542229249, 'Simon Dillon', 14, 41, 89.5, 36, 22, 154, 46, 36, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (293, 569514746, 'Jeff Williams', 2, 50, 79, 20, 3, 367, 38, 75, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (294, 582291751, 'Angela Wiest', 17, 9, 47.5, 38, 32, 139, 94, 67, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (295, 559255531, 'Clea Elizabeth', 18, 7, 46.5, 85, 21, 93, 1, 25, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (296, 578538883, 'Peter Thewlis', 13, 49, 99.5, 84, 17, 391, 51, 95, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (297, 552178386, 'Gordie Kudrow', 10, 44, 86, 49, 21, 158, 47, 4, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (298, 529152119, 'Charlton Pressl', 9, 7, 28.5, 28, 21, 903, 13, 1, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (299, 559925286, 'Ernest Beals', 7, 44, 80, 97, 40, 865, 80, 71, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (300, 593895866, 'Martha Haslam', 14, 13, 47.5, 69, 42, 457, 28, 95, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (301, 537664693, 'Ann Farrell', 13, 42, 89, 25, 6, 571, 42, 14, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (302, 598526377, 'Casey Calle', 7, 40, 74, 28, 11, 150, 46, 41, 0, 0);
commit;
prompt 300 records committed...
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (303, 599161279, 'Rawlins Vassar', 12, 14, 45, 13, 30, 563, 72, 20, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (304, 539567494, 'Jesus Alston', 18, 49, 109.5, 83, 50, 651, 46, 94, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (305, 565386323, 'Jeffrey O''Sulli', 10, 3, 24.5, 51, 36, 231, 4, 2, 1, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (306, 554129539, 'Gwyneth Mewes', 9, 37, 73.5, 53, 40, 102, 83, 88, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (307, 584685948, 'Nastassja MacPh', 12, 50, 99, 91, 38, 554, 6, 83, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (308, 565728941, 'Gates Goodall', 7, 31, 60.5, 34, 20, 831, 83, 68, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (309, 576718291, 'Swoosie Bean', 14, 6, 37, 55, 31, 218, 58, 2, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (310, 582772575, 'Wayman Tyler', 17, 44, 100, 14, 33, 319, 28, 55, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (311, 559929171, 'Linda Banderas', 2, 19, 32.5, 30, 23, 887, 13, 67, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (312, 578396213, 'Madeline Purefo', 17, 16, 58, 28, 20, 55, 83, 95, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (313, 584484621, 'Maggie Berkeley', 11, 37, 77.5, 25, 11, 465, 25, 4, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (314, 554757622, 'Jonathan Coward', 9, 13, 37.5, 22, 48, 242, 81, 96, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (315, 553798757, 'Chi MacNeil', 5, 8, 22, 82, 43, 341, 6, 34, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (316, 554157646, 'Kay Kingsley', 19, 39, 96.5, 42, 32, 509, 55, 96, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (317, 531491998, 'Belinda Wills', 13, 40, 86, 56, 43, 969, 19, 59, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (318, 521243398, 'Steve Strong', 14, 15, 50.5, 86, 2, 710, 47, 12, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (319, 531312179, 'Sheena Akins', 11, 14, 43, 52, 30, 278, 17, 24, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (320, 558334152, 'Don Olyphant', 7, 39, 72.5, 97, 27, 617, 38, 10, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (321, 546826431, 'Lizzy Isaacs', 2, 41, 65.5, 61, 26, 375, 38, 83, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (322, 534716523, 'Seann Whitmore', 14, 38, 85, 77, 6, 426, 73, 99, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (323, 593618836, 'Mia Davies', 9, 19, 46.5, 10, 2, 593, 47, 4, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (324, 543284846, 'Vanessa Hurt', 0, 21, 31.5, 32, 8, 176, 33, 18, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (325, 571832484, 'Franco Bonnevil', 20, 50, 115, 78, 5, 945, 80, 30, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (326, 541995329, 'Percy Hanley', 3, 40, 66, 33, 34, 603, 55, 90, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (327, 521468243, 'Demi Pleasure', 8, 2, 19, 57, 2, 310, 46, 62, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (328, 541312949, 'Chet Phillippe', 17, 40, 94, 57, 31, 330, 33, 11, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (329, 534885691, 'Johnny Fox', 2, 3, 8.5, 25, 43, 507, 27, 30, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (330, 522112323, 'Andrew Janney', 19, 38, 95, 45, 22, 876, 41, 7, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (331, 538984678, 'Veruca Barrymor', 1, 37, 57.5, 93, 10, 682, 85, 1, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (332, 531771759, 'Freda Wills', 8, 17, 41.5, 29, 12, 112, 40, 20, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (333, 554597357, 'Rose Lithgow', 1, 31, 48.5, 79, 32, 540, 52, 2, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (334, 536528891, 'Tobey Zane', 16, 20, 62, 52, 4, 793, 80, 72, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (335, 581621585, 'Adina Snipes', 12, 6, 33, 4, 25, 239, 95, 71, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (336, 586283341, 'Martha Apple', 9, 1, 19.5, 72, 23, 132, 67, 38, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (337, 596341946, 'Shelby Rain', 1, 27, 42.5, 68, 1, 983, 51, 17, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (338, 555788384, 'Wallace Arkin', 5, 13, 29.5, 61, 18, 549, 72, 55, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (339, 513889256, 'Teri Satriani', 19, 0, 38, 7, 49, 613, 25, 58, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (340, 583618989, 'Gary Hawn', 9, 9, 31.5, 18, 4, 48, 70, 6, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (341, 525936846, 'Mitchell Barry', 19, 4, 44, 81, 44, 731, 70, 63, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (342, 526469312, 'Harold Hingle', 3, 8, 18, 56, 39, 868, 17, 57, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (343, 562439367, 'Geraldine Bacon', 9, 50, 93, 61, 44, 188, 42, 21, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (344, 525386286, 'Lupe Snider', 14, 31, 74.5, 41, 34, 356, 27, 34, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (345, 576178394, 'Sydney Hopper', 2, 39, 62.5, 5, 21, 930, 81, 70, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (346, 516795721, 'Stewart Keaton', 4, 20, 38, 91, 6, 200, 19, 96, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (347, 599362854, 'Nigel Ricci', 5, 5, 17.5, 42, 41, 558, 72, 62, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (348, 561271654, 'Val King', 0, 2, 3, 60, 49, 489, 28, 29, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (350, 515412586, 'Gilberto Del To', 11, 1, 23.5, 65, 11, 222, 94, 72, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (351, 565768251, 'Azucar Downey', 3, 6, 15, 60, 19, 803, 38, 10, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (352, 571296968, 'Emma Porter', 15, 49, 103.5, 34, 21, 229, 74, 57, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (353, 579224277, 'Boz Caviezel', 13, 11, 42.5, 5, 20, 47, 19, 64, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (354, 554252956, 'Madeline Nevill', 15, 28, 72, 78, 37, 656, 4, 25, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (355, 547179413, 'Taryn Chung', 1, 42, 65, 6, 16, 565, 4, 4, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (356, 539932514, 'Hex Cleary', 15, 26, 69, 26, 29, 432, 51, 90, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (357, 512269687, 'Linda Sarandon', 9, 43, 82.5, 68, 18, 632, 51, 9, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (358, 517551624, 'Darren Larter', 7, 43, 78.5, 62, 46, 406, 27, 46, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (359, 513853322, 'Burt Barkin', 16, 45, 99.5, 20, 20, 950, 52, 60, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (360, 526979961, 'Brenda Chandler', 10, 3, 24.5, 61, 45, 64, 19, 83, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (361, 575499179, 'Rosario Statham', 1, 45, 69.5, 17, 7, 297, 51, 32, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (362, 539441123, 'Kate Cummings', 17, 27, 74.5, 8, 26, 995, 70, 1, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (363, 511746532, 'Terrence Gyllen', 20, 35, 92.5, 4, 35, 238, 33, 49, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (364, 532214792, 'Wang Cruise', 6, 40, 72, 58, 13, 549, 13, 54, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (365, 545531454, 'Ossie Sample', 1, 6, 11, 54, 12, 440, 41, 71, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (366, 543221916, 'Gordie Hatfield', 11, 25, 59.5, 58, 40, 325, 70, 89, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (367, 572971443, 'Viggo Pacino', 18, 2, 39, 60, 27, 397, 83, 75, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (368, 567269622, 'Lily Fierstein', 7, 33, 63.5, 42, 38, 439, 37, 53, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (369, 591693614, 'Percy Young', 20, 5, 47.5, 84, 34, 594, 72, 83, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (370, 599712162, 'Joaquim Dunn', 13, 43, 90.5, 85, 23, 740, 94, 59, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (371, 554918446, 'Ivan Caldwell', 7, 24, 50, 55, 46, 428, 51, 20, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (372, 522159878, 'Collin Stuermer', 0, 44, 66, 44, 26, 378, 17, 71, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (373, 573899218, 'France Rhys-Dav', 2, 30, 49, 80, 48, 417, 51, 50, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (374, 515166875, 'Cate Stewart', 3, 5, 13.5, 60, 38, 416, 1, 31, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (375, 556391184, 'Brad Gill', 17, 29, 77.5, 26, 28, 502, 23, 18, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (376, 555121976, 'Fred Puckett', 6, 17, 37.5, 74, 26, 397, 85, 75, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (377, 536149867, 'Dianne Li', 17, 6, 43, 66, 34, 490, 23, 8, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (378, 549626688, 'Rawlins Blair', 3, 40, 66, 90, 33, 44, 40, 36, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (379, 543819456, 'Rachel Mueller-', 5, 50, 85, 7, 24, 924, 85, 41, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (380, 597686356, 'Kelli Ojeda', 3, 39, 64.5, 84, 27, 507, 46, 7, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (381, 592692749, 'Geggy Hughes', 6, 5, 19.5, 45, 33, 940, 27, 20, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (382, 563372246, 'Rhea Holiday', 16, 11, 48.5, 45, 50, 841, 94, 35, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (384, 571623487, 'Ty Aglukark', 16, 42, 95, 2, 4, 620, 58, 48, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (385, 515179889, 'Sam Davis', 0, 45, 67.5, 52, 27, 860, 73, 20, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (386, 546642815, 'Carrie-Anne Red', 13, 36, 80, 59, 39, 873, 52, 11, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (387, 539941141, 'Julia Soul', 1, 37, 57.5, 61, 21, 134, 42, 19, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (388, 582435665, 'Jason Tippe', 8, 37, 71.5, 58, 24, 764, 51, 20, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (389, 588791695, 'Dan Horizon', 15, 29, 73.5, 39, 8, 557, 72, 59, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (390, 544168964, 'Ian Paul', 18, 0, 36, 24, 25, 675, 13, 30, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (391, 556874561, 'Lucy Gryner', 2, 30, 49, 29, 14, 200, 33, 54, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (392, 599766526, 'Angelina Irons', 14, 7, 38.5, 83, 1, 627, 17, 74, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (393, 571318132, 'Moe Soda', 19, 34, 89, 88, 12, 595, 22, 70, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (394, 526188196, 'Kasey Torino', 17, 7, 44.5, 48, 26, 204, 13, 46, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (395, 555141166, 'Mykelti Mitchel', 18, 31, 82.5, 84, 11, 775, 42, 13, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (396, 546775285, 'Gailard MacIsaa', 8, 17, 41.5, 96, 3, 404, 38, 50, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (397, 548886843, 'Cesar Horton', 20, 28, 82, 63, 43, 670, 17, 7, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (398, 528796476, 'Ryan Dalley', 5, 22, 43, 13, 25, 89, 41, 94, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (399, 534355648, 'Rade Imperioli', 13, 3, 30.5, 35, 23, 651, 80, 38, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (400, 571253628, 'Andrea Robards', 3, 37, 61.5, 62, 11, 957, 40, 88, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (401, 542376218, 'Tamala Fox', 14, 38, 85, 87, 15, 282, 52, 48, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (402, 551219439, 'Burton Holm', 15, 1, 31.5, 99, 48, 203, 33, 20, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (403, 547135855, 'Joe Snider', 10, 15.5, 43.25, 35, 40, 565, 55, 85, 1, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (404, 512679999, 'Jennifer Rydell', 1, 37, 57.5, 47, 42, 295, 83, 72, 0, 0);
commit;
prompt 400 records committed...
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (405, 569136973, 'Madeline Hackma', 13, 0, 26, 50, 32, 227, 95, 38, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (406, 516784112, 'Millie Bosco', 10, 24, 56, 1, 42, 540, 37, 11, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (407, 544415635, 'Nastassja Gunto', 6, 10, 27, 38, 16, 852, 19, 76, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (408, 594755352, 'Daniel Shannon', 15, 39, 88.5, 35, 7, 356, 4, 49, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (409, 516964358, 'Chely Swank', 1, 8, 14, 54, 36, 899, 84, 24, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (410, 565957318, 'Halle Arkenston', 15, 45, 97.5, 15, 5, 415, 81, 36, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (411, 584185498, 'Hex Quaid', 4, 24, 44, 77, 19, 902, 19, 9, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (412, 576493317, 'Rodney Romijn-S', 0, 43, 64.5, 46, 40, 109, 74, 50, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (413, 566133837, 'Philip Nicholso', 16, 47, 102.5, 81, 42, 407, 1, 37, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (414, 511664272, 'Brooke Murphy', 10, 12, 38, 18, 24, 961, 33, 60, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (415, 543617395, 'Gabriel Scaggs', 11, 9, 35.5, 76, 13, 430, 67, 93, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (416, 527637449, 'Lizzy Devine', 0, 12, 18, 19, 17, 964, 38, 22, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (417, 535719688, 'Vin Goldblum', 13, 16, 50, 1, 46, 499, 81, 43, 0, 0);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (420, 501234567, 'mom', 3, 54, 87, 67, 4, 7, 19, 5, 0, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (421, 571138648, 'Red Wood', 10, 13, 39.5, 29, 12, 213, 25, 54, 1, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (422, 579234253, 'Alicia Laurie', 10, 17.5, 46.25, 80, 18, 509, 23, 94, 1, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (423, 557765136, 'Mia McKean', 10, 7.5, 31.25, 57, 37, 868, 28, 60, 1, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (424, 567338558, 'Loren Rauhofer', 10, 23, 54.5, 37, 7, 387, 40, 30, 1, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (425, 565386323, 'Jeffrey O''Sulli', 10, 3, 24.5, 51, 36, 231, 4, 2, 1, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum, is_split, is_splitable)
values (426, 547135855, 'Joe Snider', 10, 15.5, 43.25, 35, 40, 565, 55, 85, 1, 1);
commit;
prompt 420 records loaded
prompt Loading TRACKINGSHIPMENTS...
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (3, to_date('24-11-2023', 'dd-mm-yyyy'), to_date('14-02-2024', 'dd-mm-yyyy'), to_date('15-02-2024', 'dd-mm-yyyy'), to_date('07-01-2024', 'dd-mm-yyyy'), 36, 3);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (4, to_date('18-10-2023', 'dd-mm-yyyy'), to_date('02-12-2023', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), to_date('27-05-2024', 'dd-mm-yyyy'), 36, 4);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (5, to_date('23-11-2023', 'dd-mm-yyyy'), to_date('24-11-2023', 'dd-mm-yyyy'), to_date('22-08-2023', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'), 36, 5);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (6, to_date('04-03-2024', 'dd-mm-yyyy'), to_date('05-03-2024', 'dd-mm-yyyy'), to_date('09-04-2023', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'), 36, 6);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (7, to_date('24-02-2024', 'dd-mm-yyyy'), to_date('25-02-2024', 'dd-mm-yyyy'), to_date('05-01-2024', 'dd-mm-yyyy'), to_date('06-01-2024', 'dd-mm-yyyy'), 36, 7);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (8, to_date('03-10-2023', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'), 36, 8);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (9, to_date('25-05-2023', 'dd-mm-yyyy'), to_date('15-10-2023', 'dd-mm-yyyy'), to_date('08-02-2024', 'dd-mm-yyyy'), to_date('09-02-2024', 'dd-mm-yyyy'), 36, 9);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (10, to_date('22-07-2023', 'dd-mm-yyyy'), to_date('14-10-2023', 'dd-mm-yyyy'), to_date('13-02-2024', 'dd-mm-yyyy'), to_date('14-02-2024', 'dd-mm-yyyy'), 36, 10);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (11, to_date('19-02-2024', 'dd-mm-yyyy'), to_date('20-02-2024', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), to_date('15-02-2024', 'dd-mm-yyyy'), 36, 11);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (12, to_date('23-06-2023', 'dd-mm-yyyy'), to_date('30-12-2023', 'dd-mm-yyyy'), to_date('18-02-2024', 'dd-mm-yyyy'), to_date('19-02-2024', 'dd-mm-yyyy'), 36, 12);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (13, to_date('13-10-2023', 'dd-mm-yyyy'), to_date('29-05-2024', 'dd-mm-yyyy'), to_date('30-05-2024', 'dd-mm-yyyy'), to_date('22-03-2024', 'dd-mm-yyyy'), 36, 13);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (14, to_date('30-07-2023', 'dd-mm-yyyy'), to_date('16-03-2024', 'dd-mm-yyyy'), to_date('17-03-2024', 'dd-mm-yyyy'), to_date('04-10-2023', 'dd-mm-yyyy'), 36, 14);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (15, to_date('08-03-2023', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'), to_date('31-03-2024', 'dd-mm-yyyy'), to_date('01-04-2024', 'dd-mm-yyyy'), 36, 15);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (16, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), to_date('09-10-2023', 'dd-mm-yyyy'), to_date('08-11-2023', 'dd-mm-yyyy'), 36, 16);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (17, to_date('19-03-2023', 'dd-mm-yyyy'), to_date('02-05-2023', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'), to_date('12-04-2024', 'dd-mm-yyyy'), 36, 17);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (18, to_date('21-05-2023', 'dd-mm-yyyy'), to_date('22-05-2023', 'dd-mm-yyyy'), to_date('23-11-2023', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), 36, 18);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (19, to_date('28-04-2023', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'), to_date('17-03-2024', 'dd-mm-yyyy'), 36, 19);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (20, to_date('28-05-2024', 'dd-mm-yyyy'), to_date('29-05-2024', 'dd-mm-yyyy'), to_date('22-10-2023', 'dd-mm-yyyy'), to_date('06-06-2024', 'dd-mm-yyyy'), 36, 20);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (21, to_date('05-07-2023', 'dd-mm-yyyy'), to_date('06-07-2023', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'), 36, 21);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (22, to_date('23-01-2023', 'dd-mm-yyyy'), to_date('20-06-2023', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), to_date('02-02-2024', 'dd-mm-yyyy'), 36, 22);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (23, to_date('21-08-2023', 'dd-mm-yyyy'), to_date('22-08-2023', 'dd-mm-yyyy'), to_date('02-08-2023', 'dd-mm-yyyy'), to_date('01-04-2024', 'dd-mm-yyyy'), 36, 23);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (24, to_date('15-10-2023', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'), 36, 24);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (25, to_date('27-01-2023', 'dd-mm-yyyy'), to_date('31-07-2023', 'dd-mm-yyyy'), to_date('10-03-2024', 'dd-mm-yyyy'), to_date('11-03-2024', 'dd-mm-yyyy'), 36, 25);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (26, to_date('06-09-2023', 'dd-mm-yyyy'), to_date('07-09-2023', 'dd-mm-yyyy'), to_date('19-02-2024', 'dd-mm-yyyy'), to_date('20-02-2024', 'dd-mm-yyyy'), 36, 26);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (27, to_date('31-10-2023', 'dd-mm-yyyy'), to_date('01-06-2024', 'dd-mm-yyyy'), to_date('02-06-2024', 'dd-mm-yyyy'), to_date('26-11-2023', 'dd-mm-yyyy'), 36, 27);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (28, to_date('27-08-2023', 'dd-mm-yyyy'), to_date('30-01-2024', 'dd-mm-yyyy'), to_date('31-01-2024', 'dd-mm-yyyy'), to_date('16-11-2023', 'dd-mm-yyyy'), 36, 28);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (29, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('06-03-2024', 'dd-mm-yyyy'), to_date('05-04-2024', 'dd-mm-yyyy'), to_date('06-04-2024', 'dd-mm-yyyy'), 36, 29);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (30, to_date('29-03-2023', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'), to_date('25-05-2024', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), 36, 30);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (31, to_date('23-04-2024', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), to_date('22-03-2023', 'dd-mm-yyyy'), to_date('02-09-2023', 'dd-mm-yyyy'), 36, 31);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (32, to_date('26-04-2024', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'), to_date('14-07-2023', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'), 36, 32);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (34, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('15-02-2024', 'dd-mm-yyyy'), to_date('16-02-2024', 'dd-mm-yyyy'), to_date('10-11-2023', 'dd-mm-yyyy'), 36, 34);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (35, to_date('13-12-2023', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'), to_date('04-03-2024', 'dd-mm-yyyy'), to_date('05-03-2024', 'dd-mm-yyyy'), 36, 35);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (36, to_date('26-04-2024', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'), to_date('02-09-2023', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'), 36, 36);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (37, to_date('25-01-2024', 'dd-mm-yyyy'), to_date('26-01-2024', 'dd-mm-yyyy'), to_date('08-12-2023', 'dd-mm-yyyy'), to_date('07-01-2024', 'dd-mm-yyyy'), 36, 37);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (38, to_date('19-07-2023', 'dd-mm-yyyy'), to_date('27-02-2024', 'dd-mm-yyyy'), to_date('28-02-2024', 'dd-mm-yyyy'), to_date('10-10-2023', 'dd-mm-yyyy'), 36, 38);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (39, to_date('02-04-2024', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'), 36, 39);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (40, to_date('28-08-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), to_date('21-09-2023', 'dd-mm-yyyy'), to_date('03-11-2023', 'dd-mm-yyyy'), 36, 40);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (41, to_date('02-02-2024', 'dd-mm-yyyy'), to_date('03-02-2024', 'dd-mm-yyyy'), to_date('28-05-2023', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'), 36, 41);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (42, to_date('23-11-2023', 'dd-mm-yyyy'), to_date('24-11-2023', 'dd-mm-yyyy'), to_date('26-04-2023', 'dd-mm-yyyy'), to_date('31-01-2024', 'dd-mm-yyyy'), 36, 42);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (43, to_date('29-03-2024', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'), to_date('17-12-2023', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'), 36, 43);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (44, to_date('18-01-2023', 'dd-mm-yyyy'), to_date('22-08-2023', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'), to_date('30-04-2024', 'dd-mm-yyyy'), 36, 44);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (45, to_date('16-03-2023', 'dd-mm-yyyy'), to_date('21-09-2023', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'), to_date('04-06-2023', 'dd-mm-yyyy'), 36, 45);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (46, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'), 36, 46);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (47, to_date('20-05-2023', 'dd-mm-yyyy'), to_date('21-05-2023', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 36, 47);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (48, to_date('29-03-2023', 'dd-mm-yyyy'), to_date('01-03-2024', 'dd-mm-yyyy'), to_date('02-03-2024', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'), 36, 48);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (49, to_date('24-10-2023', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'), 36, 49);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (50, to_date('14-03-2024', 'dd-mm-yyyy'), to_date('15-03-2024', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), to_date('21-10-2023', 'dd-mm-yyyy'), 36, 50);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (51, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), to_date('19-09-2023', 'dd-mm-yyyy'), to_date('20-09-2023', 'dd-mm-yyyy'), 36, 51);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (52, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('07-01-2024', 'dd-mm-yyyy'), to_date('25-11-2023', 'dd-mm-yyyy'), to_date('26-11-2023', 'dd-mm-yyyy'), 36, 52);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (1, to_date('18-08-2023', 'dd-mm-yyyy'), to_date('04-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), to_date('07-02-2024', 'dd-mm-yyyy'), 36, 1);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (2, to_date('19-01-2024', 'dd-mm-yyyy'), to_date('20-01-2024', 'dd-mm-yyyy'), to_date('03-01-2024', 'dd-mm-yyyy'), to_date('18-09-2023', 'dd-mm-yyyy'), 36, 2);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (53, to_date('06-12-2023', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'), to_date('06-04-2024', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), 36, 53);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (54, to_date('13-03-2023', 'dd-mm-yyyy'), to_date('11-06-2024', 'dd-mm-yyyy'), to_date('12-06-2024', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'), 36, 54);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (55, to_date('15-04-2024', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'), to_date('09-12-2023', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), 36, 55);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (56, to_date('09-03-2024', 'dd-mm-yyyy'), to_date('10-03-2024', 'dd-mm-yyyy'), to_date('15-10-2023', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), 36, 56);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (57, to_date('16-07-2023', 'dd-mm-yyyy'), to_date('16-02-2024', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 36, 57);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (58, to_date('01-09-2023', 'dd-mm-yyyy'), to_date('23-11-2023', 'dd-mm-yyyy'), to_date('24-11-2023', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'), 36, 58);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (59, to_date('20-03-2024', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'), to_date('06-12-2023', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'), 36, 59);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (60, to_date('08-04-2024', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'), to_date('06-02-2024', 'dd-mm-yyyy'), to_date('07-02-2024', 'dd-mm-yyyy'), 36, 60);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (61, to_date('26-10-2023', 'dd-mm-yyyy'), to_date('27-10-2023', 'dd-mm-yyyy'), to_date('11-01-2024', 'dd-mm-yyyy'), to_date('25-04-2024', 'dd-mm-yyyy'), 36, 61);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (62, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('01-12-2023', 'dd-mm-yyyy'), to_date('30-01-2024', 'dd-mm-yyyy'), to_date('31-01-2024', 'dd-mm-yyyy'), 36, 62);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (63, to_date('05-04-2023', 'dd-mm-yyyy'), to_date('06-04-2023', 'dd-mm-yyyy'), to_date('12-11-2023', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), 36, 63);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (64, to_date('01-04-2023', 'dd-mm-yyyy'), to_date('06-05-2023', 'dd-mm-yyyy'), to_date('07-05-2023', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'), 36, 64);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (65, to_date('08-06-2023', 'dd-mm-yyyy'), to_date('05-04-2024', 'dd-mm-yyyy'), to_date('06-04-2024', 'dd-mm-yyyy'), to_date('23-05-2024', 'dd-mm-yyyy'), 36, 65);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (66, to_date('10-04-2023', 'dd-mm-yyyy'), to_date('11-04-2023', 'dd-mm-yyyy'), to_date('17-09-2023', 'dd-mm-yyyy'), to_date('31-03-2024', 'dd-mm-yyyy'), 36, 66);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (67, to_date('31-12-2023', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'), to_date('10-05-2024', 'dd-mm-yyyy'), to_date('11-05-2024', 'dd-mm-yyyy'), 36, 67);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (68, to_date('04-08-2023', 'dd-mm-yyyy'), to_date('05-06-2024', 'dd-mm-yyyy'), to_date('06-06-2024', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'), 36, 68);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (69, to_date('16-12-2023', 'dd-mm-yyyy'), to_date('13-04-2024', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'), to_date('24-08-2023', 'dd-mm-yyyy'), 36, 69);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (70, to_date('11-02-2024', 'dd-mm-yyyy'), to_date('12-02-2024', 'dd-mm-yyyy'), to_date('09-02-2024', 'dd-mm-yyyy'), to_date('10-02-2024', 'dd-mm-yyyy'), 36, 70);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (71, to_date('19-02-2023', 'dd-mm-yyyy'), to_date('05-03-2024', 'dd-mm-yyyy'), to_date('06-03-2024', 'dd-mm-yyyy'), to_date('28-03-2024', 'dd-mm-yyyy'), 36, 71);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (72, to_date('26-11-2023', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'), to_date('16-03-2024', 'dd-mm-yyyy'), to_date('17-03-2024', 'dd-mm-yyyy'), 36, 72);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (73, to_date('01-09-2023', 'dd-mm-yyyy'), to_date('02-09-2023', 'dd-mm-yyyy'), to_date('06-01-2024', 'dd-mm-yyyy'), to_date('07-01-2024', 'dd-mm-yyyy'), 36, 73);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (74, to_date('04-09-2023', 'dd-mm-yyyy'), to_date('05-09-2023', 'dd-mm-yyyy'), to_date('19-03-2024', 'dd-mm-yyyy'), to_date('20-03-2024', 'dd-mm-yyyy'), 36, 74);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (75, to_date('15-12-2023', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), to_date('15-12-2023', 'dd-mm-yyyy'), 36, 75);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (76, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 36, 76);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (77, to_date('02-03-2023', 'dd-mm-yyyy'), to_date('01-04-2023', 'dd-mm-yyyy'), to_date('28-01-2024', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 36, 77);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (78, to_date('05-05-2023', 'dd-mm-yyyy'), to_date('06-05-2023', 'dd-mm-yyyy'), to_date('25-04-2023', 'dd-mm-yyyy'), to_date('05-06-2024', 'dd-mm-yyyy'), 36, 78);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (79, to_date('15-10-2023', 'dd-mm-yyyy'), to_date('11-02-2024', 'dd-mm-yyyy'), to_date('12-02-2024', 'dd-mm-yyyy'), to_date('05-02-2024', 'dd-mm-yyyy'), 36, 79);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (80, to_date('20-05-2023', 'dd-mm-yyyy'), to_date('21-05-2023', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'), to_date('17-04-2024', 'dd-mm-yyyy'), 36, 80);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (81, to_date('21-04-2024', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'), to_date('26-02-2024', 'dd-mm-yyyy'), 36, 81);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (82, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('09-01-2024', 'dd-mm-yyyy'), to_date('04-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 36, 82);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (83, to_date('31-10-2023', 'dd-mm-yyyy'), to_date('01-11-2023', 'dd-mm-yyyy'), to_date('24-09-2023', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 36, 83);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (84, to_date('08-10-2023', 'dd-mm-yyyy'), null, null, null, 33, 84);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (85, to_date('17-05-2023', 'dd-mm-yyyy'), null, null, null, 33, 85);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (86, to_date('11-06-2024', 'dd-mm-yyyy'), null, null, null, 33, 86);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (87, to_date('11-01-2023', 'dd-mm-yyyy'), null, null, null, 33, 87);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (88, to_date('18-08-2023', 'dd-mm-yyyy'), null, null, null, 33, 88);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (89, to_date('15-02-2023', 'dd-mm-yyyy'), null, null, null, 33, 89);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (90, to_date('12-06-2024', 'dd-mm-yyyy'), null, null, null, 33, 90);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (91, to_date('07-05-2023', 'dd-mm-yyyy'), null, null, null, 33, 91);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (92, to_date('28-05-2024', 'dd-mm-yyyy'), null, null, null, 33, 92);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (93, to_date('24-07-2023', 'dd-mm-yyyy'), null, null, null, 33, 93);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (94, to_date('13-11-2023', 'dd-mm-yyyy'), null, null, null, 33, 94);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (95, to_date('02-09-2023', 'dd-mm-yyyy'), null, null, null, 33, 95);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (96, to_date('06-11-2023', 'dd-mm-yyyy'), null, null, null, 33, 96);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (97, to_date('24-03-2024', 'dd-mm-yyyy'), null, null, null, 33, 97);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (98, to_date('02-03-2024', 'dd-mm-yyyy'), null, null, null, 33, 98);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (99, to_date('16-03-2024', 'dd-mm-yyyy'), null, null, null, 33, 99);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (100, to_date('22-03-2023', 'dd-mm-yyyy'), null, null, null, 33, 100);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (101, to_date('30-01-2024', 'dd-mm-yyyy'), null, null, null, 33, 101);
commit;
prompt 100 records committed...
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (102, to_date('17-09-2023', 'dd-mm-yyyy'), null, null, null, 33, 102);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (103, to_date('19-12-2023', 'dd-mm-yyyy'), null, null, null, 33, 103);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (104, to_date('31-07-2023', 'dd-mm-yyyy'), null, null, null, 33, 104);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (105, to_date('24-10-2023', 'dd-mm-yyyy'), null, null, null, 33, 105);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (106, to_date('17-08-2023', 'dd-mm-yyyy'), null, null, null, 33, 106);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (107, to_date('30-05-2023', 'dd-mm-yyyy'), null, null, null, 33, 107);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (108, to_date('12-10-2023', 'dd-mm-yyyy'), null, null, null, 33, 108);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (109, to_date('13-03-2024', 'dd-mm-yyyy'), null, null, null, 33, 109);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (110, to_date('30-07-2023', 'dd-mm-yyyy'), null, null, null, 33, 110);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (111, to_date('19-02-2024', 'dd-mm-yyyy'), null, null, null, 33, 111);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (112, to_date('14-04-2024', 'dd-mm-yyyy'), null, null, null, 33, 112);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (113, to_date('18-04-2023', 'dd-mm-yyyy'), null, null, null, 33, 113);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (114, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('07-01-2024', 'dd-mm-yyyy'), null, null, 34, 114);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (115, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('05-04-2024', 'dd-mm-yyyy'), null, null, 34, 115);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (116, to_date('22-07-2023', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), null, null, 34, 116);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (117, to_date('08-05-2024', 'dd-mm-yyyy'), to_date('09-05-2024', 'dd-mm-yyyy'), null, null, 34, 117);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (118, to_date('04-01-2023', 'dd-mm-yyyy'), to_date('04-09-2023', 'dd-mm-yyyy'), null, null, 34, 118);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (119, to_date('04-08-2023', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'), null, null, 34, 119);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (120, to_date('28-02-2024', 'dd-mm-yyyy'), to_date('08-05-2024', 'dd-mm-yyyy'), null, null, 34, 120);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (121, to_date('22-09-2023', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'), null, null, 34, 121);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (122, to_date('02-03-2024', 'dd-mm-yyyy'), to_date('30-05-2024', 'dd-mm-yyyy'), null, null, 34, 122);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (123, to_date('03-04-2024', 'dd-mm-yyyy'), to_date('04-04-2024', 'dd-mm-yyyy'), null, null, 34, 123);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (124, to_date('22-03-2023', 'dd-mm-yyyy'), to_date('12-11-2023', 'dd-mm-yyyy'), null, null, 34, 124);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (125, to_date('05-02-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), null, null, 34, 125);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (126, to_date('07-01-2023', 'dd-mm-yyyy'), to_date('06-06-2024', 'dd-mm-yyyy'), null, null, 34, 126);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (127, to_date('27-08-2023', 'dd-mm-yyyy'), to_date('14-09-2023', 'dd-mm-yyyy'), null, null, 34, 127);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (128, to_date('12-06-2024', 'dd-mm-yyyy'), to_date('13-06-2024', 'dd-mm-yyyy'), null, null, 34, 128);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (129, to_date('05-04-2024', 'dd-mm-yyyy'), to_date('06-04-2024', 'dd-mm-yyyy'), null, null, 34, 129);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (130, to_date('01-01-2023', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'), null, null, 34, 130);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (131, to_date('02-01-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), null, null, 34, 131);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (132, to_date('02-04-2024', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), null, null, 34, 132);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (133, to_date('13-05-2023', 'dd-mm-yyyy'), to_date('14-05-2023', 'dd-mm-yyyy'), null, null, 34, 133);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (134, to_date('12-02-2023', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'), null, null, 34, 134);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (135, to_date('26-05-2024', 'dd-mm-yyyy'), to_date('27-05-2024', 'dd-mm-yyyy'), null, null, 34, 135);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (136, to_date('15-01-2023', 'dd-mm-yyyy'), to_date('06-04-2024', 'dd-mm-yyyy'), null, null, 34, 136);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (137, to_date('17-04-2023', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'), null, null, 34, 137);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (138, to_date('11-05-2023', 'dd-mm-yyyy'), to_date('14-07-2023', 'dd-mm-yyyy'), null, null, 34, 138);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (139, to_date('30-01-2023', 'dd-mm-yyyy'), to_date('06-12-2023', 'dd-mm-yyyy'), null, null, 34, 139);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (140, to_date('11-03-2023', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), null, null, 34, 140);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (141, to_date('10-09-2023', 'dd-mm-yyyy'), to_date('11-09-2023', 'dd-mm-yyyy'), null, null, 34, 141);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (142, to_date('06-06-2024', 'dd-mm-yyyy'), to_date('07-06-2024', 'dd-mm-yyyy'), null, null, 34, 142);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (143, to_date('15-01-2023', 'dd-mm-yyyy'), to_date('08-04-2024', 'dd-mm-yyyy'), null, null, 34, 143);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (144, to_date('08-04-2024', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'), to_date('20-02-2024', 'dd-mm-yyyy'), null, 35, 144);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (145, to_date('24-06-2023', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'), to_date('10-11-2023', 'dd-mm-yyyy'), null, 35, 145);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (146, to_date('25-12-2023', 'dd-mm-yyyy'), to_date('26-12-2023', 'dd-mm-yyyy'), to_date('21-12-2023', 'dd-mm-yyyy'), null, 35, 146);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (147, to_date('07-06-2023', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), to_date('04-04-2024', 'dd-mm-yyyy'), null, 35, 147);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (148, to_date('19-01-2023', 'dd-mm-yyyy'), to_date('04-04-2024', 'dd-mm-yyyy'), to_date('05-04-2024', 'dd-mm-yyyy'), null, 35, 148);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (149, to_date('24-05-2023', 'dd-mm-yyyy'), to_date('25-05-2023', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'), null, 35, 149);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (150, to_date('04-12-2023', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'), to_date('09-05-2024', 'dd-mm-yyyy'), null, 35, 150);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (151, to_date('22-07-2023', 'dd-mm-yyyy'), to_date('07-06-2024', 'dd-mm-yyyy'), to_date('08-06-2024', 'dd-mm-yyyy'), null, 35, 151);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (152, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('18-05-2023', 'dd-mm-yyyy'), to_date('19-05-2023', 'dd-mm-yyyy'), null, 35, 152);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (153, to_date('27-11-2023', 'dd-mm-yyyy'), to_date('10-06-2024', 'dd-mm-yyyy'), to_date('11-06-2024', 'dd-mm-yyyy'), null, 35, 153);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (154, to_date('24-04-2023', 'dd-mm-yyyy'), to_date('06-10-2023', 'dd-mm-yyyy'), to_date('05-04-2024', 'dd-mm-yyyy'), null, 35, 154);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (155, to_date('12-02-2024', 'dd-mm-yyyy'), to_date('13-02-2024', 'dd-mm-yyyy'), to_date('27-10-2023', 'dd-mm-yyyy'), null, 35, 155);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (156, to_date('19-10-2023', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'), to_date('12-12-2023', 'dd-mm-yyyy'), null, 35, 156);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (157, to_date('03-04-2023', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'), null, 35, 157);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (158, to_date('07-06-2024', 'dd-mm-yyyy'), to_date('08-06-2024', 'dd-mm-yyyy'), to_date('05-04-2024', 'dd-mm-yyyy'), null, 35, 158);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (159, to_date('13-11-2023', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'), null, 35, 159);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (160, to_date('14-12-2023', 'dd-mm-yyyy'), to_date('10-03-2024', 'dd-mm-yyyy'), to_date('11-03-2024', 'dd-mm-yyyy'), null, 35, 160);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (161, to_date('27-11-2023', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'), to_date('16-09-2023', 'dd-mm-yyyy'), null, 35, 161);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (162, to_date('08-06-2024', 'dd-mm-yyyy'), to_date('09-06-2024', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), null, 35, 162);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (163, to_date('15-09-2023', 'dd-mm-yyyy'), to_date('15-04-2024', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'), null, 35, 163);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (164, to_date('25-02-2024', 'dd-mm-yyyy'), to_date('26-02-2024', 'dd-mm-yyyy'), to_date('13-01-2024', 'dd-mm-yyyy'), null, 35, 164);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (165, to_date('26-04-2023', 'dd-mm-yyyy'), to_date('01-08-2023', 'dd-mm-yyyy'), to_date('30-09-2023', 'dd-mm-yyyy'), null, 35, 165);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (166, to_date('19-04-2024', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'), null, 35, 166);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (167, to_date('10-03-2024', 'dd-mm-yyyy'), to_date('11-03-2024', 'dd-mm-yyyy'), to_date('12-03-2024', 'dd-mm-yyyy'), null, 35, 167);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (168, to_date('06-02-2023', 'dd-mm-yyyy'), to_date('01-03-2024', 'dd-mm-yyyy'), to_date('22-03-2024', 'dd-mm-yyyy'), null, 35, 168);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (169, to_date('10-10-2023', 'dd-mm-yyyy'), to_date('11-10-2023', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'), null, 35, 169);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (170, to_date('15-02-2023', 'dd-mm-yyyy'), to_date('30-08-2023', 'dd-mm-yyyy'), to_date('14-10-2023', 'dd-mm-yyyy'), null, 35, 170);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (171, to_date('28-04-2024', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'), to_date('19-09-2023', 'dd-mm-yyyy'), null, 35, 171);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (172, to_date('21-07-2023', 'dd-mm-yyyy'), to_date('18-08-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), null, 35, 172);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (173, to_date('24-03-2024', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'), to_date('13-03-2024', 'dd-mm-yyyy'), null, 35, 173);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (174, to_date('10-03-2024', 'dd-mm-yyyy'), to_date('09-05-2024', 'dd-mm-yyyy'), to_date('10-05-2024', 'dd-mm-yyyy'), null, 35, 174);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (175, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'), null, 35, 175);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (176, to_date('30-05-2023', 'dd-mm-yyyy'), to_date('04-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), null, 35, 176);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (177, to_date('19-10-2023', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'), null, 35, 177);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (178, to_date('13-09-2023', 'dd-mm-yyyy'), to_date('27-09-2023', 'dd-mm-yyyy'), to_date('28-09-2023', 'dd-mm-yyyy'), null, 35, 178);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (179, to_date('08-02-2023', 'dd-mm-yyyy'), to_date('29-05-2024', 'dd-mm-yyyy'), to_date('30-05-2024', 'dd-mm-yyyy'), null, 35, 179);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (180, to_date('25-05-2024', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), to_date('02-05-2024', 'dd-mm-yyyy'), null, 35, 180);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (181, to_date('20-01-2023', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'), to_date('10-03-2024', 'dd-mm-yyyy'), null, 35, 181);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (182, to_date('30-01-2024', 'dd-mm-yyyy'), to_date('31-01-2024', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'), null, 35, 182);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (183, to_date('17-07-2023', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), null, 35, 183);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (184, to_date('03-05-2024', 'dd-mm-yyyy'), to_date('04-05-2024', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), null, 35, 184);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (185, to_date('27-12-2023', 'dd-mm-yyyy'), to_date('22-04-2024', 'dd-mm-yyyy'), to_date('23-04-2024', 'dd-mm-yyyy'), null, 35, 185);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (186, to_date('08-04-2024', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'), to_date('27-08-2023', 'dd-mm-yyyy'), null, 35, 186);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (187, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'), to_date('23-05-2024', 'dd-mm-yyyy'), null, 35, 187);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (188, to_date('15-06-2023', 'dd-mm-yyyy'), to_date('16-06-2023', 'dd-mm-yyyy'), to_date('09-06-2023', 'dd-mm-yyyy'), null, 35, 188);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (189, to_date('22-12-2023', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'), to_date('18-01-2024', 'dd-mm-yyyy'), null, 35, 189);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (190, to_date('26-02-2023', 'dd-mm-yyyy'), to_date('03-05-2023', 'dd-mm-yyyy'), to_date('30-04-2024', 'dd-mm-yyyy'), null, 35, 190);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (191, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), to_date('17-06-2023', 'dd-mm-yyyy'), null, 35, 191);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (192, to_date('07-02-2023', 'dd-mm-yyyy'), to_date('02-06-2023', 'dd-mm-yyyy'), to_date('05-06-2024', 'dd-mm-yyyy'), null, 35, 192);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (193, to_date('23-02-2023', 'dd-mm-yyyy'), to_date('24-02-2023', 'dd-mm-yyyy'), to_date('06-08-2023', 'dd-mm-yyyy'), null, 35, 193);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (194, to_date('29-12-2023', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), null, 35, 194);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (195, to_date('10-06-2024', 'dd-mm-yyyy'), to_date('11-06-2024', 'dd-mm-yyyy'), to_date('25-12-2023', 'dd-mm-yyyy'), null, 35, 195);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (196, to_date('19-03-2023', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'), to_date('05-01-2024', 'dd-mm-yyyy'), null, 35, 196);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (197, to_date('16-06-2023', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'), null, 35, 197);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (198, to_date('13-03-2023', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), null, 35, 198);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (199, to_date('29-04-2023', 'dd-mm-yyyy'), to_date('09-07-2023', 'dd-mm-yyyy'), to_date('09-06-2024', 'dd-mm-yyyy'), null, 35, 199);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (200, to_date('23-12-2023', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'), to_date('02-10-2023', 'dd-mm-yyyy'), null, 35, 200);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (201, to_date('18-01-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), null, 35, 201);
commit;
prompt 200 records committed...
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (202, to_date('10-01-2023', 'dd-mm-yyyy'), to_date('14-02-2023', 'dd-mm-yyyy'), to_date('09-06-2023', 'dd-mm-yyyy'), null, 35, 202);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (203, to_date('18-02-2024', 'dd-mm-yyyy'), to_date('19-02-2024', 'dd-mm-yyyy'), to_date('03-05-2023', 'dd-mm-yyyy'), null, 35, 203);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (204, to_date('01-04-2023', 'dd-mm-yyyy'), to_date('23-11-2023', 'dd-mm-yyyy'), to_date('30-12-2023', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'), 36, 204);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (205, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'), to_date('03-01-2024', 'dd-mm-yyyy'), 36, 205);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (206, to_date('31-05-2024', 'dd-mm-yyyy'), to_date('01-06-2024', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'), to_date('06-12-2023', 'dd-mm-yyyy'), 36, 206);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (207, to_date('22-02-2024', 'dd-mm-yyyy'), to_date('23-02-2024', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), to_date('25-04-2024', 'dd-mm-yyyy'), 36, 207);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (208, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('21-05-2024', 'dd-mm-yyyy'), to_date('02-05-2023', 'dd-mm-yyyy'), to_date('01-10-2023', 'dd-mm-yyyy'), 36, 208);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (209, to_date('02-10-2023', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'), to_date('12-04-2024', 'dd-mm-yyyy'), to_date('19-11-2023', 'dd-mm-yyyy'), 36, 209);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (210, to_date('28-12-2023', 'dd-mm-yyyy'), to_date('29-12-2023', 'dd-mm-yyyy'), to_date('03-06-2023', 'dd-mm-yyyy'), to_date('14-01-2024', 'dd-mm-yyyy'), 36, 210);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (211, to_date('06-02-2023', 'dd-mm-yyyy'), to_date('01-10-2023', 'dd-mm-yyyy'), to_date('23-10-2023', 'dd-mm-yyyy'), to_date('24-10-2023', 'dd-mm-yyyy'), 36, 211);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (212, to_date('28-05-2023', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), to_date('25-04-2024', 'dd-mm-yyyy'), to_date('02-06-2023', 'dd-mm-yyyy'), 36, 212);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (213, to_date('09-04-2024', 'dd-mm-yyyy'), to_date('10-04-2024', 'dd-mm-yyyy'), to_date('01-09-2023', 'dd-mm-yyyy'), to_date('09-05-2024', 'dd-mm-yyyy'), 36, 213);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (214, to_date('31-05-2023', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'), to_date('22-03-2024', 'dd-mm-yyyy'), to_date('25-09-2023', 'dd-mm-yyyy'), 36, 214);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (215, to_date('27-03-2024', 'dd-mm-yyyy'), to_date('28-03-2024', 'dd-mm-yyyy'), to_date('31-05-2023', 'dd-mm-yyyy'), to_date('03-06-2024', 'dd-mm-yyyy'), 36, 215);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (216, to_date('12-05-2023', 'dd-mm-yyyy'), to_date('13-05-2023', 'dd-mm-yyyy'), to_date('06-05-2023', 'dd-mm-yyyy'), to_date('31-05-2023', 'dd-mm-yyyy'), 36, 216);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (217, to_date('09-12-2023', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), to_date('06-01-2024', 'dd-mm-yyyy'), to_date('07-01-2024', 'dd-mm-yyyy'), 36, 217);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (218, to_date('01-01-2023', 'dd-mm-yyyy'), to_date('13-01-2024', 'dd-mm-yyyy'), to_date('14-01-2024', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), 36, 218);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (219, to_date('10-04-2024', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'), to_date('15-12-2023', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'), 36, 219);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (220, to_date('12-02-2023', 'dd-mm-yyyy'), to_date('15-04-2023', 'dd-mm-yyyy'), to_date('08-05-2023', 'dd-mm-yyyy'), to_date('09-05-2023', 'dd-mm-yyyy'), 36, 220);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (221, to_date('24-02-2024', 'dd-mm-yyyy'), to_date('25-04-2024', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'), to_date('22-01-2024', 'dd-mm-yyyy'), 36, 221);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (222, to_date('02-05-2023', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 36, 222);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (223, to_date('02-06-2024', 'dd-mm-yyyy'), to_date('03-06-2024', 'dd-mm-yyyy'), to_date('21-08-2023', 'dd-mm-yyyy'), to_date('05-04-2024', 'dd-mm-yyyy'), 36, 223);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (224, to_date('23-08-2023', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), to_date('11-08-2023', 'dd-mm-yyyy'), 36, 224);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (225, to_date('07-01-2023', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'), to_date('25-02-2024', 'dd-mm-yyyy'), to_date('29-05-2023', 'dd-mm-yyyy'), 36, 225);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (226, to_date('12-03-2024', 'dd-mm-yyyy'), to_date('13-03-2024', 'dd-mm-yyyy'), to_date('05-07-2023', 'dd-mm-yyyy'), to_date('18-02-2024', 'dd-mm-yyyy'), 36, 226);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (227, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('05-01-2024', 'dd-mm-yyyy'), to_date('24-05-2023', 'dd-mm-yyyy'), to_date('02-06-2023', 'dd-mm-yyyy'), 36, 227);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (228, to_date('24-05-2024', 'dd-mm-yyyy'), to_date('25-05-2024', 'dd-mm-yyyy'), to_date('19-03-2024', 'dd-mm-yyyy'), to_date('20-03-2024', 'dd-mm-yyyy'), 36, 228);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (229, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('15-04-2024', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'), to_date('07-03-2024', 'dd-mm-yyyy'), 36, 229);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (230, to_date('02-04-2024', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), to_date('11-01-2024', 'dd-mm-yyyy'), to_date('10-02-2024', 'dd-mm-yyyy'), 36, 230);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (231, to_date('25-04-2023', 'dd-mm-yyyy'), to_date('22-06-2023', 'dd-mm-yyyy'), to_date('23-06-2023', 'dd-mm-yyyy'), to_date('19-04-2023', 'dd-mm-yyyy'), 36, 231);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (233, to_date('12-09-2023', 'dd-mm-yyyy'), to_date('13-09-2023', 'dd-mm-yyyy'), to_date('17-08-2023', 'dd-mm-yyyy'), to_date('18-08-2023', 'dd-mm-yyyy'), 36, 233);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (234, to_date('14-06-2023', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'), to_date('08-05-2024', 'dd-mm-yyyy'), to_date('09-05-2024', 'dd-mm-yyyy'), 36, 234);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (235, to_date('13-05-2024', 'dd-mm-yyyy'), to_date('14-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 36, 235);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (236, to_date('30-09-2023', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'), to_date('22-05-2024', 'dd-mm-yyyy'), 36, 236);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (237, to_date('22-03-2024', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'), to_date('21-12-2023', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), 36, 237);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (238, to_date('20-03-2024', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'), to_date('27-08-2023', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 36, 238);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (239, to_date('15-04-2024', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'), to_date('09-09-2023', 'dd-mm-yyyy'), to_date('15-01-2024', 'dd-mm-yyyy'), 36, 239);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (240, to_date('29-03-2023', 'dd-mm-yyyy'), to_date('19-06-2023', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), 36, 240);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (241, to_date('13-02-2023', 'dd-mm-yyyy'), to_date('13-05-2023', 'dd-mm-yyyy'), to_date('14-05-2023', 'dd-mm-yyyy'), to_date('30-06-2023', 'dd-mm-yyyy'), 36, 241);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (242, to_date('08-02-2023', 'dd-mm-yyyy'), to_date('01-03-2024', 'dd-mm-yyyy'), to_date('02-03-2024', 'dd-mm-yyyy'), to_date('13-02-2024', 'dd-mm-yyyy'), 36, 242);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (243, to_date('07-04-2023', 'dd-mm-yyyy'), to_date('17-12-2023', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), 36, 243);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (244, to_date('07-03-2024', 'dd-mm-yyyy'), to_date('08-03-2024', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'), 36, 244);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (245, to_date('09-06-2023', 'dd-mm-yyyy'), to_date('25-08-2023', 'dd-mm-yyyy'), to_date('13-11-2023', 'dd-mm-yyyy'), to_date('14-11-2023', 'dd-mm-yyyy'), 36, 245);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (246, to_date('05-02-2023', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), to_date('08-01-2024', 'dd-mm-yyyy'), 36, 246);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (247, to_date('25-09-2023', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'), 36, 247);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (248, to_date('01-03-2024', 'dd-mm-yyyy'), to_date('02-03-2024', 'dd-mm-yyyy'), to_date('26-01-2024', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), 36, 248);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (249, to_date('21-06-2023', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'), 36, 249);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (250, to_date('18-01-2024', 'dd-mm-yyyy'), to_date('19-01-2024', 'dd-mm-yyyy'), to_date('02-03-2024', 'dd-mm-yyyy'), to_date('03-03-2024', 'dd-mm-yyyy'), 36, 250);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (251, to_date('27-08-2023', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), 36, 251);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (252, to_date('18-02-2023', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), to_date('23-02-2024', 'dd-mm-yyyy'), to_date('28-03-2024', 'dd-mm-yyyy'), 36, 252);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (253, to_date('20-10-2023', 'dd-mm-yyyy'), to_date('21-10-2023', 'dd-mm-yyyy'), to_date('25-12-2023', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'), 36, 253);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (254, to_date('23-05-2024', 'dd-mm-yyyy'), to_date('24-05-2024', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), to_date('03-07-2023', 'dd-mm-yyyy'), 36, 254);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (255, to_date('22-04-2024', 'dd-mm-yyyy'), to_date('23-04-2024', 'dd-mm-yyyy'), to_date('10-02-2024', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 36, 255);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (256, to_date('29-08-2023', 'dd-mm-yyyy'), to_date('17-03-2024', 'dd-mm-yyyy'), to_date('17-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 36, 256);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (257, to_date('13-05-2023', 'dd-mm-yyyy'), to_date('18-02-2024', 'dd-mm-yyyy'), to_date('19-02-2024', 'dd-mm-yyyy'), to_date('25-08-2023', 'dd-mm-yyyy'), 36, 257);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (258, to_date('21-09-2023', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'), to_date('26-02-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 36, 258);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (259, to_date('15-02-2024', 'dd-mm-yyyy'), to_date('09-05-2024', 'dd-mm-yyyy'), to_date('10-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 36, 259);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (260, to_date('24-11-2023', 'dd-mm-yyyy'), to_date('25-11-2023', 'dd-mm-yyyy'), to_date('08-04-2023', 'dd-mm-yyyy'), to_date('10-06-2023', 'dd-mm-yyyy'), 36, 260);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (261, to_date('26-05-2024', 'dd-mm-yyyy'), to_date('27-05-2024', 'dd-mm-yyyy'), to_date('28-12-2023', 'dd-mm-yyyy'), to_date('29-12-2023', 'dd-mm-yyyy'), 36, 261);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (262, to_date('19-04-2024', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'), to_date('13-05-2024', 'dd-mm-yyyy'), 36, 262);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (263, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'), to_date('06-05-2023', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'), 36, 263);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (264, to_date('07-06-2023', 'dd-mm-yyyy'), to_date('08-06-2023', 'dd-mm-yyyy'), to_date('27-05-2023', 'dd-mm-yyyy'), null, 35, 264);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (265, to_date('16-06-2023', 'dd-mm-yyyy'), to_date('08-08-2023', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'), null, 35, 265);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (266, to_date('08-11-2023', 'dd-mm-yyyy'), to_date('14-01-2024', 'dd-mm-yyyy'), to_date('15-01-2024', 'dd-mm-yyyy'), null, 35, 266);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (267, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('13-01-2024', 'dd-mm-yyyy'), to_date('01-06-2023', 'dd-mm-yyyy'), null, 35, 267);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (268, to_date('28-05-2024', 'dd-mm-yyyy'), to_date('29-05-2024', 'dd-mm-yyyy'), to_date('15-02-2024', 'dd-mm-yyyy'), null, 35, 268);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (269, to_date('27-07-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), to_date('19-11-2023', 'dd-mm-yyyy'), null, 35, 269);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (270, to_date('14-08-2023', 'dd-mm-yyyy'), to_date('15-08-2023', 'dd-mm-yyyy'), to_date('24-05-2023', 'dd-mm-yyyy'), null, 35, 270);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (271, to_date('19-01-2023', 'dd-mm-yyyy'), to_date('14-01-2024', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'), null, 35, 271);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (272, to_date('24-01-2023', 'dd-mm-yyyy'), to_date('14-09-2023', 'dd-mm-yyyy'), to_date('08-05-2024', 'dd-mm-yyyy'), null, 35, 272);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (273, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), to_date('18-10-2023', 'dd-mm-yyyy'), null, 35, 273);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (274, to_date('19-03-2023', 'dd-mm-yyyy'), to_date('25-12-2023', 'dd-mm-yyyy'), to_date('26-12-2023', 'dd-mm-yyyy'), null, 35, 274);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (275, to_date('13-10-2023', 'dd-mm-yyyy'), to_date('14-10-2023', 'dd-mm-yyyy'), to_date('18-10-2023', 'dd-mm-yyyy'), null, 35, 275);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (276, to_date('21-06-2023', 'dd-mm-yyyy'), to_date('22-06-2023', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'), null, 35, 276);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (277, to_date('26-01-2024', 'dd-mm-yyyy'), to_date('27-01-2024', 'dd-mm-yyyy'), to_date('28-09-2023', 'dd-mm-yyyy'), null, 35, 277);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (278, to_date('13-06-2023', 'dd-mm-yyyy'), to_date('31-07-2023', 'dd-mm-yyyy'), to_date('22-04-2024', 'dd-mm-yyyy'), null, 35, 278);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (279, to_date('14-02-2023', 'dd-mm-yyyy'), to_date('13-04-2024', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'), null, 35, 279);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (280, to_date('10-03-2023', 'dd-mm-yyyy'), to_date('01-10-2023', 'dd-mm-yyyy'), to_date('10-11-2023', 'dd-mm-yyyy'), null, 35, 280);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (281, to_date('15-10-2023', 'dd-mm-yyyy'), to_date('12-11-2023', 'dd-mm-yyyy'), to_date('13-11-2023', 'dd-mm-yyyy'), null, 35, 281);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (282, to_date('19-05-2023', 'dd-mm-yyyy'), to_date('20-05-2023', 'dd-mm-yyyy'), to_date('23-03-2023', 'dd-mm-yyyy'), null, 35, 282);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (283, to_date('27-08-2023', 'dd-mm-yyyy'), to_date('23-05-2024', 'dd-mm-yyyy'), to_date('24-05-2024', 'dd-mm-yyyy'), null, 35, 283);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (284, to_date('02-12-2023', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'), to_date('20-12-2023', 'dd-mm-yyyy'), null, 35, 284);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (285, to_date('12-06-2023', 'dd-mm-yyyy'), to_date('13-06-2023', 'dd-mm-yyyy'), to_date('04-06-2023', 'dd-mm-yyyy'), null, 35, 285);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (286, to_date('23-07-2023', 'dd-mm-yyyy'), to_date('24-07-2023', 'dd-mm-yyyy'), to_date('18-05-2023', 'dd-mm-yyyy'), null, 35, 286);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (287, to_date('01-01-2023', 'dd-mm-yyyy'), to_date('03-06-2023', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'), null, 35, 287);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (288, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), null, 35, 288);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (289, to_date('14-03-2023', 'dd-mm-yyyy'), to_date('02-07-2023', 'dd-mm-yyyy'), to_date('03-07-2023', 'dd-mm-yyyy'), null, 35, 289);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (290, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('10-04-2024', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'), null, 35, 290);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (291, to_date('18-09-2023', 'dd-mm-yyyy'), to_date('27-02-2024', 'dd-mm-yyyy'), to_date('28-02-2024', 'dd-mm-yyyy'), null, 35, 291);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (292, to_date('01-03-2023', 'dd-mm-yyyy'), to_date('21-01-2024', 'dd-mm-yyyy'), to_date('22-01-2024', 'dd-mm-yyyy'), null, 35, 292);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (293, to_date('23-11-2023', 'dd-mm-yyyy'), to_date('04-03-2024', 'dd-mm-yyyy'), to_date('05-03-2024', 'dd-mm-yyyy'), null, 35, 293);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (294, to_date('21-05-2023', 'dd-mm-yyyy'), to_date('10-06-2023', 'dd-mm-yyyy'), null, null, 34, 294);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (295, to_date('07-02-2024', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), null, null, 34, 295);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (296, to_date('30-08-2023', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), null, null, 34, 296);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (297, to_date('10-02-2023', 'dd-mm-yyyy'), to_date('25-03-2023', 'dd-mm-yyyy'), null, null, 34, 297);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (298, to_date('28-12-2023', 'dd-mm-yyyy'), to_date('31-05-2024', 'dd-mm-yyyy'), null, null, 34, 298);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (299, to_date('07-10-2023', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'), null, null, 34, 299);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (300, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('03-11-2023', 'dd-mm-yyyy'), null, null, 34, 300);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (301, to_date('26-01-2024', 'dd-mm-yyyy'), to_date('27-01-2024', 'dd-mm-yyyy'), null, null, 34, 301);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (302, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('21-09-2023', 'dd-mm-yyyy'), null, null, 34, 302);
commit;
prompt 300 records committed...
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (303, to_date('13-11-2023', 'dd-mm-yyyy'), to_date('14-11-2023', 'dd-mm-yyyy'), null, null, 34, 303);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (304, to_date('12-01-2023', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'), null, null, 34, 304);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (305, to_date('20-01-2023', 'dd-mm-yyyy'), to_date('12-04-2023', 'dd-mm-yyyy'), null, null, 34, 305);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (306, to_date('14-11-2023', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'), null, null, 34, 306);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (307, to_date('24-09-2023', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), null, null, 34, 307);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (308, to_date('23-11-2023', 'dd-mm-yyyy'), to_date('24-11-2023', 'dd-mm-yyyy'), null, null, 34, 308);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (309, to_date('14-10-2023', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), null, null, 34, 309);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (310, to_date('07-12-2023', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'), null, null, 34, 310);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (311, to_date('02-07-2023', 'dd-mm-yyyy'), to_date('03-07-2023', 'dd-mm-yyyy'), null, null, 34, 311);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (312, to_date('09-06-2024', 'dd-mm-yyyy'), to_date('10-06-2024', 'dd-mm-yyyy'), null, null, 34, 312);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (313, to_date('29-10-2023', 'dd-mm-yyyy'), to_date('30-10-2023', 'dd-mm-yyyy'), null, null, 34, 313);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (314, to_date('20-06-2023', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'), null, null, 34, 314);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (315, to_date('12-08-2023', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'), null, null, 34, 315);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (316, to_date('14-03-2024', 'dd-mm-yyyy'), to_date('15-03-2024', 'dd-mm-yyyy'), null, null, 34, 316);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (317, to_date('20-06-2023', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'), null, null, 34, 317);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (318, to_date('04-01-2023', 'dd-mm-yyyy'), to_date('09-06-2024', 'dd-mm-yyyy'), null, null, 34, 318);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (319, to_date('19-02-2024', 'dd-mm-yyyy'), to_date('20-02-2024', 'dd-mm-yyyy'), null, null, 34, 319);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (320, to_date('09-03-2023', 'dd-mm-yyyy'), to_date('19-11-2023', 'dd-mm-yyyy'), null, null, 34, 320);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (321, to_date('15-06-2023', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), null, null, 34, 321);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (322, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('13-01-2024', 'dd-mm-yyyy'), null, null, 34, 322);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (323, to_date('08-11-2023', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'), null, null, 34, 323);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (324, to_date('30-08-2023', 'dd-mm-yyyy'), null, null, null, 33, 324);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (325, to_date('03-09-2023', 'dd-mm-yyyy'), null, null, null, 33, 325);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (326, to_date('14-06-2023', 'dd-mm-yyyy'), null, null, null, 33, 326);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (327, to_date('25-08-2023', 'dd-mm-yyyy'), null, null, null, 33, 327);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (328, to_date('22-02-2024', 'dd-mm-yyyy'), null, null, null, 33, 328);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (329, to_date('13-12-2023', 'dd-mm-yyyy'), null, null, null, 33, 329);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (330, to_date('27-06-2023', 'dd-mm-yyyy'), null, null, null, 33, 330);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (331, to_date('10-06-2023', 'dd-mm-yyyy'), null, null, null, 33, 331);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (332, to_date('10-03-2023', 'dd-mm-yyyy'), null, null, null, 33, 332);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (333, to_date('12-01-2023', 'dd-mm-yyyy'), null, null, null, 33, 333);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (334, to_date('21-05-2024', 'dd-mm-yyyy'), null, null, null, 33, 334);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (335, to_date('03-05-2023', 'dd-mm-yyyy'), null, null, null, 33, 335);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (336, to_date('24-07-2023', 'dd-mm-yyyy'), null, null, null, 33, 336);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (337, to_date('15-05-2024', 'dd-mm-yyyy'), null, null, null, 33, 337);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (338, to_date('27-08-2023', 'dd-mm-yyyy'), null, null, null, 33, 338);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (339, to_date('20-05-2024', 'dd-mm-yyyy'), null, null, null, 33, 339);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (340, to_date('06-01-2024', 'dd-mm-yyyy'), null, null, null, 33, 340);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (341, to_date('04-12-2023', 'dd-mm-yyyy'), null, null, null, 33, 341);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (342, to_date('12-10-2023', 'dd-mm-yyyy'), null, null, null, 33, 342);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (343, to_date('28-12-2023', 'dd-mm-yyyy'), null, null, null, 33, 343);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (344, to_date('27-12-2023', 'dd-mm-yyyy'), null, null, null, 33, 344);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (345, to_date('03-08-2023', 'dd-mm-yyyy'), null, null, null, 33, 345);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (346, to_date('28-11-2023', 'dd-mm-yyyy'), null, null, null, 33, 346);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (347, to_date('10-11-2023', 'dd-mm-yyyy'), null, null, null, 33, 347);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (348, to_date('07-06-2023', 'dd-mm-yyyy'), null, null, null, 33, 348);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (350, to_date('28-05-2023', 'dd-mm-yyyy'), null, null, null, 33, 350);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (351, to_date('26-02-2024', 'dd-mm-yyyy'), null, null, null, 33, 351);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (352, to_date('09-02-2023', 'dd-mm-yyyy'), null, null, null, 33, 352);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (353, to_date('06-07-2023', 'dd-mm-yyyy'), null, null, null, 33, 353);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (354, to_date('15-09-2023', 'dd-mm-yyyy'), to_date('22-01-2024', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'), to_date('02-10-2023', 'dd-mm-yyyy'), 36, 354);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (355, to_date('28-10-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'), to_date('09-09-2023', 'dd-mm-yyyy'), 36, 355);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (356, to_date('10-02-2023', 'dd-mm-yyyy'), to_date('29-04-2023', 'dd-mm-yyyy'), to_date('30-04-2023', 'dd-mm-yyyy'), to_date('28-03-2023', 'dd-mm-yyyy'), 36, 356);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (357, to_date('16-03-2024', 'dd-mm-yyyy'), to_date('17-03-2024', 'dd-mm-yyyy'), to_date('01-04-2024', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), 36, 357);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (358, to_date('11-12-2023', 'dd-mm-yyyy'), to_date('12-12-2023', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), to_date('05-06-2024', 'dd-mm-yyyy'), 36, 358);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (359, to_date('04-02-2023', 'dd-mm-yyyy'), to_date('05-02-2023', 'dd-mm-yyyy'), to_date('12-07-2023', 'dd-mm-yyyy'), to_date('13-07-2023', 'dd-mm-yyyy'), 36, 359);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (360, to_date('16-12-2023', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'), to_date('17-04-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 36, 360);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (361, to_date('20-03-2024', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'), to_date('28-12-2023', 'dd-mm-yyyy'), to_date('19-09-2023', 'dd-mm-yyyy'), 36, 361);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (362, to_date('13-02-2024', 'dd-mm-yyyy'), to_date('14-02-2024', 'dd-mm-yyyy'), to_date('30-04-2024', 'dd-mm-yyyy'), to_date('29-05-2024', 'dd-mm-yyyy'), 36, 362);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (363, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), to_date('26-09-2023', 'dd-mm-yyyy'), to_date('10-02-2024', 'dd-mm-yyyy'), 36, 363);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (364, to_date('27-07-2023', 'dd-mm-yyyy'), to_date('28-07-2023', 'dd-mm-yyyy'), to_date('20-08-2023', 'dd-mm-yyyy'), to_date('21-08-2023', 'dd-mm-yyyy'), 36, 364);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (365, to_date('30-01-2023', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), to_date('20-08-2023', 'dd-mm-yyyy'), to_date('03-12-2023', 'dd-mm-yyyy'), 36, 365);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (366, to_date('07-01-2024', 'dd-mm-yyyy'), to_date('08-01-2024', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), 36, 366);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (367, to_date('29-05-2024', 'dd-mm-yyyy'), to_date('30-05-2024', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'), 36, 367);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (368, to_date('15-04-2024', 'dd-mm-yyyy'), to_date('22-05-2024', 'dd-mm-yyyy'), to_date('23-05-2024', 'dd-mm-yyyy'), to_date('29-05-2024', 'dd-mm-yyyy'), 36, 368);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (369, to_date('01-04-2023', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'), to_date('17-02-2023', 'dd-mm-yyyy'), 36, 369);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (370, to_date('21-04-2023', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), to_date('26-12-2023', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'), 36, 370);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (371, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('11-05-2023', 'dd-mm-yyyy'), to_date('19-09-2023', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'), 36, 371);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (372, to_date('21-09-2023', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), to_date('08-04-2024', 'dd-mm-yyyy'), to_date('03-03-2024', 'dd-mm-yyyy'), 36, 372);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (373, to_date('18-10-2023', 'dd-mm-yyyy'), to_date('19-10-2023', 'dd-mm-yyyy'), to_date('26-06-2023', 'dd-mm-yyyy'), to_date('23-10-2023', 'dd-mm-yyyy'), 36, 373);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (374, to_date('27-01-2023', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), to_date('07-05-2023', 'dd-mm-yyyy'), 36, 374);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (375, to_date('03-03-2023', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'), to_date('18-02-2024', 'dd-mm-yyyy'), to_date('15-11-2023', 'dd-mm-yyyy'), 36, 375);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (376, to_date('10-06-2024', 'dd-mm-yyyy'), to_date('11-06-2024', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'), to_date('13-06-2024', 'dd-mm-yyyy'), 36, 376);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (377, to_date('29-03-2023', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'), to_date('16-06-2023', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), 36, 377);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (378, to_date('04-06-2024', 'dd-mm-yyyy'), to_date('05-06-2024', 'dd-mm-yyyy'), to_date('06-03-2024', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), 36, 378);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (379, to_date('18-01-2023', 'dd-mm-yyyy'), to_date('21-09-2023', 'dd-mm-yyyy'), to_date('08-12-2023', 'dd-mm-yyyy'), to_date('15-04-2024', 'dd-mm-yyyy'), 36, 379);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (380, to_date('16-12-2023', 'dd-mm-yyyy'), to_date('17-12-2023', 'dd-mm-yyyy'), to_date('16-07-2023', 'dd-mm-yyyy'), to_date('17-07-2023', 'dd-mm-yyyy'), 36, 380);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (381, to_date('02-05-2024', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'), 36, 381);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (382, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('07-03-2024', 'dd-mm-yyyy'), to_date('08-03-2024', 'dd-mm-yyyy'), to_date('23-02-2024', 'dd-mm-yyyy'), 36, 382);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (384, to_date('11-12-2023', 'dd-mm-yyyy'), to_date('25-12-2023', 'dd-mm-yyyy'), to_date('25-05-2024', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), 36, 384);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (385, to_date('02-04-2024', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), to_date('11-10-2023', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'), 36, 385);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (386, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('28-01-2024', 'dd-mm-yyyy'), to_date('01-06-2024', 'dd-mm-yyyy'), to_date('02-06-2024', 'dd-mm-yyyy'), 36, 386);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (387, to_date('16-03-2023', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'), to_date('31-07-2023', 'dd-mm-yyyy'), to_date('10-05-2024', 'dd-mm-yyyy'), 36, 387);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (388, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('12-01-2024', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'), to_date('04-02-2024', 'dd-mm-yyyy'), 36, 388);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (389, to_date('26-03-2023', 'dd-mm-yyyy'), to_date('19-05-2023', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'), 36, 389);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (390, to_date('13-07-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), to_date('21-10-2023', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'), 36, 390);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (391, to_date('05-01-2023', 'dd-mm-yyyy'), to_date('18-03-2024', 'dd-mm-yyyy'), to_date('19-03-2024', 'dd-mm-yyyy'), to_date('07-09-2023', 'dd-mm-yyyy'), 36, 391);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (392, to_date('29-11-2023', 'dd-mm-yyyy'), to_date('18-02-2024', 'dd-mm-yyyy'), to_date('19-02-2024', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'), 36, 392);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (393, to_date('25-02-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), to_date('17-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 36, 393);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (394, to_date('20-06-2023', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), 36, 394);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (395, to_date('03-06-2024', 'dd-mm-yyyy'), to_date('04-06-2024', 'dd-mm-yyyy'), to_date('03-12-2023', 'dd-mm-yyyy'), to_date('04-12-2023', 'dd-mm-yyyy'), 36, 395);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (396, to_date('14-04-2024', 'dd-mm-yyyy'), to_date('15-04-2024', 'dd-mm-yyyy'), to_date('15-02-2024', 'dd-mm-yyyy'), to_date('20-03-2024', 'dd-mm-yyyy'), 36, 396);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (397, to_date('06-03-2024', 'dd-mm-yyyy'), to_date('07-03-2024', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'), to_date('10-03-2024', 'dd-mm-yyyy'), 36, 397);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (398, to_date('18-07-2023', 'dd-mm-yyyy'), to_date('12-12-2023', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), 36, 398);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (399, to_date('09-06-2024', 'dd-mm-yyyy'), to_date('10-06-2024', 'dd-mm-yyyy'), to_date('03-10-2023', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 36, 399);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (400, to_date('05-01-2023', 'dd-mm-yyyy'), to_date('19-03-2023', 'dd-mm-yyyy'), to_date('20-03-2023', 'dd-mm-yyyy'), to_date('25-07-2023', 'dd-mm-yyyy'), 36, 400);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (401, to_date('28-09-2023', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), to_date('14-04-2023', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'), 36, 401);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (402, to_date('08-02-2024', 'dd-mm-yyyy'), to_date('09-02-2024', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'), 36, 402);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (403, to_date('23-04-2024', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), to_date('15-01-2024', 'dd-mm-yyyy'), to_date('12-10-2023', 'dd-mm-yyyy'), 36, 403);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (404, to_date('15-05-2023', 'dd-mm-yyyy'), to_date('16-05-2023', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), 36, 404);
commit;
prompt 400 records committed...
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (405, to_date('02-03-2024', 'dd-mm-yyyy'), to_date('03-03-2024', 'dd-mm-yyyy'), to_date('07-02-2024', 'dd-mm-yyyy'), to_date('08-02-2024', 'dd-mm-yyyy'), 36, 405);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (406, to_date('26-08-2023', 'dd-mm-yyyy'), to_date('27-08-2023', 'dd-mm-yyyy'), to_date('20-07-2023', 'dd-mm-yyyy'), to_date('25-02-2024', 'dd-mm-yyyy'), 36, 406);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (407, to_date('23-09-2023', 'dd-mm-yyyy'), to_date('24-09-2023', 'dd-mm-yyyy'), to_date('06-12-2023', 'dd-mm-yyyy'), to_date('30-01-2024', 'dd-mm-yyyy'), 36, 407);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (408, to_date('22-03-2023', 'dd-mm-yyyy'), to_date('13-07-2023', 'dd-mm-yyyy'), to_date('30-12-2023', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'), 36, 408);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (409, to_date('13-10-2023', 'dd-mm-yyyy'), to_date('14-10-2023', 'dd-mm-yyyy'), to_date('27-07-2023', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), 36, 409);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (410, to_date('27-03-2024', 'dd-mm-yyyy'), to_date('28-03-2024', 'dd-mm-yyyy'), to_date('09-05-2024', 'dd-mm-yyyy'), to_date('04-06-2024', 'dd-mm-yyyy'), 36, 410);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (411, to_date('26-01-2023', 'dd-mm-yyyy'), to_date('02-06-2023', 'dd-mm-yyyy'), to_date('31-05-2024', 'dd-mm-yyyy'), to_date('01-06-2024', 'dd-mm-yyyy'), 36, 411);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (412, to_date('26-03-2024', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), to_date('19-11-2023', 'dd-mm-yyyy'), 36, 412);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (413, to_date('03-07-2023', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'), to_date('02-02-2024', 'dd-mm-yyyy'), to_date('03-02-2024', 'dd-mm-yyyy'), 36, 413);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (414, to_date('09-07-2023', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'), to_date('30-04-2024', 'dd-mm-yyyy'), to_date('08-08-2023', 'dd-mm-yyyy'), 36, 414);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (415, to_date('06-04-2023', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'), to_date('03-09-2023', 'dd-mm-yyyy'), to_date('04-09-2023', 'dd-mm-yyyy'), 36, 415);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (416, to_date('10-06-2024', 'dd-mm-yyyy'), to_date('11-06-2024', 'dd-mm-yyyy'), to_date('02-02-2024', 'dd-mm-yyyy'), to_date('03-02-2024', 'dd-mm-yyyy'), 36, 416);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (417, to_date('10-05-2023', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), to_date('08-04-2024', 'dd-mm-yyyy'), 36, 417);
commit;
prompt 413 records loaded
prompt Loading WORKERS...
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (1, 'Garry', 'Van Der Beek', 'garry.vanderbee', -5924432, 69, 5, 71, 0, 167.56);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (2, 'Emily', 'Gilliam', 'e.gilliam@merit', -8612522, 67, 10, 33, 0, 159.76);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (3, 'Amanda', 'Clarkson', 'amandac@datapri', -3246568, 71, 2, 46, 0, 168.31);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (4, 'Natascha', 'Unger', 'natascha.u@ipsa', -6366530, 69, 4, 99, 0, 133.64);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (5, 'Patty', 'Costa', 'patty@aoltimewa', -4264185, 71, 6, 21, 0, 52.99);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (6, 'Glen', 'Simpson', 'glen.simpson@an', -3968616, 69, 5, 42, 0, 160.8);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (7, 'Edgar', 'Gibbons', 'edgar@hfg.ca', -2437524, 71, 6, 82, 0, 101.49);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (8, 'Cary', 'Johansson', 'cary.johansson@', -4281770, 70, 4, 33, 0, 62.25);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (9, 'Roger', 'Milsap', 'roger.milsap@kr', -4364635, 70, 9, 42, 0, 179.26);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (10, 'Halle', 'Magnuson', 'halle.magnuson@', -8345416, 70, 9, 29, 0, 132.09);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (11, 'Larry', 'Branagh', 'lbranagh@alogen', -9159763, 68, 1, 54, 0, 142.31);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (12, 'Fats', 'Rodriguez', 'fatsr@navigator', -8622682, 67, 3, 34, 0, 87.6);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (13, 'Liquid', 'Giraldo', 'liquid.giraldo@', -3537337, 69, 5, 36, 0, 54.5);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (14, 'Marie', 'Mahoney', 'mariem@woronoco', -4911802, 71, 3, 79, 0, 154.43);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (15, 'Mika', 'Rain', 'mika.rain@gsat.', -9257207, 71, 6, 76, 0, 137.56);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (16, 'Graham', 'Ronstadt', 'graham.r@spas.c', -3886309, 71, 4, 11, 0, 94.06);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (17, 'Renee', 'Carrington', 'rcarrington@jew', -8278216, 69, 10, 82, 0, 124.07);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (18, 'Debby', 'Napolitano', 'd.napolitano@sa', -6781322, 67, 6, 85, 0, 112.26);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (19, 'Mika', 'Kimball', 'mika.k@commwork', -3927591, 69, 5, 50, 0, 148.74);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (20, 'Kyra', 'Jay', 'k.jay@merck.com', -1638212, 71, 2, 11, 0, 77.15);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (21, 'Victor', 'McLean', 'victorm@comglob', -5674307, 70, 1, 96, 0, 123.69);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (22, 'Larenz', 'Stowe', 'larenz.stowe@ir', -3782127, 69, 6, 81, 8700, 107.41);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (23, 'Tilda', 'Lipnicki', 'tilda.lipnicki@', -5578921, 69, 3, 14, 0, 142.49);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (24, 'Jann', 'Schiff', 'jschiff@dvdt.co', -8379665, 69, 9, 21, 0, 107.06);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (25, 'Terri', 'Krieger', 'terri.krieger@s', -6653825, 69, 3, 41, 0, 99.02);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (26, 'Vendetta', 'Horton', 'vendetta.horton', -3799239, 71, 6, 15, 0, 137.01);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (27, 'Rawlins', 'Neil', 'rawlins.neil@ye', -1133814, 69, 4, 58, 0, 85.12);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (28, 'Delroy', 'Plimpton', 'dplimpton@merck', -4467632, 69, 5, 36, 0, 92.66);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (29, 'Cathy', 'Gooding', 'cathy@kmart.ee', -9789128, 67, 10, 82, 0, 85.7);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (30, 'Barry', 'Coyote', 'barry@jewettcam', -8344739, 67, 3, 84, 0, 123.21);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (31, 'Joanna', 'Franklin', 'joanna.franklin', -9136138, 67, 9, 60, 0, 62.07);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (32, 'Bonnie', 'Vannelli', 'bonnie.vannelli', -5414460, 71, 5, 33, 0, 60.32);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (33, 'Caroline', 'Gary', 'carolineg@sfb.i', -9663595, 69, 9, 19, 0, 71.13);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (34, 'Hal', 'Warwick', 'hal@vfs.com', -5563796, 67, 2, 34, 0, 65.14);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (35, 'Trini', 'Knight', 'trini.knight@ma', -8575740, 70, 1, 88, 0, 93.25);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (36, 'Christian', 'Pony', 'christian@heart', -2182531, 70, 10, 22, 0, 159.65);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (37, 'Mekhi', 'Whitley', 'mekhi.whitley@c', -1668930, 69, 9, 27, 8700, 158.51);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (38, 'Candice', 'Astin', 'candice.astin@g', -1284119, 69, 2, 33, 0, 57.1);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (39, 'Azucar', 'Cassel', 'azucar.cassel@c', -4672535, 70, 4, 79, 0, 102.74);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (40, 'Ruth', 'Winter', 'ruth@tracertech', -9127460, 69, 10, 32, 0, 177.83);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (41, 'Rodney', 'Wilkinson', 'rodney.wilkinso', -7879067, 69, 10, 76, 0, 54.64);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (42, 'Fionnula', 'Gellar', 'fionnula.gellar', -6997319, 69, 3, 28, 0, 71.78);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (43, 'Nik', 'Idol', 'nik.idol@bowman', -4391815, 70, 9, 15, 0, 63.09);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (45, 'Thomas', 'Rydell', 'thomas@bedfordb', -1731411, 70, 9, 35, 0, 135.96);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (46, 'Judi', 'Trejo', 'judi.trejo@epiq', -5866947, 69, 10, 30, 0, 111.34);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (47, 'Rik', 'Baldwin', 'rik.baldwin@mic', -3554445, 69, 4, 46, 0, 159.25);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (49, 'Pamela', 'Leguizamo', 'pamelal@glaxosm', -8924469, 70, 1, 6, 0, 128.88);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (50, 'Debby', 'Downie', 'debby.downie@pr', -8292506, 71, 9, 34, 0, 54.6);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (51, 'Lenny', 'Venora', 'lenny.venora@vo', -5765629, 69, 5, 74, 500, 105.53);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (52, 'Casey', 'Loeb', 'casey.loeb@roya', -1521836, 69, 6, 33, 1400, 66.39);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (53, 'Brian', 'Stone', 'brian.stone@inf', -8828322, 70, 5, 36, 0, 105.99);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (54, 'Anna', 'McGovern', 'anna.mcgovern@o', -1272586, 71, 2, 76, 0, 150.94);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (55, 'Cary', 'Stuermer', 'cary@sms.be', -7636095, 69, 10, 29, 0, 70.01);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (56, 'Sinead', 'DiCaprio', 'sinead@signatur', -4375798, 71, 5, 34, 0, 86.58);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (57, 'Sean', 'Hirsch', 'sean.h@usdairyp', -4684330, 67, 10, 32, 0, 116.77);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (58, 'Johnette', 'Reiner', 'johnetter@prosp', -6643467, 69, 4, 12, 0, 73.43);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (59, 'Kirsten', 'Carlisle', 'kirsten@esteela', -1143286, 71, 9, 53, 0, 176.3);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (60, 'Martin', 'Hornsby', 'martin.hornsby@', -9746929, 67, 3, 22, 0, 88.7);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (61, 'Joaquin', 'Travolta', 'j.travolta@sbc.', -1751874, 70, 3, 22, 0, 104.01);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (62, 'Cyndi', 'Heald', 'cyndi@carteretm', -6147827, 70, 10, 91, 0, 113.56);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (63, 'Kenny', 'Begley', 'kenny.begley@ge', -9698531, 70, 10, 6, 0, 72.57);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (64, 'Loren', 'Sharp', 'loren.sharp@sfg', -8923927, 71, 1, 15, 0, 70.39);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (65, 'Bebe', 'Vince', 'bebe.v@campbell', -1211723, 71, 10, 37, 0, 147.24);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (66, 'Joe', 'Shand', 'joe.shand@evinc', -8235560, 67, 4, 30, 0, 55.56);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (67, 'Tea', 'Cruz', 'tcruz@dynacqint', -7335226, 69, 1, 13, 0, 67.25);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (69, 'Dermot', 'Brickell', 'dermot.brickell', -2853410, 70, 9, 4, 0, 161.53);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (70, 'Jeffrey', 'Pollak', 'jeffrey.pollak@', -4596671, 69, 5, 8, 0, 60.3);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (71, 'Elle', 'Cusack', 'e.cusack@scjohn', -5328424, 67, 9, 35, 0, 91.89);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (72, 'Taylor', 'Plummer', 'taylorp@ait.com', -8272101, 69, 9, 25, 0, 128.72);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (73, 'Allan', 'Wolf', 'allan.wolf@manh', -8988513, 69, 5, 54, 0, 134.04);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (74, 'Louise', 'Tempest', 'louise.tempest@', -9426388, 69, 2, 34, 0, 161.83);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (75, 'Jann', 'Heald', 'jann.heald@secu', -6128373, 70, 5, 89, 0, 172.13);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (76, 'Beth', 'Preston', 'beth.preston@sy', -5223929, 67, 6, 36, 0, 79.65);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (77, 'Keith', 'Phifer', 'keith.phifer@fm', -1947575, 67, 6, 9, 0, 168.75);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (78, 'Nancy', 'Reiner', 'nancy@ataservic', -3386522, 70, 6, 9, 0, 121.75);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (79, 'Cuba', 'Burmester', 'cburmester@seia', -1326881, 70, 9, 89, 0, 130.28);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (80, 'Larenz', 'Gaines', 'larenz.gaines@s', -7172341, 69, 3, 81, 0, 177.89);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (81, 'Gaby', 'Dooley', 'gaby@larkinente', -5465560, 69, 5, 20, 7800, 141.61);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (82, 'Chuck', 'Downey', 'c.downey@bestbu', -8532288, 71, 5, 96, 0, 140.65);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (83, 'Scarlett', 'McCabe', 'scarlett.m@mms.', -6413771, 69, 10, 59, 0, 109.06);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (84, 'Jerry', 'Pollak', 'jerry.pollak@kw', -1619766, 69, 10, 64, 0, 141.69);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (85, 'Herbie', 'Tilly', 'htilly@oneidafi', -8437140, 69, 3, 38, 0, 94.15);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (86, 'Alex', 'Oldman', 'aoldman@accesss', -5452327, 67, 4, 9, 0, 82.08);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (88, 'Boyd', 'Shatner', 'boyd.shatner@be', -2321182, 70, 1, 83, 0, 137.9);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (89, 'Cherry', 'Scott', 'cherry.scott@su', -2198214, 68, 1, 36, 0, 88.58);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (90, 'Collective', 'Uggams', 'collective.ugga', -4528189, 71, 2, 17, 0, 89.56);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (91, 'Anthony', 'Minogue', 'anthony.m@healt', -8563587, 67, 4, 14, 0, 68.34);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (92, 'Adina', 'England', 'a.england@invis', -3852131, 71, 5, 10, 0, 82.51);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (93, 'Don', 'Winstone', 'don.winstone@ca', -4174197, 70, 1, 8, 0, 120.66);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (94, 'Vickie', 'Dillon', 'vickie.dillon@l', -1429674, 69, 4, 94, 0, 125.31);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (95, 'Robby', 'Arden', 'r.arden@sourceg', -6886384, 69, 3, 33, 0, 68.22);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (96, 'Arturo', 'McDowall', 'a.mcdowall@newt', -5581105, 70, 10, 57, 0, 151.88);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (97, 'Cole', 'Peniston', 'cole.peniston@b', -9238483, 70, 9, 2, 0, 77.34);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (98, 'Naomi', 'Wilson', 'naomi.wilson@ci', -5428457, 69, 10, 22, 0, 80.34);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (99, 'Elizabeth', 'Chandler', 'elizabeth@cookt', -8292245, 71, 1, 85, 0, 128);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum, bonus, workhours)
values (100, 'Brendan', 'Judd', 'brendan.judd@aq', -1221144, 70, 3, 41, 0, 117.49);
commit;
prompt 96 records loaded
prompt Enabling foreign key constraints for APPOINTMENTS...
alter table APPOINTMENTS enable constraint SYS_C007491;
prompt Enabling foreign key constraints for PACKAGES...
alter table PACKAGES enable constraint SYS_C007514;
alter table PACKAGES enable constraint SYS_C007515;
prompt Enabling foreign key constraints for TRACKINGSHIPMENTS...
alter table TRACKINGSHIPMENTS enable constraint SYS_C007522;
alter table TRACKINGSHIPMENTS enable constraint SYS_C007523;
prompt Enabling foreign key constraints for WORKERS...
alter table WORKERS enable constraint SYS_C007530;
alter table WORKERS enable constraint SYS_C007531;
prompt Enabling triggers for COSTUMER...
alter table COSTUMER enable all triggers;
prompt Enabling triggers for APPOINTMENTS...
alter table APPOINTMENTS enable all triggers;
prompt Enabling triggers for CITY...
alter table CITY enable all triggers;
prompt Enabling triggers for CREDIT_RESULTS_TEMP...
alter table CREDIT_RESULTS_TEMP enable all triggers;
prompt Enabling triggers for JOB...
alter table JOB enable all triggers;
prompt Enabling triggers for ORDERSTATUS...
alter table ORDERSTATUS enable all triggers;
prompt Enabling triggers for STREET...
alter table STREET enable all triggers;
prompt Enabling triggers for PACKAGES...
alter table PACKAGES enable all triggers;
prompt Enabling triggers for TRACKINGSHIPMENTS...
alter table TRACKINGSHIPMENTS enable all triggers;
prompt Enabling triggers for WORKERS...
alter table WORKERS enable all triggers;
set feedback on
set define on
prompt Done.
