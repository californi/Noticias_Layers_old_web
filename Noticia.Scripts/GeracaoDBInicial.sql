USE [Noticias]
GO
/****** Object:  Table [dbo].[tblDiaSemana]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDiaSemana](
	[IdDia] [int] NOT NULL,
	[Descricao] [varchar](20) NULL,
 CONSTRAINT [PK_tblDiaSemana] PRIMARY KEY CLUSTERED 
(
	[IdDia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNoticia]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblNoticia](
	[IdNoticia] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NULL,
	[Conteudo] [varchar](max) NULL,
 CONSTRAINT [PK_tblNoticia] PRIMARY KEY CLUSTERED 
(
	[IdNoticia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGrupoTrabalho]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGrupoTrabalho](
	[IdGrupoTrabalho] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NULL,
 CONSTRAINT [PK_tblGrupoTrabalho] PRIMARY KEY CLUSTERED 
(
	[IdGrupoTrabalho] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblImagem]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblImagem](
	[IdImagem] [int] IDENTITY(1,1) NOT NULL,
	[Legenda] [varchar](100) NULL,
 CONSTRAINT [PK_tblImagem] PRIMARY KEY CLUSTERED 
(
	[IdImagem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTipoUsuario]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTipoUsuario](
	[IdTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NULL,
 CONSTRAINT [PK_tblTipoUsuario] PRIMARY KEY CLUSTERED 
(
	[IdTipoUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStatusNoticia]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStatusNoticia](
	[IdStatus] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NULL,
 CONSTRAINT [PK_tblStatusNoticia] PRIMARY KEY CLUSTERED 
(
	[IdStatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPermissao]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPermissao](
	[IdPermissao] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NULL,
 CONSTRAINT [PK_tblPermissao] PRIMARY KEY CLUSTERED 
(
	[IdPermissao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPalavraChave]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPalavraChave](
	[IdPalavraChave] [int] IDENTITY(1,1) NOT NULL,
	[IdNoticia] [int] NOT NULL,
	[PalavraChave] [varchar](50) NULL,
 CONSTRAINT [PK_tblPalavraChave] PRIMARY KEY CLUSTERED 
(
	[IdPalavraChave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNoticiaImagem]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNoticiaImagem](
	[IdNoticia] [int] NOT NULL,
	[IdImagem] [int] NOT NULL,
 CONSTRAINT [PK_tblNoticiaImagem] PRIMARY KEY CLUSTERED 
(
	[IdNoticia] ASC,
	[IdImagem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNoticiaGrupoTrabalho]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNoticiaGrupoTrabalho](
	[IdNoticia] [int] NOT NULL,
	[IdGrupoTrabalho] [int] NOT NULL,
 CONSTRAINT [PK_tblNoticiaGrupoTrabalho] PRIMARY KEY CLUSTERED 
(
	[IdNoticia] ASC,
	[IdGrupoTrabalho] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NULL,
	[Senha] [varchar](50) NULL,
	[Nome] [varchar](50) NULL,
	[IdTipoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_tblUsuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTrabalho]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrabalho](
	[IdTrabalho] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoUsuario] [int] NOT NULL,
	[ValorHoraTrabalhada] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tblTrabalho] PRIMARY KEY CLUSTERED 
(
	[IdTrabalho] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblImagemGravacao]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblImagemGravacao](
	[IdImagem] [int] NOT NULL,
	[DataHoraGravacao] [datetime] NULL,
	[LocalGravacao] [varchar](50) NULL,
 CONSTRAINT [PK_tblImagemGravacao] PRIMARY KEY CLUSTERED 
(
	[IdImagem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblImagemArquivo]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblImagemArquivo](
	[IdImagem] [int] NOT NULL,
	[Imagem] [varbinary](max) NULL,
	[Extensao] [varchar](10) NULL,
	[Tamanho] [nchar](10) NULL,
	[Formato] [varchar](50) NULL,
 CONSTRAINT [PK_tblImagemArquivo] PRIMARY KEY CLUSTERED 
(
	[IdImagem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsuarioPermissao]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuarioPermissao](
	[IdUsuario] [int] NOT NULL,
	[IdPermissao] [int] NOT NULL,
 CONSTRAINT [PK_tblUsuarioPermissao] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdPermissao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuarioEndereco]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsuarioEndereco](
	[IdUsuario] [int] NOT NULL,
	[Email] [varchar](50) NULL,
	[Telefone] [varchar](50) NULL,
 CONSTRAINT [PK_tblUsuarioEndereco] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblContratacao]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContratacao](
	[IdUsuario] [int] NOT NULL,
	[DataHora] [datetime] NULL,
 CONSTRAINT [PK_tblContratacao] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHistorico]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistorico](
	[IdHistorico] [int] IDENTITY(1,1) NOT NULL,
	[IdNoticia] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdStatus] [int] NOT NULL,
	[DataHora] [datetime] NULL,
 CONSTRAINT [PK_tblHistorico] PRIMARY KEY CLUSTERED 
(
	[IdHistorico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGrupoTrabalhoUsuario]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGrupoTrabalhoUsuario](
	[IdGrupoTrabalho] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_tblGrupoTrabalhoUsuario] PRIMARY KEY CLUSTERED 
(
	[IdGrupoTrabalho] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiasTrabalhados]    Script Date: 06/07/2013 00:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiasTrabalhados](
	[IdUsuario] [int] NOT NULL,
	[IdDia] [int] NOT NULL,
 CONSTRAINT [PK_tblDiasTrabalhados_1] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdDia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_tblContratacao_tblUsuario]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblContratacao]  WITH CHECK ADD  CONSTRAINT [FK_tblContratacao_tblUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tblUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[tblContratacao] CHECK CONSTRAINT [FK_tblContratacao_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblDiasTrabalhados_tblDiaSemana1]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblDiasTrabalhados]  WITH CHECK ADD  CONSTRAINT [FK_tblDiasTrabalhados_tblDiaSemana1] FOREIGN KEY([IdDia])
REFERENCES [dbo].[tblDiaSemana] ([IdDia])
GO
ALTER TABLE [dbo].[tblDiasTrabalhados] CHECK CONSTRAINT [FK_tblDiasTrabalhados_tblDiaSemana1]
GO
/****** Object:  ForeignKey [FK_tblDiasTrabalhados_tblUsuario]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblDiasTrabalhados]  WITH CHECK ADD  CONSTRAINT [FK_tblDiasTrabalhados_tblUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tblUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[tblDiasTrabalhados] CHECK CONSTRAINT [FK_tblDiasTrabalhados_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblGrupoTrabalhoUsuario_tblGrupoTrabalho]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblGrupoTrabalhoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tblGrupoTrabalhoUsuario_tblGrupoTrabalho] FOREIGN KEY([IdGrupoTrabalho])
REFERENCES [dbo].[tblGrupoTrabalho] ([IdGrupoTrabalho])
GO
ALTER TABLE [dbo].[tblGrupoTrabalhoUsuario] CHECK CONSTRAINT [FK_tblGrupoTrabalhoUsuario_tblGrupoTrabalho]
GO
/****** Object:  ForeignKey [FK_tblGrupoTrabalhoUsuario_tblUsuario]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblGrupoTrabalhoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tblGrupoTrabalhoUsuario_tblUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tblUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[tblGrupoTrabalhoUsuario] CHECK CONSTRAINT [FK_tblGrupoTrabalhoUsuario_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblHistorico_tblNoticia]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblHistorico]  WITH CHECK ADD  CONSTRAINT [FK_tblHistorico_tblNoticia] FOREIGN KEY([IdNoticia])
REFERENCES [dbo].[tblNoticia] ([IdNoticia])
GO
ALTER TABLE [dbo].[tblHistorico] CHECK CONSTRAINT [FK_tblHistorico_tblNoticia]
GO
/****** Object:  ForeignKey [FK_tblHistorico_tblStatusNoticia]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblHistorico]  WITH CHECK ADD  CONSTRAINT [FK_tblHistorico_tblStatusNoticia] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[tblStatusNoticia] ([IdStatus])
GO
ALTER TABLE [dbo].[tblHistorico] CHECK CONSTRAINT [FK_tblHistorico_tblStatusNoticia]
GO
/****** Object:  ForeignKey [FK_tblHistorico_tblUsuario1]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblHistorico]  WITH CHECK ADD  CONSTRAINT [FK_tblHistorico_tblUsuario1] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tblUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[tblHistorico] CHECK CONSTRAINT [FK_tblHistorico_tblUsuario1]
GO
/****** Object:  ForeignKey [FK_tblImagemArquivo_tblImagem]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblImagemArquivo]  WITH CHECK ADD  CONSTRAINT [FK_tblImagemArquivo_tblImagem] FOREIGN KEY([IdImagem])
REFERENCES [dbo].[tblImagem] ([IdImagem])
GO
ALTER TABLE [dbo].[tblImagemArquivo] CHECK CONSTRAINT [FK_tblImagemArquivo_tblImagem]
GO
/****** Object:  ForeignKey [FK_tblImagemGravacao_tblImagem]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblImagemGravacao]  WITH CHECK ADD  CONSTRAINT [FK_tblImagemGravacao_tblImagem] FOREIGN KEY([IdImagem])
REFERENCES [dbo].[tblImagem] ([IdImagem])
GO
ALTER TABLE [dbo].[tblImagemGravacao] CHECK CONSTRAINT [FK_tblImagemGravacao_tblImagem]
GO
/****** Object:  ForeignKey [FK_tblNoticiaGrupoTrabalho_tblGrupoTrabalho]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblNoticiaGrupoTrabalho]  WITH CHECK ADD  CONSTRAINT [FK_tblNoticiaGrupoTrabalho_tblGrupoTrabalho] FOREIGN KEY([IdGrupoTrabalho])
REFERENCES [dbo].[tblGrupoTrabalho] ([IdGrupoTrabalho])
GO
ALTER TABLE [dbo].[tblNoticiaGrupoTrabalho] CHECK CONSTRAINT [FK_tblNoticiaGrupoTrabalho_tblGrupoTrabalho]
GO
/****** Object:  ForeignKey [FK_tblNoticiaGrupoTrabalho_tblNoticia]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblNoticiaGrupoTrabalho]  WITH CHECK ADD  CONSTRAINT [FK_tblNoticiaGrupoTrabalho_tblNoticia] FOREIGN KEY([IdNoticia])
REFERENCES [dbo].[tblNoticia] ([IdNoticia])
GO
ALTER TABLE [dbo].[tblNoticiaGrupoTrabalho] CHECK CONSTRAINT [FK_tblNoticiaGrupoTrabalho_tblNoticia]
GO
/****** Object:  ForeignKey [FK_tblNoticiaImagem_tblImagem]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblNoticiaImagem]  WITH CHECK ADD  CONSTRAINT [FK_tblNoticiaImagem_tblImagem] FOREIGN KEY([IdImagem])
REFERENCES [dbo].[tblImagem] ([IdImagem])
GO
ALTER TABLE [dbo].[tblNoticiaImagem] CHECK CONSTRAINT [FK_tblNoticiaImagem_tblImagem]
GO
/****** Object:  ForeignKey [FK_tblNoticiaImagem_tblNoticia]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblNoticiaImagem]  WITH CHECK ADD  CONSTRAINT [FK_tblNoticiaImagem_tblNoticia] FOREIGN KEY([IdNoticia])
REFERENCES [dbo].[tblNoticia] ([IdNoticia])
GO
ALTER TABLE [dbo].[tblNoticiaImagem] CHECK CONSTRAINT [FK_tblNoticiaImagem_tblNoticia]
GO
/****** Object:  ForeignKey [FK_tblPalavraChave_tblNoticia]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblPalavraChave]  WITH CHECK ADD  CONSTRAINT [FK_tblPalavraChave_tblNoticia] FOREIGN KEY([IdNoticia])
REFERENCES [dbo].[tblNoticia] ([IdNoticia])
GO
ALTER TABLE [dbo].[tblPalavraChave] CHECK CONSTRAINT [FK_tblPalavraChave_tblNoticia]
GO
/****** Object:  ForeignKey [FK_tblTrabalho_tblTipoUsuario]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblTrabalho]  WITH CHECK ADD  CONSTRAINT [FK_tblTrabalho_tblTipoUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[tblTipoUsuario] ([IdTipoUsuario])
GO
ALTER TABLE [dbo].[tblTrabalho] CHECK CONSTRAINT [FK_tblTrabalho_tblTipoUsuario]
GO
/****** Object:  ForeignKey [FK_tblUsuario_tblTipoUsuario]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuario_tblTipoUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[tblTipoUsuario] ([IdTipoUsuario])
GO
ALTER TABLE [dbo].[tblUsuario] CHECK CONSTRAINT [FK_tblUsuario_tblTipoUsuario]
GO
/****** Object:  ForeignKey [FK_tblUsuarioEndereco_tblUsuario]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblUsuarioEndereco]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioEndereco_tblUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tblUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[tblUsuarioEndereco] CHECK CONSTRAINT [FK_tblUsuarioEndereco_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblUsuarioPermissao_tblPermissao]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblUsuarioPermissao]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioPermissao_tblPermissao] FOREIGN KEY([IdPermissao])
REFERENCES [dbo].[tblPermissao] ([IdPermissao])
GO
ALTER TABLE [dbo].[tblUsuarioPermissao] CHECK CONSTRAINT [FK_tblUsuarioPermissao_tblPermissao]
GO
/****** Object:  ForeignKey [FK_tblUsuarioPermissao_tblUsuario]    Script Date: 06/07/2013 00:40:27 ******/
ALTER TABLE [dbo].[tblUsuarioPermissao]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioPermissao_tblUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tblUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[tblUsuarioPermissao] CHECK CONSTRAINT [FK_tblUsuarioPermissao_tblUsuario]
GO




