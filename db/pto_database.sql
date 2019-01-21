USE [C:\USERS\DUKESC\SOURCE\REPOS\KRISSYDOTNET\PTO\SRC\PTO\APP_DATA\PTO_DB.MDF]
GO
/****** Object:  Table [dbo].[PTORequests]    Script Date: 1/21/2019 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PTORequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[hours] [int] NULL,
	[comments] [nvarchar](100) NULL,
	[typeid] [int] NOT NULL,
	[date_requested] [datetime] NULL DEFAULT (getdate()),
	[date_approved] [datetime] NULL,
 CONSTRAINT [PK_PTORequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimeOffType]    Script Date: 1/21/2019 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeOffType](
	[typeid] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[credit] [bit] NULL,
 CONSTRAINT [PK_TimeOffType] PRIMARY KEY CLUSTERED 
(
	[typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/21/2019 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[admin] [bit] NOT NULL DEFAULT ((0)),
	[total_pto] [int] NOT NULL DEFAULT ((0)),
	[used_pto] [int] NOT NULL DEFAULT ((0)),
	[active] [bit] NOT NULL DEFAULT ((0)),
	[accrual_rate] [int] NOT NULL DEFAULT ((8)),
	[balance_pto] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[PTORequests]  WITH CHECK ADD  CONSTRAINT [FK_PTORequests_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[PTORequests] CHECK CONSTRAINT [FK_PTORequests_Users]
GO
/****** Object:  StoredProcedure [dbo].[spApprovePTORequest]    Script Date: 1/21/2019 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spApprovePTORequest]
	@id int
AS
	UPDATE PTORequests
	SET date_approved=GetDate()
	Where Id=@id

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spAutoAccrual]    Script Date: 1/21/2019 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAutoAccrual]

AS
INSERT INTO PTORequests (userid, start_date, end_date, hours, comments, typeid)
SELECT userid, GetDate() as start_date, GetDate() as end_date, accrual_rate as hours, 'Auto accrual' as comments, 1 as typeid 
From Users
Where active=1
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spInsertPTORequest]    Script Date: 1/21/2019 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertPTORequest]
	@userid int,
	@start_date datetime,
	@end_date datetime,
	@hours int,
	@comments nvarchar(100),
	@typeid int
AS
	INSERT INTO [dbo].[PTORequests]
           ([userid]
           ,[start_date]
           ,[end_date]
           ,[hours]
           ,[comments]
           ,[typeid]
		   ,[date_requested])
     VALUES
           (@userid
           ,@start_date
           ,@end_date
           ,@hours
           ,@comments
           ,@typeid, 
		   GETDATE())
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePTORequest]    Script Date: 1/21/2019 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdatePTORequest]
	@id int,
	@start_date datetime,
	@end_date datetime,
	@hours int,
	@comments nvarchar(100),
	@typeid int
AS
UPDATE PTORequests
SET start_date = @start_date,  end_date = @end_date, typeid=@typeid, hours=@hours, comments = @comments
WHERE Id=@id;

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePTOUsed]    Script Date: 1/21/2019 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdatePTOUsed]

AS
UPDATE Users set used_pto = used_pto - I.hours, balance_pto = balance_pto - I.hours 
FROM Users inner join 
(SELECT PTORequests.userid, PTORequests.hours
FROM     PTORequests INNER JOIN
                  TimeOffType ON PTORequests.typeid = TimeOffType.typeid
WHERE  (TimeOffType.credit = 0) AND CAST(PTORequests.start_date as DATE) =CAST(GETDATE() as DATE) ) 
I on Users.userid = I.userid

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePTOUsedByUser]    Script Date: 1/21/2019 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdatePTOUsedByUser]
	@userid int,
	@hours int
AS
	UPDATE Users set used_pto = used_pto - @hours, balance_pto = balance_pto - @hours 
	Where userid=@userid

RETURN 0
GO
