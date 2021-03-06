USE [master]
GO
/****** Object:  Database [lucene]    Script Date: 2018/4/22 8:37:24 ******/
CREATE DATABASE [lucene]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lucene', FILENAME = N'E:\lucene.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'lucene_log', FILENAME = N'E:\lucene_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [lucene] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lucene].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lucene] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lucene] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lucene] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lucene] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lucene] SET ARITHABORT OFF 
GO
ALTER DATABASE [lucene] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lucene] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [lucene] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lucene] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lucene] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lucene] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lucene] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lucene] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lucene] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lucene] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lucene] SET  DISABLE_BROKER 
GO
ALTER DATABASE [lucene] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lucene] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lucene] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lucene] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lucene] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lucene] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lucene] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lucene] SET RECOVERY FULL 
GO
ALTER DATABASE [lucene] SET  MULTI_USER 
GO
ALTER DATABASE [lucene] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lucene] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lucene] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lucene] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'lucene', N'ON'
GO
USE [lucene]
GO
/****** Object:  StoredProcedure [dbo].[Pr_AddActionlog]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_AddActionlog]
(
	@id int,
	@productid nvarchar(50),
	@productgroup nvarchar(50),
	@userid nvarchar(50),
	@createdate datetime,
	@comments nvarchar(2000),
	@prdouctpicandprice nvarchar(2000),
	@username nvarchar(50),
	@attitude nvarchar(50),
	@tag nvarchar(5),
	@weiboqq nvarchar(500),
	@weibosina nvarchar(500)
)
AS

INSERT INTO
	Actionlog
	(id,productid,productgroup,userid,createdate,comments,prdouctpicandprice,username,attitude,tag,weiboqq,weibosina)
	VALUES
	(@id,@productid,@productgroup,@userid,@createdate,@comments,@prdouctpicandprice,@username,@attitude,@tag,@weiboqq,@weibosina)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_Addarticle]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Addarticle]
(
	@id int,
	@title nvarchar(1000),
	@content nvarchar(MAX),
	@date datetime,
	@src nvarchar(4000),
	@tag nchar(10),
	@siteid int
)
AS

INSERT INTO
	article
	(id,title,content,date,src,tag,siteid)
	VALUES
	(@id,@title,@content,@date,@src,@tag,@siteid)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_Addassign]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Addassign]
(
	@id int,
	@client_name nvarchar(50),
	@begin_id int,
	@end_id int,
	@now_id int,
	@begin_date datetime,
	@finish_date datetime
)
AS

INSERT INTO
	assign
	(id,client_name,begin_id,end_id,now_id,begin_date,finish_date)
	VALUES
	(@id,@client_name,@begin_id,@end_id,@now_id,@begin_date,@finish_date)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_Addcategory]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Addcategory]
(
	@id int,
	@siteid int,
	@category nvarchar(200),
	@depth int,
	@url nvarchar(2000),
	@parentid int
)
AS

INSERT INTO
	category
	(id,siteid,category,depth,url,parentid)
	VALUES
	(@id,@siteid,@category,@depth,@url,@parentid)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_AddClicklog]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_AddClicklog]
(
	@id int,
	@url nvarchar(1000),
	@time datetime,
	@userid nvarchar(50),
	@ip nvarchar(50),
	@mac nvarchar(50)
)
AS

INSERT INTO
	Clicklog
	(id,url,time,userid,ip,mac)
	VALUES
	(@id,@url,@time,@userid,@ip,@mac)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_Adddns]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Adddns]
(
	@id int,
	@siteurl nvarchar(50),
	@ip nvarchar(50),
	@siteid int
)
AS

INSERT INTO
	dns
	(id,siteurl,ip,siteid)
	VALUES
	(@id,@siteurl,@ip,@siteid)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_Adddtproperties]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Adddtproperties]
(
	@id int,
	@objectid int,
	@property varchar(64),
	@value varchar(255),
	@uvalue nvarchar(255),
	@lvalue  varbinary(max),
	@version int
)
AS

INSERT INTO
	dtproperties
	(id,objectid,property,value,uvalue,lvalue,version)
	VALUES
	(@id,@objectid,@property,@value,@uvalue,@lvalue,@version)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_Addproduct]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Addproduct]
(
	@id int,
	@name nvarchar(1000),
	@price money,
	@price2 money,
	@descrn nvarchar(MAX),
	@comment nvarchar(MAX),
	@website nvarchar(50),
	@link nvarchar(4000),
	@sold int,
	@product_no nvarchar(50),
	@category nvarchar(50),
	@date datetime,
	@brand nvarchar(50),
	@ask nvarchar(MAX),
	@pricetag nvarchar(50)
)
AS

INSERT INTO
	product
	(id,name,price,price2,descrn,comment,website,link,sold,product_no,category,date,brand,ask,pricetag)
	VALUES
	(@id,@name,@price,@price2,@descrn,@comment,@website,@link,@sold,@product_no,@category,@date,@brand,@ask,@pricetag)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_AddProductgroup]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_AddProductgroup]
(
	@id int,
	@category nchar(10),
	@userid nvarchar(50)
)
AS

INSERT INTO
	Productgroup
	(id,category,userid)
	VALUES
	(@id,@category,@userid)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_Addproducturl]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Addproducturl]
(
	@id int,
	@siteid int,
	@url nvarchar(2000),
	@tag nvarchar(10),
	@depth int,
	@pic nvarchar(4000)
)
AS

INSERT INTO
	producturl
	(id,siteid,url,tag,depth,pic)
	VALUES
	(@id,@siteid,@url,@tag,@depth,@pic)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_AddQuerylog]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_AddQuerylog]
(
	@id int,
	@querycontent nvarchar(2000),
	@ip nvarchar(50),
	@userid nvarchar(50),
	@mac nvarchar(50),
	@time datetime
)
AS

INSERT INTO
	Querylog
	(id,querycontent,ip,userid,mac,time)
	VALUES
	(@id,@querycontent,@ip,@userid,@mac,@time)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_Addsitename]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Addsitename]
(
	@id int,
	@siteid int,
	@sitename nvarchar(1000),
	@url nvarchar(4000),
	@tag nvarchar(10),
	@page_count int,
	@date datetime
)
AS

INSERT INTO
	sitename
	(id,siteid,sitename,url,tag,page_count,date)
	VALUES
	(@id,@siteid,@sitename,@url,@tag,@page_count,@date)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_Addtask]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Addtask]
(
	@id int,
	@client_name nvarchar(50),
	@producturl_id int,
	@tag nvarchar(10),
	@usingdate datetime,
	@finishdate datetime
)
AS

INSERT INTO
	task
	(id,client_name,producturl_id,tag,usingdate,finishdate)
	VALUES
	(@id,@client_name,@producturl_id,@tag,@usingdate,@finishdate)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_AddUserinfo]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_AddUserinfo]
(
	@id int,
	@userid nvarchar(50),
	@userheadurl nvarchar(300),
	@email nvarchar(50),
	@signature nvarchar(1000),
	@password nvarchar(50)
)
AS

INSERT INTO
	Userinfo
	(id,userid,userheadurl,email,signature,password)
	VALUES
	(@id,@userid,@userheadurl,@email,@signature,@password)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_AddUserloginlog]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_AddUserloginlog]
(
	@id int,
	@userid nvarchar(50),
	@message nvarchar(50),
	@logindate datetime,
	@exitdate datetime,
	@ip nvarchar(50),
	@mac nvarchar(50)
)
AS

INSERT INTO
	Userloginlog
	(id,userid,message,logindate,exitdate,ip,mac)
	VALUES
	(@id,@userid,@message,@logindate,@exitdate,@ip,@mac)

RETURN @@Identity

GO
/****** Object:  StoredProcedure [dbo].[Pr_GetActionlogs]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_GetActionlogs]

AS

SELECT *
FROM Actionlog

GO
/****** Object:  StoredProcedure [dbo].[Pr_Getarticles]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Getarticles]

AS

SELECT *
FROM article

GO
/****** Object:  StoredProcedure [dbo].[Pr_Getassigns]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Getassigns]

AS

SELECT *
FROM assign

GO
/****** Object:  StoredProcedure [dbo].[Pr_Getcategorys]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Getcategorys]

AS

SELECT *
FROM category

GO
/****** Object:  StoredProcedure [dbo].[Pr_GetClicklogs]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_GetClicklogs]

AS

SELECT *
FROM Clicklog

GO
/****** Object:  StoredProcedure [dbo].[Pr_Getdnss]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Getdnss]

AS

SELECT *
FROM dns

GO
/****** Object:  StoredProcedure [dbo].[Pr_Getdtpropertiess]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Getdtpropertiess]

AS

SELECT *
FROM dtproperties

GO
/****** Object:  StoredProcedure [dbo].[Pr_GetProductgroups]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_GetProductgroups]

AS

SELECT *
FROM Productgroup

GO
/****** Object:  StoredProcedure [dbo].[Pr_Getproducts]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Getproducts]

AS

SELECT *
FROM product

GO
/****** Object:  StoredProcedure [dbo].[Pr_Getproducturls]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Getproducturls]

AS

SELECT *
FROM producturl

GO
/****** Object:  StoredProcedure [dbo].[Pr_GetQuerylogs]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_GetQuerylogs]

AS

SELECT *
FROM Querylog

GO
/****** Object:  StoredProcedure [dbo].[Pr_Getsitenames]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Getsitenames]

AS

SELECT *
FROM sitename

GO
/****** Object:  StoredProcedure [dbo].[Pr_Gettasks]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_Gettasks]

AS

SELECT *
FROM task

GO
/****** Object:  StoredProcedure [dbo].[Pr_GetUrllibs]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_GetUrllibs]

AS

SELECT *
FROM Urllib

GO
/****** Object:  StoredProcedure [dbo].[Pr_GetUserinfos]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_GetUserinfos]

AS

SELECT *
FROM Userinfo

GO
/****** Object:  StoredProcedure [dbo].[Pr_GetUserloginlogs]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_GetUserloginlogs]

AS

SELECT *
FROM Userloginlog

GO
/****** Object:  StoredProcedure [dbo].[procedure_getproducturlid_to_task]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[procedure_getproducturlid_to_task]
as

insert into task(producturl_id) select id from producturl

GO
/****** Object:  Table [dbo].[article]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](1000) NULL,
	[content] [nvarchar](max) NULL,
	[date] [datetime] NULL,
	[src] [nvarchar](4000) NULL,
	[tag] [nchar](10) NULL,
	[siteid] [int] NULL,
 CONSTRAINT [PK_article] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[assign]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assign](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client_name] [nvarchar](50) NULL,
	[begin_id] [int] NULL,
	[end_id] [int] NULL,
	[now_id] [int] NULL,
	[begin_date] [datetime] NULL,
	[finish_date] [datetime] NULL,
 CONSTRAINT [PK_assign] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[caipu]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caipu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[picurl] [nvarchar](4000) NULL,
	[caitext] [nvarchar](max) NULL,
	[gongxiao] [nvarchar](2000) NULL,
	[caixi] [nvarchar](500) NULL,
	[date] [datetime] NULL,
	[name] [nvarchar](2000) NULL,
	[title_img] [nvarchar](4000) NULL,
 CONSTRAINT [PK_caipu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[caipuurl]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caipuurl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](4000) NULL,
	[title_img] [nvarchar](4000) NULL,
	[tag] [nvarchar](50) NULL,
	[caixi] [nvarchar](50) NULL,
	[siteid] [int] NULL,
 CONSTRAINT [PK_caipuurl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[caixiCategory]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caixiCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[caixi] [nvarchar](500) NULL,
	[url] [nvarchar](4000) NULL,
	[date] [datetime] NULL,
	[page_count] [int] NULL,
	[tag] [nvarchar](50) NULL,
 CONSTRAINT [PK_caixiCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[category]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[siteid] [int] NULL,
	[category] [nvarchar](200) NULL,
	[depth] [int] NULL,
	[url] [nvarchar](2000) NULL,
	[parentid] [int] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[clientuser]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientuser](
	[id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dns]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[siteurl] [nvarchar](50) NULL,
	[ip] [nvarchar](50) NULL,
	[siteid] [int] NULL,
 CONSTRAINT [PK_dns] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[food]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[siteid] [nvarchar](2000) NULL,
	[name] [nvarchar](2000) NULL,
	[dizhi] [nvarchar](2000) NULL,
	[dianhua] [nvarchar](1000) NULL,
	[pic] [nvarchar](4000) NULL,
	[fuwu] [nvarchar](1000) NULL,
	[kouwei] [nvarchar](1000) NULL,
	[huanjing] [nvarchar](1000) NULL,
	[xingjiabi] [nvarchar](500) NULL,
	[haoping] [nvarchar](500) NULL,
	[biaoqian] [nvarchar](max) NULL,
	[youhui] [nvarchar](max) NULL,
	[caidan] [nvarchar](max) NULL,
	[yingyeshijian] [nvarchar](500) NULL,
	[canyingfenlei] [nvarchar](500) NULL,
	[shangquan] [nvarchar](50) NULL,
	[renjunxiaofei] [nvarchar](50) NULL,
 CONSTRAINT [PK_food2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[foodcategory]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foodcategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](max) NULL,
	[meishifenlei] [nvarchar](500) NULL,
	[shangquan] [nvarchar](500) NULL,
	[tag] [nvarchar](10) NULL,
	[page_count] [nvarchar](2000) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_foodcategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[foodurl]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foodurl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[siteid] [int] NULL,
	[url] [nvarchar](3000) NULL,
	[tag] [nvarchar](10) NULL,
	[pic] [nvarchar](4000) NULL,
	[name] [nvarchar](2000) NULL,
	[dizhi] [nvarchar](4000) NULL,
	[fuwu] [nvarchar](10) NULL,
	[kouwei] [nvarchar](10) NULL,
	[huanjing] [nvarchar](50) NULL,
	[xingjiabi] [nvarchar](10) NULL,
	[haoping] [nvarchar](50) NULL,
	[biaoqian] [nvarchar](2000) NULL,
	[youhui] [nvarchar](2000) NULL,
	[shangquan] [nvarchar](50) NULL,
	[meishi_fenlei] [nvarchar](50) NULL,
	[renjunxiaofei] [nvarchar](50) NULL,
	[page_id] [nvarchar](50) NULL,
 CONSTRAINT [PK_foodurl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[meishijie_catecory]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meishijie_catecory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fenlei] [nvarchar](500) NULL,
	[url] [nvarchar](4000) NULL,
	[tag] [nvarchar](50) NULL,
	[date] [datetime] NULL,
	[page_count] [int] NULL,
 CONSTRAINT [PK_meishijie_catecory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[meishijie_categoryurl]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meishijie_categoryurl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](4000) NULL,
	[tag] [nvarchar](50) NULL,
	[siteid] [int] NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_meishijie_categoryurl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[meishijie_tuwen]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meishijie_tuwen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[picurl] [nvarchar](4000) NULL,
	[tag] [nvarchar](50) NULL,
	[name] [nvarchar](2000) NULL,
	[picname] [nvarchar](2000) NULL,
	[txt] [nvarchar](max) NULL,
	[date] [datetime] NULL,
	[url] [nvarchar](4000) NULL,
 CONSTRAINT [PK_meishijie_tuwen2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1000) NULL,
	[pricetag] [nvarchar](50) NULL,
	[price] [money] NULL,
	[price2] [money] NULL,
	[descrn] [nvarchar](max) NULL,
	[comment] [nvarchar](max) NULL,
	[website] [nvarchar](50) NULL,
	[link] [nvarchar](4000) NULL,
	[sold] [int] NULL,
	[product_no] [nvarchar](50) NULL,
	[category] [nvarchar](50) NULL,
	[date] [datetime] NULL,
	[brand] [nvarchar](50) NULL,
	[ask] [nvarchar](max) NULL,
	[pic] [nvarchar](4000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[producturl]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producturl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[siteid] [int] NULL,
	[url] [nvarchar](2000) NULL,
	[tag] [nvarchar](10) NULL,
	[depth] [int] NULL,
	[pic] [nvarchar](4000) NULL,
	[name] [nvarchar](2000) NULL,
	[dizhi] [nvarchar](4000) NULL,
	[fuwu] [nvarchar](50) NULL,
	[kouwei] [nvarchar](50) NULL,
	[huanjing] [nvarchar](50) NULL,
 CONSTRAINT [PK_producturl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sitename]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sitename](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[siteid] [int] NULL,
	[sitename] [nvarchar](1000) NULL,
	[url] [nvarchar](4000) NULL,
	[tag] [nvarchar](10) NULL,
	[page_count] [int] NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_sitename] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stock_id_jiaoyimingxi]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_id_jiaoyimingxi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[chengjiaojia] [nvarchar](50) NULL,
	[zhangdiefhu] [nvarchar](50) NULL,
	[jiagebiandong] [nvarchar](50) NULL,
	[chengjiaoliang] [nvarchar](50) NULL,
	[chengjiaoe] [nvarchar](50) NULL,
	[xingzhi] [nvarchar](50) NULL,
	[stock_id] [nvarchar](50) NULL,
	[date] [nvarchar](50) NULL,
	[filedate] [date] NULL,
 CONSTRAINT [PK_stock_id_jiaoyimingxi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stock_id_name]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_id_name](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stock_name] [nvarchar](50) NULL,
	[stock_type] [nvarchar](50) NULL,
	[tag] [nvarchar](50) NULL,
	[tag_date] [nvarchar](50) NULL,
	[stock_id] [nvarchar](50) NULL,
 CONSTRAINT [PK_stock_id_name] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stock_liutonggudong]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_liutonggudong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stock_id] [nvarchar](50) NULL,
	[gudongmingcheng] [nvarchar](50) NULL,
	[chigushuliang] [nvarchar](50) NULL,
	[chigubili] [nvarchar](50) NULL,
	[gubenxingzhi] [nvarchar](50) NULL,
	[date] [nvarchar](50) NULL,
	[filedate] [date] NULL,
 CONSTRAINT [PK_stock_liutonggudong] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stock_trade_history]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_trade_history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stock_id] [nvarchar](50) NULL,
	[stock_name] [nvarchar](50) NULL,
	[kaipanjia] [nvarchar](50) NULL,
	[zuigaojia] [nvarchar](50) NULL,
	[soupanjia] [nvarchar](50) NULL,
	[zuidijia] [nvarchar](50) NULL,
	[jiaoyiliang] [nvarchar](50) NULL,
	[jiaoyijine] [nvarchar](50) NULL,
	[date] [nvarchar](50) NULL,
 CONSTRAINT [PK_stock_trade_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[task]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client_name] [nvarchar](50) NULL,
	[producturl_id] [int] NULL,
	[tag] [nvarchar](10) NULL,
	[usingdate] [datetime] NULL,
	[finishdate] [datetime] NULL,
 CONSTRAINT [PK_task] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tianya_bbs]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tianya_bbs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[title] [nvarchar](3000) NULL,
	[dianji] [nvarchar](500) NULL,
	[huifu] [nvarchar](1000) NULL,
	[createdate] [nvarchar](100) NULL,
	[txt] [nvarchar](max) NULL,
	[bbsid] [nvarchar](1000) NULL,
 CONSTRAINT [PK_tianya_bbs2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tianya_catecory_url]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tianya_catecory_url](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](4000) NULL,
	[name] [nvarchar](2000) NULL,
	[tag] [nvarchar](50) NULL,
	[siteid] [int] NULL,
	[date] [datetime] NULL,
	[creatdate] [datetime] NULL,
	[fenlei] [nvarchar](1000) NULL,
 CONSTRAINT [PK_tianya_catecory_url] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tianya_category]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tianya_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fenlei] [nvarchar](500) NULL,
	[url] [nvarchar](4000) NULL,
	[date] [datetime] NULL,
	[tag] [nchar](50) NULL,
	[page_count] [int] NULL,
 CONSTRAINT [PK_tianya_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[URLLIB]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URLLIB](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sitename] [nvarchar](500) NULL,
	[link] [nvarchar](4000) NULL,
 CONSTRAINT [PK_URLLIB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_URLLIB] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[weixin_article]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weixin_article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](4000) NULL,
	[body] [nvarchar](max) NULL,
	[user_id] [nvarchar](4000) NULL,
	[user_name] [nvarchar](4000) NULL,
	[url] [nvarchar](max) NULL,
	[post] [nvarchar](50) NULL,
	[c_date] [datetime] NULL,
 CONSTRAINT [PK_weixin_article] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[weixin_lib]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weixin_lib](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](max) NULL,
	[user_id] [nvarchar](1000) NULL,
	[tag] [nvarchar](50) NULL,
	[c_date] [datetime] NULL,
	[user_name] [nvarchar](1000) NULL,
 CONSTRAINT [PK_weixin_lib] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[weixin_url]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weixin_url](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](max) NULL,
	[name] [nvarchar](4000) NULL,
	[userid] [nvarchar](4000) NULL,
	[tag] [nchar](10) NULL,
	[datatime] [datetime] NULL,
 CONSTRAINT [PK_weixin_url] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ziben_artitle]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ziben_artitle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jijingguanliren_c] [nvarchar](4000) NULL,
	[jijingguanliren_e] [nvarchar](4000) NULL,
	[zhucedizhi] [nvarchar](4000) NULL,
	[bangongdizhi] [nvarchar](4000) NULL,
	[guanlijijinzhuyaoleibie] [nvarchar](4000) NULL,
	[chenglishijian] [nvarchar](4000) NULL,
	[dengjishijian] [nvarchar](4000) NULL,
	[dengjibianhao] [nvarchar](4000) NULL,
	[zhuzhijigoudaima] [nvarchar](4000) NULL,
	[qiyexingzhi] [nvarchar](4000) NULL,
	[zhuceziben] [nvarchar](4000) NULL,
	[shishouziben] [nvarchar](4000) NULL,
	[zhucezibenshijiaobili] [nvarchar](4000) NULL,
	[fadingdaibiaoren_name] [nvarchar](4000) NULL,
	[fadingdaibiaoren_resume] [nvarchar](max) NULL,
	[gaoguanqingkuang] [nvarchar](max) NULL,
	[yuangongrenshu] [nvarchar](4000) NULL,
	[jigouwangzhi] [nvarchar](max) NULL,
	[guanlirendengjihouxinbeianjijin] [nvarchar](max) NULL,
	[jijinxiehuitebietishi] [nvarchar](max) NULL,
	[url] [nvarchar](4000) NULL,
	[c_date] [datetime] NULL,
 CONSTRAINT [PK_ziben_artitle6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ziben_artitle2]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ziben_artitle2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jijingguanliren_c] [nvarchar](4000) NULL,
	[jijingguanliren_e] [nvarchar](4000) NULL,
	[zhucedizhi] [nvarchar](4000) NULL,
	[bangongdizhi] [nvarchar](4000) NULL,
	[guanlijijinzhuyaoleibie] [nvarchar](4000) NULL,
	[chenglishijian] [nvarchar](4000) NULL,
	[dengjishijian] [nvarchar](4000) NULL,
	[dengjibianhao] [nvarchar](4000) NULL,
	[zhuzhijigoudaima] [nvarchar](4000) NULL,
	[qiyexingzhi] [nvarchar](4000) NULL,
	[zhuceziben] [nvarchar](4000) NULL,
	[shishouziben] [nvarchar](4000) NULL,
	[zhucezibenshijiaobili] [nvarchar](4000) NULL,
	[fadingdaibiaoren_name] [nvarchar](4000) NULL,
	[fadingdaibiaoren_resume] [nvarchar](4000) NULL,
	[gaoguanqingkuang] [nvarchar](4000) NULL,
	[yuangongrenshu] [nvarchar](4000) NULL,
	[jigouwangzhi] [nvarchar](max) NULL,
	[guanlirendengjihouxinbeianjijin] [nvarchar](4000) NULL,
	[jijinxiehuitebietishi] [nvarchar](4000) NULL,
	[url] [nvarchar](4000) NULL,
	[c_date] [datetime] NULL,
 CONSTRAINT [PK_art_artitle2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ziben_artitle3]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ziben_artitle3](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jijingguanliren_c] [nvarchar](1000) NULL,
	[jijingguanliren_e] [nchar](10) NULL,
	[zhucedizhi] [nvarchar](1000) NULL,
	[bangongdizhi] [nvarchar](1000) NULL,
	[guanlijijinzhuyaoleibie] [nvarchar](50) NULL,
	[chenglishijian] [nvarchar](50) NULL,
	[dengjishijian] [nvarchar](50) NULL,
	[dengjibianhao] [nvarchar](50) NULL,
	[zhuzhijigoudaima] [nvarchar](50) NULL,
	[qiyexingzhi] [nvarchar](50) NULL,
	[zhuceziben] [nvarchar](50) NULL,
	[shishouziben] [nvarchar](50) NULL,
	[zhucezibenshijiaobili] [nvarchar](50) NULL,
	[fadingdaibiaoren_name] [nvarchar](50) NULL,
	[fadingdaibiaoren_resume] [nvarchar](4000) NULL,
	[gaoguanqingkuang] [nvarchar](4000) NULL,
	[yuangongrenshu] [nvarchar](50) NULL,
	[jigouwangzhi] [nvarchar](max) NULL,
	[guanlirendengjihouxinbeianjijin] [nvarchar](4000) NULL,
	[jijinxiehuitebietishi] [nvarchar](4000) NULL,
	[url] [nvarchar](4000) NULL,
	[c_date] [datetime] NULL,
 CONSTRAINT [PK_ziben_artitle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ziben_artitle8]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ziben_artitle8](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jijingguanliren_c] [nvarchar](4000) NULL,
	[jijingguanliren_e] [nvarchar](4000) NULL,
	[zhucedizhi] [nvarchar](4000) NULL,
	[bangongdizhi] [nvarchar](4000) NULL,
	[guanlijijinzhuyaoleibie] [nvarchar](4000) NULL,
	[chenglishijian] [nvarchar](4000) NULL,
	[dengjishijian] [nvarchar](4000) NULL,
	[dengjibianhao] [nvarchar](4000) NULL,
	[zhuzhijigoudaima] [nvarchar](4000) NULL,
	[qiyexingzhi] [nvarchar](4000) NULL,
	[zhuceziben] [nvarchar](4000) NULL,
	[shishouziben] [nvarchar](4000) NULL,
	[zhucezibenshijiaobili] [nvarchar](4000) NULL,
	[fadingdaibiaoren_name] [nvarchar](4000) NULL,
	[fadingdaibiaoren_resume] [nvarchar](max) NULL,
	[gaoguanqingkuang] [nvarchar](4000) NULL,
	[yuangongrenshu] [nvarchar](4000) NULL,
	[jigouwangzhi] [nvarchar](max) NULL,
	[guanlirendengjihouxinbeianjijin] [nvarchar](4000) NULL,
	[jijinxiehuitebietishi] [nvarchar](4000) NULL,
	[url] [nvarchar](4000) NULL,
	[c_date] [datetime] NULL,
 CONSTRAINT [PK_ziben_artitle5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ziben_url]    Script Date: 2018/4/22 8:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ziben_url](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](4000) NULL,
	[tag] [nvarchar](50) NULL,
 CONSTRAINT [PK_ziben_url] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [lucene] SET  READ_WRITE 
GO
