USE [C:\USERS\DUKESC\SOURCE\REPOS\KRISSYDOTNET\PTO\SRC\PTO\APP_DATA\PTO_DB.MDF]
GO
/****** Object:  Table [dbo].[PTORequests]    Script Date: 1/22/2019 9:59:28 AM ******/
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
/****** Object:  Table [dbo].[TimeOffType]    Script Date: 1/22/2019 9:59:28 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 1/22/2019 9:59:28 AM ******/
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
SET IDENTITY_INSERT [dbo].[PTORequests] ON 

INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (115, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), CAST(N'2019-01-01 00:00:00.000' AS DateTime), 48, N'Roll over PTO', 6, CAST(N'2019-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (116, 3, CAST(N'2019-01-01 00:00:00.000' AS DateTime), CAST(N'2019-01-01 00:00:00.000' AS DateTime), 48, N'Roll over PTO', 6, CAST(N'2019-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (117, 4, CAST(N'2019-01-01 00:00:00.000' AS DateTime), CAST(N'2019-01-01 00:00:00.000' AS DateTime), 24, N'Roll over PTO', 6, CAST(N'2019-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (118, 5, CAST(N'2019-01-01 00:00:00.000' AS DateTime), CAST(N'2019-01-01 00:00:00.000' AS DateTime), 12, N'Roll over PTO', 6, CAST(N'2019-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (119, 6, CAST(N'2019-01-01 00:00:00.000' AS DateTime), CAST(N'2019-01-01 00:00:00.000' AS DateTime), -16, N'Roll over PTO', 6, CAST(N'2019-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (120, 7, CAST(N'2019-01-01 00:00:00.000' AS DateTime), CAST(N'2019-01-01 00:00:00.000' AS DateTime), 20, N'Roll over PTO', 6, CAST(N'2019-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (121, 8, CAST(N'2019-01-01 00:00:00.000' AS DateTime), CAST(N'2019-01-01 00:00:00.000' AS DateTime), 48, N'Roll over PTO', 6, CAST(N'2019-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (282, 1, CAST(N'2019-01-22 09:51:05.430' AS DateTime), CAST(N'2019-01-22 09:51:05.430' AS DateTime), 8, N'Auto accrual', 1, CAST(N'2019-01-22 09:51:05.430' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (283, 3, CAST(N'2019-01-22 09:51:05.430' AS DateTime), CAST(N'2019-01-22 09:51:05.430' AS DateTime), 8, N'Auto accrual', 1, CAST(N'2019-01-22 09:51:05.430' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (284, 4, CAST(N'2019-01-22 09:51:05.430' AS DateTime), CAST(N'2019-01-22 09:51:05.430' AS DateTime), 8, N'Auto accrual', 1, CAST(N'2019-01-22 09:51:05.430' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (285, 5, CAST(N'2019-01-22 09:51:05.430' AS DateTime), CAST(N'2019-01-22 09:51:05.430' AS DateTime), 8, N'Auto accrual', 1, CAST(N'2019-01-22 09:51:05.430' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (286, 6, CAST(N'2019-01-22 09:51:05.430' AS DateTime), CAST(N'2019-01-22 09:51:05.430' AS DateTime), 8, N'Auto accrual', 1, CAST(N'2019-01-22 09:51:05.430' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (287, 7, CAST(N'2019-01-22 09:51:05.430' AS DateTime), CAST(N'2019-01-22 09:51:05.430' AS DateTime), 8, N'Auto accrual', 1, CAST(N'2019-01-22 09:51:05.430' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (288, 8, CAST(N'2019-01-22 09:51:05.430' AS DateTime), CAST(N'2019-01-22 09:51:05.430' AS DateTime), 8, N'Auto accrual', 1, CAST(N'2019-01-22 09:51:05.430' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (289, 1, CAST(N'2019-01-18 00:00:00.000' AS DateTime), CAST(N'2019-01-18 00:00:00.000' AS DateTime), 8, N'', 3, CAST(N'2019-01-22 09:51:38.447' AS DateTime), NULL)
INSERT [dbo].[PTORequests] ([Id], [userid], [start_date], [end_date], [hours], [comments], [typeid], [date_requested], [date_approved]) VALUES (290, 1, CAST(N'2019-01-25 00:00:00.000' AS DateTime), CAST(N'2019-02-01 00:00:00.000' AS DateTime), 48, N'', 2, CAST(N'2019-01-22 09:52:36.600' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PTORequests] OFF
SET IDENTITY_INSERT [dbo].[TimeOffType] ON 

INSERT [dbo].[TimeOffType] ([typeid], [description], [credit]) VALUES (1, N'Auto accrual', 1)
INSERT [dbo].[TimeOffType] ([typeid], [description], [credit]) VALUES (2, N'Vacation', 0)
INSERT [dbo].[TimeOffType] ([typeid], [description], [credit]) VALUES (3, N'Sick', 0)
INSERT [dbo].[TimeOffType] ([typeid], [description], [credit]) VALUES (4, N'Jury Duty', 0)
INSERT [dbo].[TimeOffType] ([typeid], [description], [credit]) VALUES (5, N'Bereavement', 0)
INSERT [dbo].[TimeOffType] ([typeid], [description], [credit]) VALUES (6, N'Beginning Balance', 1)
INSERT [dbo].[TimeOffType] ([typeid], [description], [credit]) VALUES (7, N'Doctor Appointment', 0)
INSERT [dbo].[TimeOffType] ([typeid], [description], [credit]) VALUES (8, N'PTO Credit', 1)
SET IDENTITY_INSERT [dbo].[TimeOffType] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userid], [name], [admin], [total_pto], [used_pto], [active], [accrual_rate], [balance_pto]) VALUES (1, N'Tim', 1, 56, 8, 1, 8, 48)
INSERT [dbo].[Users] ([userid], [name], [admin], [total_pto], [used_pto], [active], [accrual_rate], [balance_pto]) VALUES (3, N'Leah', 0, 56, 0, 1, 8, 56)
INSERT [dbo].[Users] ([userid], [name], [admin], [total_pto], [used_pto], [active], [accrual_rate], [balance_pto]) VALUES (4, N'Michael', 0, 32, 0, 1, 8, 32)
INSERT [dbo].[Users] ([userid], [name], [admin], [total_pto], [used_pto], [active], [accrual_rate], [balance_pto]) VALUES (5, N'Daniel', 0, 20, 0, 1, 8, 20)
INSERT [dbo].[Users] ([userid], [name], [admin], [total_pto], [used_pto], [active], [accrual_rate], [balance_pto]) VALUES (6, N'Chelsey', 0, -8, 0, 1, 8, -8)
INSERT [dbo].[Users] ([userid], [name], [admin], [total_pto], [used_pto], [active], [accrual_rate], [balance_pto]) VALUES (7, N'Alex', 0, 36, 0, 1, 8, 36)
INSERT [dbo].[Users] ([userid], [name], [admin], [total_pto], [used_pto], [active], [accrual_rate], [balance_pto]) VALUES (8, N'Judi', 0, 56, 0, 1, 8, 56)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[PTORequests]  WITH CHECK ADD  CONSTRAINT [FK_PTORequests_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[PTORequests] CHECK CONSTRAINT [FK_PTORequests_Users]
GO
/****** Object:  StoredProcedure [dbo].[spApprovePTORequest]    Script Date: 1/22/2019 9:59:28 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spAutoAccrual]    Script Date: 1/22/2019 9:59:28 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertPTORequest]    Script Date: 1/22/2019 9:59:28 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdatePTORequest]    Script Date: 1/22/2019 9:59:28 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdatePTOUsed]    Script Date: 1/22/2019 9:59:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdatePTOUsed]

AS
UPDATE Users set used_pto = used_pto + I.hours, balance_pto = balance_pto - I.hours 
FROM Users inner join 
(SELECT PTORequests.userid, PTORequests.hours
FROM     PTORequests INNER JOIN
                  TimeOffType ON PTORequests.typeid = TimeOffType.typeid
WHERE  (TimeOffType.credit = 0) AND CAST(PTORequests.start_date as DATE) =CAST(GETDATE() as DATE) ) 
I on Users.userid = I.userid

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePTOUsedByUser]    Script Date: 1/22/2019 9:59:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdatePTOUsedByUser]
	@userid int,
	@hours int
AS
	UPDATE Users set used_pto = used_pto + @hours, balance_pto = balance_pto - @hours 
	Where userid=@userid

RETURN 0
GO
/****** Object:  Trigger [dbo].[TriggerPTOCredit]    Script Date: 1/22/2019 9:59:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TriggerPTOCredit]
	ON [dbo].[PTORequests]
	FOR INSERT
	AS
	BEGIN
	
	if   exists (select 1 from inserted INNER JOIN TimeOffType ON inserted.typeid = TimeOffType.typeid WHERE TimeOffType.credit = 1)
		BEGIN
			update Users set total_pto = total_pto + I.hours, balance_pto = balance_pto + I.hours from Users inner join Inserted I on Users.userid = I.userid

		END

	
		SET NOCOUNT ON
	END
GO
