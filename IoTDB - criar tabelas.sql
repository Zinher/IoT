USE [IOTDB]
GO
/****** Object:  Table [dbo].[AtuadorProgramavel]    Script Date: 29/05/2017 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AtuadorProgramavel](
	[Id] [int] NOT NULL,
	[Ligar] [int] NULL,
	[Desligar] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dispositivo]    Script Date: 29/05/2017 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dispositivo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Tipo] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Dispositivo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoDispositivo]    Script Date: 29/05/2017 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoDispositivo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Data] [datetime] NOT NULL,
	[Valor] [int] NOT NULL,
	[DispositivoId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.EstadoDispositivo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AtuadorProgramavel]  WITH CHECK ADD  CONSTRAINT [FK_AtuadorProgramavel_Dispositivo] FOREIGN KEY([Id])
REFERENCES [dbo].[Dispositivo] ([Id])
GO
ALTER TABLE [dbo].[AtuadorProgramavel] CHECK CONSTRAINT [FK_AtuadorProgramavel_Dispositivo]
GO
ALTER TABLE [dbo].[EstadoDispositivo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EstadoDispositivo_dbo.Dispositivo_DispositivoId] FOREIGN KEY([DispositivoId])
REFERENCES [dbo].[Dispositivo] ([Id])
GO
ALTER TABLE [dbo].[EstadoDispositivo] CHECK CONSTRAINT [FK_dbo.EstadoDispositivo_dbo.Dispositivo_DispositivoId]
GO
/****** Object:  StoredProcedure [dbo].[AlterarProgramacao]    Script Date: 29/05/2017 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlterarProgramacao]
	@id int,
	@ligar int = null,
	@desligar int = null
AS
	IF @id IS NULL or  @id <= 0
	BEGIN
		SELECT -1 AS Id
	END
	ELSE
	BEGIN
		IF EXISTS (SELECT 1 FROM AtuadorProgramavel WHERE Id = @id)
			UPDATE AtuadorProgramavel SET Ligar = @ligar, Desligar = @desligar WHERE Id = @Id
		ELSE
			INSERT INTO AtuadorProgramavel (Id, Ligar, Desligar) Values (@id, @ligar, @desligar)
		SELECT 0
	END
GO
/****** Object:  StoredProcedure [dbo].[HistoricoUltimos30Dias]    Script Date: 29/05/2017 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HistoricoUltimos30Dias]
	@id int
AS
	SELECT * from EstadoDispositivo
	WHERE DispositivoId = @id AND Data >= DATEADD(day,-30,GETDATE())
	ORDER BY Data DESC
GO
/****** Object:  StoredProcedure [dbo].[ObterAtuadorAutomatico]    Script Date: 29/05/2017 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObterAtuadorAutomatico]
	@id int
AS
	SELECT * FROM AtuadorProgramavel a
	INNER JOIN Dispositivo d ON a.Id = d.Id
	WHERE a.Id = @id
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[ObterAtuadoresAutomaticos]    Script Date: 29/05/2017 17:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObterAtuadoresAutomaticos]
AS
	SELECT * FROM AtuadorProgramavel a
	INNER JOIN Dispositivo d ON a.Id = d.Id
--RETURN 0
GO
