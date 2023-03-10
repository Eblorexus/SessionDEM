USE [Kurort_LesoparkSPB]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 09.03.2023 11:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID_client] [int] NOT NULL,
	[Passport_information] [nvarchar](100) NOT NULL,
	[Born_date] [date] NOT NULL,
	[Adress] [nvarchar](100) NOT NULL,
	[ID_user] [int] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09.03.2023 11:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID_order] [int] NOT NULL,
	[Order_code] [nvarchar](50) NOT NULL,
	[Date_of_creation] [date] NOT NULL,
	[Time_creation] [time](7) NOT NULL,
	[ID_user] [int] NOT NULL,
	[Nums_of_service] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](24) NOT NULL,
	[Date_of_ending] [date] NOT NULL,
	[Actual_time] [nvarchar](24) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09.03.2023 11:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_role] [int] NOT NULL,
	[Name_role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 09.03.2023 11:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID_service] [int] NOT NULL,
	[Name_service] [nvarchar](24) NOT NULL,
	[Code_service] [nvarchar](24) NOT NULL,
	[Price] [money] NOT NULL,
	[ID_order] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID_service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09.03.2023 11:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID_user] [int] NOT NULL,
	[FIO] [nvarchar](100) NOT NULL,
	[Phone_number] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[ID_role] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_try_info]    Script Date: 09.03.2023 11:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_try_info](
	[ID_try] [int] NOT NULL,
	[ID_user] [int] NOT NULL,
	[Time_begin] [datetime] NOT NULL,
	[Time_end] [datetime] NOT NULL,
	[Type_try] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User_try_info] PRIMARY KEY CLUSTERED 
(
	[ID_try] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_User] FOREIGN KEY([ID_user])
REFERENCES [dbo].[User] ([ID_user])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([ID_user])
REFERENCES [dbo].[User] ([ID_user])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Order] FOREIGN KEY([ID_order])
REFERENCES [dbo].[Order] ([ID_order])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Order]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([ID_role])
REFERENCES [dbo].[Role] ([ID_role])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User_try_info]  WITH CHECK ADD  CONSTRAINT [FK_User_try_info_User] FOREIGN KEY([ID_user])
REFERENCES [dbo].[User] ([ID_user])
GO
ALTER TABLE [dbo].[User_try_info] CHECK CONSTRAINT [FK_User_try_info_User]
GO