INSERT INTO tblStatusNoticia (Descricao) values ('Criada')
INSERT INTO tblStatusNoticia (Descricao) values ('GrupoVinculado')
INSERT INTO tblStatusNoticia (Descricao) values ('ImagensAssociadas')
INSERT INTO tblStatusNoticia (Descricao) values ('Editada')
INSERT INTO tblStatusNoticia (Descricao) values ('Submetida')
INSERT INTO tblStatusNoticia (Descricao) values ('Aprovada')

INSERT INTO tblPermissao (Descricao) VALUES ('Efetuar Acesso')
INSERT INTO tblPermissao (Descricao) VALUES ('Criar Notícia')
INSERT INTO tblPermissao (Descricao) VALUES ('Manter grupo de trabalho')
INSERT INTO tblPermissao (Descricao) VALUES ('Submeter Imagens')
INSERT INTO tblPermissao (Descricao) VALUES ('Associar Imagens')
INSERT INTO tblPermissao (Descricao) VALUES ('Editar Notícia')
INSERT INTO tblPermissao (Descricao) VALUES ('Selecionar Imagens')
INSERT INTO tblPermissao (Descricao) VALUES ('Submeter Notícia')
INSERT INTO tblPermissao (Descricao) VALUES ('Avaliar Notícia')
INSERT INTO tblPermissao (Descricao) VALUES ('Manter Usuário')

