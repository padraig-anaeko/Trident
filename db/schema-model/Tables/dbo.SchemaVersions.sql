CREATE TABLE [dbo].[SchemaVersions]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ScriptName] [nvarchar] (255) NOT NULL,
[Applied] [datetime] NOT NULL
)
GO
ALTER TABLE [dbo].[SchemaVersions] ADD CONSTRAINT [PK_SchemaVersions_Id] PRIMARY KEY CLUSTERED ([Id])
GO
