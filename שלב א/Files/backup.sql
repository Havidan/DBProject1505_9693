prompt PL/SQL Developer import file
prompt Created on יום שני 27 מאי 2024 by This_user
set feedback off
set define off
prompt Creating COSTUMER...
create table COSTUMER
(
  id_sender NUMBER(3) not null,
  email     VARCHAR2(15),
  phone     NUMBER(10) not null
)
;
alter table COSTUMER
  add primary key (ID_SENDER);

prompt Creating APPOINTMENTS...
create table APPOINTMENTS
(
  app_date  DATE not null,
  appid     NUMBER(3) not null,
  lengthapp NUMBER(2) not null,
  id_sender NUMBER(3) not null,
  wid       NUMBER(3) not null
)
;
alter table APPOINTMENTS
  add primary key (APPID);
alter table APPOINTMENTS
  add foreign key (ID_SENDER)
  references COSTUMER (ID_SENDER);
grant select, insert, update, delete, references, alter, index on APPOINTMENTS to HAVIDAN;

prompt Creating CITY...
create table CITY
(
  cityname VARCHAR2(15) not null,
  citynum  NUMBER(3) not null
)
;
alter table CITY
  add primary key (CITYNUM);

prompt Creating JOB...
create table JOB
(
  jobnum        NUMBER(2) not null,
  jobname       VARCHAR2(15) not null,
  salaryperhour FLOAT not null
)
;
alter table JOB
  add primary key (JOBNUM);

prompt Creating ORDERSTATUS...
create table ORDERSTATUS
(
  statusnum   NUMBER(3) not null,
  statusname  VARCHAR2(15) not null,
  chronoorder NUMBER(1) not null
)
;
alter table ORDERSTATUS
  add primary key (STATUSNUM);

prompt Creating STREET...
create table STREET
(
  streetnum  NUMBER(3) not null,
  streetname VARCHAR2(15) not null
)
;
alter table STREET
  add primary key (STREETNUM);

prompt Creating PACKAGES...
create table PACKAGES
(
  idpackege      NUMBER(3) not null,
  deliveryphone  NUMBER(10) not null,
  recipientname  VARCHAR2(15),
  weight         FLOAT,
  packsize       FLOAT,
  price          FLOAT,
  buildingnumber NUMBER(2) not null,
  housenumber    NUMBER(2),
  id_sender      NUMBER(3) not null,
  wid            NUMBER(3) not null,
  streetnum      NUMBER(3) not null
)
;
alter table PACKAGES
  add primary key (IDPACKEGE);
alter table PACKAGES
  add foreign key (ID_SENDER)
  references COSTUMER (ID_SENDER);
alter table PACKAGES
  add foreign key (STREETNUM)
  references STREET (STREETNUM);

prompt Creating TRACKINGSHIPMENTS...
create table TRACKINGSHIPMENTS
(
  idtracship   NUMBER(3) not null,
  orderdate    DATE not null,
  sortdate     DATE,
  sendingdate  DATE,
  deliverydate DATE,
  statusnum    NUMBER(3) not null,
  idpackege    NUMBER(3) not null
)
;
alter table TRACKINGSHIPMENTS
  add primary key (IDTRACSHIP);
alter table TRACKINGSHIPMENTS
  add foreign key (STATUSNUM)
  references ORDERSTATUS (STATUSNUM);
alter table TRACKINGSHIPMENTS
  add foreign key (IDPACKEGE)
  references PACKAGES (IDPACKEGE);

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
  streetnum NUMBER(3)
)
;
alter table WORKERS
  add primary key (WID);
alter table WORKERS
  add foreign key (JOBNUM)
  references JOB (JOBNUM);
alter table WORKERS
  add foreign key (STREETNUM)
  references STREET (STREETNUM);

