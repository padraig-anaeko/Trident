/****** Object:  DatabaseRole [role_webuser]    Script Date: 5/11/2023 5:14:39 PM ******/
CREATE ROLE [role_webuser]
GO
/****** Object:  Table [dbo].[Deployment]    Script Date: 5/11/2023 5:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deployment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OctopusId] [nvarchar](256) NOT NULL,
	[ReleaseId] [int] NOT NULL,
	[EnvironmentId] [int] NOT NULL,
	[TenantId] [int] NULL,
	[QueueTime] [datetime2](7) NOT NULL,
	[StartTime] [datetime2](7) NULL,
	[CompletedTime] [datetime2](7) NULL,
	[DeploymentState] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Deployment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Environment]    Script Date: 5/11/2023 5:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Environment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OctopusId] [nvarchar](256) NOT NULL,
	[SpaceId] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Environment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instance]    Script Date: 5/11/2023 5:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OctopusId] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Url] [nvarchar](1024) NOT NULL,
	[ApiKey] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Instance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 5/11/2023 5:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OctopusId] [nvarchar](256) NOT NULL,
	[SpaceId] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Release]    Script Date: 5/11/2023 5:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Release](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OctopusId] [nvarchar](256) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Version] [nvarchar](256) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Release] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchemaVersions]    Script Date: 5/11/2023 5:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchemaVersions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScriptName] [nvarchar](255) NOT NULL,
	[Applied] [datetime] NOT NULL,
 CONSTRAINT [PK_SchemaVersions_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Space]    Script Date: 5/11/2023 5:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Space](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OctopusId] [nvarchar](256) NOT NULL,
	[InstanceId] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Space] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sync]    Script Date: 5/11/2023 5:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sync](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InstanceId] [int] NOT NULL,
	[State] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](1024) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Started] [datetime2](7) NULL,
	[Completed] [datetime2](7) NULL,
	[SearchStateDate] [datetime2](7) NULL,
	[RetryAttempts] [int] NULL,
 CONSTRAINT [PK_Sync] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SyncLog]    Script Date: 5/11/2023 5:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SyncLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SyncId] [int] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Type] [nvarchar](256) NOT NULL,
	[Message] [nvarchar](2048) NOT NULL,
 CONSTRAINT [PK_SyncLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 5/11/2023 5:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OctopusId] [nvarchar](256) NOT NULL,
	[SpaceId] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Deployment]  WITH CHECK ADD  CONSTRAINT [FK_Deployment_Environment] FOREIGN KEY([EnvironmentId])
REFERENCES [dbo].[Environment] ([Id])
GO
ALTER TABLE [dbo].[Deployment] CHECK CONSTRAINT [FK_Deployment_Environment]
GO
ALTER TABLE [dbo].[Deployment]  WITH CHECK ADD  CONSTRAINT [FK_Deployment_Release] FOREIGN KEY([ReleaseId])
REFERENCES [dbo].[Release] ([Id])
GO
ALTER TABLE [dbo].[Deployment] CHECK CONSTRAINT [FK_Deployment_Release]
GO
ALTER TABLE [dbo].[Deployment]  WITH CHECK ADD  CONSTRAINT [FK_Deployment_Tenant] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([Id])
GO
ALTER TABLE [dbo].[Deployment] CHECK CONSTRAINT [FK_Deployment_Tenant]
GO
ALTER TABLE [dbo].[Environment]  WITH CHECK ADD  CONSTRAINT [FK_Environment_Space] FOREIGN KEY([SpaceId])
REFERENCES [dbo].[Space] ([Id])
GO
ALTER TABLE [dbo].[Environment] CHECK CONSTRAINT [FK_Environment_Space]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Space] FOREIGN KEY([SpaceId])
REFERENCES [dbo].[Space] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Space]
GO
ALTER TABLE [dbo].[Release]  WITH CHECK ADD  CONSTRAINT [FK_Release_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Release] CHECK CONSTRAINT [FK_Release_Project]
GO
ALTER TABLE [dbo].[Space]  WITH CHECK ADD  CONSTRAINT [FK_Space_Instance] FOREIGN KEY([InstanceId])
REFERENCES [dbo].[Instance] ([Id])
GO
ALTER TABLE [dbo].[Space] CHECK CONSTRAINT [FK_Space_Instance]
GO
ALTER TABLE [dbo].[Sync]  WITH CHECK ADD  CONSTRAINT [FK_Sync_Instance] FOREIGN KEY([InstanceId])
REFERENCES [dbo].[Instance] ([Id])
GO
ALTER TABLE [dbo].[Sync] CHECK CONSTRAINT [FK_Sync_Instance]
GO
ALTER TABLE [dbo].[SyncLog]  WITH CHECK ADD  CONSTRAINT [FK_SyncLog_Sync] FOREIGN KEY([SyncId])
REFERENCES [dbo].[Sync] ([Id])
GO
ALTER TABLE [dbo].[SyncLog] CHECK CONSTRAINT [FK_SyncLog_Sync]
GO
ALTER TABLE [dbo].[Tenant]  WITH CHECK ADD  CONSTRAINT [FK_Tenant_Space] FOREIGN KEY([SpaceId])
REFERENCES [dbo].[Space] ([Id])
GO
ALTER TABLE [dbo].[Tenant] CHECK CONSTRAINT [FK_Tenant_Space]
GO
