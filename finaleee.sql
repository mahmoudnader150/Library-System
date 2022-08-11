/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     5/29/2022 5:27:16 PM                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BOOK') and o.name = 'FK_BOOK_INHERITAN_PRODUCTS')
alter table BOOK
   drop constraint FK_BOOK_INHERITAN_PRODUCTS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CART') and o.name = 'FK_CART_RELATIONS_PRODUCTS')
alter table CART
   drop constraint FK_CART_RELATIONS_PRODUCTS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMICBOOK') and o.name = 'FK_COMICBOO_INHERITAN_PRODUCTS')
alter table COMICBOOK
   drop constraint FK_COMICBOO_INHERITAN_PRODUCTS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MAGAZINE') and o.name = 'FK_MAGAZINE_INHERITAN_PRODUCTS')
alter table MAGAZINE
   drop constraint FK_MAGAZINE_INHERITAN_PRODUCTS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTS') and o.name = 'FK_PRODUCTS_RELATIONS_READER')
alter table PRODUCTS
   drop constraint FK_PRODUCTS_RELATIONS_READER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTS') and o.name = 'FK_PRODUCTS_RELATIONS_ADMIN')
alter table PRODUCTS
   drop constraint FK_PRODUCTS_RELATIONS_ADMIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTS') and o.name = 'FK_PRODUCTS_RELATIONS_AUTHOR')
alter table PRODUCTS
   drop constraint FK_PRODUCTS_RELATIONS_AUTHOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RESEARCHPAPERS') and o.name = 'FK_RESEARCH_INHERITAN_PRODUCTS')
alter table RESEARCHPAPERS
   drop constraint FK_RESEARCH_INHERITAN_PRODUCTS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ADMIN')
            and   type = 'U')
   drop table ADMIN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AUTHOR')
            and   type = 'U')
   drop table AUTHOR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BOOK')
            and   type = 'U')
   drop table BOOK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CART')
            and   name  = 'RELATIONSHIP_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index CART.RELATIONSHIP_5_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CART')
            and   type = 'U')
   drop table CART
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMICBOOK')
            and   type = 'U')
   drop table COMICBOOK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MAGAZINE')
            and   type = 'U')
   drop table MAGAZINE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTS')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTS.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTS')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTS.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTS')
            and   name  = 'RELATIONSHIP_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTS.RELATIONSHIP_3_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCTS')
            and   type = 'U')
   drop table PRODUCTS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('READER')
            and   type = 'U')
   drop table READER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RESEARCHPAPERS')
            and   type = 'U')
   drop table RESEARCHPAPERS
go

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN (
   ADMINID              int    identity(1,1)              not null,
   ADMINNAME            varchar(1024)        not null,
   ADMINUSER            varchar(1024)   unique     not null,
   ADMINPASSWD          varchar(1024)        not null,
   constraint PK_ADMIN primary key (ADMINID)
)
go

/*==============================================================*/
/* Table: AUTHOR                                                */
/*==============================================================*/
create table AUTHOR (
   AUTHORID             int   identity(1,1)               not null,
   AUTHORNAME           varchar(1024)        not null,
   NUMBOOK              int                  null,
   AUTHORUSER           varchar(1024)    unique    not null,
   AUTHORPASSWD         varchar(1024)        not null,
   constraint PK_AUTHOR primary key (AUTHORID)
)
go

/*==============================================================*/
/* Table: BOOK                                                  */
/*==============================================================*/
create table BOOK (
   PRODUCTNAME          varchar(1024)        not null,
   TYPE                 varchar(1024)        not null,
   ADMINID              int                  null,
   READERID             int                  null,
   AUTHORID             int                  null,
   YEAR                 int                  not null,
   NUMPAGES             int                  not null,
   PRICE                float                not null,
   AUTHOR               varchar(1024)        not null,
   CATEGORIES           varchar(1024)        null,
   NUM_AUTHORS          int                  null,
   BOOKLANG             varchar(1024)        not null,
   BOOKCOVER            image                null,
   AVAILABLEBOOK        int                  null,
   BOOKID               int                  null,
   constraint PK_BOOK primary key (PRODUCTNAME)
)
go