prompt Disabling triggers for COSTUMER...
alter table COSTUMER disable all triggers;
prompt Disabling triggers for APPOINTMENTS...
alter table APPOINTMENTS disable all triggers;
prompt Disabling triggers for CITY...
alter table CITY disable all triggers;
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
alter table APPOINTMENTS disable constraint SYS_C007142;
prompt Disabling foreign key constraints for PACKAGES...
alter table PACKAGES disable constraint SYS_C007151;
alter table PACKAGES disable constraint SYS_C007153;
prompt Disabling foreign key constraints for TRACKINGSHIPMENTS...
alter table TRACKINGSHIPMENTS disable constraint SYS_C007159;
alter table TRACKINGSHIPMENTS disable constraint SYS_C007160;
prompt Disabling foreign key constraints for WORKERS...
alter table WORKERS disable constraint SYS_C007178;
alter table WORKERS disable constraint SYS_C007180;
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
values (to_date('10-03-2023', 'dd-mm-yyyy'), 1, 5, 835, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-03-2023', 'dd-mm-yyyy'), 2, 5, 732, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-04-2023', 'dd-mm-yyyy'), 3, 15, 930, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 4, 15, 924, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-05-2023', 'dd-mm-yyyy'), 5, 10, 145, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-02-2024', 'dd-mm-yyyy'), 6, 10, 842, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-04-2024', 'dd-mm-yyyy'), 7, 15, 927, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-03-2024', 'dd-mm-yyyy'), 8, 5, 974, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-01-2024', 'dd-mm-yyyy'), 9, 15, 372, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-11-2023', 'dd-mm-yyyy'), 10, 5, 863, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-07-2023', 'dd-mm-yyyy'), 11, 10, 950, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-06-2023', 'dd-mm-yyyy'), 12, 15, 903, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-08-2023', 'dd-mm-yyyy'), 13, 10, 351, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-02-2023', 'dd-mm-yyyy'), 14, 5, 699, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-06-2023', 'dd-mm-yyyy'), 15, 15, 854, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-12-2023', 'dd-mm-yyyy'), 16, 5, 982, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-05-2023', 'dd-mm-yyyy'), 17, 5, 295, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-03-2023', 'dd-mm-yyyy'), 18, 15, 95, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 19, 10, 566, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-01-2024', 'dd-mm-yyyy'), 20, 5, 36, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-04-2024', 'dd-mm-yyyy'), 21, 10, 703, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-03-2024', 'dd-mm-yyyy'), 22, 10, 67, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-04-2023', 'dd-mm-yyyy'), 23, 5, 520, 74);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2024', 'dd-mm-yyyy'), 24, 5, 882, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-05-2024', 'dd-mm-yyyy'), 25, 10, 807, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-11-2023', 'dd-mm-yyyy'), 26, 15, 343, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-04-2024', 'dd-mm-yyyy'), 27, 15, 99, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-09-2023', 'dd-mm-yyyy'), 28, 15, 770, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-01-2024', 'dd-mm-yyyy'), 29, 5, 998, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-02-2024', 'dd-mm-yyyy'), 30, 5, 803, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-01-2024', 'dd-mm-yyyy'), 31, 15, 68, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-02-2023', 'dd-mm-yyyy'), 32, 10, 818, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 33, 10, 275, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-04-2024', 'dd-mm-yyyy'), 34, 10, 912, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-05-2023', 'dd-mm-yyyy'), 35, 10, 14, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-05-2024', 'dd-mm-yyyy'), 36, 5, 449, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-03-2023', 'dd-mm-yyyy'), 37, 10, 672, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-09-2023', 'dd-mm-yyyy'), 38, 5, 161, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-05-2024', 'dd-mm-yyyy'), 39, 5, 781, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-04-2024', 'dd-mm-yyyy'), 40, 15, 827, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-12-2023', 'dd-mm-yyyy'), 41, 10, 705, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-01-2023', 'dd-mm-yyyy'), 42, 10, 500, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-11-2023', 'dd-mm-yyyy'), 43, 5, 913, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-05-2024', 'dd-mm-yyyy'), 44, 15, 302, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-11-2023', 'dd-mm-yyyy'), 45, 10, 802, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-01-2024', 'dd-mm-yyyy'), 46, 5, 781, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-12-2023', 'dd-mm-yyyy'), 47, 15, 86, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-01-2024', 'dd-mm-yyyy'), 48, 10, 836, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-04-2023', 'dd-mm-yyyy'), 49, 15, 745, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-02-2024', 'dd-mm-yyyy'), 50, 10, 193, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-04-2024', 'dd-mm-yyyy'), 51, 5, 544, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-04-2024', 'dd-mm-yyyy'), 52, 15, 451, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-01-2023', 'dd-mm-yyyy'), 53, 15, 106, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-03-2023', 'dd-mm-yyyy'), 54, 10, 696, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-08-2023', 'dd-mm-yyyy'), 55, 10, 546, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-09-2023', 'dd-mm-yyyy'), 56, 15, 661, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-01-2023', 'dd-mm-yyyy'), 57, 5, 682, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-05-2023', 'dd-mm-yyyy'), 58, 10, 467, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-02-2024', 'dd-mm-yyyy'), 59, 15, 792, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-12-2023', 'dd-mm-yyyy'), 60, 5, 910, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-08-2023', 'dd-mm-yyyy'), 61, 10, 940, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-07-2023', 'dd-mm-yyyy'), 62, 15, 328, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-11-2023', 'dd-mm-yyyy'), 63, 10, 868, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-11-2023', 'dd-mm-yyyy'), 64, 15, 12, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-10-2023', 'dd-mm-yyyy'), 65, 15, 446, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-06-2023', 'dd-mm-yyyy'), 66, 15, 191, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-01-2024', 'dd-mm-yyyy'), 67, 5, 682, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-11-2023', 'dd-mm-yyyy'), 68, 5, 582, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-02-2023', 'dd-mm-yyyy'), 69, 5, 306, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-05-2023', 'dd-mm-yyyy'), 70, 10, 491, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-04-2023', 'dd-mm-yyyy'), 71, 5, 899, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 72, 15, 484, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-11-2023', 'dd-mm-yyyy'), 73, 5, 604, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-05-2024', 'dd-mm-yyyy'), 74, 10, 624, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-05-2024', 'dd-mm-yyyy'), 75, 10, 382, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-01-2024', 'dd-mm-yyyy'), 76, 15, 260, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-12-2023', 'dd-mm-yyyy'), 77, 15, 841, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-09-2023', 'dd-mm-yyyy'), 78, 5, 388, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-02-2023', 'dd-mm-yyyy'), 79, 10, 626, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-05-2024', 'dd-mm-yyyy'), 80, 15, 569, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-01-2023', 'dd-mm-yyyy'), 81, 15, 368, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-04-2023', 'dd-mm-yyyy'), 82, 10, 415, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-08-2023', 'dd-mm-yyyy'), 83, 5, 199, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-07-2023', 'dd-mm-yyyy'), 84, 5, 629, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-02-2023', 'dd-mm-yyyy'), 85, 10, 827, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-02-2024', 'dd-mm-yyyy'), 86, 5, 614, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-03-2024', 'dd-mm-yyyy'), 87, 10, 177, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-10-2023', 'dd-mm-yyyy'), 88, 5, 647, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-03-2023', 'dd-mm-yyyy'), 89, 5, 587, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-01-2023', 'dd-mm-yyyy'), 90, 5, 604, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-04-2024', 'dd-mm-yyyy'), 91, 5, 581, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-11-2023', 'dd-mm-yyyy'), 92, 5, 264, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-06-2023', 'dd-mm-yyyy'), 93, 15, 184, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-05-2024', 'dd-mm-yyyy'), 94, 15, 155, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2024', 'dd-mm-yyyy'), 95, 10, 818, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-05-2023', 'dd-mm-yyyy'), 96, 15, 986, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-07-2023', 'dd-mm-yyyy'), 97, 5, 753, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-09-2023', 'dd-mm-yyyy'), 98, 5, 622, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-04-2024', 'dd-mm-yyyy'), 99, 15, 117, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-02-2024', 'dd-mm-yyyy'), 100, 15, 629, 78);
commit;
prompt 100 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-03-2024', 'dd-mm-yyyy'), 101, 10, 473, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-02-2024', 'dd-mm-yyyy'), 102, 5, 386, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-08-2023', 'dd-mm-yyyy'), 103, 5, 962, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-01-2023', 'dd-mm-yyyy'), 104, 15, 749, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-11-2023', 'dd-mm-yyyy'), 105, 5, 998, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-12-2023', 'dd-mm-yyyy'), 106, 5, 290, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 107, 5, 536, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-01-2023', 'dd-mm-yyyy'), 108, 15, 84, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-06-2023', 'dd-mm-yyyy'), 109, 15, 897, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-01-2023', 'dd-mm-yyyy'), 110, 15, 74, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-06-2023', 'dd-mm-yyyy'), 111, 15, 156, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-06-2023', 'dd-mm-yyyy'), 112, 10, 987, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-03-2024', 'dd-mm-yyyy'), 113, 15, 94, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-10-2023', 'dd-mm-yyyy'), 114, 15, 818, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-07-2023', 'dd-mm-yyyy'), 115, 15, 709, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-12-2023', 'dd-mm-yyyy'), 116, 5, 872, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-12-2023', 'dd-mm-yyyy'), 117, 5, 298, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-10-2023', 'dd-mm-yyyy'), 118, 5, 376, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 119, 5, 92, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-03-2023', 'dd-mm-yyyy'), 120, 10, 643, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-07-2023', 'dd-mm-yyyy'), 121, 10, 452, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-05-2023', 'dd-mm-yyyy'), 122, 10, 811, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-12-2023', 'dd-mm-yyyy'), 123, 5, 645, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-03-2024', 'dd-mm-yyyy'), 124, 5, 134, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-01-2023', 'dd-mm-yyyy'), 125, 5, 160, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2023', 'dd-mm-yyyy'), 126, 15, 838, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-11-2023', 'dd-mm-yyyy'), 127, 5, 598, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-02-2023', 'dd-mm-yyyy'), 128, 10, 548, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-02-2024', 'dd-mm-yyyy'), 129, 5, 129, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-02-2024', 'dd-mm-yyyy'), 130, 10, 261, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-04-2023', 'dd-mm-yyyy'), 131, 5, 497, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-02-2023', 'dd-mm-yyyy'), 132, 15, 895, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-05-2024', 'dd-mm-yyyy'), 133, 10, 605, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-02-2024', 'dd-mm-yyyy'), 134, 5, 402, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-12-2023', 'dd-mm-yyyy'), 135, 10, 649, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-02-2023', 'dd-mm-yyyy'), 136, 15, 428, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-04-2024', 'dd-mm-yyyy'), 137, 15, 816, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-07-2023', 'dd-mm-yyyy'), 138, 10, 551, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-05-2023', 'dd-mm-yyyy'), 139, 10, 556, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-06-2023', 'dd-mm-yyyy'), 140, 15, 77, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-02-2023', 'dd-mm-yyyy'), 141, 5, 400, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-04-2023', 'dd-mm-yyyy'), 142, 15, 394, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-07-2023', 'dd-mm-yyyy'), 143, 5, 355, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-02-2024', 'dd-mm-yyyy'), 144, 5, 894, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-03-2024', 'dd-mm-yyyy'), 145, 15, 850, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-03-2023', 'dd-mm-yyyy'), 146, 10, 456, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-02-2023', 'dd-mm-yyyy'), 147, 5, 254, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-05-2023', 'dd-mm-yyyy'), 148, 15, 487, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-08-2023', 'dd-mm-yyyy'), 149, 5, 948, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-05-2023', 'dd-mm-yyyy'), 150, 5, 535, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-08-2023', 'dd-mm-yyyy'), 151, 15, 969, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 152, 15, 454, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-05-2024', 'dd-mm-yyyy'), 153, 5, 207, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-02-2023', 'dd-mm-yyyy'), 154, 10, 141, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-07-2023', 'dd-mm-yyyy'), 155, 5, 165, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-04-2024', 'dd-mm-yyyy'), 156, 10, 826, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-05-2023', 'dd-mm-yyyy'), 157, 10, 298, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-05-2024', 'dd-mm-yyyy'), 158, 10, 934, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-08-2023', 'dd-mm-yyyy'), 159, 10, 886, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-05-2024', 'dd-mm-yyyy'), 160, 15, 502, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-04-2024', 'dd-mm-yyyy'), 161, 10, 500, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-08-2023', 'dd-mm-yyyy'), 162, 15, 162, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-04-2024', 'dd-mm-yyyy'), 163, 15, 3, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-03-2024', 'dd-mm-yyyy'), 164, 10, 685, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-02-2023', 'dd-mm-yyyy'), 165, 15, 132, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-02-2023', 'dd-mm-yyyy'), 166, 15, 94, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-11-2023', 'dd-mm-yyyy'), 167, 15, 639, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-04-2023', 'dd-mm-yyyy'), 168, 15, 323, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-10-2023', 'dd-mm-yyyy'), 169, 5, 988, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-07-2023', 'dd-mm-yyyy'), 170, 10, 463, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-01-2023', 'dd-mm-yyyy'), 171, 10, 620, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-04-2023', 'dd-mm-yyyy'), 172, 15, 545, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-11-2023', 'dd-mm-yyyy'), 173, 5, 780, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-12-2023', 'dd-mm-yyyy'), 174, 5, 903, 74);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-01-2023', 'dd-mm-yyyy'), 175, 15, 902, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-07-2023', 'dd-mm-yyyy'), 176, 10, 96, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-02-2023', 'dd-mm-yyyy'), 177, 5, 569, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-03-2023', 'dd-mm-yyyy'), 178, 15, 383, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-04-2024', 'dd-mm-yyyy'), 179, 15, 15, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-11-2023', 'dd-mm-yyyy'), 180, 5, 777, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-01-2023', 'dd-mm-yyyy'), 181, 15, 209, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-11-2023', 'dd-mm-yyyy'), 182, 15, 646, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-08-2023', 'dd-mm-yyyy'), 183, 15, 492, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-02-2024', 'dd-mm-yyyy'), 184, 5, 885, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-04-2024', 'dd-mm-yyyy'), 185, 10, 779, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-02-2024', 'dd-mm-yyyy'), 186, 10, 649, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-09-2023', 'dd-mm-yyyy'), 187, 5, 320, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-04-2023', 'dd-mm-yyyy'), 188, 15, 645, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-10-2023', 'dd-mm-yyyy'), 189, 5, 27, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-03-2024', 'dd-mm-yyyy'), 190, 10, 995, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 191, 5, 364, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-01-2023', 'dd-mm-yyyy'), 192, 10, 651, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-02-2024', 'dd-mm-yyyy'), 193, 10, 798, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-11-2023', 'dd-mm-yyyy'), 194, 10, 379, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-09-2023', 'dd-mm-yyyy'), 195, 5, 812, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-11-2023', 'dd-mm-yyyy'), 196, 5, 303, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-01-2024', 'dd-mm-yyyy'), 197, 5, 482, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-07-2023', 'dd-mm-yyyy'), 198, 5, 15, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-05-2023', 'dd-mm-yyyy'), 199, 10, 613, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-05-2023', 'dd-mm-yyyy'), 200, 15, 242, 59);
commit;
prompt 200 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-11-2023', 'dd-mm-yyyy'), 201, 10, 445, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-04-2024', 'dd-mm-yyyy'), 202, 15, 81, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-06-2023', 'dd-mm-yyyy'), 203, 15, 910, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-02-2023', 'dd-mm-yyyy'), 204, 10, 791, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-10-2023', 'dd-mm-yyyy'), 205, 10, 466, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-04-2023', 'dd-mm-yyyy'), 206, 5, 156, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-03-2023', 'dd-mm-yyyy'), 207, 5, 479, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-03-2023', 'dd-mm-yyyy'), 208, 10, 395, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-12-2023', 'dd-mm-yyyy'), 209, 5, 179, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-02-2024', 'dd-mm-yyyy'), 210, 10, 654, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-05-2023', 'dd-mm-yyyy'), 211, 5, 170, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 212, 5, 49, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-01-2023', 'dd-mm-yyyy'), 213, 10, 507, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-06-2023', 'dd-mm-yyyy'), 214, 15, 266, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-05-2024', 'dd-mm-yyyy'), 215, 15, 338, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-03-2024', 'dd-mm-yyyy'), 216, 10, 741, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-08-2023', 'dd-mm-yyyy'), 217, 10, 101, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-11-2023', 'dd-mm-yyyy'), 218, 10, 390, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-06-2023', 'dd-mm-yyyy'), 219, 5, 289, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-05-2023', 'dd-mm-yyyy'), 220, 10, 896, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-09-2023', 'dd-mm-yyyy'), 221, 15, 776, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 222, 5, 578, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-05-2023', 'dd-mm-yyyy'), 223, 15, 709, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-04-2023', 'dd-mm-yyyy'), 224, 5, 802, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-11-2023', 'dd-mm-yyyy'), 225, 15, 952, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-11-2023', 'dd-mm-yyyy'), 226, 15, 967, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-04-2023', 'dd-mm-yyyy'), 227, 10, 108, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-05-2024', 'dd-mm-yyyy'), 228, 10, 53, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-12-2023', 'dd-mm-yyyy'), 229, 10, 87, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-08-2023', 'dd-mm-yyyy'), 230, 10, 719, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-08-2023', 'dd-mm-yyyy'), 231, 5, 251, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-06-2023', 'dd-mm-yyyy'), 232, 5, 986, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-06-2023', 'dd-mm-yyyy'), 233, 15, 115, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-03-2023', 'dd-mm-yyyy'), 234, 5, 458, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-09-2023', 'dd-mm-yyyy'), 235, 15, 604, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-09-2023', 'dd-mm-yyyy'), 236, 5, 123, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 237, 5, 887, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-10-2023', 'dd-mm-yyyy'), 238, 15, 707, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-12-2023', 'dd-mm-yyyy'), 239, 15, 763, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-05-2024', 'dd-mm-yyyy'), 240, 15, 598, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-01-2024', 'dd-mm-yyyy'), 241, 5, 610, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 242, 5, 325, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-09-2023', 'dd-mm-yyyy'), 243, 5, 898, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-11-2023', 'dd-mm-yyyy'), 244, 15, 604, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-01-2023', 'dd-mm-yyyy'), 245, 5, 274, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-03-2023', 'dd-mm-yyyy'), 246, 5, 946, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2024', 'dd-mm-yyyy'), 247, 5, 187, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-08-2023', 'dd-mm-yyyy'), 248, 10, 827, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-10-2023', 'dd-mm-yyyy'), 249, 5, 101, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-03-2024', 'dd-mm-yyyy'), 250, 5, 418, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-05-2023', 'dd-mm-yyyy'), 251, 15, 253, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-11-2023', 'dd-mm-yyyy'), 252, 15, 883, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-02-2024', 'dd-mm-yyyy'), 253, 15, 977, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-05-2023', 'dd-mm-yyyy'), 254, 5, 236, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-03-2024', 'dd-mm-yyyy'), 255, 10, 602, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-09-2023', 'dd-mm-yyyy'), 256, 5, 758, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-09-2023', 'dd-mm-yyyy'), 257, 5, 892, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-12-2023', 'dd-mm-yyyy'), 258, 15, 982, 75);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-10-2023', 'dd-mm-yyyy'), 259, 5, 67, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-05-2023', 'dd-mm-yyyy'), 260, 5, 240, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-08-2023', 'dd-mm-yyyy'), 261, 15, 373, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 262, 5, 764, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2024', 'dd-mm-yyyy'), 263, 5, 231, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-07-2023', 'dd-mm-yyyy'), 264, 15, 364, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-12-2023', 'dd-mm-yyyy'), 265, 5, 927, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-07-2023', 'dd-mm-yyyy'), 266, 15, 651, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-01-2023', 'dd-mm-yyyy'), 267, 10, 881, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-04-2024', 'dd-mm-yyyy'), 268, 15, 842, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-01-2023', 'dd-mm-yyyy'), 269, 5, 475, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-08-2023', 'dd-mm-yyyy'), 270, 15, 111, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-08-2023', 'dd-mm-yyyy'), 271, 15, 436, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-04-2024', 'dd-mm-yyyy'), 272, 15, 508, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-08-2023', 'dd-mm-yyyy'), 273, 5, 791, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2023', 'dd-mm-yyyy'), 274, 5, 448, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-05-2024', 'dd-mm-yyyy'), 275, 15, 382, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-05-2023', 'dd-mm-yyyy'), 276, 15, 749, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-12-2023', 'dd-mm-yyyy'), 277, 15, 938, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-02-2024', 'dd-mm-yyyy'), 278, 15, 244, 75);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-05-2023', 'dd-mm-yyyy'), 279, 10, 718, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-08-2023', 'dd-mm-yyyy'), 280, 15, 946, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-08-2023', 'dd-mm-yyyy'), 281, 10, 709, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-11-2023', 'dd-mm-yyyy'), 282, 5, 788, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-11-2023', 'dd-mm-yyyy'), 283, 5, 390, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-01-2024', 'dd-mm-yyyy'), 284, 15, 911, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-01-2023', 'dd-mm-yyyy'), 285, 10, 60, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-04-2023', 'dd-mm-yyyy'), 286, 5, 524, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-04-2023', 'dd-mm-yyyy'), 287, 5, 723, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-03-2024', 'dd-mm-yyyy'), 288, 15, 324, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-09-2023', 'dd-mm-yyyy'), 289, 5, 547, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-01-2023', 'dd-mm-yyyy'), 290, 15, 478, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-01-2024', 'dd-mm-yyyy'), 291, 10, 868, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-03-2023', 'dd-mm-yyyy'), 292, 5, 170, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-12-2023', 'dd-mm-yyyy'), 293, 5, 773, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-01-2024', 'dd-mm-yyyy'), 294, 5, 703, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-01-2024', 'dd-mm-yyyy'), 295, 10, 234, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-07-2023', 'dd-mm-yyyy'), 296, 15, 177, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-03-2024', 'dd-mm-yyyy'), 297, 5, 813, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-02-2024', 'dd-mm-yyyy'), 298, 10, 713, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-03-2023', 'dd-mm-yyyy'), 299, 10, 923, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-02-2024', 'dd-mm-yyyy'), 300, 15, 255, 2);
commit;
prompt 300 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-02-2024', 'dd-mm-yyyy'), 301, 10, 658, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-12-2023', 'dd-mm-yyyy'), 302, 10, 921, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-05-2023', 'dd-mm-yyyy'), 303, 10, 176, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-05-2024', 'dd-mm-yyyy'), 304, 5, 931, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-03-2024', 'dd-mm-yyyy'), 305, 10, 653, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 306, 10, 80, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-02-2023', 'dd-mm-yyyy'), 307, 10, 799, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-12-2023', 'dd-mm-yyyy'), 308, 15, 789, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-11-2023', 'dd-mm-yyyy'), 309, 10, 931, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-02-2023', 'dd-mm-yyyy'), 310, 10, 712, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-01-2024', 'dd-mm-yyyy'), 311, 5, 613, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2024', 'dd-mm-yyyy'), 312, 15, 904, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-04-2023', 'dd-mm-yyyy'), 313, 15, 855, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-06-2023', 'dd-mm-yyyy'), 314, 15, 556, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-02-2024', 'dd-mm-yyyy'), 315, 15, 880, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-02-2023', 'dd-mm-yyyy'), 316, 5, 285, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-01-2024', 'dd-mm-yyyy'), 317, 10, 451, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-06-2023', 'dd-mm-yyyy'), 318, 10, 997, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-01-2023', 'dd-mm-yyyy'), 319, 10, 752, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-06-2023', 'dd-mm-yyyy'), 320, 15, 306, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-03-2024', 'dd-mm-yyyy'), 321, 10, 848, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-04-2024', 'dd-mm-yyyy'), 322, 5, 510, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-06-2023', 'dd-mm-yyyy'), 323, 15, 695, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-05-2024', 'dd-mm-yyyy'), 324, 5, 146, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-01-2023', 'dd-mm-yyyy'), 325, 10, 716, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 326, 10, 91, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-12-2023', 'dd-mm-yyyy'), 327, 15, 939, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-07-2023', 'dd-mm-yyyy'), 328, 10, 232, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-05-2024', 'dd-mm-yyyy'), 329, 15, 701, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-01-2024', 'dd-mm-yyyy'), 330, 10, 699, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-05-2023', 'dd-mm-yyyy'), 331, 5, 908, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 332, 5, 665, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-08-2023', 'dd-mm-yyyy'), 333, 15, 866, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-03-2024', 'dd-mm-yyyy'), 334, 5, 695, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-02-2023', 'dd-mm-yyyy'), 335, 10, 662, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-02-2023', 'dd-mm-yyyy'), 336, 5, 672, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-02-2023', 'dd-mm-yyyy'), 337, 10, 125, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2023', 'dd-mm-yyyy'), 338, 15, 275, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-03-2023', 'dd-mm-yyyy'), 339, 10, 330, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-06-2023', 'dd-mm-yyyy'), 340, 15, 29, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-09-2023', 'dd-mm-yyyy'), 341, 10, 681, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-01-2024', 'dd-mm-yyyy'), 342, 5, 907, 87);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-06-2023', 'dd-mm-yyyy'), 343, 5, 549, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-04-2024', 'dd-mm-yyyy'), 344, 15, 507, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-05-2024', 'dd-mm-yyyy'), 345, 5, 468, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-02-2023', 'dd-mm-yyyy'), 346, 10, 775, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-04-2023', 'dd-mm-yyyy'), 347, 15, 905, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-03-2023', 'dd-mm-yyyy'), 348, 5, 309, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-12-2023', 'dd-mm-yyyy'), 349, 15, 582, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 350, 15, 211, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-05-2023', 'dd-mm-yyyy'), 351, 15, 367, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-03-2024', 'dd-mm-yyyy'), 352, 5, 506, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-10-2023', 'dd-mm-yyyy'), 353, 10, 723, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-10-2023', 'dd-mm-yyyy'), 354, 10, 132, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-09-2023', 'dd-mm-yyyy'), 355, 10, 725, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-05-2023', 'dd-mm-yyyy'), 356, 10, 474, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-01-2023', 'dd-mm-yyyy'), 357, 5, 631, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-04-2024', 'dd-mm-yyyy'), 358, 5, 481, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-10-2023', 'dd-mm-yyyy'), 359, 10, 27, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2023', 'dd-mm-yyyy'), 360, 15, 332, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-03-2023', 'dd-mm-yyyy'), 361, 10, 522, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-07-2023', 'dd-mm-yyyy'), 362, 5, 665, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-01-2024', 'dd-mm-yyyy'), 363, 15, 18, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-02-2023', 'dd-mm-yyyy'), 364, 10, 379, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-10-2023', 'dd-mm-yyyy'), 365, 5, 529, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-03-2024', 'dd-mm-yyyy'), 366, 5, 986, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-12-2023', 'dd-mm-yyyy'), 367, 10, 576, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-05-2023', 'dd-mm-yyyy'), 368, 10, 534, 75);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-06-2023', 'dd-mm-yyyy'), 369, 10, 136, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-01-2023', 'dd-mm-yyyy'), 370, 10, 87, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-10-2023', 'dd-mm-yyyy'), 371, 10, 154, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-12-2023', 'dd-mm-yyyy'), 372, 10, 771, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-02-2024', 'dd-mm-yyyy'), 373, 10, 618, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-08-2023', 'dd-mm-yyyy'), 374, 15, 383, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-02-2024', 'dd-mm-yyyy'), 375, 10, 207, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-06-2023', 'dd-mm-yyyy'), 376, 5, 556, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-02-2024', 'dd-mm-yyyy'), 377, 10, 479, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-03-2023', 'dd-mm-yyyy'), 378, 10, 500, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-04-2023', 'dd-mm-yyyy'), 379, 15, 643, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-09-2023', 'dd-mm-yyyy'), 380, 10, 288, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-07-2023', 'dd-mm-yyyy'), 381, 5, 883, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-05-2024', 'dd-mm-yyyy'), 382, 15, 717, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-01-2024', 'dd-mm-yyyy'), 383, 5, 250, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-08-2023', 'dd-mm-yyyy'), 384, 5, 731, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-01-2024', 'dd-mm-yyyy'), 385, 10, 104, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-05-2023', 'dd-mm-yyyy'), 386, 15, 398, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-01-2024', 'dd-mm-yyyy'), 387, 10, 138, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-10-2023', 'dd-mm-yyyy'), 388, 15, 458, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-06-2023', 'dd-mm-yyyy'), 389, 5, 947, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-03-2024', 'dd-mm-yyyy'), 390, 10, 430, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-07-2023', 'dd-mm-yyyy'), 391, 10, 176, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-04-2023', 'dd-mm-yyyy'), 392, 5, 282, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-09-2023', 'dd-mm-yyyy'), 393, 15, 205, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 394, 15, 663, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-01-2023', 'dd-mm-yyyy'), 395, 10, 429, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 396, 5, 699, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-01-2024', 'dd-mm-yyyy'), 397, 15, 76, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-07-2023', 'dd-mm-yyyy'), 398, 5, 349, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-01-2023', 'dd-mm-yyyy'), 399, 10, 597, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-10-2023', 'dd-mm-yyyy'), 400, 5, 323, 83);
commit;
prompt 400 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-10-2023', 'dd-mm-yyyy'), 401, 5, 617, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-05-2024', 'dd-mm-yyyy'), 402, 15, 571, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-12-2023', 'dd-mm-yyyy'), 403, 5, 450, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-05-2023', 'dd-mm-yyyy'), 404, 5, 323, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-05-2023', 'dd-mm-yyyy'), 405, 5, 173, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2024', 'dd-mm-yyyy'), 406, 5, 693, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-01-2023', 'dd-mm-yyyy'), 407, 10, 267, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-04-2023', 'dd-mm-yyyy'), 408, 15, 859, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-04-2024', 'dd-mm-yyyy'), 409, 5, 815, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-02-2024', 'dd-mm-yyyy'), 410, 10, 786, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-02-2023', 'dd-mm-yyyy'), 411, 15, 273, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-10-2023', 'dd-mm-yyyy'), 412, 10, 526, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-09-2023', 'dd-mm-yyyy'), 413, 5, 784, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-01-2023', 'dd-mm-yyyy'), 414, 5, 74, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-07-2023', 'dd-mm-yyyy'), 415, 5, 78, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-03-2023', 'dd-mm-yyyy'), 416, 10, 785, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-11-2023', 'dd-mm-yyyy'), 417, 15, 917, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-04-2023', 'dd-mm-yyyy'), 418, 15, 364, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-06-2023', 'dd-mm-yyyy'), 419, 15, 113, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-06-2023', 'dd-mm-yyyy'), 420, 10, 403, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-10-2023', 'dd-mm-yyyy'), 421, 10, 97, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-04-2024', 'dd-mm-yyyy'), 422, 10, 491, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-03-2024', 'dd-mm-yyyy'), 423, 10, 66, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-05-2024', 'dd-mm-yyyy'), 424, 5, 888, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-03-2023', 'dd-mm-yyyy'), 425, 10, 679, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-02-2024', 'dd-mm-yyyy'), 426, 15, 750, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 427, 15, 323, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-06-2023', 'dd-mm-yyyy'), 428, 15, 932, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-12-2023', 'dd-mm-yyyy'), 429, 15, 937, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-03-2023', 'dd-mm-yyyy'), 430, 15, 337, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-04-2024', 'dd-mm-yyyy'), 431, 15, 403, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-04-2024', 'dd-mm-yyyy'), 432, 5, 843, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-01-2023', 'dd-mm-yyyy'), 433, 15, 497, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-05-2023', 'dd-mm-yyyy'), 434, 5, 783, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-03-2024', 'dd-mm-yyyy'), 435, 15, 399, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-10-2023', 'dd-mm-yyyy'), 436, 15, 986, 75);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-08-2023', 'dd-mm-yyyy'), 437, 5, 773, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-02-2023', 'dd-mm-yyyy'), 438, 10, 394, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-05-2024', 'dd-mm-yyyy'), 439, 10, 407, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-09-2023', 'dd-mm-yyyy'), 440, 10, 220, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-07-2023', 'dd-mm-yyyy'), 441, 15, 410, 87);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-05-2023', 'dd-mm-yyyy'), 442, 10, 688, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-05-2023', 'dd-mm-yyyy'), 443, 10, 975, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-02-2024', 'dd-mm-yyyy'), 444, 5, 330, 74);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-11-2023', 'dd-mm-yyyy'), 445, 5, 713, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-04-2023', 'dd-mm-yyyy'), 446, 15, 833, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-01-2023', 'dd-mm-yyyy'), 447, 10, 533, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-03-2024', 'dd-mm-yyyy'), 448, 15, 473, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2023', 'dd-mm-yyyy'), 449, 10, 96, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-11-2023', 'dd-mm-yyyy'), 450, 15, 85, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 451, 10, 830, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-02-2023', 'dd-mm-yyyy'), 452, 5, 613, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-06-2023', 'dd-mm-yyyy'), 453, 5, 506, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-05-2024', 'dd-mm-yyyy'), 454, 10, 220, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-04-2024', 'dd-mm-yyyy'), 455, 10, 377, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-01-2024', 'dd-mm-yyyy'), 456, 10, 953, 75);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-03-2023', 'dd-mm-yyyy'), 457, 10, 874, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-01-2023', 'dd-mm-yyyy'), 458, 15, 980, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-05-2023', 'dd-mm-yyyy'), 459, 15, 878, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-03-2023', 'dd-mm-yyyy'), 460, 10, 382, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-04-2024', 'dd-mm-yyyy'), 461, 5, 542, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-04-2024', 'dd-mm-yyyy'), 462, 5, 507, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-05-2023', 'dd-mm-yyyy'), 463, 5, 676, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2023', 'dd-mm-yyyy'), 464, 5, 900, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-02-2024', 'dd-mm-yyyy'), 465, 15, 705, 87);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-03-2023', 'dd-mm-yyyy'), 466, 15, 776, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-10-2023', 'dd-mm-yyyy'), 467, 10, 180, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-03-2023', 'dd-mm-yyyy'), 468, 5, 70, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-05-2024', 'dd-mm-yyyy'), 469, 10, 850, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-09-2023', 'dd-mm-yyyy'), 470, 10, 40, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-08-2023', 'dd-mm-yyyy'), 471, 5, 309, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-04-2023', 'dd-mm-yyyy'), 472, 10, 442, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-05-2023', 'dd-mm-yyyy'), 473, 15, 190, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-03-2024', 'dd-mm-yyyy'), 474, 5, 261, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-02-2023', 'dd-mm-yyyy'), 475, 15, 930, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-01-2024', 'dd-mm-yyyy'), 476, 15, 2, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-07-2023', 'dd-mm-yyyy'), 477, 15, 102, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-05-2023', 'dd-mm-yyyy'), 478, 5, 552, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-09-2023', 'dd-mm-yyyy'), 479, 10, 293, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-12-2023', 'dd-mm-yyyy'), 480, 15, 599, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-12-2023', 'dd-mm-yyyy'), 481, 5, 567, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-02-2024', 'dd-mm-yyyy'), 482, 5, 614, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-05-2023', 'dd-mm-yyyy'), 483, 15, 469, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-05-2023', 'dd-mm-yyyy'), 484, 5, 394, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-05-2023', 'dd-mm-yyyy'), 485, 10, 607, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-12-2023', 'dd-mm-yyyy'), 486, 10, 171, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-08-2023', 'dd-mm-yyyy'), 487, 10, 788, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-08-2023', 'dd-mm-yyyy'), 488, 15, 284, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-12-2023', 'dd-mm-yyyy'), 489, 5, 721, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-04-2024', 'dd-mm-yyyy'), 490, 10, 409, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-04-2024', 'dd-mm-yyyy'), 491, 10, 277, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-07-2023', 'dd-mm-yyyy'), 492, 10, 352, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-02-2023', 'dd-mm-yyyy'), 493, 15, 321, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-08-2023', 'dd-mm-yyyy'), 494, 15, 413, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-04-2024', 'dd-mm-yyyy'), 495, 10, 95, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-01-2024', 'dd-mm-yyyy'), 496, 15, 297, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-01-2023', 'dd-mm-yyyy'), 497, 10, 173, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-04-2024', 'dd-mm-yyyy'), 498, 5, 605, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-01-2023', 'dd-mm-yyyy'), 499, 15, 972, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-06-2023', 'dd-mm-yyyy'), 500, 10, 874, 63);
commit;
prompt 500 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-08-2023', 'dd-mm-yyyy'), 501, 10, 832, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-05-2024', 'dd-mm-yyyy'), 502, 15, 184, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-05-2023', 'dd-mm-yyyy'), 503, 15, 651, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-06-2023', 'dd-mm-yyyy'), 504, 10, 331, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-01-2024', 'dd-mm-yyyy'), 505, 10, 85, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-12-2023', 'dd-mm-yyyy'), 506, 5, 557, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-05-2024', 'dd-mm-yyyy'), 507, 10, 317, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-04-2024', 'dd-mm-yyyy'), 508, 5, 847, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-07-2023', 'dd-mm-yyyy'), 509, 10, 378, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-04-2024', 'dd-mm-yyyy'), 510, 5, 783, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-01-2024', 'dd-mm-yyyy'), 511, 10, 40, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-09-2023', 'dd-mm-yyyy'), 512, 15, 968, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-03-2023', 'dd-mm-yyyy'), 513, 15, 262, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-01-2023', 'dd-mm-yyyy'), 514, 5, 8, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-05-2023', 'dd-mm-yyyy'), 515, 5, 211, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-08-2023', 'dd-mm-yyyy'), 516, 10, 49, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-05-2024', 'dd-mm-yyyy'), 517, 15, 829, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 518, 5, 898, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 519, 15, 980, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-01-2023', 'dd-mm-yyyy'), 520, 15, 683, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-03-2024', 'dd-mm-yyyy'), 521, 15, 148, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-01-2024', 'dd-mm-yyyy'), 522, 10, 89, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-03-2024', 'dd-mm-yyyy'), 523, 10, 696, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-10-2023', 'dd-mm-yyyy'), 524, 5, 149, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-02-2024', 'dd-mm-yyyy'), 525, 5, 702, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-08-2023', 'dd-mm-yyyy'), 526, 10, 608, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-12-2023', 'dd-mm-yyyy'), 527, 15, 338, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-04-2023', 'dd-mm-yyyy'), 528, 10, 839, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-01-2024', 'dd-mm-yyyy'), 529, 15, 827, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-02-2024', 'dd-mm-yyyy'), 530, 15, 326, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-11-2023', 'dd-mm-yyyy'), 531, 10, 956, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-02-2024', 'dd-mm-yyyy'), 532, 10, 706, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-10-2023', 'dd-mm-yyyy'), 533, 10, 151, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2023', 'dd-mm-yyyy'), 534, 15, 383, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-07-2023', 'dd-mm-yyyy'), 535, 10, 114, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-03-2024', 'dd-mm-yyyy'), 536, 10, 692, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-04-2024', 'dd-mm-yyyy'), 537, 10, 27, 87);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-02-2023', 'dd-mm-yyyy'), 538, 5, 634, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-05-2023', 'dd-mm-yyyy'), 539, 10, 315, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-02-2024', 'dd-mm-yyyy'), 540, 5, 171, 74);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-04-2023', 'dd-mm-yyyy'), 541, 10, 972, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-04-2024', 'dd-mm-yyyy'), 542, 15, 83, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-10-2023', 'dd-mm-yyyy'), 543, 15, 451, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-07-2023', 'dd-mm-yyyy'), 544, 15, 386, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-12-2023', 'dd-mm-yyyy'), 545, 10, 110, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-07-2023', 'dd-mm-yyyy'), 546, 10, 319, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-03-2023', 'dd-mm-yyyy'), 547, 15, 234, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-05-2024', 'dd-mm-yyyy'), 548, 10, 884, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-02-2023', 'dd-mm-yyyy'), 549, 10, 601, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-03-2023', 'dd-mm-yyyy'), 550, 5, 957, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-07-2023', 'dd-mm-yyyy'), 551, 15, 633, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-09-2023', 'dd-mm-yyyy'), 552, 5, 956, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-02-2024', 'dd-mm-yyyy'), 553, 15, 86, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-01-2024', 'dd-mm-yyyy'), 554, 15, 76, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-06-2023', 'dd-mm-yyyy'), 555, 15, 318, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 556, 5, 77, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-01-2024', 'dd-mm-yyyy'), 557, 5, 117, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-11-2023', 'dd-mm-yyyy'), 558, 10, 649, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-09-2023', 'dd-mm-yyyy'), 559, 10, 87, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 560, 10, 332, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-03-2023', 'dd-mm-yyyy'), 561, 5, 600, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-01-2023', 'dd-mm-yyyy'), 562, 15, 991, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-03-2024', 'dd-mm-yyyy'), 563, 15, 313, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-03-2024', 'dd-mm-yyyy'), 564, 15, 870, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 565, 5, 235, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-01-2023', 'dd-mm-yyyy'), 566, 5, 191, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-10-2023', 'dd-mm-yyyy'), 567, 15, 376, 75);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-03-2024', 'dd-mm-yyyy'), 568, 15, 329, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-03-2024', 'dd-mm-yyyy'), 569, 5, 942, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-05-2023', 'dd-mm-yyyy'), 570, 10, 545, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-06-2023', 'dd-mm-yyyy'), 571, 10, 104, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-03-2024', 'dd-mm-yyyy'), 572, 5, 278, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-10-2023', 'dd-mm-yyyy'), 573, 10, 314, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-01-2023', 'dd-mm-yyyy'), 574, 5, 4, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-03-2024', 'dd-mm-yyyy'), 575, 10, 207, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-05-2023', 'dd-mm-yyyy'), 576, 10, 655, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-08-2023', 'dd-mm-yyyy'), 577, 5, 41, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-05-2023', 'dd-mm-yyyy'), 578, 15, 603, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2023', 'dd-mm-yyyy'), 579, 15, 717, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-09-2023', 'dd-mm-yyyy'), 580, 15, 203, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-05-2023', 'dd-mm-yyyy'), 581, 5, 354, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-07-2023', 'dd-mm-yyyy'), 582, 5, 902, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 583, 5, 426, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-04-2024', 'dd-mm-yyyy'), 584, 15, 909, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-11-2023', 'dd-mm-yyyy'), 585, 5, 463, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-03-2023', 'dd-mm-yyyy'), 586, 15, 424, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-02-2024', 'dd-mm-yyyy'), 587, 15, 320, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-02-2024', 'dd-mm-yyyy'), 588, 10, 439, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-07-2023', 'dd-mm-yyyy'), 589, 15, 993, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-03-2024', 'dd-mm-yyyy'), 590, 5, 91, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2023', 'dd-mm-yyyy'), 591, 5, 20, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-05-2023', 'dd-mm-yyyy'), 592, 10, 580, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 593, 5, 421, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-03-2024', 'dd-mm-yyyy'), 594, 5, 658, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-05-2024', 'dd-mm-yyyy'), 595, 5, 219, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-04-2023', 'dd-mm-yyyy'), 596, 5, 671, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-05-2024', 'dd-mm-yyyy'), 597, 10, 513, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-02-2023', 'dd-mm-yyyy'), 598, 5, 162, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-02-2024', 'dd-mm-yyyy'), 599, 5, 118, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-04-2023', 'dd-mm-yyyy'), 600, 15, 48, 60);
commit;
prompt 600 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-02-2024', 'dd-mm-yyyy'), 601, 5, 764, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-08-2023', 'dd-mm-yyyy'), 602, 10, 345, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-09-2023', 'dd-mm-yyyy'), 603, 10, 863, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-10-2023', 'dd-mm-yyyy'), 604, 10, 473, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-01-2023', 'dd-mm-yyyy'), 605, 15, 833, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-05-2024', 'dd-mm-yyyy'), 606, 5, 103, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-09-2023', 'dd-mm-yyyy'), 607, 5, 987, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-04-2023', 'dd-mm-yyyy'), 608, 15, 582, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-10-2023', 'dd-mm-yyyy'), 609, 5, 983, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-03-2024', 'dd-mm-yyyy'), 610, 5, 915, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-04-2024', 'dd-mm-yyyy'), 611, 10, 841, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-08-2023', 'dd-mm-yyyy'), 612, 10, 312, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-05-2024', 'dd-mm-yyyy'), 613, 15, 516, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-05-2023', 'dd-mm-yyyy'), 614, 5, 289, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-09-2023', 'dd-mm-yyyy'), 615, 10, 38, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2023', 'dd-mm-yyyy'), 616, 10, 344, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-08-2023', 'dd-mm-yyyy'), 617, 15, 211, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 618, 10, 190, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 619, 15, 882, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-02-2024', 'dd-mm-yyyy'), 620, 10, 542, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-09-2023', 'dd-mm-yyyy'), 621, 5, 762, 49);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-01-2024', 'dd-mm-yyyy'), 622, 10, 486, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-01-2024', 'dd-mm-yyyy'), 623, 15, 817, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-02-2024', 'dd-mm-yyyy'), 624, 15, 387, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-07-2023', 'dd-mm-yyyy'), 625, 5, 219, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-10-2023', 'dd-mm-yyyy'), 626, 5, 380, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-06-2023', 'dd-mm-yyyy'), 627, 5, 856, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-03-2023', 'dd-mm-yyyy'), 628, 5, 413, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-09-2023', 'dd-mm-yyyy'), 629, 15, 416, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-04-2023', 'dd-mm-yyyy'), 630, 15, 851, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-03-2024', 'dd-mm-yyyy'), 631, 10, 20, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-04-2024', 'dd-mm-yyyy'), 632, 15, 651, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-01-2024', 'dd-mm-yyyy'), 633, 10, 420, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-04-2024', 'dd-mm-yyyy'), 634, 10, 90, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-04-2023', 'dd-mm-yyyy'), 635, 5, 774, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-08-2023', 'dd-mm-yyyy'), 636, 15, 61, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-04-2023', 'dd-mm-yyyy'), 637, 10, 959, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-10-2023', 'dd-mm-yyyy'), 638, 15, 933, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-06-2023', 'dd-mm-yyyy'), 639, 5, 472, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-03-2023', 'dd-mm-yyyy'), 640, 10, 969, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-03-2023', 'dd-mm-yyyy'), 641, 5, 868, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-08-2023', 'dd-mm-yyyy'), 642, 5, 310, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-11-2023', 'dd-mm-yyyy'), 643, 15, 786, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-06-2023', 'dd-mm-yyyy'), 644, 15, 513, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-01-2023', 'dd-mm-yyyy'), 645, 5, 518, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-10-2023', 'dd-mm-yyyy'), 646, 10, 670, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-07-2023', 'dd-mm-yyyy'), 647, 5, 148, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-07-2023', 'dd-mm-yyyy'), 648, 5, 68, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-06-2023', 'dd-mm-yyyy'), 649, 5, 258, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-04-2023', 'dd-mm-yyyy'), 650, 5, 426, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-05-2024', 'dd-mm-yyyy'), 651, 10, 186, 3);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-01-2024', 'dd-mm-yyyy'), 652, 15, 690, 96);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-11-2023', 'dd-mm-yyyy'), 653, 10, 854, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-02-2023', 'dd-mm-yyyy'), 654, 5, 390, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-03-2024', 'dd-mm-yyyy'), 655, 5, 160, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-07-2023', 'dd-mm-yyyy'), 656, 15, 557, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-08-2023', 'dd-mm-yyyy'), 657, 5, 923, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-06-2023', 'dd-mm-yyyy'), 658, 5, 212, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-07-2023', 'dd-mm-yyyy'), 659, 15, 404, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-05-2023', 'dd-mm-yyyy'), 660, 15, 401, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-03-2023', 'dd-mm-yyyy'), 661, 10, 374, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-02-2023', 'dd-mm-yyyy'), 662, 15, 813, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-12-2023', 'dd-mm-yyyy'), 663, 10, 759, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-01-2023', 'dd-mm-yyyy'), 664, 15, 944, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-03-2024', 'dd-mm-yyyy'), 665, 5, 840, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-04-2024', 'dd-mm-yyyy'), 666, 10, 831, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-01-2024', 'dd-mm-yyyy'), 667, 10, 15, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-01-2023', 'dd-mm-yyyy'), 668, 5, 345, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-12-2023', 'dd-mm-yyyy'), 669, 15, 124, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-07-2023', 'dd-mm-yyyy'), 670, 10, 51, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-05-2023', 'dd-mm-yyyy'), 671, 15, 341, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-01-2023', 'dd-mm-yyyy'), 672, 5, 625, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2023', 'dd-mm-yyyy'), 673, 15, 625, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-04-2023', 'dd-mm-yyyy'), 674, 5, 841, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-11-2023', 'dd-mm-yyyy'), 675, 10, 731, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-10-2023', 'dd-mm-yyyy'), 676, 5, 114, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-03-2024', 'dd-mm-yyyy'), 677, 15, 788, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 678, 15, 601, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-03-2024', 'dd-mm-yyyy'), 679, 5, 438, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-08-2023', 'dd-mm-yyyy'), 680, 10, 883, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-08-2023', 'dd-mm-yyyy'), 681, 5, 534, 79);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-05-2023', 'dd-mm-yyyy'), 682, 15, 188, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-08-2023', 'dd-mm-yyyy'), 683, 15, 409, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-01-2023', 'dd-mm-yyyy'), 684, 5, 188, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-08-2023', 'dd-mm-yyyy'), 685, 5, 696, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-12-2023', 'dd-mm-yyyy'), 686, 15, 358, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-09-2023', 'dd-mm-yyyy'), 687, 15, 725, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-04-2024', 'dd-mm-yyyy'), 688, 5, 897, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-12-2023', 'dd-mm-yyyy'), 689, 15, 464, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-07-2023', 'dd-mm-yyyy'), 690, 5, 207, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-08-2023', 'dd-mm-yyyy'), 691, 10, 42, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-01-2023', 'dd-mm-yyyy'), 692, 10, 939, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-08-2023', 'dd-mm-yyyy'), 693, 5, 815, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-08-2023', 'dd-mm-yyyy'), 694, 5, 603, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-02-2023', 'dd-mm-yyyy'), 695, 15, 19, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-10-2023', 'dd-mm-yyyy'), 696, 15, 734, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2023', 'dd-mm-yyyy'), 697, 5, 954, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-12-2023', 'dd-mm-yyyy'), 698, 15, 627, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-09-2023', 'dd-mm-yyyy'), 699, 10, 765, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-01-2024', 'dd-mm-yyyy'), 700, 10, 631, 18);
commit;
prompt 700 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-03-2023', 'dd-mm-yyyy'), 701, 10, 753, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-06-2023', 'dd-mm-yyyy'), 702, 15, 9, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-02-2023', 'dd-mm-yyyy'), 703, 5, 273, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-05-2024', 'dd-mm-yyyy'), 704, 10, 351, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-02-2023', 'dd-mm-yyyy'), 705, 10, 183, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-07-2023', 'dd-mm-yyyy'), 706, 5, 565, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-06-2023', 'dd-mm-yyyy'), 707, 10, 856, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-01-2024', 'dd-mm-yyyy'), 708, 5, 417, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-04-2023', 'dd-mm-yyyy'), 709, 15, 758, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-04-2023', 'dd-mm-yyyy'), 710, 5, 638, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-03-2024', 'dd-mm-yyyy'), 711, 5, 586, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-07-2023', 'dd-mm-yyyy'), 712, 5, 597, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-04-2024', 'dd-mm-yyyy'), 713, 15, 968, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-01-2024', 'dd-mm-yyyy'), 714, 5, 530, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-07-2023', 'dd-mm-yyyy'), 715, 10, 731, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-05-2023', 'dd-mm-yyyy'), 716, 15, 339, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-08-2023', 'dd-mm-yyyy'), 717, 10, 720, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-03-2023', 'dd-mm-yyyy'), 718, 5, 945, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-10-2023', 'dd-mm-yyyy'), 719, 15, 195, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-09-2023', 'dd-mm-yyyy'), 720, 10, 211, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-02-2023', 'dd-mm-yyyy'), 721, 5, 772, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-01-2023', 'dd-mm-yyyy'), 722, 10, 422, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-04-2024', 'dd-mm-yyyy'), 723, 15, 948, 6);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-05-2024', 'dd-mm-yyyy'), 724, 5, 334, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-05-2024', 'dd-mm-yyyy'), 725, 15, 171, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-02-2023', 'dd-mm-yyyy'), 726, 15, 775, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-04-2024', 'dd-mm-yyyy'), 727, 10, 476, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-07-2023', 'dd-mm-yyyy'), 728, 15, 822, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-02-2023', 'dd-mm-yyyy'), 729, 10, 692, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-07-2023', 'dd-mm-yyyy'), 730, 15, 530, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-03-2024', 'dd-mm-yyyy'), 731, 10, 205, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-02-2023', 'dd-mm-yyyy'), 732, 5, 225, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-04-2023', 'dd-mm-yyyy'), 733, 10, 279, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-02-2023', 'dd-mm-yyyy'), 734, 5, 363, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-01-2024', 'dd-mm-yyyy'), 735, 5, 948, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-04-2024', 'dd-mm-yyyy'), 736, 5, 952, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-12-2023', 'dd-mm-yyyy'), 737, 5, 472, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-05-2023', 'dd-mm-yyyy'), 738, 5, 535, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-02-2023', 'dd-mm-yyyy'), 739, 10, 341, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-06-2023', 'dd-mm-yyyy'), 740, 15, 727, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-12-2023', 'dd-mm-yyyy'), 741, 15, 856, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-03-2023', 'dd-mm-yyyy'), 742, 10, 334, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-05-2023', 'dd-mm-yyyy'), 743, 10, 273, 23);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-04-2023', 'dd-mm-yyyy'), 744, 15, 13, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-03-2024', 'dd-mm-yyyy'), 745, 10, 492, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-02-2024', 'dd-mm-yyyy'), 746, 15, 508, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-02-2023', 'dd-mm-yyyy'), 747, 5, 334, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-03-2024', 'dd-mm-yyyy'), 748, 15, 450, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-07-2023', 'dd-mm-yyyy'), 749, 5, 356, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-06-2023', 'dd-mm-yyyy'), 750, 5, 705, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-02-2024', 'dd-mm-yyyy'), 751, 10, 247, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-01-2023', 'dd-mm-yyyy'), 752, 10, 303, 97);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-04-2024', 'dd-mm-yyyy'), 753, 5, 775, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-08-2023', 'dd-mm-yyyy'), 754, 10, 910, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-02-2023', 'dd-mm-yyyy'), 755, 15, 305, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-10-2023', 'dd-mm-yyyy'), 756, 5, 887, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-08-2023', 'dd-mm-yyyy'), 757, 15, 869, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-12-2023', 'dd-mm-yyyy'), 758, 5, 883, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-03-2023', 'dd-mm-yyyy'), 759, 5, 811, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-11-2023', 'dd-mm-yyyy'), 760, 5, 16, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-08-2023', 'dd-mm-yyyy'), 761, 10, 983, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-07-2023', 'dd-mm-yyyy'), 762, 10, 596, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-05-2023', 'dd-mm-yyyy'), 763, 10, 515, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-10-2023', 'dd-mm-yyyy'), 764, 10, 429, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-07-2023', 'dd-mm-yyyy'), 765, 10, 131, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-07-2023', 'dd-mm-yyyy'), 766, 10, 667, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-01-2023', 'dd-mm-yyyy'), 767, 10, 48, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-02-2024', 'dd-mm-yyyy'), 768, 10, 235, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-04-2023', 'dd-mm-yyyy'), 769, 5, 422, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-01-2023', 'dd-mm-yyyy'), 770, 5, 806, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 771, 15, 364, 87);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-01-2024', 'dd-mm-yyyy'), 772, 5, 351, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-03-2024', 'dd-mm-yyyy'), 773, 5, 513, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-07-2023', 'dd-mm-yyyy'), 774, 15, 244, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-05-2024', 'dd-mm-yyyy'), 775, 10, 177, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-03-2024', 'dd-mm-yyyy'), 776, 5, 934, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-06-2023', 'dd-mm-yyyy'), 777, 15, 34, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-02-2024', 'dd-mm-yyyy'), 778, 10, 176, 76);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-04-2024', 'dd-mm-yyyy'), 779, 15, 395, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-07-2023', 'dd-mm-yyyy'), 780, 5, 823, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-02-2024', 'dd-mm-yyyy'), 781, 15, 32, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-04-2024', 'dd-mm-yyyy'), 782, 15, 194, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-03-2023', 'dd-mm-yyyy'), 783, 10, 562, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-09-2023', 'dd-mm-yyyy'), 784, 10, 976, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-04-2023', 'dd-mm-yyyy'), 785, 5, 404, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-04-2024', 'dd-mm-yyyy'), 786, 5, 728, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-08-2023', 'dd-mm-yyyy'), 787, 15, 291, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-05-2023', 'dd-mm-yyyy'), 788, 15, 906, 11);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-09-2023', 'dd-mm-yyyy'), 789, 10, 341, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-02-2023', 'dd-mm-yyyy'), 790, 15, 484, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-09-2023', 'dd-mm-yyyy'), 791, 5, 704, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-04-2023', 'dd-mm-yyyy'), 792, 10, 118, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-07-2023', 'dd-mm-yyyy'), 793, 10, 758, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-03-2024', 'dd-mm-yyyy'), 794, 15, 878, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-04-2024', 'dd-mm-yyyy'), 795, 15, 873, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-12-2023', 'dd-mm-yyyy'), 796, 15, 548, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-07-2023', 'dd-mm-yyyy'), 797, 5, 737, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-05-2024', 'dd-mm-yyyy'), 798, 15, 477, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-04-2024', 'dd-mm-yyyy'), 799, 15, 249, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-12-2023', 'dd-mm-yyyy'), 800, 5, 3, 72);
commit;
prompt 800 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-02-2024', 'dd-mm-yyyy'), 801, 5, 962, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-01-2023', 'dd-mm-yyyy'), 802, 10, 433, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-06-2023', 'dd-mm-yyyy'), 803, 5, 107, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-10-2023', 'dd-mm-yyyy'), 804, 10, 591, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-06-2023', 'dd-mm-yyyy'), 805, 5, 158, 65);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-02-2024', 'dd-mm-yyyy'), 806, 5, 923, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-02-2024', 'dd-mm-yyyy'), 807, 5, 978, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-06-2023', 'dd-mm-yyyy'), 808, 10, 168, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-10-2023', 'dd-mm-yyyy'), 809, 5, 523, 13);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-02-2024', 'dd-mm-yyyy'), 810, 5, 587, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-05-2023', 'dd-mm-yyyy'), 811, 10, 96, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-05-2023', 'dd-mm-yyyy'), 812, 5, 766, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-06-2023', 'dd-mm-yyyy'), 813, 5, 178, 29);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-12-2023', 'dd-mm-yyyy'), 814, 15, 963, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-08-2023', 'dd-mm-yyyy'), 815, 5, 819, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-01-2023', 'dd-mm-yyyy'), 816, 10, 39, 68);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-02-2023', 'dd-mm-yyyy'), 817, 5, 588, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-12-2023', 'dd-mm-yyyy'), 818, 15, 928, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2023', 'dd-mm-yyyy'), 819, 10, 85, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-10-2023', 'dd-mm-yyyy'), 820, 10, 694, 37);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-11-2023', 'dd-mm-yyyy'), 821, 10, 16, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-03-2024', 'dd-mm-yyyy'), 822, 5, 131, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-05-2024', 'dd-mm-yyyy'), 823, 15, 835, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-02-2023', 'dd-mm-yyyy'), 824, 10, 933, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-02-2023', 'dd-mm-yyyy'), 825, 5, 945, 82);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-01-2023', 'dd-mm-yyyy'), 826, 10, 434, 91);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-06-2023', 'dd-mm-yyyy'), 827, 10, 460, 75);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-05-2024', 'dd-mm-yyyy'), 828, 15, 889, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-03-2024', 'dd-mm-yyyy'), 829, 15, 530, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-10-2023', 'dd-mm-yyyy'), 830, 15, 347, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-03-2023', 'dd-mm-yyyy'), 831, 10, 233, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-09-2023', 'dd-mm-yyyy'), 832, 5, 61, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-09-2023', 'dd-mm-yyyy'), 833, 10, 23, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-07-2023', 'dd-mm-yyyy'), 834, 10, 471, 77);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-09-2023', 'dd-mm-yyyy'), 835, 15, 747, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-05-2023', 'dd-mm-yyyy'), 836, 15, 753, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-02-2024', 'dd-mm-yyyy'), 837, 10, 220, 95);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-05-2024', 'dd-mm-yyyy'), 838, 5, 926, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-10-2023', 'dd-mm-yyyy'), 839, 5, 358, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-12-2023', 'dd-mm-yyyy'), 840, 5, 517, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-10-2023', 'dd-mm-yyyy'), 841, 10, 890, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-04-2023', 'dd-mm-yyyy'), 842, 5, 798, 14);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-10-2023', 'dd-mm-yyyy'), 843, 15, 614, 60);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-05-2024', 'dd-mm-yyyy'), 844, 15, 581, 74);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-10-2023', 'dd-mm-yyyy'), 845, 15, 224, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-07-2023', 'dd-mm-yyyy'), 846, 15, 572, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-11-2023', 'dd-mm-yyyy'), 847, 15, 699, 19);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-08-2023', 'dd-mm-yyyy'), 848, 5, 293, 56);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-12-2023', 'dd-mm-yyyy'), 849, 5, 258, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-05-2024', 'dd-mm-yyyy'), 850, 10, 567, 64);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-03-2024', 'dd-mm-yyyy'), 851, 10, 867, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-01-2023', 'dd-mm-yyyy'), 852, 15, 557, 40);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-10-2023', 'dd-mm-yyyy'), 853, 5, 323, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-04-2024', 'dd-mm-yyyy'), 854, 5, 379, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-06-2023', 'dd-mm-yyyy'), 855, 10, 882, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-07-2023', 'dd-mm-yyyy'), 856, 10, 269, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-12-2023', 'dd-mm-yyyy'), 857, 10, 475, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-04-2023', 'dd-mm-yyyy'), 858, 10, 315, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-02-2024', 'dd-mm-yyyy'), 859, 5, 455, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-02-2024', 'dd-mm-yyyy'), 860, 5, 755, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 861, 10, 937, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-05-2024', 'dd-mm-yyyy'), 862, 5, 832, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-12-2023', 'dd-mm-yyyy'), 863, 15, 678, 9);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-06-2023', 'dd-mm-yyyy'), 864, 5, 213, 98);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-09-2023', 'dd-mm-yyyy'), 865, 5, 533, 22);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-08-2023', 'dd-mm-yyyy'), 866, 5, 973, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-05-2023', 'dd-mm-yyyy'), 867, 10, 467, 17);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-06-2023', 'dd-mm-yyyy'), 868, 10, 142, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-02-2024', 'dd-mm-yyyy'), 869, 10, 129, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-02-2024', 'dd-mm-yyyy'), 870, 15, 807, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-05-2023', 'dd-mm-yyyy'), 871, 15, 994, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-02-2024', 'dd-mm-yyyy'), 872, 5, 787, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-08-2023', 'dd-mm-yyyy'), 873, 5, 65, 88);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-04-2023', 'dd-mm-yyyy'), 874, 10, 863, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-01-2023', 'dd-mm-yyyy'), 875, 15, 131, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-02-2023', 'dd-mm-yyyy'), 876, 5, 574, 46);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-03-2023', 'dd-mm-yyyy'), 877, 15, 599, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-12-2023', 'dd-mm-yyyy'), 878, 10, 572, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-08-2023', 'dd-mm-yyyy'), 879, 10, 880, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-03-2024', 'dd-mm-yyyy'), 880, 15, 545, 81);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-02-2023', 'dd-mm-yyyy'), 881, 10, 342, 21);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-02-2023', 'dd-mm-yyyy'), 882, 15, 697, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-01-2024', 'dd-mm-yyyy'), 883, 5, 818, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-02-2023', 'dd-mm-yyyy'), 884, 5, 798, 71);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-02-2024', 'dd-mm-yyyy'), 885, 5, 691, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-04-2024', 'dd-mm-yyyy'), 886, 15, 782, 90);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-09-2023', 'dd-mm-yyyy'), 887, 5, 527, 42);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-04-2024', 'dd-mm-yyyy'), 888, 15, 925, 74);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-04-2023', 'dd-mm-yyyy'), 889, 15, 277, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-10-2023', 'dd-mm-yyyy'), 890, 5, 577, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-12-2023', 'dd-mm-yyyy'), 891, 5, 39, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-02-2024', 'dd-mm-yyyy'), 892, 15, 451, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-08-2023', 'dd-mm-yyyy'), 893, 5, 389, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-04-2024', 'dd-mm-yyyy'), 894, 15, 486, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-06-2023', 'dd-mm-yyyy'), 895, 5, 266, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-02-2023', 'dd-mm-yyyy'), 896, 5, 265, 92);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-03-2024', 'dd-mm-yyyy'), 897, 10, 423, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('09-07-2023', 'dd-mm-yyyy'), 898, 15, 996, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-03-2024', 'dd-mm-yyyy'), 899, 5, 444, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-05-2023', 'dd-mm-yyyy'), 900, 5, 62, 23);
commit;
prompt 900 records committed...
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-01-2023', 'dd-mm-yyyy'), 901, 5, 315, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-04-2024', 'dd-mm-yyyy'), 902, 10, 122, 5);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-11-2023', 'dd-mm-yyyy'), 903, 5, 567, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-02-2024', 'dd-mm-yyyy'), 904, 5, 783, 34);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 905, 15, 976, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-01-2023', 'dd-mm-yyyy'), 906, 10, 837, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-04-2023', 'dd-mm-yyyy'), 907, 15, 825, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-01-2023', 'dd-mm-yyyy'), 908, 15, 50, 99);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-01-2024', 'dd-mm-yyyy'), 909, 10, 734, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-07-2023', 'dd-mm-yyyy'), 910, 15, 518, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-04-2024', 'dd-mm-yyyy'), 911, 5, 44, 38);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-04-2023', 'dd-mm-yyyy'), 912, 5, 597, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-09-2023', 'dd-mm-yyyy'), 913, 5, 770, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-03-2023', 'dd-mm-yyyy'), 914, 10, 376, 45);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2023', 'dd-mm-yyyy'), 915, 15, 117, 47);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2023', 'dd-mm-yyyy'), 916, 15, 722, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-02-2023', 'dd-mm-yyyy'), 917, 5, 552, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-11-2023', 'dd-mm-yyyy'), 918, 5, 895, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-07-2023', 'dd-mm-yyyy'), 919, 10, 449, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-02-2024', 'dd-mm-yyyy'), 920, 15, 711, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-03-2024', 'dd-mm-yyyy'), 921, 5, 280, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-07-2023', 'dd-mm-yyyy'), 922, 10, 276, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-07-2023', 'dd-mm-yyyy'), 923, 5, 390, 80);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-06-2023', 'dd-mm-yyyy'), 924, 10, 282, 62);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-03-2024', 'dd-mm-yyyy'), 925, 15, 315, 8);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-02-2023', 'dd-mm-yyyy'), 926, 5, 863, 33);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-01-2023', 'dd-mm-yyyy'), 927, 15, 675, 18);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-01-2024', 'dd-mm-yyyy'), 928, 10, 20, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-01-2024', 'dd-mm-yyyy'), 929, 15, 622, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 930, 15, 593, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-01-2024', 'dd-mm-yyyy'), 931, 5, 858, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-09-2023', 'dd-mm-yyyy'), 932, 10, 817, 69);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-01-2023', 'dd-mm-yyyy'), 933, 15, 208, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-03-2023', 'dd-mm-yyyy'), 934, 5, 423, 39);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-11-2023', 'dd-mm-yyyy'), 935, 15, 756, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-11-2023', 'dd-mm-yyyy'), 936, 5, 310, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-10-2023', 'dd-mm-yyyy'), 937, 5, 554, 93);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-04-2024', 'dd-mm-yyyy'), 938, 10, 774, 59);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2023', 'dd-mm-yyyy'), 939, 10, 878, 28);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-07-2023', 'dd-mm-yyyy'), 940, 5, 312, 83);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-03-2024', 'dd-mm-yyyy'), 941, 15, 59, 67);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 942, 5, 966, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-02-2024', 'dd-mm-yyyy'), 943, 10, 868, 20);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 944, 5, 257, 52);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-04-2024', 'dd-mm-yyyy'), 945, 15, 472, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-09-2023', 'dd-mm-yyyy'), 946, 5, 656, 7);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-11-2023', 'dd-mm-yyyy'), 947, 10, 942, 44);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2024', 'dd-mm-yyyy'), 948, 15, 635, 27);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-05-2024', 'dd-mm-yyyy'), 949, 15, 335, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-02-2024', 'dd-mm-yyyy'), 950, 5, 274, 1);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('13-01-2024', 'dd-mm-yyyy'), 951, 15, 326, 48);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-01-2023', 'dd-mm-yyyy'), 952, 10, 429, 61);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-01-2024', 'dd-mm-yyyy'), 953, 10, 415, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-04-2024', 'dd-mm-yyyy'), 954, 10, 465, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-05-2023', 'dd-mm-yyyy'), 955, 15, 688, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('06-01-2023', 'dd-mm-yyyy'), 956, 10, 551, 70);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-03-2023', 'dd-mm-yyyy'), 957, 15, 145, 50);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-05-2023', 'dd-mm-yyyy'), 958, 5, 520, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-10-2023', 'dd-mm-yyyy'), 959, 5, 585, 24);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('14-07-2023', 'dd-mm-yyyy'), 960, 15, 284, 57);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-05-2023', 'dd-mm-yyyy'), 961, 10, 61, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-03-2024', 'dd-mm-yyyy'), 962, 5, 820, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-06-2023', 'dd-mm-yyyy'), 963, 10, 891, 84);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-11-2023', 'dd-mm-yyyy'), 964, 5, 713, 26);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('16-08-2023', 'dd-mm-yyyy'), 965, 5, 238, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('31-03-2023', 'dd-mm-yyyy'), 966, 10, 268, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('28-02-2023', 'dd-mm-yyyy'), 967, 10, 242, 35);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('18-04-2023', 'dd-mm-yyyy'), 968, 5, 171, 2);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-05-2024', 'dd-mm-yyyy'), 969, 10, 728, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('23-02-2023', 'dd-mm-yyyy'), 970, 10, 729, 100);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-01-2024', 'dd-mm-yyyy'), 971, 15, 468, 30);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-09-2023', 'dd-mm-yyyy'), 972, 15, 665, 53);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('26-04-2023', 'dd-mm-yyyy'), 973, 15, 2, 72);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-05-2024', 'dd-mm-yyyy'), 974, 10, 470, 31);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('12-05-2024', 'dd-mm-yyyy'), 975, 10, 34, 36);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('22-12-2023', 'dd-mm-yyyy'), 976, 15, 327, 4);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-09-2023', 'dd-mm-yyyy'), 977, 5, 379, 12);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('27-06-2023', 'dd-mm-yyyy'), 978, 15, 592, 86);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('17-07-2023', 'dd-mm-yyyy'), 979, 5, 476, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-02-2024', 'dd-mm-yyyy'), 980, 5, 840, 58);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('21-02-2023', 'dd-mm-yyyy'), 981, 10, 469, 41);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-03-2023', 'dd-mm-yyyy'), 982, 15, 473, 66);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('19-09-2023', 'dd-mm-yyyy'), 983, 5, 839, 54);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('30-09-2023', 'dd-mm-yyyy'), 984, 10, 884, 15);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-05-2024', 'dd-mm-yyyy'), 985, 10, 611, 16);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('07-07-2023', 'dd-mm-yyyy'), 986, 5, 200, 25);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('02-12-2023', 'dd-mm-yyyy'), 987, 5, 114, 55);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('10-05-2023', 'dd-mm-yyyy'), 988, 15, 565, 89);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 989, 5, 309, 73);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-04-2023', 'dd-mm-yyyy'), 990, 10, 11, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('15-03-2024', 'dd-mm-yyyy'), 991, 5, 675, 85);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('20-04-2024', 'dd-mm-yyyy'), 992, 10, 861, 32);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 993, 10, 667, 51);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('25-04-2024', 'dd-mm-yyyy'), 994, 5, 730, 94);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('03-03-2024', 'dd-mm-yyyy'), 995, 10, 720, 78);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('01-02-2023', 'dd-mm-yyyy'), 996, 10, 55, 43);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('08-04-2024', 'dd-mm-yyyy'), 997, 5, 832, 10);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('24-01-2024', 'dd-mm-yyyy'), 998, 5, 209, 63);
insert into APPOINTMENTS (app_date, appid, lengthapp, id_sender, wid)
values (to_date('11-04-2024', 'dd-mm-yyyy'), 999, 10, 702, 97);
commit;
prompt 999 records loaded
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
prompt Loading JOB...
insert into JOB (jobnum, jobname, salaryperhour)
values (67, 'פקיד', 35.9);
insert into JOB (jobnum, jobname, salaryperhour)
values (68, 'מנהל', 50.2);
insert into JOB (jobnum, jobname, salaryperhour)
values (69, 'משלוחן', 73.5);
insert into JOB (jobnum, jobname, salaryperhour)
values (70, 'ממיין', 35.9);
insert into JOB (jobnum, jobname, salaryperhour)
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
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (1, 589121154, 'McDonaldTori', 1.1, 1.5, 15.9, 75, 7, 684, 29, 15);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (2, 554521282, 'LeighLoretta', 7.1, 10.5, 25.9, 43, 46, 746, 49, 91);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (3, 582539439, 'HartnettNatacha', 7.1, 1.5, 25.9, 97, 39, 163, 15, 20);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (4, 531718254, 'CozierRip', 1.1, 1.5, 10.9, 84, 20, 532, 22, 68);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (6, 564391568, 'StevensGwyneth', .5, 3.5, 20.9, 45, 48, 888, 7, 93);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (7, 581676772, 'HimmelmanNeil', 2.5, 2.5, 20.9, 54, 19, 483, 74, 7);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (8, 575462716, 'McGriffSara', .6, 2.5, 15.9, 71, 20, 410, 8, 90);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (9, 527728938, 'TravoltaJay', 7.1, 1.5, 15.9, 52, 32, 614, 38, 13);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (10, 594813588, 'BarrymoreRowan', .6, 10.5, 15.9, 37, 35, 477, 98, 21);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (11, 532847774, 'TarantinoMeredi', .6, 2.5, 25.9, 89, 41, 539, 89, 95);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (12, 573187524, 'CarnesKiefer', .5, 1.5, 25.9, 82, 29, 843, 83, 41);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (5, 592712926, 'ColtraneJesus', .5, 10.5, 5.9, 85, 33, 414, 33, 28);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (13, 516819896, 'GuestGailard', 1.5, 4.5, 25.9, 24, 39, 40, 73, 81);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (14, 582535178, 'SchneiderMichae', 1.5, 3.5, 25.9, 19, 24, 196, 36, 64);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (15, 527654484, 'MonkRebecca', .5, 10.5, 20.9, 47, 12, 606, 93, 18);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (16, 527295712, 'GarciaTrey', 7.1, 12.1, 10.9, 74, 37, 207, 53, 67);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (17, 528513173, 'Sainte-MarieChr', 2.5, 4.5, 5.9, 29, 24, 994, 79, 67);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (18, 595165662, 'GrayCole', 1.1, 2.5, 10.9, 98, 9, 593, 1, 10);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (19, 599672655, 'CostelloKristin', 2.5, 10.5, 20.9, 40, 4, 418, 76, 6);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (20, 587411722, 'Angelina Brosna', 15, 23, 5.9, 96, 17, 7, 82, 74);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (21, 545766861, 'Pete Crow', 11, 0, 5.9, 17, 3, 78, 9, 12);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (22, 597792341, 'Terri Lovitz', 9, 22, 5.9, 93, 6, 571, 16, 34);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (23, 552148318, 'Dar Donovan', 7, 37, 50, 45, 17, 701, 3, 14);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (24, 574885167, 'Victoria Remar', 4, 44, 20, 63, 4, 333, 46, 57);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (25, 559224737, 'Arnold MacNeil', 18, 35, 50, 77, 41, 245, 54, 99);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (26, 565592551, 'Lynn Puckett', 2, 29, 5.9, 91, 3, 656, 93, 30);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (27, 582111884, 'Stephen Beck', 9, 24, 15.9, 32, 38, 47, 68, 37);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (28, 536278158, 'Stellan Rourke', 12, 4, 25, 14, 13, 315, 85, 86);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (29, 527536112, 'Humberto Borden', 11, 20, 20, 91, 36, 435, 59, 41);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (30, 556964425, 'Geoffrey Kingsl', 0, 9, 5.9, 47, 40, 425, 56, 41);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (31, 574612115, 'Emily Chao', 0, 25, 25, 86, 35, 455, 82, 28);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (32, 544975739, 'Sally Bosco', 16, 12, 25, 26, 17, 630, 60, 19);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (34, 545616254, 'Jerry Kramer', 7, 40, 50, 66, 46, 673, 74, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (35, 593484327, 'Jeanne Felician', 17, 27, 25, 27, 20, 917, 53, 90);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (36, 561498917, 'Edwin Pullman', 16, 3, 10.9, 97, 5, 876, 59, 43);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (37, 542431779, 'Hector Garber', 5, 9, 50, 49, 11, 313, 79, 12);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (38, 592615451, 'Antonio McNeice', 7, 30, 50, 25, 48, 345, 76, 7);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (39, 583258599, 'Goldie Polley', 15, 32, 50, 98, 17, 721, 70, 79);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (40, 523377583, 'Alessandro Wied', 15, 1, 5.9, 26, 21, 927, 90, 64);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (41, 556732866, 'Paul Krieger', 12, 36, 25, 10, 23, 570, 19, 36);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (42, 575515625, 'Blair Preston', 16, 8, 50, 81, 35, 242, 99, 36);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (43, 532124693, 'Nils Lane', 16, 45, 10.9, 10, 46, 803, 75, 99);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (44, 594791392, 'Matt Margolyes', 14, 9, 20, 2, 12, 302, 65, 99);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (45, 554333436, 'Johnnie Berkley', 10, 1, 25, 73, 50, 191, 65, 54);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (46, 513314358, 'Franz Arkin', 3, 7, 25, 7, 5, 550, 53, 37);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (47, 567655281, 'Brian Smith', 8, 20, 10.9, 46, 9, 410, 100, 24);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (48, 569287796, 'Miko Hauer', 11, 0, 5.9, 40, 46, 341, 86, 16);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (49, 516714283, 'Kathy Monk', 19, 36, 20, 31, 24, 63, 59, 49);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (50, 527919165, 'Jimmy Klugh', 7, 33, 20, 62, 37, 168, 86, 42);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (51, 559925183, 'Rosanna Cartlid', 14, 32, 15.9, 64, 31, 70, 47, 74);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (52, 512585958, 'Belinda Hewitt', 20, 49, 20, 36, 15, 193, 45, 48);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (53, 598114534, 'Horace Danger', 1, 46, 5.9, 41, 24, 87, 79, 68);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (54, 527978716, 'Glen Rhys-Davie', 19, 27, 5.9, 93, 43, 854, 59, 55);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (55, 529151989, 'Elle Rollins', 13, 0, 15.9, 71, 2, 886, 37, 91);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (56, 525438346, 'Mindy Tobolowsk', 11, 46, 5.9, 59, 10, 624, 19, 72);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (57, 577611914, 'Millie Hutton', 8, 49, 25, 66, 38, 871, 91, 27);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (58, 526438288, 'Crispin Furtado', 16, 16, 10.9, 65, 46, 191, 23, 35);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (59, 511374556, 'Suzy Suvari', 15, 45, 25, 83, 21, 133, 6, 59);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (60, 555951126, 'Matthew Blossom', 14, 13, 25, 77, 31, 629, 82, 34);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (61, 563212391, 'Robby Curtis-Ha', 4, 11, 10.9, 99, 19, 739, 47, 43);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (62, 577999633, 'Roscoe Weaving', 14, 13, 10.9, 25, 43, 347, 8, 46);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (63, 583548447, 'Mekhi Ruiz', 5, 39, 10.9, 64, 1, 165, 66, 2);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (64, 554539388, 'Blair Summer', 1, 4, 20, 7, 15, 857, 19, 58);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (65, 566883716, 'Rhys Krabbe', 9, 7, 5.9, 70, 50, 44, 46, 32);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (66, 592439168, 'Bonnie Levine', 2, 44, 15.9, 98, 34, 671, 9, 95);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (67, 597437642, 'April Flack', 16, 47, 25, 44, 14, 648, 11, 95);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (68, 557194517, 'Owen Dupree', 9, 45, 20, 1, 6, 860, 44, 6);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (69, 527957968, 'Clay Oates', 4, 46, 20, 29, 10, 800, 49, 64);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (70, 596827821, 'Taylor Cooper', 17, 32, 20, 75, 23, 93, 17, 64);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (71, 553142493, 'Victor Nicholso', 0, 29, 5.9, 83, 34, 593, 62, 60);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (72, 535449767, 'Freda Satriani', 11, 5, 5.9, 68, 32, 803, 52, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (73, 567147949, 'Devon Hannah', 17, 28, 10.9, 54, 28, 752, 73, 93);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (74, 571782261, 'Carrie Liu', 5, 41, 50, 63, 38, 124, 10, 54);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (75, 551638237, 'Harvey Hart', 3, 26, 50, 45, 46, 464, 17, 55);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (76, 565757525, 'Deborah Lynne', 12, 44, 50, 76, 15, 144, 6, 20);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (77, 577436793, 'Eddie Senior', 1, 19, 15.9, 15, 34, 386, 87, 23);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (78, 568724758, 'Halle Forster', 11, 43, 25, 62, 31, 328, 8, 89);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (79, 587617587, 'Greg Taylor', 17, 23, 50, 10, 17, 730, 14, 47);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (80, 569464189, 'Jonathan Lineba', 2, 35, 15.9, 67, 48, 592, 17, 67);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (81, 575777647, 'Terrence Sheare', 7, 12, 15.9, 54, 7, 638, 73, 17);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (82, 554973324, 'Cevin Gooding', 12, 14, 25, 78, 9, 443, 9, 13);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (83, 594128475, 'George Richter', 10, 42, 15.9, 22, 20, 992, 12, 49);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (84, 533432826, 'Rita Isaacs', 11, 25, 10.9, 32, 23, 662, 41, 22);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (85, 588944634, 'Ann Thornton', 10, 2, 20, 36, 44, 210, 60, 96);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (86, 587815684, 'Colleen Spacey', 20, 8, 20, 49, 42, 217, 79, 12);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (87, 585185123, 'Denny Douglas', 7, 1, 20, 47, 46, 815, 37, 12);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (88, 551652961, 'Guy McCabe', 18, 36, 15.9, 50, 37, 322, 94, 27);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (89, 531778768, 'Fairuza Palin', 12, 40, 20, 13, 25, 834, 71, 74);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (90, 511762525, 'Marc Head', 18, 6, 25, 88, 19, 804, 18, 94);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (91, 557984653, 'Sigourney Broli', 5, 9, 25, 63, 32, 317, 73, 53);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (92, 594612796, 'Raymond Briscoe', 8, 45, 20, 4, 44, 225, 67, 46);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (93, 585475987, 'Rhona Chaykin', 14, 11, 20, 12, 27, 518, 51, 63);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (94, 562152344, 'Wade Heron', 11, 40, 15.9, 67, 23, 396, 74, 74);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (95, 535314187, 'Gwyneth McCabe', 3, 27, 50, 87, 30, 560, 56, 99);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (96, 556811953, 'Pamela Cervine', 1, 32, 10.9, 86, 8, 243, 89, 9);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (97, 554525782, 'Rickie Clinton', 7, 29, 10.9, 48, 14, 590, 84, 8);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (98, 552275175, 'Treat Heatherly', 10, 31, 5.9, 85, 42, 165, 20, 34);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (99, 555335259, 'Martha Weston', 4, 42, 5.9, 34, 1, 764, 83, 50);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (100, 567264768, 'Daryl Sample', 9, 33, 5.9, 82, 15, 320, 57, 18);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (101, 527813425, 'Kelly Delta', 20, 3, 15.9, 71, 9, 573, 34, 17);
commit;
prompt 100 records committed...
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (102, 553612298, 'Keanu Brothers', 2, 47, 25, 19, 49, 519, 77, 67);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (103, 534139788, 'Shannyn Cusack', 5, 21, 10.9, 2, 27, 329, 19, 95);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (104, 569534544, 'Curt Sanchez', 1, 22, 5.9, 31, 30, 629, 17, 85);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (105, 535726552, 'Stanley Palmint', 3, 1, 50, 47, 35, 854, 78, 7);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (106, 576793874, 'Rebeka Foxx', 19, 21, 25, 50, 23, 675, 97, 74);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (107, 525182946, 'Don Apple', 6, 6, 50, 92, 19, 661, 20, 30);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (108, 562255279, 'Alfred Brolin', 9, 47, 20, 76, 18, 53, 95, 88);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (109, 516832188, 'Juan Blackmore', 1, 7, 50, 66, 44, 182, 55, 85);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (110, 513347416, 'Ethan Nicholas', 7, 39, 20, 79, 29, 531, 11, 96);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (111, 566588441, 'Laurie Coburn', 0, 3, 10.9, 60, 36, 829, 48, 36);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (112, 566362454, 'Dabney Diaz', 16, 38, 20, 91, 5, 962, 98, 54);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (113, 563197685, 'Joseph Willis', 4, 12, 10.9, 87, 20, 962, 14, 31);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (114, 586496263, 'Trey Ammons', 2, 40, 50, 18, 1, 866, 18, 75);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (115, 548726467, 'Sheena Conway', 1, 8, 20, 98, 44, 17, 7, 91);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (116, 528331388, 'Taylor Leoni', 17, 30, 10.9, 84, 4, 326, 61, 15);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (117, 582448787, 'Mekhi Bacharach', 17, 3, 20, 3, 7, 381, 75, 88);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (118, 556262237, 'Joan Wood', 2, 35, 10.9, 64, 26, 846, 41, 36);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (119, 527874715, 'Jean-Luc Franci', 2, 24, 5.9, 47, 46, 796, 76, 38);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (120, 532584467, 'Caroline Loeb', 9, 16, 50, 48, 19, 207, 14, 26);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (121, 567744917, 'Jessica Loring', 12, 42, 15.9, 36, 8, 432, 38, 35);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (122, 589125825, 'Arnold Henrikse', 19, 10, 20, 53, 42, 811, 97, 48);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (123, 514543235, 'Morris Martin', 5, 1, 10.9, 36, 27, 816, 25, 88);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (124, 582231232, 'Davy Lithgow', 18, 6, 5.9, 40, 11, 386, 14, 27);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (125, 591847114, 'Miguel Amos', 11, 27, 20, 49, 43, 282, 14, 84);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (126, 577132659, 'Maura Sepulveda', 14, 34, 50, 3, 12, 934, 29, 64);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (127, 547433928, 'Russell McIntyr', 2, 28, 50, 98, 25, 714, 75, 94);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (128, 544468772, 'Lizzy McKean', 7, 6, 25, 98, 16, 305, 24, 58);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (129, 599541893, 'Daryle Church', 2, 22, 50, 30, 22, 852, 51, 70);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (130, 533974157, 'Isaiah Law', 3, 35, 50, 90, 30, 866, 65, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (131, 597473616, 'Mike Rain', 19, 12, 25, 21, 19, 466, 15, 95);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (132, 561264253, 'Xander Rea', 5, 50, 50, 70, 11, 731, 22, 74);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (133, 542274282, 'Kazem Wolf', 10, 27, 50, 74, 12, 424, 72, 20);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (134, 573713246, 'Mae Hawn', 6, 16, 5.9, 21, 34, 535, 80, 47);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (135, 521468338, 'Rebecca Orlando', 18, 25, 50, 82, 40, 839, 1, 32);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (136, 596248289, 'Clay Nolte', 16, 49, 5.9, 68, 43, 98, 95, 86);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (137, 556151416, 'Loreena Dunaway', 11, 24, 20, 95, 12, 692, 37, 5);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (138, 582188635, 'Colleen DeVito', 9, 32, 15.9, 46, 43, 502, 44, 22);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (139, 534186243, 'Ned Baldwin', 17, 21, 15.9, 56, 1, 624, 32, 27);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (140, 573983974, 'Moe Forrest', 17, 41, 50, 43, 17, 389, 93, 13);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (141, 529491462, 'Delroy Brothers', 11, 41, 20, 72, 33, 807, 65, 33);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (142, 589351716, 'Beth Newman', 11, 35, 15.9, 32, 20, 512, 99, 88);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (143, 572857172, 'Treat Crudup', 20, 7, 20, 31, 37, 76, 71, 60);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (144, 522814668, 'Steve Underwood', 14, 32, 5.9, 88, 19, 856, 79, 43);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (145, 511913981, 'Moe Hector', 11, 43, 15.9, 92, 36, 725, 11, 62);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (146, 569718467, 'Jake Gugino', 12, 34, 10.9, 50, 19, 859, 46, 5);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (147, 551315233, 'Robby Sedaka', 16, 25, 15.9, 7, 6, 670, 21, 89);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (148, 541798491, 'Barbara Burrows', 4, 23, 20, 80, 3, 538, 88, 67);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (149, 549571471, 'Seann Bonham', 12, 27, 5.9, 54, 15, 865, 91, 10);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (150, 596816381, 'Suzi Warden', 17, 25, 10.9, 15, 5, 567, 28, 54);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (151, 539244776, 'Lucinda Deejay', 2, 42, 5.9, 77, 37, 173, 64, 94);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (152, 524216318, 'Joaquim Kilmer', 5, 35, 5.9, 47, 22, 596, 100, 59);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (153, 544184236, 'Dabney Carrack', 18, 42, 15.9, 74, 37, 91, 73, 5);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (154, 517266677, 'Casey Olyphant', 10, 27, 10.9, 37, 7, 374, 31, 42);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (155, 556196259, 'Joseph Phillips', 3, 12, 25, 87, 37, 20, 44, 50);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (156, 563769126, 'Jimmie Hyde', 4, 20, 5.9, 70, 24, 454, 9, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (157, 565156672, 'Alex Kweller', 1, 16, 5.9, 58, 38, 988, 23, 13);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (158, 562322114, 'Catherine Rock', 0, 47, 10.9, 15, 39, 541, 80, 81);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (159, 577251257, 'Tea Horizon', 9, 10, 20, 81, 44, 9, 23, 67);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (160, 548732159, 'Rowan Hawn', 13, 14, 10.9, 16, 35, 768, 2, 23);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (161, 583532881, 'Jamie Pony', 16, 8, 20, 58, 14, 477, 98, 33);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (162, 571462615, 'Rob Brandt', 0, 41, 20, 62, 16, 463, 50, 18);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (163, 536672718, 'Loreena Gaynor', 6, 15, 5.9, 24, 39, 310, 75, 68);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (164, 525869845, 'Anne Cruise', 14, 27, 5.9, 97, 14, 187, 49, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (165, 565886128, 'Rupert Kattan', 19, 17, 5.9, 19, 25, 713, 10, 85);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (166, 583182925, 'Kieran Stevens', 10, 16, 25, 57, 28, 100, 79, 39);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (167, 563971998, 'Vern Saxon', 15, 23, 5.9, 8, 12, 779, 52, 24);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (168, 572276475, 'Lucy Whitmore', 2, 33, 10.9, 69, 41, 945, 88, 36);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (169, 587777421, 'Ashley Scheider', 7, 13, 50, 91, 43, 316, 31, 34);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (170, 571138648, 'Red Wood', 20, 26, 15.9, 29, 12, 213, 88, 54);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (171, 596746493, 'Giovanni Bandy', 0, 21, 10.9, 36, 22, 591, 94, 11);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (172, 535887598, 'Jake Carter', 12, 38, 10.9, 53, 30, 254, 33, 31);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (173, 526318687, 'Spike Getty', 7, 30, 15.9, 37, 10, 908, 66, 99);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (174, 588539222, 'Stellan Keen', 19, 44, 15.9, 72, 34, 420, 7, 15);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (175, 538472419, 'Luke Holy', 17, 26, 20, 92, 22, 185, 5, 61);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (176, 528724571, 'Isaiah Tennison', 20, 1, 20, 96, 21, 510, 67, 35);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (177, 528143621, 'Eileen Campbell', 4, 24, 10.9, 18, 47, 962, 78, 96);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (178, 567244315, 'Nora Easton', 19, 45, 10.9, 97, 15, 64, 9, 89);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (179, 562996851, 'Earl Lerner', 19, 36, 10.9, 90, 30, 513, 79, 35);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (180, 519287546, 'Toshiro Vaughan', 15, 36, 25, 58, 1, 323, 63, 49);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (181, 568295835, 'Busta Haysbert', 1, 1, 15.9, 49, 14, 964, 66, 18);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (182, 548386236, 'Lindsey Jolie', 5, 14, 15.9, 7, 22, 882, 46, 58);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (183, 517435217, 'Jarvis Azaria', 5, 6, 50, 4, 4, 618, 84, 13);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (184, 561494772, 'Johnette Isaacs', 6, 7, 10.9, 29, 2, 343, 96, 91);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (185, 562415431, 'Lea Chinlund', 13, 9, 15.9, 55, 25, 886, 5, 82);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (186, 576915577, 'Andrae McLean', 5, 3, 25, 9, 45, 505, 97, 47);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (187, 579234253, 'Alicia Laurie', 20, 35, 5.9, 80, 18, 509, 3, 94);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (188, 598225869, 'Dave Koyana', 16, 22, 50, 81, 26, 907, 64, 5);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (189, 524617926, 'Roger Lattimore', 20, 39, 15.9, 91, 15, 978, 38, 95);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (190, 539736325, 'Terrence Mattha', 17, 24, 5.9, 53, 3, 751, 19, 67);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (191, 554423839, 'Paul Schock', 11, 9, 10.9, 27, 2, 354, 30, 4);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (192, 567652688, 'Swoosie Nivola', 3, 2, 10.9, 52, 2, 506, 23, 24);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (193, 518154666, 'Nathan Singh', 7, 0, 25, 54, 13, 862, 28, 20);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (194, 577429287, 'Gabriel McElhon', 0, 35, 20, 7, 20, 751, 4, 9);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (195, 591129216, 'Julianne Lemmon', 17, 30, 5.9, 92, 18, 987, 24, 35);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (196, 588473627, 'Kid Baez', 6, 6, 50, 56, 17, 46, 20, 53);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (197, 516828284, 'Kenny Sherman', 5, 13, 50, 72, 18, 945, 59, 5);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (198, 557765136, 'Mia McKean', 20, 15, 10.9, 57, 37, 868, 42, 60);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (199, 583917557, 'Jerry Aiken', 12, 42, 5.9, 16, 5, 730, 17, 26);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (200, 523628265, 'Denise Lindo', 6, 36, 15.9, 28, 28, 937, 34, 57);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (201, 547958366, 'Nora Diffie', 10, 3, 25, 73, 18, 150, 7, 67);
commit;
prompt 200 records committed...
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (202, 551447765, 'Robby Williamso', 0, 34, 10.9, 48, 50, 442, 91, 76);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (203, 563425386, 'Mae Kilmer', 7, 28, 5.9, 69, 15, 518, 81, 42);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (204, 512312316, 'Dick Hatchet', 12, 37, 10.9, 2, 50, 992, 27, 18);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (205, 578517666, 'Vanessa Logue', 3, 27, 50, 41, 30, 941, 48, 30);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (206, 542322489, 'Gladys Lipnicki', 4, 7, 25, 44, 24, 338, 56, 24);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (207, 515883993, 'Willie Oates', 5, 33, 10.9, 72, 12, 345, 49, 25);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (208, 529271825, 'Rosco Cruz', 6, 38, 20, 13, 24, 132, 95, 3);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (209, 558527789, 'Ritchie Elwes', 13, 2, 5.9, 46, 29, 687, 41, 63);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (210, 574885778, 'Remy Schreiber', 11, 45, 10.9, 29, 38, 318, 70, 31);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (211, 531726921, 'Gavin Jane', 0, 36, 10.9, 88, 17, 20, 90, 55);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (212, 532616296, 'Garth Bogguss', 13, 34, 20, 42, 9, 906, 31, 58);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (213, 522187644, 'Yaphet Humphrey', 2, 14, 10.9, 58, 33, 313, 56, 46);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (214, 526258254, 'Sissy Ripley', 4, 38, 20, 34, 6, 214, 82, 15);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (215, 536845731, 'Gil Dutton', 15, 47, 25, 11, 8, 234, 48, 36);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (216, 598337178, 'First Colon', 6, 4, 20, 77, 13, 833, 93, 81);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (217, 533128256, 'Derrick Goldber', 14, 25, 10.9, 48, 46, 278, 61, 14);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (218, 598441874, 'Ani Nugent', 9, 40, 10.9, 98, 26, 917, 53, 42);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (219, 536777616, 'Angelina Cross', 14, 27, 25, 30, 24, 584, 46, 24);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (220, 561946752, 'Rowan Mazzello', 20, 44, 20, 63, 7, 745, 89, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (221, 566458357, 'Rose McPherson', 3, 9, 20, 85, 5, 148, 2, 46);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (222, 562948517, 'Rhea Fender', 13, 3, 20, 86, 22, 461, 49, 88);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (223, 511679427, 'Uma Cook', 20, 36, 50, 64, 5, 395, 70, 55);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (224, 564164169, 'Chi Osment', 19, 39, 10.9, 51, 8, 660, 56, 86);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (225, 595323792, 'Bonnie Schiff', 15, 13, 50, 85, 41, 175, 43, 27);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (226, 592242426, 'Trace Berenger', 6, 24, 15.9, 32, 19, 215, 43, 37);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (227, 586746519, 'Marie DeVita', 7, 46, 15.9, 60, 27, 340, 20, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (228, 594426589, 'Rade Diggs', 8, 2, 25, 92, 20, 421, 61, 79);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (229, 573178975, 'Regina Vince', 18, 14, 50, 93, 33, 537, 21, 17);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (230, 512254822, 'Natasha Rundgre', 2, 16, 5.9, 17, 37, 447, 66, 12);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (231, 574674722, 'Talvin Tippe', 6, 4, 15.9, 70, 18, 291, 47, 67);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (233, 569527398, 'Aida von Sydow', 12, 26, 10.9, 32, 34, 185, 90, 89);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (234, 569928365, 'Fred Davidtz', 18, 35, 15.9, 53, 31, 870, 42, 72);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (235, 599485647, 'Oro Wopat', 1, 1, 50, 11, 43, 171, 8, 35);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (236, 549731935, 'Patty Mann', 10, 7, 10.9, 44, 6, 299, 45, 89);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (237, 546874516, 'Horace Loggia', 0, 25, 25, 39, 44, 325, 16, 75);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (238, 575998395, 'Rhona Duschel', 19, 25, 25, 7, 29, 307, 83, 90);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (239, 578475517, 'Leon Cassidy', 6, 27, 25, 93, 5, 570, 75, 53);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (240, 533637172, 'Paul Sweeney', 5, 14, 50, 63, 48, 944, 38, 35);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (241, 572211432, 'Jean O''Donnell', 16, 39, 5.9, 24, 20, 193, 60, 2);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (242, 593549485, 'Garry Keith', 13, 40, 20, 36, 26, 600, 44, 84);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (243, 523616412, 'Aaron Pierce', 12, 26, 5.9, 69, 34, 173, 49, 13);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (244, 579137325, 'Raymond Gilliam', 1, 23, 15.9, 77, 5, 817, 63, 68);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (245, 577788987, 'Raymond Fichtne', 20, 31, 20, 69, 8, 639, 69, 18);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (246, 561146144, 'Howard Foley', 18, 13, 25, 10, 39, 838, 31, 10);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (247, 578444633, 'James Weller', 8, 35, 5.9, 21, 48, 997, 79, 50);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (248, 563293786, 'Jarvis Kershaw', 15, 49, 50, 72, 45, 575, 3, 63);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (249, 524937559, 'Nile MacIsaac', 11, 29, 25, 51, 7, 521, 80, 32);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (250, 579167698, 'Henry Gellar', 13, 11, 25, 13, 14, 892, 73, 86);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (251, 594283874, 'Miguel McIntosh', 12, 19, 20, 76, 41, 453, 89, 8);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (252, 569241931, 'Crispin Wayans', 12, 25, 15.9, 67, 6, 419, 43, 81);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (253, 589538494, 'Maria Barkin', 11, 36, 10.9, 99, 15, 917, 16, 9);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (254, 518931473, 'Pete Bogguss', 13, 36, 25, 27, 30, 265, 49, 25);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (255, 594516127, 'Rhett Logue', 9, 43, 5.9, 53, 8, 196, 12, 36);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (256, 588239362, 'Olga Reeve', 3, 12, 50, 65, 26, 352, 100, 75);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (257, 513924693, 'Julie Pastore', 11, 38, 50, 83, 46, 145, 4, 9);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (258, 529528438, 'Rene Roundtree', 1, 50, 20, 98, 16, 254, 63, 39);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (259, 557349933, 'Udo Bedelia', 10, 32, 10.9, 43, 33, 819, 25, 62);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (260, 546136431, 'Leslie Washingt', 10, 9, 25, 81, 17, 740, 6, 47);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (261, 558973794, 'Maria O''Donnell', 20, 0, 15.9, 34, 28, 594, 90, 5);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (262, 552761142, 'Todd Wincott', 6, 22, 25, 79, 12, 424, 87, 30);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (263, 555335175, 'Demi Drive', 11, 33, 10.9, 18, 22, 331, 99, 48);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (264, 524624559, 'Lance Lithgow', 15, 1, 50, 54, 41, 202, 47, 30);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (265, 526681237, 'Chazz Secada', 16, 3, 25, 89, 32, 378, 58, 75);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (266, 597517673, 'Melba Sobieski', 14, 32, 10.9, 59, 37, 399, 50, 39);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (267, 514726578, 'Malcolm Saxon', 10, 0, 15.9, 72, 1, 467, 46, 99);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (268, 545313257, 'Mary-Louise Sch', 17, 0, 20, 41, 43, 795, 64, 67);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (269, 512933534, 'Toni Field', 17, 21, 50, 83, 26, 788, 68, 70);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (270, 554759811, 'Rosanna Harriso', 11, 42, 25, 73, 12, 955, 93, 23);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (271, 553779899, 'Will Wong', 19, 41, 15.9, 93, 49, 800, 81, 6);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (272, 515787875, 'Jeroen Stamp', 20, 21, 20, 90, 41, 527, 100, 86);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (273, 572914643, 'Derrick Magnuso', 14, 42, 5.9, 52, 3, 566, 81, 71);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (274, 561664354, 'Roscoe Hawn', 1, 33, 50, 87, 34, 439, 70, 55);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (275, 522634941, 'Dylan Byrd', 11, 32, 10.9, 70, 8, 668, 80, 6);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (276, 586327392, 'Dorry McFerrin', 12, 10, 5.9, 96, 5, 168, 14, 33);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (277, 516546254, 'Maura McCready', 1, 20, 20, 83, 1, 990, 12, 14);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (278, 542286931, 'Ali Fender', 6, 12, 15.9, 73, 49, 487, 13, 67);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (279, 572253225, 'Jeremy Crow', 1, 42, 50, 24, 18, 919, 58, 9);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (280, 567338558, 'Loren Rauhofer', 20, 46, 25, 37, 7, 387, 44, 30);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (281, 548688212, 'Teena Matarazzo', 18, 35, 50, 89, 32, 768, 70, 18);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (282, 592981425, 'Taylor Raye', 6, 27, 10.9, 60, 39, 68, 50, 17);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (283, 531847787, 'Spike Williamso', 1, 38, 25, 75, 35, 457, 37, 90);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (284, 592194582, 'Greg Myers', 3, 1, 5.9, 92, 9, 194, 30, 41);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (285, 514754394, 'Billy Rosas', 15, 23, 50, 14, 6, 750, 16, 75);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (286, 584415997, 'Ritchie Bandy', 4, 4, 5.9, 67, 1, 825, 78, 75);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (287, 538634988, 'Kimberly Crimso', 11, 30, 20, 42, 23, 611, 34, 95);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (288, 597393461, 'Melba Roth', 19, 26, 25, 38, 16, 692, 89, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (289, 588994415, 'Hilary Rodrigue', 3, 14, 15.9, 73, 25, 447, 24, 38);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (290, 534386143, 'Boz Henstridge', 7, 50, 25, 18, 35, 748, 100, 82);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (291, 526252149, 'Dennis Evanswoo', 3, 17, 15.9, 69, 27, 315, 49, 88);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (292, 542229249, 'Simon Dillon', 14, 41, 10.9, 36, 22, 154, 55, 36);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (293, 569514746, 'Jeff Williams', 2, 50, 50, 20, 3, 367, 46, 75);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (294, 582291751, 'Angela Wiest', 17, 9, 20, 38, 32, 139, 3, 67);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (295, 559255531, 'Clea Elizabeth', 18, 7, 20, 85, 21, 93, 60, 25);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (296, 578538883, 'Peter Thewlis', 13, 49, 20, 84, 17, 391, 63, 95);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (297, 552178386, 'Gordie Kudrow', 10, 44, 25, 49, 21, 158, 86, 4);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (298, 529152119, 'Charlton Pressl', 9, 7, 15.9, 28, 21, 903, 11, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (299, 559925286, 'Ernest Beals', 7, 44, 15.9, 97, 40, 865, 21, 71);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (300, 593895866, 'Martha Haslam', 14, 13, 50, 69, 42, 457, 99, 95);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (301, 537664693, 'Ann Farrell', 13, 42, 50, 25, 6, 571, 83, 14);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (302, 598526377, 'Casey Calle', 7, 40, 20, 28, 11, 150, 79, 41);
commit;
prompt 300 records committed...
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (303, 599161279, 'Rawlins Vassar', 12, 14, 20, 13, 30, 563, 76, 20);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (304, 539567494, 'Jesus Alston', 18, 49, 50, 83, 50, 651, 4, 94);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (305, 565386323, 'Jeffrey O''Sulli', 20, 6, 10.9, 51, 36, 231, 91, 2);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (306, 554129539, 'Gwyneth Mewes', 9, 37, 15.9, 53, 40, 102, 48, 88);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (307, 584685948, 'Nastassja MacPh', 12, 50, 20, 91, 38, 554, 68, 83);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (308, 565728941, 'Gates Goodall', 7, 31, 50, 34, 20, 831, 31, 68);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (309, 576718291, 'Swoosie Bean', 14, 6, 10.9, 55, 31, 218, 74, 2);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (310, 582772575, 'Wayman Tyler', 17, 44, 50, 14, 33, 319, 65, 55);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (311, 559929171, 'Linda Banderas', 2, 19, 5.9, 30, 23, 887, 59, 67);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (312, 578396213, 'Madeline Purefo', 17, 16, 10.9, 28, 20, 55, 59, 95);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (313, 584484621, 'Maggie Berkeley', 11, 37, 5.9, 25, 11, 465, 4, 4);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (314, 554757622, 'Jonathan Coward', 9, 13, 50, 22, 48, 242, 41, 96);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (315, 553798757, 'Chi MacNeil', 5, 8, 25, 82, 43, 341, 61, 34);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (316, 554157646, 'Kay Kingsley', 19, 39, 20, 42, 32, 509, 71, 96);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (317, 531491998, 'Belinda Wills', 13, 40, 15.9, 56, 43, 969, 66, 59);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (318, 521243398, 'Steve Strong', 14, 15, 25, 86, 2, 710, 88, 12);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (319, 531312179, 'Sheena Akins', 11, 14, 20, 52, 30, 278, 94, 24);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (320, 558334152, 'Don Olyphant', 7, 39, 25, 97, 27, 617, 13, 10);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (321, 546826431, 'Lizzy Isaacs', 2, 41, 25, 61, 26, 375, 41, 83);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (322, 534716523, 'Seann Whitmore', 14, 38, 25, 77, 6, 426, 5, 99);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (323, 539469514, 'Mia Davies', 9, 19, 25, 64, 35, 593, 13, 75);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (324, 543284846, 'Vanessa Hurt', 0, 21, 50, 32, 8, 176, 58, 18);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (325, 571832484, 'Franco Bonnevil', 20, 50, 20, 78, 5, 945, 58, 30);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (326, 541995329, 'Percy Hanley', 3, 40, 10.9, 33, 34, 603, 29, 90);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (327, 521468243, 'Demi Pleasure', 8, 2, 20, 57, 2, 310, 69, 62);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (328, 541312949, 'Chet Phillippe', 17, 40, 25, 57, 31, 330, 77, 11);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (329, 534885691, 'Johnny Fox', 2, 3, 15.9, 25, 43, 507, 40, 30);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (330, 522112323, 'Andrew Janney', 19, 38, 5.9, 45, 22, 876, 37, 7);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (331, 538984678, 'Veruca Barrymor', 1, 37, 10.9, 93, 10, 682, 75, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (332, 531771759, 'Freda Wills', 8, 17, 25, 29, 12, 112, 12, 20);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (333, 554597357, 'Rose Lithgow', 1, 31, 15.9, 79, 32, 540, 28, 2);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (334, 536528891, 'Tobey Zane', 16, 20, 50, 52, 4, 793, 17, 72);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (335, 581621585, 'Adina Snipes', 12, 6, 5.9, 4, 25, 239, 64, 71);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (336, 586283341, 'Martha Apple', 9, 1, 5.9, 72, 23, 132, 25, 38);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (337, 596341946, 'Shelby Rain', 1, 27, 20, 68, 1, 983, 76, 17);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (338, 555788384, 'Wallace Arkin', 5, 13, 5.9, 61, 18, 549, 16, 55);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (339, 513889256, 'Teri Satriani', 19, 0, 5.9, 7, 49, 613, 99, 58);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (340, 583618989, 'Gary Hawn', 9, 9, 5.9, 18, 4, 48, 32, 6);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (341, 525936846, 'Mitchell Barry', 19, 4, 10.9, 81, 44, 731, 95, 63);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (342, 526469312, 'Harold Hingle', 3, 8, 50, 56, 39, 868, 74, 57);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (343, 562439367, 'Geraldine Bacon', 9, 50, 10.9, 61, 44, 188, 5, 21);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (344, 525386286, 'Lupe Snider', 14, 31, 20, 41, 34, 356, 1, 34);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (345, 576178394, 'Sydney Hopper', 2, 39, 20, 5, 21, 930, 4, 70);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (346, 516795721, 'Stewart Keaton', 4, 20, 15.9, 91, 6, 200, 25, 96);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (347, 599362854, 'Nigel Ricci', 5, 5, 20, 42, 41, 558, 89, 62);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (348, 561271654, 'Val King', 0, 2, 5.9, 60, 49, 489, 100, 29);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (350, 515412586, 'Gilberto Del To', 11, 1, 15.9, 65, 11, 222, 50, 72);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (351, 565768251, 'Azucar Downey', 3, 6, 15.9, 60, 19, 803, 84, 10);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (352, 571296968, 'Emma Porter', 15, 49, 10.9, 34, 21, 229, 100, 57);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (353, 579224277, 'Boz Caviezel', 13, 11, 10.9, 5, 20, 47, 66, 64);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (354, 554252956, 'Madeline Nevill', 15, 28, 15.9, 78, 37, 656, 83, 25);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (355, 547179413, 'Taryn Chung', 1, 42, 50, 6, 16, 565, 85, 4);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (356, 539932514, 'Hex Cleary', 15, 26, 50, 26, 29, 432, 44, 90);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (357, 512269687, 'Linda Sarandon', 9, 43, 5.9, 68, 18, 632, 51, 9);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (358, 517551624, 'Darren Larter', 7, 43, 20, 62, 46, 406, 78, 46);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (359, 513853322, 'Burt Barkin', 16, 45, 20, 20, 20, 950, 100, 60);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (360, 526979961, 'Brenda Chandler', 10, 3, 15.9, 61, 45, 64, 57, 83);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (361, 575499179, 'Rosario Statham', 1, 45, 10.9, 17, 7, 297, 36, 32);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (362, 539441123, 'Kate Cummings', 17, 27, 15.9, 8, 26, 995, 33, 1);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (363, 511746532, 'Terrence Gyllen', 20, 35, 15.9, 4, 35, 238, 6, 49);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (364, 532214792, 'Wang Cruise', 6, 40, 25, 58, 13, 549, 30, 54);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (365, 545531454, 'Ossie Sample', 1, 6, 10.9, 54, 12, 440, 74, 71);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (366, 543221916, 'Gordie Hatfield', 11, 25, 15.9, 58, 40, 325, 63, 89);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (367, 572971443, 'Viggo Pacino', 18, 2, 5.9, 60, 27, 397, 5, 75);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (368, 567269622, 'Lily Fierstein', 7, 33, 5.9, 42, 38, 439, 42, 53);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (369, 591693614, 'Percy Young', 20, 5, 5.9, 84, 34, 594, 63, 83);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (370, 599712162, 'Joaquim Dunn', 13, 43, 10.9, 85, 23, 740, 41, 59);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (371, 554918446, 'Ivan Caldwell', 7, 24, 5.9, 55, 46, 428, 95, 20);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (372, 522159878, 'Collin Stuermer', 0, 44, 15.9, 44, 26, 378, 56, 71);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (373, 573899218, 'France Rhys-Dav', 2, 30, 50, 80, 48, 417, 48, 50);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (374, 515166875, 'Cate Stewart', 3, 5, 20, 60, 38, 416, 80, 31);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (375, 556391184, 'Brad Gill', 17, 29, 10.9, 26, 28, 502, 44, 18);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (376, 555121976, 'Fred Puckett', 6, 17, 5.9, 74, 26, 397, 55, 75);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (377, 536149867, 'Dianne Li', 17, 6, 20, 66, 34, 490, 16, 8);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (378, 549626688, 'Rawlins Blair', 3, 40, 20, 90, 33, 44, 88, 36);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (379, 543819456, 'Rachel Mueller-', 5, 50, 20, 7, 24, 924, 64, 41);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (380, 597686356, 'Kelli Ojeda', 3, 39, 10.9, 84, 27, 507, 46, 7);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (381, 592692749, 'Geggy Hughes', 6, 5, 25, 45, 33, 940, 5, 20);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (382, 563372246, 'Rhea Holiday', 16, 11, 15.9, 45, 50, 841, 64, 35);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (384, 571623487, 'Ty Aglukark', 16, 42, 15.9, 2, 4, 620, 17, 48);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (385, 515179889, 'Sam Davis', 0, 45, 5.9, 52, 27, 860, 23, 20);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (386, 546642815, 'Carrie-Anne Red', 13, 36, 50, 59, 39, 873, 62, 11);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (387, 539941141, 'Julia Soul', 1, 37, 20, 61, 21, 134, 34, 19);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (388, 582435665, 'Jason Tippe', 8, 37, 10.9, 58, 24, 764, 44, 20);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (389, 588791695, 'Dan Horizon', 15, 29, 15.9, 39, 8, 557, 61, 59);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (390, 544168964, 'Ian Paul', 18, 0, 25, 24, 25, 675, 6, 30);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (391, 556874561, 'Lucy Gryner', 2, 30, 15.9, 29, 14, 200, 52, 54);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (392, 599766526, 'Angelina Irons', 14, 7, 25, 83, 1, 627, 67, 74);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (393, 571318132, 'Moe Soda', 19, 34, 20, 88, 12, 595, 22, 70);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (394, 526188196, 'Kasey Torino', 17, 7, 15.9, 48, 26, 204, 57, 46);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (395, 555141166, 'Mykelti Mitchel', 18, 31, 15.9, 84, 11, 775, 82, 13);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (396, 546775285, 'Gailard MacIsaa', 8, 17, 15.9, 96, 3, 404, 7, 50);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (397, 548886843, 'Cesar Horton', 20, 28, 25, 63, 43, 670, 58, 7);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (398, 528796476, 'Ryan Dalley', 5, 22, 5.9, 13, 25, 89, 47, 94);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (399, 534355648, 'Rade Imperioli', 13, 3, 5.9, 35, 23, 651, 85, 38);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (400, 571253628, 'Andrea Robards', 3, 37, 50, 62, 11, 957, 54, 88);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (401, 542376218, 'Tamala Fox', 14, 38, 15.9, 87, 15, 282, 100, 48);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (402, 551219439, 'Burton Holm', 15, 1, 50, 99, 48, 203, 59, 20);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (403, 547135855, 'Joe Snider', 20, 31, 5.9, 35, 40, 565, 82, 85);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (404, 512679999, 'Jennifer Rydell', 1, 37, 50, 47, 42, 295, 100, 72);
commit;
prompt 400 records committed...
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (405, 569136973, 'Madeline Hackma', 13, 0, 50, 50, 32, 227, 13, 38);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (406, 516784112, 'Millie Bosco', 10, 24, 5.9, 1, 42, 540, 71, 11);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (407, 544415635, 'Nastassja Gunto', 6, 10, 25, 38, 16, 852, 68, 76);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (408, 594755352, 'Daniel Shannon', 15, 39, 15.9, 35, 7, 356, 32, 49);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (409, 516964358, 'Chely Swank', 1, 8, 10.9, 54, 36, 899, 38, 24);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (410, 565957318, 'Halle Arkenston', 15, 45, 20, 15, 5, 415, 48, 36);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (411, 584185498, 'Hex Quaid', 4, 24, 50, 77, 19, 902, 51, 9);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (412, 576493317, 'Rodney Romijn-S', 0, 43, 50, 46, 40, 109, 86, 50);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (413, 566133837, 'Philip Nicholso', 16, 47, 50, 81, 42, 407, 57, 37);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (414, 511664272, 'Brooke Murphy', 10, 12, 5.9, 18, 24, 961, 98, 60);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (415, 543617395, 'Gabriel Scaggs', 11, 9, 10.9, 76, 13, 430, 80, 93);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (416, 527637449, 'Lizzy Devine', 0, 12, 15.9, 19, 17, 964, 50, 22);
insert into PACKAGES (idpackege, deliveryphone, recipientname, weight, packsize, price, buildingnumber, housenumber, id_sender, wid, streetnum)
values (417, 535719688, 'Vin Goldblum', 13, 16, 20, 1, 46, 499, 53, 43);
commit;
prompt 413 records loaded
prompt Loading TRACKINGSHIPMENTS...
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (1, to_date('30-12-1899 01:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 01:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 01:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 01:00:00', 'dd-mm-yyyy hh24:mi:ss'), 34, 1);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (2, to_date('30-12-1899 02:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 02:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 02:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 02:00:00', 'dd-mm-yyyy hh24:mi:ss'), 35, 2);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (3, to_date('30-12-1899 03:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 03:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 03:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 03:00:00', 'dd-mm-yyyy hh24:mi:ss'), 36, 3);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (4, to_date('30-12-1899 04:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 04:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 04:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 04:00:00', 'dd-mm-yyyy hh24:mi:ss'), 34, 4);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (5, to_date('30-12-1899 05:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 05:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 05:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 05:00:00', 'dd-mm-yyyy hh24:mi:ss'), 33, 5);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (6, to_date('30-12-1899 06:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 06:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 06:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 06:00:00', 'dd-mm-yyyy hh24:mi:ss'), 34, 6);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (7, to_date('30-12-1899 07:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 07:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 07:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 07:00:00', 'dd-mm-yyyy hh24:mi:ss'), 34, 7);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (8, to_date('30-12-1899 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), 34, 8);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (9, to_date('30-12-1899 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), 35, 9);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (10, to_date('30-12-1899 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), 33, 10);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (11, to_date('30-12-1899 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), 33, 11);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (12, to_date('30-12-1899 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), 34, 12);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (13, to_date('30-12-1899 13:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 13:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 13:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 13:00:00', 'dd-mm-yyyy hh24:mi:ss'), 34, 13);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (14, to_date('30-12-1899 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), 34, 14);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (15, to_date('30-12-1899 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), 33, 15);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (16, to_date('30-12-1899 16:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 16:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 16:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 16:00:00', 'dd-mm-yyyy hh24:mi:ss'), 33, 16);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (17, to_date('30-12-1899 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), 35, 17);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (18, to_date('30-12-1899 18:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 18:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 18:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 18:00:00', 'dd-mm-yyyy hh24:mi:ss'), 35, 18);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (19, to_date('30-12-1899 19:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 19:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 19:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 19:00:00', 'dd-mm-yyyy hh24:mi:ss'), 35, 19);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (20, to_date('30-12-1899 20:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 20:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 20:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 20:00:00', 'dd-mm-yyyy hh24:mi:ss'), 33, 20);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (21, to_date('30-12-1899 21:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 21:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 21:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 21:00:00', 'dd-mm-yyyy hh24:mi:ss'), 33, 21);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (22, to_date('30-12-1899 22:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 22:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 22:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 22:00:00', 'dd-mm-yyyy hh24:mi:ss'), 33, 22);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (23, to_date('30-12-1899 23:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 23:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 23:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-12-1899 23:00:00', 'dd-mm-yyyy hh24:mi:ss'), 35, 23);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (24, to_date('05-11-2022', 'dd-mm-yyyy'), to_date('13-02-2023', 'dd-mm-yyyy'), to_date('23-11-2023', 'dd-mm-yyyy'), to_date('11-11-2024', 'dd-mm-yyyy'), 36, 1);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (25, to_date('25-01-2022', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), to_date('05-10-2023', 'dd-mm-yyyy'), to_date('02-02-2024', 'dd-mm-yyyy'), 36, 2);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (26, to_date('04-08-2022', 'dd-mm-yyyy'), to_date('26-04-2023', 'dd-mm-yyyy'), to_date('07-06-2023', 'dd-mm-yyyy'), to_date('09-01-2024', 'dd-mm-yyyy'), 36, 3);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (27, to_date('11-08-2022', 'dd-mm-yyyy'), to_date('25-04-2023', 'dd-mm-yyyy'), to_date('15-11-2023', 'dd-mm-yyyy'), to_date('03-07-2024', 'dd-mm-yyyy'), 36, 4);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (28, to_date('24-02-2022', 'dd-mm-yyyy'), to_date('20-02-2023', 'dd-mm-yyyy'), to_date('04-11-2023', 'dd-mm-yyyy'), to_date('12-01-2025', 'dd-mm-yyyy'), 33, 5);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (29, to_date('18-05-2022', 'dd-mm-yyyy'), to_date('28-01-2023', 'dd-mm-yyyy'), to_date('04-07-2023', 'dd-mm-yyyy'), to_date('17-06-2024', 'dd-mm-yyyy'), 36, 6);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (30, to_date('06-11-2022', 'dd-mm-yyyy'), to_date('06-04-2023', 'dd-mm-yyyy'), to_date('14-05-2023', 'dd-mm-yyyy'), to_date('27-10-2024', 'dd-mm-yyyy'), 36, 7);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (31, to_date('23-11-2022', 'dd-mm-yyyy'), to_date('26-03-2023', 'dd-mm-yyyy'), to_date('04-10-2023', 'dd-mm-yyyy'), to_date('02-05-2024', 'dd-mm-yyyy'), 35, 8);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (32, to_date('26-03-2022', 'dd-mm-yyyy'), to_date('24-03-2023', 'dd-mm-yyyy'), to_date('30-06-2023', 'dd-mm-yyyy'), to_date('12-02-2025', 'dd-mm-yyyy'), 35, 9);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (33, to_date('28-03-2022', 'dd-mm-yyyy'), to_date('17-02-2023', 'dd-mm-yyyy'), to_date('03-09-2023', 'dd-mm-yyyy'), to_date('12-07-2024', 'dd-mm-yyyy'), 35, 10);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (34, to_date('22-04-2022', 'dd-mm-yyyy'), to_date('06-02-2023', 'dd-mm-yyyy'), to_date('22-08-2023', 'dd-mm-yyyy'), to_date('03-07-2024', 'dd-mm-yyyy'), 36, 11);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (35, to_date('27-12-2022', 'dd-mm-yyyy'), to_date('25-02-2023', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'), to_date('09-07-2024', 'dd-mm-yyyy'), 33, 12);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (36, to_date('04-07-2022', 'dd-mm-yyyy'), to_date('28-02-2023', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'), to_date('16-08-2024', 'dd-mm-yyyy'), 35, 13);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (37, to_date('06-12-2022', 'dd-mm-yyyy'), to_date('20-02-2023', 'dd-mm-yyyy'), to_date('21-10-2023', 'dd-mm-yyyy'), to_date('23-04-2024', 'dd-mm-yyyy'), 35, 14);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (38, to_date('25-02-2022', 'dd-mm-yyyy'), to_date('24-01-2023', 'dd-mm-yyyy'), to_date('02-07-2023', 'dd-mm-yyyy'), to_date('22-10-2024', 'dd-mm-yyyy'), 35, 15);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (39, to_date('12-08-2022', 'dd-mm-yyyy'), to_date('28-03-2023', 'dd-mm-yyyy'), to_date('06-08-2023', 'dd-mm-yyyy'), to_date('22-03-2024', 'dd-mm-yyyy'), 35, 16);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (40, to_date('03-08-2022', 'dd-mm-yyyy'), to_date('05-02-2023', 'dd-mm-yyyy'), to_date('18-07-2023', 'dd-mm-yyyy'), to_date('21-11-2024', 'dd-mm-yyyy'), 33, 17);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (41, to_date('10-07-2022', 'dd-mm-yyyy'), to_date('20-02-2023', 'dd-mm-yyyy'), to_date('26-06-2023', 'dd-mm-yyyy'), to_date('13-10-2024', 'dd-mm-yyyy'), 35, 18);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (42, to_date('21-06-2022', 'dd-mm-yyyy'), to_date('19-04-2023', 'dd-mm-yyyy'), to_date('03-10-2023', 'dd-mm-yyyy'), to_date('01-05-2025', 'dd-mm-yyyy'), 36, 19);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (43, to_date('18-10-2022', 'dd-mm-yyyy'), to_date('28-01-2023', 'dd-mm-yyyy'), to_date('21-08-2023', 'dd-mm-yyyy'), to_date('02-05-2025', 'dd-mm-yyyy'), 34, 20);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (44, to_date('06-02-2022', 'dd-mm-yyyy'), to_date('25-02-2023', 'dd-mm-yyyy'), to_date('30-10-2023', 'dd-mm-yyyy'), to_date('18-01-2025', 'dd-mm-yyyy'), 34, 21);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (45, to_date('27-04-2022', 'dd-mm-yyyy'), to_date('11-02-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), 35, 22);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (46, to_date('31-12-2022', 'dd-mm-yyyy'), to_date('25-03-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), 36, 23);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (47, to_date('23-09-2022', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'), to_date('03-08-2024', 'dd-mm-yyyy'), 36, 24);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (48, to_date('24-12-2022', 'dd-mm-yyyy'), to_date('12-02-2023', 'dd-mm-yyyy'), to_date('07-05-2023', 'dd-mm-yyyy'), to_date('11-05-2025', 'dd-mm-yyyy'), 34, 25);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (49, to_date('30-05-2022', 'dd-mm-yyyy'), to_date('16-01-2023', 'dd-mm-yyyy'), to_date('10-06-2023', 'dd-mm-yyyy'), to_date('22-01-2024', 'dd-mm-yyyy'), 36, 26);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (50, to_date('03-09-2022', 'dd-mm-yyyy'), to_date('01-03-2023', 'dd-mm-yyyy'), to_date('03-08-2023', 'dd-mm-yyyy'), to_date('21-05-2025', 'dd-mm-yyyy'), 36, 27);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (51, to_date('01-01-2022', 'dd-mm-yyyy'), to_date('05-04-2023', 'dd-mm-yyyy'), to_date('16-08-2023', 'dd-mm-yyyy'), to_date('13-06-2024', 'dd-mm-yyyy'), 34, 28);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (52, to_date('02-05-2022', 'dd-mm-yyyy'), to_date('11-02-2023', 'dd-mm-yyyy'), to_date('28-12-2023', 'dd-mm-yyyy'), to_date('04-03-2024', 'dd-mm-yyyy'), 35, 29);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (53, to_date('23-03-2022', 'dd-mm-yyyy'), to_date('16-04-2023', 'dd-mm-yyyy'), to_date('06-08-2023', 'dd-mm-yyyy'), to_date('22-06-2024', 'dd-mm-yyyy'), 33, 30);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (54, to_date('22-01-2022', 'dd-mm-yyyy'), to_date('30-01-2023', 'dd-mm-yyyy'), to_date('31-07-2023', 'dd-mm-yyyy'), to_date('14-05-2025', 'dd-mm-yyyy'), 33, 31);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (55, to_date('23-05-2022', 'dd-mm-yyyy'), to_date('25-01-2023', 'dd-mm-yyyy'), to_date('01-08-2023', 'dd-mm-yyyy'), to_date('16-08-2024', 'dd-mm-yyyy'), 33, 32);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (57, to_date('14-05-2022', 'dd-mm-yyyy'), to_date('03-03-2023', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'), to_date('20-02-2024', 'dd-mm-yyyy'), 33, 34);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (58, to_date('14-02-2022', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), to_date('12-07-2023', 'dd-mm-yyyy'), to_date('08-12-2024', 'dd-mm-yyyy'), 34, 35);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (59, to_date('02-06-2022', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), to_date('21-12-2023', 'dd-mm-yyyy'), to_date('08-11-2024', 'dd-mm-yyyy'), 35, 36);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (60, to_date('05-04-2022', 'dd-mm-yyyy'), to_date('25-04-2023', 'dd-mm-yyyy'), to_date('11-06-2023', 'dd-mm-yyyy'), to_date('29-06-2024', 'dd-mm-yyyy'), 35, 37);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (61, to_date('21-03-2022', 'dd-mm-yyyy'), to_date('21-01-2023', 'dd-mm-yyyy'), to_date('04-11-2023', 'dd-mm-yyyy'), to_date('29-10-2024', 'dd-mm-yyyy'), 36, 38);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (62, to_date('08-01-2022', 'dd-mm-yyyy'), to_date('17-04-2023', 'dd-mm-yyyy'), to_date('27-06-2023', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'), 33, 39);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (63, to_date('19-06-2022', 'dd-mm-yyyy'), to_date('08-02-2023', 'dd-mm-yyyy'), to_date('27-09-2023', 'dd-mm-yyyy'), to_date('19-03-2025', 'dd-mm-yyyy'), 33, 40);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (64, to_date('15-11-2022', 'dd-mm-yyyy'), to_date('25-02-2023', 'dd-mm-yyyy'), to_date('14-11-2023', 'dd-mm-yyyy'), to_date('12-11-2024', 'dd-mm-yyyy'), 33, 41);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (65, to_date('30-12-2022', 'dd-mm-yyyy'), to_date('05-01-2023', 'dd-mm-yyyy'), to_date('24-08-2023', 'dd-mm-yyyy'), to_date('08-03-2024', 'dd-mm-yyyy'), 35, 42);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (66, to_date('23-10-2022', 'dd-mm-yyyy'), to_date('22-01-2023', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'), to_date('17-07-2024', 'dd-mm-yyyy'), 34, 43);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (67, to_date('18-02-2022', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'), to_date('27-09-2023', 'dd-mm-yyyy'), to_date('09-07-2024', 'dd-mm-yyyy'), 34, 44);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (68, to_date('30-10-2022', 'dd-mm-yyyy'), to_date('20-01-2023', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'), to_date('21-09-2024', 'dd-mm-yyyy'), 36, 45);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (69, to_date('02-05-2022', 'dd-mm-yyyy'), to_date('03-03-2023', 'dd-mm-yyyy'), to_date('10-11-2023', 'dd-mm-yyyy'), to_date('11-01-2024', 'dd-mm-yyyy'), 35, 46);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (70, to_date('10-04-2022', 'dd-mm-yyyy'), to_date('02-02-2023', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'), to_date('20-04-2025', 'dd-mm-yyyy'), 36, 47);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (71, to_date('07-02-2022', 'dd-mm-yyyy'), to_date('12-01-2023', 'dd-mm-yyyy'), to_date('26-06-2023', 'dd-mm-yyyy'), to_date('17-10-2024', 'dd-mm-yyyy'), 35, 48);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (72, to_date('08-10-2022', 'dd-mm-yyyy'), to_date('26-01-2023', 'dd-mm-yyyy'), to_date('26-05-2023', 'dd-mm-yyyy'), to_date('15-06-2024', 'dd-mm-yyyy'), 33, 49);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (73, to_date('06-07-2022', 'dd-mm-yyyy'), to_date('02-01-2023', 'dd-mm-yyyy'), to_date('20-07-2023', 'dd-mm-yyyy'), to_date('09-01-2024', 'dd-mm-yyyy'), 34, 50);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (74, to_date('13-06-2022', 'dd-mm-yyyy'), to_date('15-01-2023', 'dd-mm-yyyy'), to_date('12-10-2023', 'dd-mm-yyyy'), to_date('24-06-2024', 'dd-mm-yyyy'), 34, 1);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (75, to_date('07-10-2022', 'dd-mm-yyyy'), to_date('17-01-2023', 'dd-mm-yyyy'), to_date('12-05-2023', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'), 35, 2);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (76, to_date('16-08-2022', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'), to_date('05-03-2024', 'dd-mm-yyyy'), 36, 3);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (77, to_date('19-09-2022', 'dd-mm-yyyy'), to_date('08-01-2023', 'dd-mm-yyyy'), to_date('09-10-2023', 'dd-mm-yyyy'), to_date('29-08-2024', 'dd-mm-yyyy'), 35, 4);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (78, to_date('20-01-2022', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), to_date('21-12-2023', 'dd-mm-yyyy'), to_date('27-07-2024', 'dd-mm-yyyy'), 34, 5);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (79, to_date('03-03-2022', 'dd-mm-yyyy'), to_date('05-04-2023', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), to_date('27-01-2024', 'dd-mm-yyyy'), 33, 6);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (80, to_date('12-06-2022', 'dd-mm-yyyy'), to_date('15-04-2023', 'dd-mm-yyyy'), to_date('17-11-2023', 'dd-mm-yyyy'), to_date('14-04-2025', 'dd-mm-yyyy'), 34, 7);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (81, to_date('03-03-2022', 'dd-mm-yyyy'), to_date('05-01-2023', 'dd-mm-yyyy'), to_date('16-08-2023', 'dd-mm-yyyy'), to_date('12-11-2024', 'dd-mm-yyyy'), 35, 8);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (82, to_date('02-11-2022', 'dd-mm-yyyy'), to_date('14-02-2023', 'dd-mm-yyyy'), to_date('04-06-2023', 'dd-mm-yyyy'), to_date('23-03-2025', 'dd-mm-yyyy'), 36, 9);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (83, to_date('25-04-2022', 'dd-mm-yyyy'), to_date('12-02-2023', 'dd-mm-yyyy'), to_date('26-09-2023', 'dd-mm-yyyy'), to_date('04-02-2025', 'dd-mm-yyyy'), 33, 10);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (84, to_date('07-11-2022', 'dd-mm-yyyy'), to_date('19-03-2023', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), to_date('19-03-2024', 'dd-mm-yyyy'), 35, 11);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (85, to_date('28-02-2022', 'dd-mm-yyyy'), to_date('17-02-2023', 'dd-mm-yyyy'), to_date('14-11-2023', 'dd-mm-yyyy'), to_date('17-04-2025', 'dd-mm-yyyy'), 36, 12);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (86, to_date('09-05-2022', 'dd-mm-yyyy'), to_date('03-04-2023', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'), to_date('30-11-2024', 'dd-mm-yyyy'), 35, 13);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (87, to_date('13-08-2022', 'dd-mm-yyyy'), to_date('09-04-2023', 'dd-mm-yyyy'), to_date('17-07-2023', 'dd-mm-yyyy'), to_date('14-03-2025', 'dd-mm-yyyy'), 34, 14);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (88, to_date('30-07-2022', 'dd-mm-yyyy'), to_date('22-02-2023', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'), to_date('23-09-2024', 'dd-mm-yyyy'), 36, 15);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (89, to_date('16-09-2022', 'dd-mm-yyyy'), to_date('19-01-2023', 'dd-mm-yyyy'), to_date('31-05-2023', 'dd-mm-yyyy'), to_date('23-10-2024', 'dd-mm-yyyy'), 34, 16);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (90, to_date('20-04-2022', 'dd-mm-yyyy'), to_date('21-01-2023', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'), to_date('16-02-2025', 'dd-mm-yyyy'), 36, 17);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (91, to_date('29-08-2022', 'dd-mm-yyyy'), to_date('07-03-2023', 'dd-mm-yyyy'), to_date('25-06-2023', 'dd-mm-yyyy'), to_date('22-06-2024', 'dd-mm-yyyy'), 33, 18);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (92, to_date('24-02-2022', 'dd-mm-yyyy'), to_date('21-01-2023', 'dd-mm-yyyy'), to_date('02-09-2023', 'dd-mm-yyyy'), to_date('01-04-2025', 'dd-mm-yyyy'), 34, 19);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (93, to_date('01-12-2022', 'dd-mm-yyyy'), to_date('06-02-2023', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), to_date('10-12-2024', 'dd-mm-yyyy'), 35, 20);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (94, to_date('13-06-2022', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), to_date('19-09-2023', 'dd-mm-yyyy'), to_date('18-05-2025', 'dd-mm-yyyy'), 34, 21);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (95, to_date('15-07-2022', 'dd-mm-yyyy'), to_date('01-02-2023', 'dd-mm-yyyy'), to_date('27-08-2023', 'dd-mm-yyyy'), to_date('01-12-2024', 'dd-mm-yyyy'), 35, 22);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (96, to_date('26-04-2022', 'dd-mm-yyyy'), to_date('26-04-2023', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'), to_date('08-06-2024', 'dd-mm-yyyy'), 36, 23);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (97, to_date('08-03-2022', 'dd-mm-yyyy'), to_date('13-04-2023', 'dd-mm-yyyy'), to_date('03-06-2023', 'dd-mm-yyyy'), to_date('02-07-2024', 'dd-mm-yyyy'), 35, 24);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (98, to_date('04-07-2022', 'dd-mm-yyyy'), to_date('10-01-2023', 'dd-mm-yyyy'), to_date('06-05-2023', 'dd-mm-yyyy'), to_date('15-08-2024', 'dd-mm-yyyy'), 34, 25);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (99, to_date('22-02-2022', 'dd-mm-yyyy'), to_date('24-01-2023', 'dd-mm-yyyy'), to_date('28-07-2023', 'dd-mm-yyyy'), to_date('18-05-2025', 'dd-mm-yyyy'), 33, 26);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (100, to_date('04-10-2022', 'dd-mm-yyyy'), to_date('12-04-2023', 'dd-mm-yyyy'), to_date('10-05-2023', 'dd-mm-yyyy'), to_date('17-06-2024', 'dd-mm-yyyy'), 33, 27);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (101, to_date('15-02-2022', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'), to_date('05-09-2024', 'dd-mm-yyyy'), 33, 28);
commit;
prompt 100 records committed...
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (102, to_date('16-12-2022', 'dd-mm-yyyy'), to_date('17-03-2023', 'dd-mm-yyyy'), to_date('23-11-2023', 'dd-mm-yyyy'), to_date('20-06-2024', 'dd-mm-yyyy'), 34, 29);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (103, to_date('11-04-2022', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), to_date('02-07-2023', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), 34, 30);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (104, to_date('20-12-2022', 'dd-mm-yyyy'), to_date('15-02-2023', 'dd-mm-yyyy'), to_date('04-10-2023', 'dd-mm-yyyy'), to_date('27-04-2025', 'dd-mm-yyyy'), 36, 31);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (105, to_date('08-02-2022', 'dd-mm-yyyy'), to_date('11-03-2023', 'dd-mm-yyyy'), to_date('08-12-2023', 'dd-mm-yyyy'), to_date('13-03-2024', 'dd-mm-yyyy'), 34, 32);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (107, to_date('23-05-2022', 'dd-mm-yyyy'), to_date('06-01-2023', 'dd-mm-yyyy'), to_date('23-10-2023', 'dd-mm-yyyy'), to_date('04-08-2024', 'dd-mm-yyyy'), 35, 34);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (108, to_date('05-07-2022', 'dd-mm-yyyy'), to_date('06-01-2023', 'dd-mm-yyyy'), to_date('08-11-2023', 'dd-mm-yyyy'), to_date('23-10-2024', 'dd-mm-yyyy'), 36, 35);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (109, to_date('28-05-2022', 'dd-mm-yyyy'), to_date('02-01-2023', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'), to_date('24-01-2025', 'dd-mm-yyyy'), 36, 36);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (110, to_date('12-12-2022', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), to_date('26-06-2023', 'dd-mm-yyyy'), to_date('14-12-2024', 'dd-mm-yyyy'), 36, 37);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (111, to_date('14-05-2022', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'), to_date('07-08-2024', 'dd-mm-yyyy'), 34, 38);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (112, to_date('02-01-2022', 'dd-mm-yyyy'), to_date('02-03-2023', 'dd-mm-yyyy'), to_date('27-05-2023', 'dd-mm-yyyy'), to_date('31-03-2025', 'dd-mm-yyyy'), 35, 39);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (113, to_date('17-06-2022', 'dd-mm-yyyy'), to_date('13-02-2023', 'dd-mm-yyyy'), to_date('09-08-2023', 'dd-mm-yyyy'), to_date('04-01-2025', 'dd-mm-yyyy'), 35, 40);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (114, to_date('10-07-2022', 'dd-mm-yyyy'), to_date('18-01-2023', 'dd-mm-yyyy'), to_date('14-05-2023', 'dd-mm-yyyy'), to_date('23-05-2025', 'dd-mm-yyyy'), 36, 41);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (115, to_date('07-09-2022', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), to_date('16-09-2023', 'dd-mm-yyyy'), to_date('06-10-2024', 'dd-mm-yyyy'), 33, 42);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (116, to_date('14-08-2022', 'dd-mm-yyyy'), to_date('10-01-2023', 'dd-mm-yyyy'), to_date('24-09-2023', 'dd-mm-yyyy'), to_date('18-06-2024', 'dd-mm-yyyy'), 33, 43);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (117, to_date('03-10-2022', 'dd-mm-yyyy'), to_date('29-03-2023', 'dd-mm-yyyy'), to_date('22-11-2023', 'dd-mm-yyyy'), to_date('12-11-2024', 'dd-mm-yyyy'), 35, 44);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (118, to_date('10-01-2022', 'dd-mm-yyyy'), to_date('29-04-2023', 'dd-mm-yyyy'), to_date('23-05-2023', 'dd-mm-yyyy'), to_date('09-09-2024', 'dd-mm-yyyy'), 36, 45);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (119, to_date('18-10-2022', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'), to_date('18-10-2023', 'dd-mm-yyyy'), to_date('27-01-2025', 'dd-mm-yyyy'), 33, 46);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (120, to_date('12-11-2022', 'dd-mm-yyyy'), to_date('12-01-2023', 'dd-mm-yyyy'), to_date('07-06-2023', 'dd-mm-yyyy'), to_date('29-01-2025', 'dd-mm-yyyy'), 35, 47);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (121, to_date('22-03-2022', 'dd-mm-yyyy'), to_date('12-03-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), to_date('07-11-2024', 'dd-mm-yyyy'), 36, 48);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (122, to_date('01-04-2022', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'), to_date('22-08-2023', 'dd-mm-yyyy'), to_date('15-08-2024', 'dd-mm-yyyy'), 35, 49);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (123, to_date('26-08-2022', 'dd-mm-yyyy'), to_date('26-01-2023', 'dd-mm-yyyy'), to_date('08-12-2023', 'dd-mm-yyyy'), to_date('08-03-2024', 'dd-mm-yyyy'), 36, 50);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (124, to_date('01-01-2022', 'dd-mm-yyyy'), to_date('16-04-2023', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), to_date('27-10-2024', 'dd-mm-yyyy'), 33, 51);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (125, to_date('05-04-2022', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), to_date('27-05-2023', 'dd-mm-yyyy'), to_date('01-10-2024', 'dd-mm-yyyy'), 34, 52);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (126, to_date('06-07-2022', 'dd-mm-yyyy'), to_date('16-01-2023', 'dd-mm-yyyy'), to_date('29-05-2023', 'dd-mm-yyyy'), to_date('25-05-2025', 'dd-mm-yyyy'), 33, 53);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (127, to_date('11-08-2022', 'dd-mm-yyyy'), to_date('23-02-2023', 'dd-mm-yyyy'), to_date('01-12-2023', 'dd-mm-yyyy'), to_date('31-12-2024', 'dd-mm-yyyy'), 35, 54);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (128, to_date('01-05-2022', 'dd-mm-yyyy'), to_date('19-03-2023', 'dd-mm-yyyy'), to_date('03-07-2023', 'dd-mm-yyyy'), to_date('12-01-2024', 'dd-mm-yyyy'), 35, 55);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (129, to_date('26-09-2022', 'dd-mm-yyyy'), to_date('28-03-2023', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'), to_date('30-12-2024', 'dd-mm-yyyy'), 35, 56);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (130, to_date('17-05-2022', 'dd-mm-yyyy'), to_date('26-03-2023', 'dd-mm-yyyy'), to_date('17-07-2023', 'dd-mm-yyyy'), to_date('27-12-2024', 'dd-mm-yyyy'), 36, 57);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (131, to_date('04-04-2022', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), to_date('04-08-2023', 'dd-mm-yyyy'), to_date('28-10-2024', 'dd-mm-yyyy'), 34, 58);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (132, to_date('10-03-2022', 'dd-mm-yyyy'), to_date('25-02-2023', 'dd-mm-yyyy'), to_date('08-05-2023', 'dd-mm-yyyy'), to_date('10-01-2025', 'dd-mm-yyyy'), 33, 59);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (133, to_date('03-08-2022', 'dd-mm-yyyy'), to_date('12-04-2023', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'), to_date('18-10-2024', 'dd-mm-yyyy'), 36, 60);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (134, to_date('28-08-2022', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), to_date('17-12-2023', 'dd-mm-yyyy'), to_date('11-05-2024', 'dd-mm-yyyy'), 35, 61);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (135, to_date('22-10-2022', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), to_date('18-05-2023', 'dd-mm-yyyy'), to_date('20-10-2024', 'dd-mm-yyyy'), 35, 62);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (136, to_date('13-06-2022', 'dd-mm-yyyy'), to_date('07-01-2023', 'dd-mm-yyyy'), to_date('09-06-2023', 'dd-mm-yyyy'), to_date('10-03-2025', 'dd-mm-yyyy'), 35, 63);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (137, to_date('12-11-2022', 'dd-mm-yyyy'), to_date('25-01-2023', 'dd-mm-yyyy'), to_date('03-12-2023', 'dd-mm-yyyy'), to_date('22-10-2024', 'dd-mm-yyyy'), 33, 64);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (138, to_date('21-04-2022', 'dd-mm-yyyy'), to_date('27-03-2023', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'), to_date('13-01-2025', 'dd-mm-yyyy'), 34, 65);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (139, to_date('15-02-2022', 'dd-mm-yyyy'), to_date('13-03-2023', 'dd-mm-yyyy'), to_date('28-05-2023', 'dd-mm-yyyy'), to_date('11-02-2025', 'dd-mm-yyyy'), 34, 66);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (140, to_date('09-10-2022', 'dd-mm-yyyy'), to_date('27-01-2023', 'dd-mm-yyyy'), to_date('21-11-2023', 'dd-mm-yyyy'), to_date('08-04-2025', 'dd-mm-yyyy'), 36, 67);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (141, to_date('02-05-2022', 'dd-mm-yyyy'), to_date('30-01-2023', 'dd-mm-yyyy'), to_date('12-10-2023', 'dd-mm-yyyy'), to_date('28-02-2024', 'dd-mm-yyyy'), 36, 68);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (142, to_date('07-12-2022', 'dd-mm-yyyy'), to_date('29-01-2023', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 35, 69);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (143, to_date('27-07-2022', 'dd-mm-yyyy'), to_date('17-01-2023', 'dd-mm-yyyy'), to_date('21-11-2023', 'dd-mm-yyyy'), to_date('30-07-2024', 'dd-mm-yyyy'), 33, 70);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (144, to_date('05-01-2022', 'dd-mm-yyyy'), to_date('03-01-2023', 'dd-mm-yyyy'), to_date('21-05-2023', 'dd-mm-yyyy'), to_date('23-09-2024', 'dd-mm-yyyy'), 35, 71);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (145, to_date('30-12-2022', 'dd-mm-yyyy'), to_date('12-02-2023', 'dd-mm-yyyy'), to_date('02-11-2023', 'dd-mm-yyyy'), to_date('08-04-2024', 'dd-mm-yyyy'), 36, 72);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (146, to_date('26-01-2022', 'dd-mm-yyyy'), to_date('23-02-2023', 'dd-mm-yyyy'), to_date('25-09-2023', 'dd-mm-yyyy'), to_date('30-06-2024', 'dd-mm-yyyy'), 36, 73);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (147, to_date('25-02-2022', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'), to_date('10-06-2023', 'dd-mm-yyyy'), to_date('07-05-2025', 'dd-mm-yyyy'), 35, 74);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (148, to_date('04-06-2022', 'dd-mm-yyyy'), to_date('05-01-2023', 'dd-mm-yyyy'), to_date('22-05-2023', 'dd-mm-yyyy'), to_date('12-12-2024', 'dd-mm-yyyy'), 34, 75);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (149, to_date('24-02-2022', 'dd-mm-yyyy'), to_date('11-01-2023', 'dd-mm-yyyy'), to_date('30-05-2023', 'dd-mm-yyyy'), to_date('04-05-2024', 'dd-mm-yyyy'), 36, 76);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (150, to_date('21-05-2022', 'dd-mm-yyyy'), to_date('16-01-2023', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'), to_date('31-10-2024', 'dd-mm-yyyy'), 36, 77);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (151, to_date('09-10-2022', 'dd-mm-yyyy'), to_date('06-02-2023', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'), 34, 78);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (152, to_date('19-08-2022', 'dd-mm-yyyy'), to_date('15-02-2023', 'dd-mm-yyyy'), to_date('21-05-2023', 'dd-mm-yyyy'), to_date('29-04-2025', 'dd-mm-yyyy'), 34, 79);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (153, to_date('25-10-2022', 'dd-mm-yyyy'), to_date('07-02-2023', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'), to_date('26-06-2024', 'dd-mm-yyyy'), 35, 80);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (154, to_date('25-06-2022', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), to_date('14-07-2023', 'dd-mm-yyyy'), to_date('15-10-2024', 'dd-mm-yyyy'), 36, 81);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (155, to_date('11-06-2022', 'dd-mm-yyyy'), to_date('21-02-2023', 'dd-mm-yyyy'), to_date('08-05-2023', 'dd-mm-yyyy'), to_date('24-10-2024', 'dd-mm-yyyy'), 35, 82);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (156, to_date('01-07-2022', 'dd-mm-yyyy'), to_date('29-01-2023', 'dd-mm-yyyy'), to_date('05-06-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 36, 83);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (157, to_date('10-09-2022', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'), to_date('24-11-2023', 'dd-mm-yyyy'), to_date('06-11-2024', 'dd-mm-yyyy'), 35, 84);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (158, to_date('13-01-2022', 'dd-mm-yyyy'), to_date('16-03-2023', 'dd-mm-yyyy'), to_date('03-10-2023', 'dd-mm-yyyy'), to_date('11-01-2024', 'dd-mm-yyyy'), 35, 85);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (159, to_date('03-11-2022', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'), 36, 86);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (160, to_date('04-05-2022', 'dd-mm-yyyy'), to_date('16-01-2023', 'dd-mm-yyyy'), to_date('05-08-2023', 'dd-mm-yyyy'), to_date('29-10-2024', 'dd-mm-yyyy'), 34, 87);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (161, to_date('04-12-2022', 'dd-mm-yyyy'), to_date('17-01-2023', 'dd-mm-yyyy'), to_date('30-06-2023', 'dd-mm-yyyy'), to_date('18-10-2024', 'dd-mm-yyyy'), 34, 88);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (162, to_date('22-04-2022', 'dd-mm-yyyy'), to_date('06-03-2023', 'dd-mm-yyyy'), to_date('28-05-2023', 'dd-mm-yyyy'), to_date('21-01-2025', 'dd-mm-yyyy'), 36, 89);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (163, to_date('25-07-2022', 'dd-mm-yyyy'), to_date('12-03-2023', 'dd-mm-yyyy'), to_date('10-11-2023', 'dd-mm-yyyy'), to_date('08-08-2024', 'dd-mm-yyyy'), 35, 90);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (164, to_date('25-02-2022', 'dd-mm-yyyy'), to_date('30-01-2023', 'dd-mm-yyyy'), to_date('09-08-2023', 'dd-mm-yyyy'), to_date('10-02-2025', 'dd-mm-yyyy'), 36, 91);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (165, to_date('24-05-2022', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), to_date('04-05-2023', 'dd-mm-yyyy'), to_date('28-03-2025', 'dd-mm-yyyy'), 35, 92);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (166, to_date('13-05-2022', 'dd-mm-yyyy'), to_date('24-01-2023', 'dd-mm-yyyy'), to_date('20-06-2023', 'dd-mm-yyyy'), to_date('12-01-2025', 'dd-mm-yyyy'), 33, 93);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (167, to_date('26-11-2022', 'dd-mm-yyyy'), to_date('17-04-2023', 'dd-mm-yyyy'), to_date('04-12-2023', 'dd-mm-yyyy'), to_date('21-02-2025', 'dd-mm-yyyy'), 33, 94);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (168, to_date('05-10-2022', 'dd-mm-yyyy'), to_date('10-02-2023', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), to_date('17-12-2024', 'dd-mm-yyyy'), 33, 95);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (169, to_date('07-04-2022', 'dd-mm-yyyy'), to_date('13-04-2023', 'dd-mm-yyyy'), to_date('15-05-2023', 'dd-mm-yyyy'), to_date('06-11-2024', 'dd-mm-yyyy'), 36, 96);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (170, to_date('12-07-2022', 'dd-mm-yyyy'), to_date('08-02-2023', 'dd-mm-yyyy'), to_date('11-11-2023', 'dd-mm-yyyy'), to_date('07-12-2024', 'dd-mm-yyyy'), 35, 97);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (171, to_date('05-02-2022', 'dd-mm-yyyy'), to_date('06-02-2023', 'dd-mm-yyyy'), to_date('04-06-2023', 'dd-mm-yyyy'), to_date('28-11-2024', 'dd-mm-yyyy'), 34, 98);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (172, to_date('28-01-2022', 'dd-mm-yyyy'), to_date('27-01-2023', 'dd-mm-yyyy'), to_date('08-05-2023', 'dd-mm-yyyy'), to_date('10-01-2024', 'dd-mm-yyyy'), 36, 99);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (173, to_date('13-01-2022', 'dd-mm-yyyy'), to_date('01-02-2023', 'dd-mm-yyyy'), to_date('02-10-2023', 'dd-mm-yyyy'), to_date('21-02-2025', 'dd-mm-yyyy'), 35, 100);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (174, to_date('06-11-2022', 'dd-mm-yyyy'), to_date('15-04-2023', 'dd-mm-yyyy'), to_date('04-05-2023', 'dd-mm-yyyy'), to_date('11-10-2024', 'dd-mm-yyyy'), 34, 1);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (175, to_date('13-02-2022', 'dd-mm-yyyy'), to_date('14-02-2023', 'dd-mm-yyyy'), to_date('13-09-2023', 'dd-mm-yyyy'), to_date('06-12-2024', 'dd-mm-yyyy'), 36, 2);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (176, to_date('01-11-2022', 'dd-mm-yyyy'), to_date('21-03-2023', 'dd-mm-yyyy'), to_date('04-11-2023', 'dd-mm-yyyy'), to_date('06-12-2024', 'dd-mm-yyyy'), 34, 3);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (177, to_date('16-08-2022', 'dd-mm-yyyy'), to_date('01-01-2023', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'), to_date('18-05-2025', 'dd-mm-yyyy'), 35, 4);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (178, to_date('25-07-2022', 'dd-mm-yyyy'), to_date('18-01-2023', 'dd-mm-yyyy'), to_date('17-06-2023', 'dd-mm-yyyy'), to_date('13-08-2024', 'dd-mm-yyyy'), 35, 5);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (179, to_date('19-11-2022', 'dd-mm-yyyy'), to_date('24-01-2023', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'), to_date('24-05-2025', 'dd-mm-yyyy'), 36, 6);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (180, to_date('02-05-2022', 'dd-mm-yyyy'), to_date('28-03-2023', 'dd-mm-yyyy'), to_date('07-06-2023', 'dd-mm-yyyy'), to_date('04-07-2024', 'dd-mm-yyyy'), 33, 7);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (181, to_date('26-04-2022', 'dd-mm-yyyy'), to_date('01-02-2023', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'), to_date('25-09-2024', 'dd-mm-yyyy'), 35, 8);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (182, to_date('15-03-2022', 'dd-mm-yyyy'), to_date('12-04-2023', 'dd-mm-yyyy'), to_date('03-10-2023', 'dd-mm-yyyy'), to_date('02-06-2024', 'dd-mm-yyyy'), 33, 9);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (183, to_date('26-02-2022', 'dd-mm-yyyy'), to_date('10-01-2023', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'), 34, 10);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (184, to_date('23-09-2022', 'dd-mm-yyyy'), to_date('17-02-2023', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'), to_date('02-05-2024', 'dd-mm-yyyy'), 33, 11);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (185, to_date('31-12-2022', 'dd-mm-yyyy'), to_date('16-03-2023', 'dd-mm-yyyy'), to_date('01-06-2023', 'dd-mm-yyyy'), to_date('20-05-2025', 'dd-mm-yyyy'), 33, 12);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (186, to_date('07-09-2022', 'dd-mm-yyyy'), to_date('01-03-2023', 'dd-mm-yyyy'), to_date('29-12-2023', 'dd-mm-yyyy'), to_date('21-10-2024', 'dd-mm-yyyy'), 34, 13);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (187, to_date('04-11-2022', 'dd-mm-yyyy'), to_date('21-01-2023', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'), to_date('18-12-2024', 'dd-mm-yyyy'), 34, 14);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (188, to_date('29-12-2022', 'dd-mm-yyyy'), to_date('12-03-2023', 'dd-mm-yyyy'), to_date('14-06-2023', 'dd-mm-yyyy'), to_date('19-09-2024', 'dd-mm-yyyy'), 33, 15);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (189, to_date('20-10-2022', 'dd-mm-yyyy'), to_date('10-01-2023', 'dd-mm-yyyy'), to_date('12-12-2023', 'dd-mm-yyyy'), to_date('05-02-2024', 'dd-mm-yyyy'), 36, 16);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (190, to_date('26-07-2022', 'dd-mm-yyyy'), to_date('01-03-2023', 'dd-mm-yyyy'), to_date('30-06-2023', 'dd-mm-yyyy'), to_date('04-11-2024', 'dd-mm-yyyy'), 36, 17);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (191, to_date('09-04-2022', 'dd-mm-yyyy'), to_date('08-04-2023', 'dd-mm-yyyy'), to_date('02-07-2023', 'dd-mm-yyyy'), to_date('29-04-2025', 'dd-mm-yyyy'), 33, 18);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (192, to_date('28-09-2022', 'dd-mm-yyyy'), to_date('25-01-2023', 'dd-mm-yyyy'), to_date('19-11-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 35, 19);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (193, to_date('06-03-2022', 'dd-mm-yyyy'), to_date('08-02-2023', 'dd-mm-yyyy'), to_date('04-09-2023', 'dd-mm-yyyy'), to_date('22-02-2025', 'dd-mm-yyyy'), 36, 20);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (194, to_date('22-06-2022', 'dd-mm-yyyy'), to_date('05-04-2023', 'dd-mm-yyyy'), to_date('01-12-2023', 'dd-mm-yyyy'), to_date('23-09-2024', 'dd-mm-yyyy'), 36, 21);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (195, to_date('18-05-2022', 'dd-mm-yyyy'), to_date('03-04-2023', 'dd-mm-yyyy'), to_date('09-08-2023', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 36, 22);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (196, to_date('19-10-2022', 'dd-mm-yyyy'), to_date('05-01-2023', 'dd-mm-yyyy'), to_date('18-06-2023', 'dd-mm-yyyy'), to_date('20-04-2025', 'dd-mm-yyyy'), 34, 23);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (197, to_date('14-06-2022', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), to_date('17-03-2024', 'dd-mm-yyyy'), 36, 24);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (198, to_date('28-10-2022', 'dd-mm-yyyy'), to_date('17-04-2023', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'), to_date('27-04-2025', 'dd-mm-yyyy'), 33, 25);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (199, to_date('03-10-2022', 'dd-mm-yyyy'), to_date('09-03-2023', 'dd-mm-yyyy'), to_date('17-12-2023', 'dd-mm-yyyy'), to_date('26-03-2025', 'dd-mm-yyyy'), 34, 26);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (200, to_date('03-05-2022', 'dd-mm-yyyy'), to_date('28-01-2023', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), to_date('23-05-2025', 'dd-mm-yyyy'), 33, 27);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (201, to_date('15-05-2022', 'dd-mm-yyyy'), to_date('12-01-2023', 'dd-mm-yyyy'), to_date('18-08-2023', 'dd-mm-yyyy'), to_date('10-08-2024', 'dd-mm-yyyy'), 34, 28);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (202, to_date('11-08-2022', 'dd-mm-yyyy'), to_date('30-01-2023', 'dd-mm-yyyy'), to_date('23-05-2023', 'dd-mm-yyyy'), to_date('05-03-2024', 'dd-mm-yyyy'), 34, 29);
commit;
prompt 200 records committed...
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (203, to_date('06-06-2022', 'dd-mm-yyyy'), to_date('04-03-2023', 'dd-mm-yyyy'), to_date('27-08-2023', 'dd-mm-yyyy'), to_date('25-04-2024', 'dd-mm-yyyy'), 35, 30);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (204, to_date('09-05-2022', 'dd-mm-yyyy'), to_date('03-04-2023', 'dd-mm-yyyy'), to_date('08-07-2023', 'dd-mm-yyyy'), to_date('22-04-2025', 'dd-mm-yyyy'), 34, 31);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (205, to_date('16-03-2022', 'dd-mm-yyyy'), to_date('02-02-2023', 'dd-mm-yyyy'), to_date('10-06-2023', 'dd-mm-yyyy'), to_date('14-11-2024', 'dd-mm-yyyy'), 36, 32);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (207, to_date('10-07-2022', 'dd-mm-yyyy'), to_date('19-02-2023', 'dd-mm-yyyy'), to_date('08-07-2023', 'dd-mm-yyyy'), to_date('27-10-2024', 'dd-mm-yyyy'), 34, 34);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (208, to_date('05-09-2022', 'dd-mm-yyyy'), to_date('17-02-2023', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'), to_date('18-08-2024', 'dd-mm-yyyy'), 33, 35);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (209, to_date('14-03-2022', 'dd-mm-yyyy'), to_date('15-03-2023', 'dd-mm-yyyy'), to_date('20-11-2023', 'dd-mm-yyyy'), to_date('01-08-2024', 'dd-mm-yyyy'), 35, 36);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (210, to_date('04-07-2022', 'dd-mm-yyyy'), to_date('11-03-2023', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'), to_date('27-02-2025', 'dd-mm-yyyy'), 33, 37);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (211, to_date('22-04-2022', 'dd-mm-yyyy'), to_date('05-04-2023', 'dd-mm-yyyy'), to_date('22-10-2023', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'), 33, 38);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (212, to_date('05-11-2022', 'dd-mm-yyyy'), to_date('08-04-2023', 'dd-mm-yyyy'), to_date('13-10-2023', 'dd-mm-yyyy'), to_date('16-09-2024', 'dd-mm-yyyy'), 34, 39);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (213, to_date('28-05-2022', 'dd-mm-yyyy'), to_date('13-03-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), to_date('29-07-2024', 'dd-mm-yyyy'), 35, 40);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (214, to_date('24-08-2022', 'dd-mm-yyyy'), to_date('13-04-2023', 'dd-mm-yyyy'), to_date('27-09-2023', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 35, 41);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (215, to_date('22-03-2022', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), to_date('06-05-2023', 'dd-mm-yyyy'), to_date('27-10-2024', 'dd-mm-yyyy'), 33, 42);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (216, to_date('22-05-2022', 'dd-mm-yyyy'), to_date('30-01-2023', 'dd-mm-yyyy'), to_date('09-09-2023', 'dd-mm-yyyy'), to_date('06-02-2025', 'dd-mm-yyyy'), 36, 43);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (217, to_date('12-03-2022', 'dd-mm-yyyy'), to_date('09-03-2023', 'dd-mm-yyyy'), to_date('13-09-2023', 'dd-mm-yyyy'), to_date('01-06-2024', 'dd-mm-yyyy'), 33, 44);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (218, to_date('17-06-2022', 'dd-mm-yyyy'), to_date('29-03-2023', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), to_date('28-04-2025', 'dd-mm-yyyy'), 36, 45);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (219, to_date('06-11-2022', 'dd-mm-yyyy'), to_date('26-03-2023', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'), 35, 46);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (220, to_date('02-07-2022', 'dd-mm-yyyy'), to_date('14-03-2023', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'), to_date('16-02-2025', 'dd-mm-yyyy'), 36, 47);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (221, to_date('15-01-2022', 'dd-mm-yyyy'), to_date('29-01-2023', 'dd-mm-yyyy'), to_date('10-09-2023', 'dd-mm-yyyy'), to_date('31-08-2024', 'dd-mm-yyyy'), 36, 48);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (222, to_date('19-03-2022', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), to_date('18-10-2023', 'dd-mm-yyyy'), to_date('12-01-2024', 'dd-mm-yyyy'), 36, 49);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (223, to_date('23-12-2022', 'dd-mm-yyyy'), to_date('27-02-2023', 'dd-mm-yyyy'), to_date('28-05-2023', 'dd-mm-yyyy'), to_date('06-05-2025', 'dd-mm-yyyy'), 36, 50);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (224, to_date('13-02-2022', 'dd-mm-yyyy'), to_date('09-04-2023', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'), to_date('02-07-2024', 'dd-mm-yyyy'), 35, 51);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (225, to_date('20-04-2022', 'dd-mm-yyyy'), to_date('12-02-2023', 'dd-mm-yyyy'), to_date('09-12-2023', 'dd-mm-yyyy'), to_date('24-12-2024', 'dd-mm-yyyy'), 35, 52);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (226, to_date('16-02-2022', 'dd-mm-yyyy'), to_date('29-01-2023', 'dd-mm-yyyy'), to_date('12-12-2023', 'dd-mm-yyyy'), to_date('09-01-2024', 'dd-mm-yyyy'), 34, 53);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (227, to_date('09-03-2022', 'dd-mm-yyyy'), to_date('14-04-2023', 'dd-mm-yyyy'), to_date('17-05-2023', 'dd-mm-yyyy'), to_date('01-03-2025', 'dd-mm-yyyy'), 35, 54);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (228, to_date('17-10-2022', 'dd-mm-yyyy'), to_date('20-01-2023', 'dd-mm-yyyy'), to_date('21-09-2023', 'dd-mm-yyyy'), to_date('08-04-2024', 'dd-mm-yyyy'), 35, 55);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (229, to_date('31-01-2022', 'dd-mm-yyyy'), to_date('27-03-2023', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), to_date('11-11-2024', 'dd-mm-yyyy'), 36, 56);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (230, to_date('04-02-2022', 'dd-mm-yyyy'), to_date('28-02-2023', 'dd-mm-yyyy'), to_date('14-05-2023', 'dd-mm-yyyy'), to_date('09-06-2024', 'dd-mm-yyyy'), 36, 57);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (231, to_date('23-08-2022', 'dd-mm-yyyy'), to_date('03-01-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), to_date('22-05-2024', 'dd-mm-yyyy'), 36, 58);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (232, to_date('17-12-2022', 'dd-mm-yyyy'), to_date('12-03-2023', 'dd-mm-yyyy'), to_date('08-05-2023', 'dd-mm-yyyy'), to_date('20-02-2024', 'dd-mm-yyyy'), 35, 59);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (233, to_date('05-07-2022', 'dd-mm-yyyy'), to_date('14-01-2023', 'dd-mm-yyyy'), to_date('20-09-2023', 'dd-mm-yyyy'), to_date('27-05-2024', 'dd-mm-yyyy'), 34, 60);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (234, to_date('18-04-2022', 'dd-mm-yyyy'), to_date('14-01-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), to_date('23-04-2024', 'dd-mm-yyyy'), 33, 61);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (235, to_date('05-01-2022', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'), to_date('04-12-2024', 'dd-mm-yyyy'), 33, 62);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (236, to_date('01-07-2022', 'dd-mm-yyyy'), to_date('10-02-2023', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), to_date('14-03-2025', 'dd-mm-yyyy'), 34, 63);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (237, to_date('10-11-2022', 'dd-mm-yyyy'), to_date('16-04-2023', 'dd-mm-yyyy'), to_date('26-08-2023', 'dd-mm-yyyy'), to_date('11-02-2024', 'dd-mm-yyyy'), 36, 64);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (238, to_date('29-09-2022', 'dd-mm-yyyy'), to_date('08-04-2023', 'dd-mm-yyyy'), to_date('19-06-2023', 'dd-mm-yyyy'), to_date('24-08-2024', 'dd-mm-yyyy'), 35, 65);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (239, to_date('23-08-2022', 'dd-mm-yyyy'), to_date('12-04-2023', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'), to_date('10-03-2025', 'dd-mm-yyyy'), 33, 66);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (240, to_date('15-08-2022', 'dd-mm-yyyy'), to_date('27-02-2023', 'dd-mm-yyyy'), to_date('08-12-2023', 'dd-mm-yyyy'), to_date('04-12-2024', 'dd-mm-yyyy'), 36, 67);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (241, to_date('28-06-2022', 'dd-mm-yyyy'), to_date('02-01-2023', 'dd-mm-yyyy'), to_date('21-06-2023', 'dd-mm-yyyy'), to_date('25-09-2024', 'dd-mm-yyyy'), 34, 68);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (242, to_date('23-12-2022', 'dd-mm-yyyy'), to_date('07-02-2023', 'dd-mm-yyyy'), to_date('13-06-2023', 'dd-mm-yyyy'), to_date('11-03-2025', 'dd-mm-yyyy'), 34, 69);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (243, to_date('25-06-2022', 'dd-mm-yyyy'), to_date('15-02-2023', 'dd-mm-yyyy'), to_date('01-10-2023', 'dd-mm-yyyy'), to_date('27-02-2025', 'dd-mm-yyyy'), 33, 70);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (244, to_date('17-07-2022', 'dd-mm-yyyy'), to_date('07-01-2023', 'dd-mm-yyyy'), to_date('27-05-2023', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'), 33, 71);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (245, to_date('24-06-2022', 'dd-mm-yyyy'), to_date('17-01-2023', 'dd-mm-yyyy'), to_date('09-05-2023', 'dd-mm-yyyy'), to_date('15-05-2025', 'dd-mm-yyyy'), 34, 72);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (246, to_date('16-05-2022', 'dd-mm-yyyy'), to_date('17-02-2023', 'dd-mm-yyyy'), to_date('26-11-2023', 'dd-mm-yyyy'), to_date('03-01-2025', 'dd-mm-yyyy'), 34, 73);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (247, to_date('14-05-2022', 'dd-mm-yyyy'), to_date('05-04-2023', 'dd-mm-yyyy'), to_date('16-12-2023', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), 35, 74);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (248, to_date('12-06-2022', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'), 35, 75);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (249, to_date('05-05-2022', 'dd-mm-yyyy'), to_date('11-04-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), to_date('11-05-2024', 'dd-mm-yyyy'), 35, 76);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (250, to_date('26-10-2022', 'dd-mm-yyyy'), to_date('31-03-2023', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'), to_date('12-03-2025', 'dd-mm-yyyy'), 36, 77);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (251, to_date('14-08-2022', 'dd-mm-yyyy'), to_date('14-04-2023', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'), to_date('29-07-2024', 'dd-mm-yyyy'), 33, 78);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (252, to_date('06-09-2022', 'dd-mm-yyyy'), to_date('22-03-2023', 'dd-mm-yyyy'), to_date('26-06-2023', 'dd-mm-yyyy'), to_date('20-10-2024', 'dd-mm-yyyy'), 35, 79);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (253, to_date('15-05-2022', 'dd-mm-yyyy'), to_date('25-04-2023', 'dd-mm-yyyy'), to_date('09-09-2023', 'dd-mm-yyyy'), to_date('24-09-2024', 'dd-mm-yyyy'), 33, 80);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (254, to_date('05-10-2022', 'dd-mm-yyyy'), to_date('04-03-2023', 'dd-mm-yyyy'), to_date('24-06-2023', 'dd-mm-yyyy'), to_date('15-01-2024', 'dd-mm-yyyy'), 36, 81);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (255, to_date('14-02-2022', 'dd-mm-yyyy'), to_date('09-02-2023', 'dd-mm-yyyy'), to_date('03-11-2023', 'dd-mm-yyyy'), to_date('08-07-2024', 'dd-mm-yyyy'), 35, 82);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (256, to_date('02-04-2022', 'dd-mm-yyyy'), to_date('30-04-2023', 'dd-mm-yyyy'), to_date('03-09-2023', 'dd-mm-yyyy'), to_date('04-06-2024', 'dd-mm-yyyy'), 33, 83);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (257, to_date('13-05-2022', 'dd-mm-yyyy'), to_date('29-04-2023', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'), to_date('22-02-2024', 'dd-mm-yyyy'), 33, 84);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (258, to_date('20-10-2022', 'dd-mm-yyyy'), to_date('16-04-2023', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), to_date('30-07-2024', 'dd-mm-yyyy'), 35, 85);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (259, to_date('22-04-2022', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), to_date('20-09-2023', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), 36, 86);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (260, to_date('25-12-2022', 'dd-mm-yyyy'), to_date('23-02-2023', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'), to_date('18-10-2024', 'dd-mm-yyyy'), 35, 87);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (261, to_date('29-10-2022', 'dd-mm-yyyy'), to_date('30-03-2023', 'dd-mm-yyyy'), to_date('28-09-2023', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), 33, 88);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (262, to_date('24-05-2022', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), to_date('13-05-2023', 'dd-mm-yyyy'), to_date('23-07-2024', 'dd-mm-yyyy'), 33, 89);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (263, to_date('03-09-2022', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), to_date('06-08-2023', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 36, 90);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (264, to_date('17-12-2022', 'dd-mm-yyyy'), to_date('14-03-2023', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'), to_date('11-09-2024', 'dd-mm-yyyy'), 33, 91);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (265, to_date('28-11-2022', 'dd-mm-yyyy'), to_date('25-03-2023', 'dd-mm-yyyy'), to_date('03-11-2023', 'dd-mm-yyyy'), to_date('25-11-2024', 'dd-mm-yyyy'), 34, 92);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (266, to_date('20-04-2022', 'dd-mm-yyyy'), to_date('14-04-2023', 'dd-mm-yyyy'), to_date('05-07-2023', 'dd-mm-yyyy'), to_date('22-11-2024', 'dd-mm-yyyy'), 36, 93);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (267, to_date('08-11-2022', 'dd-mm-yyyy'), to_date('14-02-2023', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'), to_date('05-04-2025', 'dd-mm-yyyy'), 35, 94);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (268, to_date('12-02-2022', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), to_date('05-04-2025', 'dd-mm-yyyy'), 36, 95);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (269, to_date('23-08-2022', 'dd-mm-yyyy'), to_date('25-04-2023', 'dd-mm-yyyy'), to_date('21-05-2023', 'dd-mm-yyyy'), to_date('01-05-2025', 'dd-mm-yyyy'), 34, 96);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (270, to_date('19-11-2022', 'dd-mm-yyyy'), to_date('27-01-2023', 'dd-mm-yyyy'), to_date('10-09-2023', 'dd-mm-yyyy'), to_date('06-07-2024', 'dd-mm-yyyy'), 35, 97);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (271, to_date('21-04-2022', 'dd-mm-yyyy'), to_date('18-01-2023', 'dd-mm-yyyy'), to_date('21-10-2023', 'dd-mm-yyyy'), to_date('15-04-2025', 'dd-mm-yyyy'), 35, 98);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (272, to_date('19-01-2022', 'dd-mm-yyyy'), to_date('01-04-2023', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'), to_date('15-05-2025', 'dd-mm-yyyy'), 36, 99);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (273, to_date('17-04-2022', 'dd-mm-yyyy'), to_date('10-03-2023', 'dd-mm-yyyy'), to_date('01-08-2023', 'dd-mm-yyyy'), to_date('19-08-2024', 'dd-mm-yyyy'), 35, 100);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (274, to_date('23-05-2022', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), to_date('18-10-2023', 'dd-mm-yyyy'), to_date('17-05-2024', 'dd-mm-yyyy'), 33, 1);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (275, to_date('27-09-2022', 'dd-mm-yyyy'), to_date('12-02-2023', 'dd-mm-yyyy'), to_date('11-07-2023', 'dd-mm-yyyy'), to_date('15-01-2024', 'dd-mm-yyyy'), 34, 2);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (276, to_date('13-07-2022', 'dd-mm-yyyy'), to_date('02-02-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), to_date('14-01-2024', 'dd-mm-yyyy'), 36, 3);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (277, to_date('17-08-2022', 'dd-mm-yyyy'), to_date('05-02-2023', 'dd-mm-yyyy'), to_date('22-06-2023', 'dd-mm-yyyy'), to_date('23-09-2024', 'dd-mm-yyyy'), 35, 4);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (278, to_date('10-02-2022', 'dd-mm-yyyy'), to_date('04-01-2023', 'dd-mm-yyyy'), to_date('26-08-2023', 'dd-mm-yyyy'), to_date('13-09-2024', 'dd-mm-yyyy'), 34, 5);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (279, to_date('14-05-2022', 'dd-mm-yyyy'), to_date('10-03-2023', 'dd-mm-yyyy'), to_date('14-05-2023', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'), 36, 6);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (280, to_date('13-11-2022', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'), to_date('27-02-2025', 'dd-mm-yyyy'), 36, 7);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (281, to_date('03-07-2022', 'dd-mm-yyyy'), to_date('10-01-2023', 'dd-mm-yyyy'), to_date('09-12-2023', 'dd-mm-yyyy'), to_date('26-01-2024', 'dd-mm-yyyy'), 35, 8);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (282, to_date('08-04-2022', 'dd-mm-yyyy'), to_date('28-02-2023', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'), to_date('23-05-2025', 'dd-mm-yyyy'), 33, 9);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (283, to_date('05-09-2022', 'dd-mm-yyyy'), to_date('17-03-2023', 'dd-mm-yyyy'), to_date('18-06-2023', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'), 33, 10);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (284, to_date('08-03-2022', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'), to_date('22-01-2024', 'dd-mm-yyyy'), 34, 11);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (285, to_date('31-01-2022', 'dd-mm-yyyy'), to_date('30-04-2023', 'dd-mm-yyyy'), to_date('06-05-2023', 'dd-mm-yyyy'), to_date('29-05-2024', 'dd-mm-yyyy'), 34, 12);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (286, to_date('01-04-2022', 'dd-mm-yyyy'), to_date('01-03-2023', 'dd-mm-yyyy'), to_date('03-12-2023', 'dd-mm-yyyy'), to_date('11-09-2024', 'dd-mm-yyyy'), 33, 13);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (287, to_date('15-05-2022', 'dd-mm-yyyy'), to_date('14-01-2023', 'dd-mm-yyyy'), to_date('28-05-2023', 'dd-mm-yyyy'), to_date('03-02-2024', 'dd-mm-yyyy'), 34, 14);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (288, to_date('22-02-2022', 'dd-mm-yyyy'), to_date('12-03-2023', 'dd-mm-yyyy'), to_date('19-11-2023', 'dd-mm-yyyy'), to_date('21-01-2024', 'dd-mm-yyyy'), 35, 15);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (289, to_date('02-11-2022', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), to_date('21-11-2023', 'dd-mm-yyyy'), to_date('24-03-2025', 'dd-mm-yyyy'), 35, 16);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (290, to_date('22-08-2022', 'dd-mm-yyyy'), to_date('15-01-2023', 'dd-mm-yyyy'), to_date('11-10-2023', 'dd-mm-yyyy'), to_date('08-02-2024', 'dd-mm-yyyy'), 34, 17);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (291, to_date('23-02-2022', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), to_date('01-08-2023', 'dd-mm-yyyy'), to_date('15-08-2024', 'dd-mm-yyyy'), 33, 18);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (292, to_date('25-11-2022', 'dd-mm-yyyy'), to_date('18-03-2023', 'dd-mm-yyyy'), to_date('14-10-2023', 'dd-mm-yyyy'), to_date('20-11-2024', 'dd-mm-yyyy'), 36, 19);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (293, to_date('30-01-2022', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), to_date('02-05-2023', 'dd-mm-yyyy'), to_date('02-02-2024', 'dd-mm-yyyy'), 35, 20);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (294, to_date('22-10-2022', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), to_date('17-12-2023', 'dd-mm-yyyy'), to_date('16-03-2025', 'dd-mm-yyyy'), 36, 21);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (295, to_date('09-06-2022', 'dd-mm-yyyy'), to_date('29-04-2023', 'dd-mm-yyyy'), to_date('08-11-2023', 'dd-mm-yyyy'), to_date('12-01-2025', 'dd-mm-yyyy'), 36, 22);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (296, to_date('11-01-2022', 'dd-mm-yyyy'), to_date('31-03-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), to_date('04-03-2025', 'dd-mm-yyyy'), 33, 23);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (297, to_date('10-11-2022', 'dd-mm-yyyy'), to_date('01-01-2023', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), to_date('18-08-2024', 'dd-mm-yyyy'), 35, 24);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (298, to_date('01-01-2022', 'dd-mm-yyyy'), to_date('18-03-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), to_date('17-04-2024', 'dd-mm-yyyy'), 35, 25);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (299, to_date('08-06-2022', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), to_date('09-12-2023', 'dd-mm-yyyy'), to_date('12-04-2024', 'dd-mm-yyyy'), 34, 26);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (300, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('15-02-2023', 'dd-mm-yyyy'), to_date('15-09-2023', 'dd-mm-yyyy'), to_date('26-09-2024', 'dd-mm-yyyy'), 35, 27);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (301, to_date('08-03-2022', 'dd-mm-yyyy'), to_date('09-02-2023', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 33, 28);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (302, to_date('09-10-2022', 'dd-mm-yyyy'), to_date('19-02-2023', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'), to_date('22-01-2024', 'dd-mm-yyyy'), 36, 29);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (303, to_date('10-05-2022', 'dd-mm-yyyy'), to_date('30-03-2023', 'dd-mm-yyyy'), to_date('23-10-2023', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), 35, 30);
commit;
prompt 300 records committed...
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (304, to_date('13-09-2022', 'dd-mm-yyyy'), to_date('30-04-2023', 'dd-mm-yyyy'), to_date('26-05-2023', 'dd-mm-yyyy'), to_date('27-07-2024', 'dd-mm-yyyy'), 36, 31);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (305, to_date('16-08-2022', 'dd-mm-yyyy'), to_date('14-04-2023', 'dd-mm-yyyy'), to_date('13-06-2023', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'), 36, 32);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (307, to_date('25-12-2022', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), to_date('21-11-2023', 'dd-mm-yyyy'), to_date('29-11-2024', 'dd-mm-yyyy'), 35, 34);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (308, to_date('24-09-2022', 'dd-mm-yyyy'), to_date('24-04-2023', 'dd-mm-yyyy'), to_date('24-10-2023', 'dd-mm-yyyy'), to_date('03-04-2025', 'dd-mm-yyyy'), 36, 35);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (309, to_date('28-06-2022', 'dd-mm-yyyy'), to_date('03-03-2023', 'dd-mm-yyyy'), to_date('13-10-2023', 'dd-mm-yyyy'), to_date('19-05-2025', 'dd-mm-yyyy'), 35, 36);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (310, to_date('06-12-2022', 'dd-mm-yyyy'), to_date('14-01-2023', 'dd-mm-yyyy'), to_date('12-11-2023', 'dd-mm-yyyy'), to_date('20-07-2024', 'dd-mm-yyyy'), 34, 37);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (311, to_date('29-11-2022', 'dd-mm-yyyy'), to_date('24-01-2023', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), to_date('07-02-2025', 'dd-mm-yyyy'), 33, 38);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (312, to_date('27-08-2022', 'dd-mm-yyyy'), to_date('28-03-2023', 'dd-mm-yyyy'), to_date('25-06-2023', 'dd-mm-yyyy'), to_date('20-01-2025', 'dd-mm-yyyy'), 35, 39);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (313, to_date('25-01-2022', 'dd-mm-yyyy'), to_date('26-03-2023', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), to_date('02-04-2025', 'dd-mm-yyyy'), 35, 40);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (314, to_date('20-01-2022', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), to_date('20-03-2024', 'dd-mm-yyyy'), 36, 41);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (315, to_date('11-01-2022', 'dd-mm-yyyy'), to_date('11-02-2023', 'dd-mm-yyyy'), to_date('01-06-2023', 'dd-mm-yyyy'), to_date('09-08-2024', 'dd-mm-yyyy'), 35, 42);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (316, to_date('21-05-2022', 'dd-mm-yyyy'), to_date('18-04-2023', 'dd-mm-yyyy'), to_date('27-06-2023', 'dd-mm-yyyy'), to_date('25-10-2024', 'dd-mm-yyyy'), 36, 43);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (317, to_date('31-08-2022', 'dd-mm-yyyy'), to_date('03-01-2023', 'dd-mm-yyyy'), to_date('01-12-2023', 'dd-mm-yyyy'), to_date('24-12-2024', 'dd-mm-yyyy'), 33, 44);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (318, to_date('05-06-2022', 'dd-mm-yyyy'), to_date('04-01-2023', 'dd-mm-yyyy'), to_date('29-12-2023', 'dd-mm-yyyy'), to_date('28-05-2024', 'dd-mm-yyyy'), 35, 45);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (319, to_date('08-03-2022', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'), to_date('06-04-2024', 'dd-mm-yyyy'), 34, 46);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (320, to_date('26-04-2022', 'dd-mm-yyyy'), to_date('11-03-2023', 'dd-mm-yyyy'), to_date('03-12-2023', 'dd-mm-yyyy'), to_date('23-10-2024', 'dd-mm-yyyy'), 35, 47);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (321, to_date('13-06-2022', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'), to_date('08-09-2023', 'dd-mm-yyyy'), to_date('21-09-2024', 'dd-mm-yyyy'), 36, 48);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (322, to_date('18-12-2022', 'dd-mm-yyyy'), to_date('17-04-2023', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), to_date('11-02-2024', 'dd-mm-yyyy'), 33, 49);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (323, to_date('19-01-2022', 'dd-mm-yyyy'), to_date('14-01-2023', 'dd-mm-yyyy'), to_date('26-12-2023', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'), 34, 50);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (324, to_date('19-12-2022', 'dd-mm-yyyy'), to_date('13-02-2023', 'dd-mm-yyyy'), to_date('06-12-2023', 'dd-mm-yyyy'), to_date('19-02-2024', 'dd-mm-yyyy'), 33, 51);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (325, to_date('13-04-2022', 'dd-mm-yyyy'), to_date('12-04-2023', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'), to_date('23-04-2025', 'dd-mm-yyyy'), 36, 52);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (326, to_date('15-11-2022', 'dd-mm-yyyy'), to_date('11-03-2023', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'), to_date('15-09-2024', 'dd-mm-yyyy'), 36, 53);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (327, to_date('24-08-2022', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), to_date('24-12-2024', 'dd-mm-yyyy'), 33, 54);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (328, to_date('04-10-2022', 'dd-mm-yyyy'), to_date('23-04-2023', 'dd-mm-yyyy'), to_date('24-06-2023', 'dd-mm-yyyy'), to_date('24-04-2025', 'dd-mm-yyyy'), 35, 55);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (329, to_date('02-02-2022', 'dd-mm-yyyy'), to_date('12-03-2023', 'dd-mm-yyyy'), to_date('05-05-2023', 'dd-mm-yyyy'), to_date('21-06-2024', 'dd-mm-yyyy'), 36, 56);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (330, to_date('12-01-2022', 'dd-mm-yyyy'), to_date('30-03-2023', 'dd-mm-yyyy'), to_date('09-07-2023', 'dd-mm-yyyy'), to_date('06-11-2024', 'dd-mm-yyyy'), 34, 57);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (331, to_date('11-01-2022', 'dd-mm-yyyy'), to_date('24-02-2023', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'), to_date('01-03-2025', 'dd-mm-yyyy'), 35, 58);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (332, to_date('09-04-2022', 'dd-mm-yyyy'), to_date('23-04-2023', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'), to_date('13-08-2024', 'dd-mm-yyyy'), 35, 59);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (333, to_date('18-06-2022', 'dd-mm-yyyy'), to_date('10-03-2023', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'), to_date('12-02-2024', 'dd-mm-yyyy'), 34, 60);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (334, to_date('11-01-2022', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), to_date('30-11-2023', 'dd-mm-yyyy'), to_date('30-04-2025', 'dd-mm-yyyy'), 33, 61);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (335, to_date('04-02-2022', 'dd-mm-yyyy'), to_date('02-01-2023', 'dd-mm-yyyy'), to_date('28-09-2023', 'dd-mm-yyyy'), to_date('19-02-2025', 'dd-mm-yyyy'), 35, 62);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (336, to_date('07-06-2022', 'dd-mm-yyyy'), to_date('23-03-2023', 'dd-mm-yyyy'), to_date('29-10-2023', 'dd-mm-yyyy'), to_date('07-01-2025', 'dd-mm-yyyy'), 35, 63);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (337, to_date('14-06-2022', 'dd-mm-yyyy'), to_date('23-04-2023', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), to_date('19-12-2024', 'dd-mm-yyyy'), 33, 64);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (338, to_date('16-01-2022', 'dd-mm-yyyy'), to_date('08-03-2023', 'dd-mm-yyyy'), to_date('02-11-2023', 'dd-mm-yyyy'), to_date('26-11-2024', 'dd-mm-yyyy'), 35, 65);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (339, to_date('16-07-2022', 'dd-mm-yyyy'), to_date('24-02-2023', 'dd-mm-yyyy'), to_date('30-12-2023', 'dd-mm-yyyy'), to_date('28-08-2024', 'dd-mm-yyyy'), 35, 66);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (340, to_date('09-07-2022', 'dd-mm-yyyy'), to_date('13-04-2023', 'dd-mm-yyyy'), to_date('19-06-2023', 'dd-mm-yyyy'), to_date('22-01-2025', 'dd-mm-yyyy'), 33, 67);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (341, to_date('12-11-2022', 'dd-mm-yyyy'), to_date('30-01-2023', 'dd-mm-yyyy'), to_date('01-09-2023', 'dd-mm-yyyy'), to_date('04-05-2024', 'dd-mm-yyyy'), 33, 68);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (342, to_date('15-01-2022', 'dd-mm-yyyy'), to_date('20-02-2023', 'dd-mm-yyyy'), to_date('31-05-2023', 'dd-mm-yyyy'), to_date('15-12-2024', 'dd-mm-yyyy'), 33, 69);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (343, to_date('18-05-2022', 'dd-mm-yyyy'), to_date('26-02-2023', 'dd-mm-yyyy'), to_date('06-10-2023', 'dd-mm-yyyy'), to_date('04-03-2025', 'dd-mm-yyyy'), 34, 70);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (344, to_date('30-12-2022', 'dd-mm-yyyy'), to_date('06-02-2023', 'dd-mm-yyyy'), to_date('04-11-2023', 'dd-mm-yyyy'), to_date('16-05-2025', 'dd-mm-yyyy'), 34, 71);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (345, to_date('26-06-2022', 'dd-mm-yyyy'), to_date('05-01-2023', 'dd-mm-yyyy'), to_date('21-05-2023', 'dd-mm-yyyy'), to_date('25-10-2024', 'dd-mm-yyyy'), 33, 72);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (346, to_date('13-11-2022', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'), to_date('27-09-2024', 'dd-mm-yyyy'), 35, 73);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (347, to_date('13-08-2022', 'dd-mm-yyyy'), to_date('17-04-2023', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'), to_date('14-02-2024', 'dd-mm-yyyy'), 33, 74);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (348, to_date('11-06-2022', 'dd-mm-yyyy'), to_date('28-02-2023', 'dd-mm-yyyy'), to_date('05-06-2023', 'dd-mm-yyyy'), to_date('31-01-2025', 'dd-mm-yyyy'), 33, 75);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (349, to_date('13-12-2022', 'dd-mm-yyyy'), to_date('30-03-2023', 'dd-mm-yyyy'), to_date('12-05-2023', 'dd-mm-yyyy'), to_date('12-03-2024', 'dd-mm-yyyy'), 33, 76);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (350, to_date('01-04-2022', 'dd-mm-yyyy'), to_date('19-01-2023', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 33, 77);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (351, to_date('07-12-2022', 'dd-mm-yyyy'), to_date('05-01-2023', 'dd-mm-yyyy'), to_date('05-10-2023', 'dd-mm-yyyy'), to_date('14-01-2024', 'dd-mm-yyyy'), 36, 78);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (352, to_date('15-03-2022', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), to_date('18-08-2023', 'dd-mm-yyyy'), to_date('10-05-2025', 'dd-mm-yyyy'), 35, 79);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (353, to_date('01-05-2022', 'dd-mm-yyyy'), to_date('13-04-2023', 'dd-mm-yyyy'), to_date('11-10-2023', 'dd-mm-yyyy'), to_date('03-07-2024', 'dd-mm-yyyy'), 35, 80);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (354, to_date('22-10-2022', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'), to_date('16-01-2025', 'dd-mm-yyyy'), 35, 81);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (355, to_date('24-06-2022', 'dd-mm-yyyy'), to_date('25-03-2023', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), to_date('27-03-2025', 'dd-mm-yyyy'), 34, 82);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (356, to_date('15-06-2022', 'dd-mm-yyyy'), to_date('20-01-2023', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'), to_date('09-02-2024', 'dd-mm-yyyy'), 34, 83);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (357, to_date('28-07-2022', 'dd-mm-yyyy'), to_date('28-03-2023', 'dd-mm-yyyy'), to_date('31-07-2023', 'dd-mm-yyyy'), to_date('20-02-2024', 'dd-mm-yyyy'), 33, 84);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (358, to_date('19-07-2022', 'dd-mm-yyyy'), to_date('29-01-2023', 'dd-mm-yyyy'), to_date('05-09-2023', 'dd-mm-yyyy'), to_date('05-08-2024', 'dd-mm-yyyy'), 33, 85);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (359, to_date('27-02-2022', 'dd-mm-yyyy'), to_date('24-02-2023', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'), to_date('04-05-2024', 'dd-mm-yyyy'), 33, 86);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (360, to_date('31-10-2022', 'dd-mm-yyyy'), to_date('13-04-2023', 'dd-mm-yyyy'), to_date('26-07-2023', 'dd-mm-yyyy'), to_date('07-03-2024', 'dd-mm-yyyy'), 34, 87);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (361, to_date('29-04-2022', 'dd-mm-yyyy'), to_date('09-01-2023', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'), to_date('04-09-2024', 'dd-mm-yyyy'), 34, 88);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (362, to_date('26-06-2022', 'dd-mm-yyyy'), to_date('09-03-2023', 'dd-mm-yyyy'), to_date('09-12-2023', 'dd-mm-yyyy'), to_date('05-01-2024', 'dd-mm-yyyy'), 34, 89);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (363, to_date('08-01-2022', 'dd-mm-yyyy'), to_date('08-03-2023', 'dd-mm-yyyy'), to_date('06-10-2023', 'dd-mm-yyyy'), to_date('01-07-2024', 'dd-mm-yyyy'), 33, 90);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (364, to_date('10-11-2022', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), to_date('03-05-2023', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'), 35, 91);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (365, to_date('23-11-2022', 'dd-mm-yyyy'), to_date('24-01-2023', 'dd-mm-yyyy'), to_date('25-08-2023', 'dd-mm-yyyy'), to_date('08-02-2024', 'dd-mm-yyyy'), 35, 92);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (366, to_date('24-04-2022', 'dd-mm-yyyy'), to_date('28-01-2023', 'dd-mm-yyyy'), to_date('16-05-2023', 'dd-mm-yyyy'), to_date('18-05-2025', 'dd-mm-yyyy'), 34, 93);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (367, to_date('28-07-2022', 'dd-mm-yyyy'), to_date('20-02-2023', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), 33, 94);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (368, to_date('16-09-2022', 'dd-mm-yyyy'), to_date('26-04-2023', 'dd-mm-yyyy'), to_date('02-10-2023', 'dd-mm-yyyy'), to_date('09-02-2025', 'dd-mm-yyyy'), 35, 95);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (369, to_date('15-04-2022', 'dd-mm-yyyy'), to_date('21-03-2023', 'dd-mm-yyyy'), to_date('13-05-2023', 'dd-mm-yyyy'), to_date('21-06-2024', 'dd-mm-yyyy'), 36, 96);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (370, to_date('23-04-2022', 'dd-mm-yyyy'), to_date('30-03-2023', 'dd-mm-yyyy'), to_date('13-11-2023', 'dd-mm-yyyy'), to_date('16-11-2024', 'dd-mm-yyyy'), 34, 97);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (371, to_date('01-03-2022', 'dd-mm-yyyy'), to_date('07-03-2023', 'dd-mm-yyyy'), to_date('03-09-2023', 'dd-mm-yyyy'), to_date('03-02-2024', 'dd-mm-yyyy'), 33, 98);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (372, to_date('28-02-2022', 'dd-mm-yyyy'), to_date('23-03-2023', 'dd-mm-yyyy'), to_date('13-09-2023', 'dd-mm-yyyy'), to_date('08-07-2024', 'dd-mm-yyyy'), 33, 99);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (373, to_date('04-08-2022', 'dd-mm-yyyy'), to_date('09-03-2023', 'dd-mm-yyyy'), to_date('11-08-2023', 'dd-mm-yyyy'), to_date('22-01-2025', 'dd-mm-yyyy'), 36, 100);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (374, to_date('23-11-2022', 'dd-mm-yyyy'), to_date('14-03-2023', 'dd-mm-yyyy'), to_date('11-09-2023', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), 36, 1);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (375, to_date('13-06-2022', 'dd-mm-yyyy'), to_date('02-04-2023', 'dd-mm-yyyy'), to_date('17-07-2023', 'dd-mm-yyyy'), to_date('10-06-2024', 'dd-mm-yyyy'), 36, 2);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (376, to_date('29-08-2022', 'dd-mm-yyyy'), to_date('24-03-2023', 'dd-mm-yyyy'), to_date('27-10-2023', 'dd-mm-yyyy'), to_date('10-10-2024', 'dd-mm-yyyy'), 33, 3);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (377, to_date('07-01-2022', 'dd-mm-yyyy'), to_date('09-02-2023', 'dd-mm-yyyy'), to_date('29-05-2023', 'dd-mm-yyyy'), to_date('11-10-2024', 'dd-mm-yyyy'), 34, 4);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (378, to_date('23-11-2022', 'dd-mm-yyyy'), to_date('08-01-2023', 'dd-mm-yyyy'), to_date('16-06-2023', 'dd-mm-yyyy'), to_date('31-08-2024', 'dd-mm-yyyy'), 36, 5);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (379, to_date('16-10-2022', 'dd-mm-yyyy'), to_date('30-01-2023', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), to_date('05-02-2025', 'dd-mm-yyyy'), 34, 6);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (380, to_date('02-08-2022', 'dd-mm-yyyy'), to_date('09-03-2023', 'dd-mm-yyyy'), to_date('06-09-2023', 'dd-mm-yyyy'), to_date('09-02-2024', 'dd-mm-yyyy'), 34, 7);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (381, to_date('11-04-2022', 'dd-mm-yyyy'), to_date('12-03-2023', 'dd-mm-yyyy'), to_date('28-10-2023', 'dd-mm-yyyy'), to_date('05-08-2024', 'dd-mm-yyyy'), 35, 8);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (382, to_date('12-01-2022', 'dd-mm-yyyy'), to_date('03-02-2023', 'dd-mm-yyyy'), to_date('29-06-2023', 'dd-mm-yyyy'), to_date('15-07-2024', 'dd-mm-yyyy'), 34, 9);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (383, to_date('21-11-2022', 'dd-mm-yyyy'), to_date('11-03-2023', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), to_date('24-06-2024', 'dd-mm-yyyy'), 33, 10);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (384, to_date('03-10-2022', 'dd-mm-yyyy'), to_date('01-03-2023', 'dd-mm-yyyy'), to_date('04-09-2023', 'dd-mm-yyyy'), to_date('03-02-2025', 'dd-mm-yyyy'), 36, 11);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (385, to_date('13-08-2022', 'dd-mm-yyyy'), to_date('06-03-2023', 'dd-mm-yyyy'), to_date('02-11-2023', 'dd-mm-yyyy'), to_date('31-08-2024', 'dd-mm-yyyy'), 35, 12);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (386, to_date('13-08-2022', 'dd-mm-yyyy'), to_date('22-02-2023', 'dd-mm-yyyy'), to_date('17-09-2023', 'dd-mm-yyyy'), to_date('04-04-2024', 'dd-mm-yyyy'), 35, 13);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (387, to_date('07-04-2022', 'dd-mm-yyyy'), to_date('03-02-2023', 'dd-mm-yyyy'), to_date('11-07-2023', 'dd-mm-yyyy'), to_date('15-09-2024', 'dd-mm-yyyy'), 35, 14);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (388, to_date('13-06-2022', 'dd-mm-yyyy'), to_date('02-01-2023', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), to_date('11-02-2025', 'dd-mm-yyyy'), 36, 15);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (389, to_date('14-01-2022', 'dd-mm-yyyy'), to_date('30-03-2023', 'dd-mm-yyyy'), to_date('22-10-2023', 'dd-mm-yyyy'), to_date('27-05-2024', 'dd-mm-yyyy'), 35, 16);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (390, to_date('19-06-2022', 'dd-mm-yyyy'), to_date('29-01-2023', 'dd-mm-yyyy'), to_date('09-07-2023', 'dd-mm-yyyy'), to_date('28-06-2024', 'dd-mm-yyyy'), 34, 17);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (391, to_date('09-12-2022', 'dd-mm-yyyy'), to_date('29-04-2023', 'dd-mm-yyyy'), to_date('02-09-2023', 'dd-mm-yyyy'), to_date('02-12-2024', 'dd-mm-yyyy'), 34, 18);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (392, to_date('07-10-2022', 'dd-mm-yyyy'), to_date('17-02-2023', 'dd-mm-yyyy'), to_date('13-10-2023', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'), 36, 19);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (393, to_date('01-04-2022', 'dd-mm-yyyy'), to_date('16-01-2023', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'), to_date('07-01-2024', 'dd-mm-yyyy'), 36, 20);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (394, to_date('18-03-2022', 'dd-mm-yyyy'), to_date('19-03-2023', 'dd-mm-yyyy'), to_date('22-06-2023', 'dd-mm-yyyy'), to_date('17-11-2024', 'dd-mm-yyyy'), 33, 21);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (395, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('11-04-2023', 'dd-mm-yyyy'), to_date('15-05-2023', 'dd-mm-yyyy'), to_date('08-02-2025', 'dd-mm-yyyy'), 33, 22);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (396, to_date('04-06-2022', 'dd-mm-yyyy'), to_date('15-01-2023', 'dd-mm-yyyy'), to_date('07-09-2023', 'dd-mm-yyyy'), to_date('24-05-2025', 'dd-mm-yyyy'), 36, 23);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (397, to_date('05-08-2022', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), to_date('15-11-2023', 'dd-mm-yyyy'), to_date('03-10-2024', 'dd-mm-yyyy'), 35, 24);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (398, to_date('03-01-2022', 'dd-mm-yyyy'), to_date('02-03-2023', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'), to_date('25-01-2025', 'dd-mm-yyyy'), 35, 25);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (399, to_date('28-09-2022', 'dd-mm-yyyy'), to_date('24-02-2023', 'dd-mm-yyyy'), to_date('01-11-2023', 'dd-mm-yyyy'), to_date('20-05-2025', 'dd-mm-yyyy'), 36, 26);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (400, to_date('14-03-2022', 'dd-mm-yyyy'), to_date('02-03-2023', 'dd-mm-yyyy'), to_date('19-10-2023', 'dd-mm-yyyy'), to_date('11-06-2024', 'dd-mm-yyyy'), 34, 27);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (401, to_date('05-11-2022', 'dd-mm-yyyy'), to_date('05-02-2023', 'dd-mm-yyyy'), to_date('04-07-2023', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), 35, 28);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (402, to_date('15-04-2022', 'dd-mm-yyyy'), to_date('21-01-2023', 'dd-mm-yyyy'), to_date('14-11-2023', 'dd-mm-yyyy'), to_date('01-03-2025', 'dd-mm-yyyy'), 36, 29);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (403, to_date('07-11-2022', 'dd-mm-yyyy'), to_date('09-02-2023', 'dd-mm-yyyy'), to_date('08-05-2023', 'dd-mm-yyyy'), to_date('06-01-2024', 'dd-mm-yyyy'), 34, 30);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (404, to_date('20-01-2022', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'), to_date('20-07-2023', 'dd-mm-yyyy'), to_date('21-02-2024', 'dd-mm-yyyy'), 33, 31);
commit;
prompt 400 records committed...
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (405, to_date('20-01-2022', 'dd-mm-yyyy'), to_date('28-03-2023', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'), to_date('15-09-2024', 'dd-mm-yyyy'), 33, 32);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (407, to_date('25-07-2022', 'dd-mm-yyyy'), to_date('08-03-2023', 'dd-mm-yyyy'), to_date('30-12-2023', 'dd-mm-yyyy'), to_date('05-11-2024', 'dd-mm-yyyy'), 36, 34);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (408, to_date('23-02-2022', 'dd-mm-yyyy'), to_date('24-03-2023', 'dd-mm-yyyy'), to_date('16-11-2023', 'dd-mm-yyyy'), to_date('13-06-2024', 'dd-mm-yyyy'), 36, 35);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (409, to_date('30-10-2022', 'dd-mm-yyyy'), to_date('27-03-2023', 'dd-mm-yyyy'), to_date('02-06-2023', 'dd-mm-yyyy'), to_date('28-08-2024', 'dd-mm-yyyy'), 35, 36);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (410, to_date('30-01-2022', 'dd-mm-yyyy'), to_date('29-04-2023', 'dd-mm-yyyy'), to_date('09-06-2023', 'dd-mm-yyyy'), to_date('12-07-2024', 'dd-mm-yyyy'), 34, 37);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (411, to_date('14-09-2022', 'dd-mm-yyyy'), to_date('11-01-2023', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), to_date('15-07-2024', 'dd-mm-yyyy'), 33, 38);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (412, to_date('30-03-2022', 'dd-mm-yyyy'), to_date('20-03-2023', 'dd-mm-yyyy'), to_date('17-05-2023', 'dd-mm-yyyy'), to_date('08-02-2024', 'dd-mm-yyyy'), 35, 39);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (413, to_date('14-10-2022', 'dd-mm-yyyy'), to_date('18-03-2023', 'dd-mm-yyyy'), to_date('02-05-2023', 'dd-mm-yyyy'), to_date('09-04-2025', 'dd-mm-yyyy'), 34, 40);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (414, to_date('27-08-2022', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), to_date('28-04-2025', 'dd-mm-yyyy'), 36, 41);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (415, to_date('03-01-2022', 'dd-mm-yyyy'), to_date('18-01-2023', 'dd-mm-yyyy'), to_date('05-10-2023', 'dd-mm-yyyy'), to_date('19-07-2024', 'dd-mm-yyyy'), 33, 42);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (416, to_date('13-03-2022', 'dd-mm-yyyy'), to_date('06-01-2023', 'dd-mm-yyyy'), to_date('25-09-2023', 'dd-mm-yyyy'), to_date('20-01-2024', 'dd-mm-yyyy'), 35, 43);
insert into TRACKINGSHIPMENTS (idtracship, orderdate, sortdate, sendingdate, deliverydate, statusnum, idpackege)
values (417, to_date('12-01-2022', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), to_date('18-06-2023', 'dd-mm-yyyy'), to_date('02-09-2024', 'dd-mm-yyyy'), 34, 44);
commit;
prompt 412 records loaded
prompt Loading WORKERS...
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (1, 'Garry', 'Van Der Beek', 'garry.vanderbee', -5924432, 69, 5, 71);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (2, 'Emily', 'Gilliam', 'e.gilliam@merit', -8612522, 67, 10, 33);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (3, 'Amanda', 'Clarkson', 'amandac@datapri', -3246568, 71, 2, 46);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (4, 'Natascha', 'Unger', 'natascha.u@ipsa', -6366530, 69, 4, 99);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (5, 'Patty', 'Costa', 'patty@aoltimewa', -4264185, 71, 6, 21);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (6, 'Glen', 'Simpson', 'glen.simpson@an', -3968616, 69, 5, 42);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (7, 'Edgar', 'Gibbons', 'edgar@hfg.ca', -2437524, 71, 6, 82);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (8, 'Cary', 'Johansson', 'cary.johansson@', -4281770, 70, 4, 33);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (9, 'Roger', 'Milsap', 'roger.milsap@kr', -4364635, 70, 9, 42);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (10, 'Halle', 'Magnuson', 'halle.magnuson@', -8345416, 70, 9, 29);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (11, 'Larry', 'Branagh', 'lbranagh@alogen', -9159763, 68, 1, 54);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (12, 'Fats', 'Rodriguez', 'fatsr@navigator', -8622682, 67, 3, 34);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (13, 'Liquid', 'Giraldo', 'liquid.giraldo@', -3537337, 68, 5, 36);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (14, 'Marie', 'Mahoney', 'mariem@woronoco', -4911802, 71, 3, 79);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (15, 'Mika', 'Rain', 'mika.rain@gsat.', -9257207, 71, 6, 76);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (16, 'Graham', 'Ronstadt', 'graham.r@spas.c', -3886309, 71, 4, 11);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (17, 'Renee', 'Carrington', 'rcarrington@jew', -8278216, 68, 10, 82);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (18, 'Debby', 'Napolitano', 'd.napolitano@sa', -6781322, 67, 6, 85);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (19, 'Mika', 'Kimball', 'mika.k@commwork', -3927591, 69, 5, 50);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (20, 'Kyra', 'Jay', 'k.jay@merck.com', -1638212, 71, 2, 11);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (21, 'Victor', 'McLean', 'victorm@comglob', -5674307, 70, 1, 96);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (22, 'Larenz', 'Stowe', 'larenz.stowe@ir', -3782127, 69, 6, 81);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (23, 'Tilda', 'Lipnicki', 'tilda.lipnicki@', -5578921, 68, 3, 14);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (24, 'Jann', 'Schiff', 'jschiff@dvdt.co', -8379665, 69, 9, 21);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (25, 'Terri', 'Krieger', 'terri.krieger@s', -6653825, 68, 3, 41);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (26, 'Vendetta', 'Horton', 'vendetta.horton', -3799239, 71, 6, 15);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (27, 'Rawlins', 'Neil', 'rawlins.neil@ye', -1133814, 68, 4, 58);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (28, 'Delroy', 'Plimpton', 'dplimpton@merck', -4467632, 69, 5, 36);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (29, 'Cathy', 'Gooding', 'cathy@kmart.ee', -9789128, 67, 10, 82);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (30, 'Barry', 'Coyote', 'barry@jewettcam', -8344739, 67, 3, 84);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (31, 'Joanna', 'Franklin', 'joanna.franklin', -9136138, 67, 9, 60);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (32, 'Bonnie', 'Vannelli', 'bonnie.vannelli', -5414460, 71, 5, 33);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (33, 'Caroline', 'Gary', 'carolineg@sfb.i', -9663595, 68, 9, 19);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (34, 'Hal', 'Warwick', 'hal@vfs.com', -5563796, 67, 2, 34);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (35, 'Trini', 'Knight', 'trini.knight@ma', -8575740, 70, 1, 88);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (36, 'Christian', 'Pony', 'christian@heart', -2182531, 70, 10, 22);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (37, 'Mekhi', 'Whitley', 'mekhi.whitley@c', -1668930, 69, 9, 27);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (38, 'Candice', 'Astin', 'candice.astin@g', -1284119, 69, 2, 33);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (39, 'Azucar', 'Cassel', 'azucar.cassel@c', -4672535, 70, 4, 79);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (40, 'Ruth', 'Winter', 'ruth@tracertech', -9127460, 69, 10, 32);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (41, 'Rodney', 'Wilkinson', 'rodney.wilkinso', -7879067, 69, 10, 76);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (42, 'Fionnula', 'Gellar', 'fionnula.gellar', -6997319, 69, 3, 28);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (43, 'Nik', 'Idol', 'nik.idol@bowman', -4391815, 70, 9, 15);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (44, 'Sheryl', 'Close', 'sheryl.close@dy', -4791128, 71, 3, 30);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (45, 'Thomas', 'Rydell', 'thomas@bedfordb', -1731411, 70, 9, 35);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (46, 'Judi', 'Trejo', 'judi.trejo@epiq', -5866947, 69, 10, 30);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (47, 'Rik', 'Baldwin', 'rik.baldwin@mic', -3554445, 69, 4, 46);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (48, 'Geoff', 'Steenburgen', 'geoff.steenburg', -3231537, 70, 6, 49);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (49, 'Pamela', 'Leguizamo', 'pamelal@glaxosm', -8924469, 70, 1, 6);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (50, 'Debby', 'Downie', 'debby.downie@pr', -8292506, 71, 9, 34);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (51, 'Lenny', 'Venora', 'lenny.venora@vo', -5765629, 69, 5, 74);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (52, 'Casey', 'Loeb', 'casey.loeb@roya', -1521836, 69, 6, 33);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (53, 'Brian', 'Stone', 'brian.stone@inf', -8828322, 70, 5, 36);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (54, 'Anna', 'McGovern', 'anna.mcgovern@o', -1272586, 71, 2, 76);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (55, 'Cary', 'Stuermer', 'cary@sms.be', -7636095, 69, 10, 29);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (56, 'Sinead', 'DiCaprio', 'sinead@signatur', -4375798, 71, 5, 34);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (57, 'Sean', 'Hirsch', 'sean.h@usdairyp', -4684330, 67, 10, 32);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (58, 'Johnette', 'Reiner', 'johnetter@prosp', -6643467, 69, 4, 12);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (59, 'Kirsten', 'Carlisle', 'kirsten@esteela', -1143286, 71, 9, 53);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (60, 'Martin', 'Hornsby', 'martin.hornsby@', -9746929, 67, 3, 22);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (61, 'Joaquin', 'Travolta', 'j.travolta@sbc.', -1751874, 70, 3, 22);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (62, 'Cyndi', 'Heald', 'cyndi@carteretm', -6147827, 70, 10, 91);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (63, 'Kenny', 'Begley', 'kenny.begley@ge', -9698531, 70, 10, 6);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (64, 'Loren', 'Sharp', 'loren.sharp@sfg', -8923927, 71, 1, 15);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (65, 'Bebe', 'Vince', 'bebe.v@campbell', -1211723, 71, 10, 37);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (66, 'Joe', 'Shand', 'joe.shand@evinc', -8235560, 67, 4, 30);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (67, 'Tea', 'Cruz', 'tcruz@dynacqint', -7335226, 69, 1, 13);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (68, 'Maceo', 'Tucker', 'maceo.tucker@os', -4121541, 71, 6, 32);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (69, 'Dermot', 'Brickell', 'dermot.brickell', -2853410, 70, 9, 4);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (70, 'Jeffrey', 'Pollak', 'jeffrey.pollak@', -4596671, 68, 5, 8);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (71, 'Elle', 'Cusack', 'e.cusack@scjohn', -5328424, 67, 9, 35);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (72, 'Taylor', 'Plummer', 'taylorp@ait.com', -8272101, 68, 9, 25);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (73, 'Allan', 'Wolf', 'allan.wolf@manh', -8988513, 69, 5, 54);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (74, 'Louise', 'Tempest', 'louise.tempest@', -9426388, 69, 2, 34);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (75, 'Jann', 'Heald', 'jann.heald@secu', -6128373, 70, 5, 89);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (76, 'Beth', 'Preston', 'beth.preston@sy', -5223929, 67, 6, 36);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (77, 'Keith', 'Phifer', 'keith.phifer@fm', -1947575, 67, 6, 9);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (78, 'Nancy', 'Reiner', 'nancy@ataservic', -3386522, 70, 6, 9);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (79, 'Cuba', 'Burmester', 'cburmester@seia', -1326881, 70, 9, 89);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (80, 'Larenz', 'Gaines', 'larenz.gaines@s', -7172341, 68, 3, 81);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (81, 'Gaby', 'Dooley', 'gaby@larkinente', -5465560, 68, 5, 20);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (82, 'Chuck', 'Downey', 'c.downey@bestbu', -8532288, 71, 5, 96);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (83, 'Scarlett', 'McCabe', 'scarlett.m@mms.', -6413771, 68, 10, 59);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (84, 'Jerry', 'Pollak', 'jerry.pollak@kw', -1619766, 69, 10, 64);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (85, 'Herbie', 'Tilly', 'htilly@oneidafi', -8437140, 68, 3, 38);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (86, 'Alex', 'Oldman', 'aoldman@accesss', -5452327, 67, 4, 9);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (87, 'Davey', 'Springfield', 'davey.springfie', -4158714, 70, 5, 8);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (88, 'Boyd', 'Shatner', 'boyd.shatner@be', -2321182, 70, 1, 83);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (89, 'Cherry', 'Scott', 'cherry.scott@su', -2198214, 67, 1, 36);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (90, 'Collective', 'Uggams', 'collective.ugga', -4528189, 71, 2, 17);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (91, 'Anthony', 'Minogue', 'anthony.m@healt', -8563587, 67, 4, 14);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (92, 'Adina', 'England', 'a.england@invis', -3852131, 71, 5, 10);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (93, 'Don', 'Winstone', 'don.winstone@ca', -4174197, 70, 1, 8);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (94, 'Vickie', 'Dillon', 'vickie.dillon@l', -1429674, 68, 4, 94);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (95, 'Robby', 'Arden', 'r.arden@sourceg', -6886384, 68, 3, 33);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (96, 'Arturo', 'McDowall', 'a.mcdowall@newt', -5581105, 70, 10, 57);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (97, 'Cole', 'Peniston', 'cole.peniston@b', -9238483, 70, 9, 2);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (98, 'Naomi', 'Wilson', 'naomi.wilson@ci', -5428457, 69, 10, 22);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (99, 'Elizabeth', 'Chandler', 'elizabeth@cookt', -8292245, 71, 1, 85);
insert into WORKERS (wid, firstname, lastname, email, phone, jobnum, citynum, streetnum)
values (100, 'Brendan', 'Judd', 'brendan.judd@aq', -1221144, 70, 3, 41);
commit;
prompt 100 records loaded
prompt Enabling foreign key constraints for APPOINTMENTS...
alter table APPOINTMENTS enable constraint SYS_C007142;
prompt Enabling foreign key constraints for PACKAGES...
alter table PACKAGES enable constraint SYS_C007151;
alter table PACKAGES enable constraint SYS_C007153;
prompt Enabling foreign key constraints for TRACKINGSHIPMENTS...
alter table TRACKINGSHIPMENTS enable constraint SYS_C007159;
alter table TRACKINGSHIPMENTS enable constraint SYS_C007160;
prompt Enabling foreign key constraints for WORKERS...
alter table WORKERS enable constraint SYS_C007178;
alter table WORKERS enable constraint SYS_C007180;
prompt Enabling triggers for COSTUMER...
alter table COSTUMER enable all triggers;
prompt Enabling triggers for APPOINTMENTS...
alter table APPOINTMENTS enable all triggers;
prompt Enabling triggers for CITY...
alter table CITY enable all triggers;
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