INSERT INTO tblDiaSemana (IdDia,Descricao) VALUES (1,'Domingo')
INSERT INTO tblDiaSemana (IdDia,Descricao) VALUES (2,'Segunda-feira')
INSERT INTO tblDiaSemana (IdDia,Descricao) VALUES (3,'Terça-feira')
INSERT INTO tblDiaSemana (IdDia,Descricao) VALUES (4,'Quarta-feira')
INSERT INTO tblDiaSemana (IdDia,Descricao) VALUES (5,'Quinta-feira')
INSERT INTO tblDiaSemana (IdDia,Descricao) VALUES (6,'Sexta-feira')
INSERT INTO tblDiaSemana (IdDia,Descricao) VALUES (7,'Sábado')

INSERT INTO tblTipoUsuario (Descricao) VALUES ('Diretor')
INSERT INTO tblTipoUsuario (Descricao) VALUES ('Editor')
INSERT INTO tblTipoUsuario (Descricao) VALUES ('Reporter')
INSERT INTO tblTipoUsuario (Descricao) VALUES ('Fotógrafo')

INSERT INTO tblTrabalho (IdTipoUsuario,ValorHoraTrabalhada)values(3,0.0)
INSERT INTO tblTrabalho (IdTipoUsuario,ValorHoraTrabalhada)values(4,0.0)