/*==============================================================*/
/* Table: CART                                                  */
/*==============================================================*/
create table CART (
   PRODUCTNAME          varchar(1024)        null,
   QUANTITY             int                  null,
   TOTAL_PRICE          float                null,
   MONTH                int                  null,
   YEAR                 int                  null,  
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_5_FK on CART (PRODUCTNAME ASC)
go

/*==============================================================*/
/* Table: COMICBOOK                                             */
/*==============================================================*/
create table COMICBOOK (
   PRODUCTNAME          varchar(1024)        not null,
   TYPE                 varchar(1024)        not null,
   ADMINID              int                  null,
   READERID             int                  null,
   AUTHORID             int                  null,
   YEAR                 int                  not null,
   NUMPAGES             int                  not null,
   PRICE                float                not null,
   AUTHOR               varchar(1024)        not null,
   CATEGORIES           varchar(1024)        null,
   NUM_AUTHORS          int                  null,
   COMICCOVER           image                null,
   COMICID              int                  null,
   AVAILABLECOMIC       int                  not null,
   COMICLANG            char(255)            not null,
   constraint PK_COMICBOOK primary key (PRODUCTNAME)
)
go

/*==============================================================*/
/* Table: MAGAZINE                                              */
/*==============================================================*/
create table MAGAZINE (
   PRODUCTNAME          varchar(1024)        not null,
   TYPE                 varchar(1024)        not null,
   ADMINID              int                  null,
   READERID             int                  null,
   AUTHORID             int                  null,
   YEAR                 int                  not null,
   NUMPAGES             int                  not null,
   PRICE                float                not null,
   AUTHOR               varchar(1024)        not null,
   CATEGORIES           varchar(1024)        null,
   NUM_AUTHORS          int                  null,
   MAGAZINECOVER        image                null,
   MAGAZINEID           int                  null,
   AVAILABLEMAGAZINE    int                  not null,
   MAGAZINELANG         char(255)            not null,
   constraint PK_MAGAZINE primary key (PRODUCTNAME)
)
go

/*==============================================================*/
/* Table: PRODUCTS                                              */
/*==============================================================*/
create table PRODUCTS (
   TYPE                 varchar(1024)        not null,
   PRODUCTNAME          varchar(1024)        not null,
   ADMINID              int                  null,
   READERID             int                  null,
   AUTHORID             int                  null,
   YEAR                 int                  not null,
   NUMPAGES             int                  not null,
   PRICE                float                not null,
   AUTHOR               varchar(1024)        not null,
   CATEGORIES           varchar(1024)        null,
   NUM_AUTHORS          int                  null,
   BOUGHT_QUANTITY      int                   ,
   constraint PK_PRODUCTS primary key (PRODUCTNAME)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_3_FK on PRODUCTS (ADMINID ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_2_FK on PRODUCTS (READERID ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_4_FK on PRODUCTS (AUTHORID ASC)
go

/*==============================================================*/
/* Table: READER                                                */
/*==============================================================*/
create table READER (
   READERNAME           varchar(1024)        not null,
   READERID             int      identity(1,1)            not null,
   BOUGHTBOOKS          int                               null,
   READERUSER           varchar(1024)   unique            not null,
   READERPASSWD         varchar(1024)        not null,
   constraint PK_READER primary key (READERID)
)
go

/*==============================================================*/
/* Table: RESEARCHPAPERS                                        */
/*==============================================================*/
create table RESEARCHPAPERS (
   PRODUCTNAME          varchar(1024)        not null,
   TYPE                 varchar(1024)        not null,
   ADMINID              int                  null,
   READERID             int                  null,
   AUTHORID             int                  null,
   YEAR                 int                  not null,
   NUMPAGES             int                  not null,
   PRICE                float                not null,
   AUTHOR               varchar(1024)        not null,
   CATEGORIES           varchar(1024)        null,
   NUM_AUTHORS          int                  null,
   NUM_CHAPTERS         int                  null,
   RESEARCHID           int                  null,
   AVAILABLERESEARCH    int                  not null,
   RESEARCHLANG         char(255)            not null,
   constraint PK_RESEARCHPAPERS primary key (PRODUCTNAME)
)
go

alter table BOOK
   add constraint FK_BOOK_INHERITAN_PRODUCTS foreign key (PRODUCTNAME)
      references PRODUCTS (PRODUCTNAME)
go

alter table CART
   add constraint FK_CART_RELATIONS_PRODUCTS foreign key (PRODUCTNAME)
      references PRODUCTS (PRODUCTNAME)
go

alter table COMICBOOK
   add constraint FK_COMICBOO_INHERITAN_PRODUCTS foreign key (PRODUCTNAME)
      references PRODUCTS (PRODUCTNAME)
go

alter table MAGAZINE
   add constraint FK_MAGAZINE_INHERITAN_PRODUCTS foreign key (PRODUCTNAME)
      references PRODUCTS (PRODUCTNAME)
go

alter table PRODUCTS
   add constraint FK_PRODUCTS_RELATIONS_READER foreign key (READERID)
      references READER (READERID)
go

alter table PRODUCTS
   add constraint FK_PRODUCTS_RELATIONS_ADMIN foreign key (ADMINID)
      references ADMIN (ADMINID)
go

alter table PRODUCTS
   add constraint FK_PRODUCTS_RELATIONS_AUTHOR foreign key (AUTHORID)
      references AUTHOR (AUTHORID)
go

alter table RESEARCHPAPERS
   add constraint FK_RESEARCH_INHERITAN_PRODUCTS foreign key (PRODUCTNAME)
      references PRODUCTS (PRODUCTNAME)
go

 
/* what is the most interesting book "title" that has Max number of buyers ?*/
SELECT PRODUCTNAME,PRICE,AUTHOR,BOUGHT_QUANTITY AS MostSelling FROM PRODUCTS ORDER BY BOUGHT_QUANTITY DESC

/* what was the book " title " that had not any buyers last month */
SELECT distinct AUTHOR,PRODUCTS.PRODUCTNAME,CART.MONTH,CART.YEAR AS No_Buyers FROM PRODUCTS,CART WHERE  BOUGHT_QUANTITY=0 and CART.MONTH = 5  and CART.YEAR = 2020

/* what is the number of authors whose books had not any buyers during last month */
SELECT   COUNT(distinct(AUTHOR)) FROM PRODUCTS WHERE BOUGHT_QUANTITY = 0

/* who are the authors who did no upload any books yet*/
SELECT distinct AUTHOR,PRODUCTNAME AS NO_UPLOADS FROM PRODUCTS WHERE  BOUGHT_QUANTITY=0

/* what is the category with minimum number of books*/
select COUNT(CATEGORIES) , CATEGORIES  AS Category FROM PRODUCTS   GROUP BY CATEGORIES ORDER BY Category ASC

