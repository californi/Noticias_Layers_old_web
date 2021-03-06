USE [Noticias]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetTableFromIntList]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetTableFromIntList]
(@strIntList VARCHAR(MAX),
 @strDelimiter VARCHAR(10)
)
 
RETURNS @tblList TABLE (ID INT NOT NULL)
 
AS
 
BEGIN
 
DECLARE    @iStartPos INT,@iEndPos INT,@strValue VARCHAR(15)
SET @iStartPos = 1
SET @strIntList = @strIntList + @strDelimiter
SET @iEndPos = CHARINDEX(@strDelimiter, @strIntList)
 
WHILE @iEndPos > 0
 
BEGIN
 
    SET @strValue = SUBSTRING(@strIntList, @iStartPos, @iEndPos - @iStartPos)
    INSERT @tblList (ID) VALUES(CONVERT(INT, @strValue))
    SET @iStartPos = @iEndPos + 1
    SET @iEndPos = CHARINDEX(@strDelimiter, @strIntList, @iStartPos)
END
RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[spDiaSemana]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDiaSemana]
	@vchAcao VARCHAR(50),
	@intIdDia INT =	NULL,
	@vchDescricao VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblDia.IdDia,
			tblDia.Descricao
		FROM
			tblDiaSemana tblDia
		WHERE
		(
			((tblDia.IdDia = @intIdDia) OR (@intIdDia IS NULL)) AND
			((tblDia.Descricao LIKE '%' + @vchDescricao + '%') OR (@vchDescricao IS NULL))
		)
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spGrupoTrabalho]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGrupoTrabalho]
	@vchAcao VARCHAR(50),
	@intIdGrupoTrabalho INT = NULL,
	@vchDescricao VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblGru.IdGrupoTrabalho,
			tblGru.Descricao
		FROM
			tblGrupoTrabalho tblGru
		WHERE
		(
			((tblGru.IdGrupoTrabalho = @intIdGrupoTrabalho) OR (@intIdGrupoTrabalho IS NULL)) AND
			((lower(tblGru.Descricao) LIKE '%' + lower(@vchDescricao) + '%') OR (@vchDescricao IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		INSERT INTO tblGrupoTrabalho
					(
						Descricao
					)
					VALUES
					(
						@vchDescricao
					)
					
		SELECT @@IDENTITY AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblGrupoTrabalho
		SET
			Descricao = @vchDescricao
		WHERE
			IdGrupoTrabalho = @intIdGrupoTrabalho
			
		SELECT @intIdGrupoTrabalho AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblGrupoTrabalho 
		WHERE 
			IdGrupoTrabalho = @intIdGrupoTrabalho
			
		SELECT @intIdGrupoTrabalho AS Retorno
	END
	ELSE
	BEGIN

		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spImagem]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spImagem]
	@vchAcao VARCHAR(50),
	@intIdImagem INT =	NULL,
	@vchLegenda VARCHAR(100) = NULL,
	@bitSelecionada BIT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblImg.IdImagem,
			tblImg.Legenda,
			tblImg.Selecionada
		FROM
			tblImagem tblImg
		WHERE
		(
			((tblImg.IdImagem = @intIdImagem) OR (@intIdImagem IS NULL)) AND
			((tblImg.Legenda LIKE '%' + @vchLegenda + '%') OR (@vchLegenda IS NULL)) AND
			((tblImg.Selecionada = @bitSelecionada) OR (@bitSelecionada IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		INSERT INTO tblImagem
					(
						Legenda,
						Selecionada
					)
					VALUES
					(
						@vchLegenda,
						@bitSelecionada
					)
					
		SELECT @@IDENTITY AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblImagem
		SET
			Legenda = @vchLegenda,
			Selecionada = @bitSelecionada
			
		WHERE
			IdImagem = @intIdImagem
			
		SELECT @intIdImagem AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblImagem 
		WHERE
			IdImagem = @intIdImagem
			
		SELECT @intIdImagem AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spTipoUsuario]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTipoUsuario]
	@vchAcao VARCHAR(50),
	@intIdTipoUsuario INT =	NULL,
	@vchDescricao VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblTipUsu.IdTipoUsuario,
			tblTipUsu.Descricao
		FROM
			tblTipoUsuario tblTipUsu
		WHERE
		(
			((tblTipUsu.IdTipoUsuario = @intIdTipoUsuario) OR (@intIdTipoUsuario IS NULL)) AND
			((tblTipUsu.Descricao LIKE '%' + @vchDescricao + '%') OR (@vchDescricao IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		INSERT INTO tblTipoUsuario
					(
						Descricao
					)
					VALUES
					(
						@vchDescricao
					)
					
		SELECT @@IDENTITY AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblTipoUsuario
		SET
			Descricao = @vchDescricao
			
		WHERE
			IdTipoUsuario = @intIdTipoUsuario
			
		SELECT @intIdTipoUsuario AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblTipoUsuario 
		WHERE
			IdTipoUsuario = @intIdTipoUsuario
			
		SELECT @intIdTipoUsuario AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spStatusNoticia]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStatusNoticia]
	@vchAcao VARCHAR(50),
	@intIdStatus INT =	NULL,
	@vchDescricao VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblTipUsu.IdStatus,
			tblTipUsu.Descricao
		FROM
			tblStatusNoticia tblTipUsu
		WHERE
		(
			((tblTipUsu.IdStatus = @intIdStatus) OR (@intIdStatus IS NULL)) AND
			((tblTipUsu.Descricao LIKE '%' + @vchDescricao + '%') OR (@vchDescricao IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		INSERT INTO tblStatusNoticia
					(
						Descricao
					)
					VALUES
					(
						@vchDescricao
					)
					
		SELECT @@IDENTITY AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblStatusNoticia
		SET
			Descricao = @vchDescricao
			
		WHERE
			IdStatus = @intIdStatus
			
		SELECT @intIdStatus AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblStatusNoticia 
		WHERE
			IdStatus = @intIdStatus
			
		SELECT @intIdStatus AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spPermissao]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPermissao]
	@vchAcao VARCHAR(50),
	@intIdPermissao INT =	NULL,
	@vchDescricao VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblPer.IdPermissao,
			tblPer.Descricao
		FROM
			tblPermissao tblPer
		WHERE
		(
			((tblPer.IdPermissao = @intIdPermissao) OR (@intIdPermissao IS NULL)) AND
			((tblPer.Descricao LIKE '%' + @vchDescricao + '%') OR (@vchDescricao IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		INSERT INTO tblPermissao
					(
						Descricao
					)
					VALUES
					(
						@vchDescricao
					)
					
		SELECT @@IDENTITY AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblPermissao
		SET
			Descricao = @vchDescricao
			
		WHERE
			IdPermissao = @intIdPermissao
			
		SELECT @intIdPermissao AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblPermissao 
		WHERE
			IdPermissao = @intIdPermissao
			
		SELECT @intIdPermissao AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spNoticia]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNoticia]
	@vchAcao VARCHAR(50),
	@intIdNoticia INT = NULL,
	@vchTitulo VARCHAR(50) = NULL,
	@vchConteudo VARCHAR(MAX) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblNot.IdNoticia,
			tblNot.Titulo,
			tblNot.Conteudo
		FROM
			tblNoticia tblNot
		WHERE
		(
			((tblNot.IdNoticia = @intIdNoticia) OR (@intIdNoticia IS NULL)) AND
			((tblNot.Titulo LIKE  '%' + @vchTitulo + '%') OR (@vchTitulo IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		INSERT INTO tblNoticia
					(
						Titulo,
						Conteudo
					)
					VALUES
					(
						@vchTitulo,
						@vchConteudo
					)
					
		SELECT @@IDENTITY AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblNoticia
		SET
			Titulo = @vchTitulo,
			Conteudo = @vchConteudo
		WHERE
			IdNoticia = @intIdNoticia
			
		SELECT @intIdNoticia AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblNoticia 
		WHERE 
			IdNoticia = @intIdNoticia
			
		SELECT @intIdNoticia AS Retorno
	END
	ELSE
	BEGIN

		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spUsuario]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUsuario]
	@vchAcao VARCHAR(50),
	@intIdUsuario	INT = NULL,
	@vchLogin	VARCHAR(50) = NULL,
	@vchSenha	VARCHAR(50)= NULL,
	@vchNome	VARCHAR(50) = NULL,
	@intIdTipoUsuario INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblUsu.IdUsuario,
			tblUsu.Login,
			tblUsu.Senha,
			tblUsu.Nome,
			tblUsu.IdTipoUsuario
		FROM
			tblUsuario tblUsu
		WHERE
		(
			((tblUsu.IdUsuario = @intIdUsuario) OR (@intIdUsuario IS NULL)) AND
			((tblUsu.Login = @vchLogin AND tblUsu.Senha = @vchSenha) OR (@vchLogin IS NULL AND @vchSenha IS NULL)) AND
			((tblUsu.Nome LIKE '%' + @vchNome + '%') OR (@vchNome IS NULL)) AND
			((tblUsu.IdTipoUsuario = @intIdTipoUsuario) OR (@intIdTipoUsuario IS NULL))
		)
		
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		INSERT INTO tblUsuario
					(
						Login,
						Senha,
						Nome,
						IdTipoUsuario
					)
					VALUES
					(
						@vchLogin,
						@vchSenha,
						@vchNome,
						@intIdTipoUsuario
					)
					
		SELECT @@IDENTITY AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblUsuario
		SET
			Login = @vchLogin,
			Senha = @vchSenha,
			Nome = @vchNome,
			IdTipoUsuario = @intIdTipoUsuario
		WHERE
			IdUsuario = @intIdUsuario
			
		SELECT @intIdUsuario AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblUsuario 
		WHERE
			IdUsuario = @intIdUsuario
			
		SELECT @intIdUsuario AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spTrabalho]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTrabalho]
	@vchAcao VARCHAR(50),
	@intIdTrabalho INT = NULL,
	@intIdTipoUsuario INT = NULL,
	@decValorHoraTrabalhada DECIMAL(10,2) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblTra.IdTrabalho,
			tblTra.IdTipoUsuario,
			tblTra.ValorHoraTrabalhada
		FROM
			tblTrabalho tblTra
		WHERE
		(
			((tblTra.IdTrabalho = @intIdTrabalho) OR (@intIdTrabalho IS NULL)) AND
			((tblTra.IdTipoUsuario = @intIdTipoUsuario) OR (@intIdTipoUsuario IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		INSERT INTO tblTrabalho
					(
						IdTipoUsuario,
						ValorHoraTrabalhada
					)
					VALUES
					(
						@intIdTipoUsuario,
						@decValorHoraTrabalhada
					)
					
		SELECT @@IDENTITY AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblTrabalho
		SET
			IdTipoUsuario = @intIdTipoUsuario,
			ValorHoraTrabalhada = @decValorHoraTrabalhada
		WHERE
			IdTrabalho = @intIdTrabalho
			
		SELECT @intIdTrabalho AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblTrabalho 
		WHERE
			IdTrabalho = @intIdTrabalho
			
		SELECT @intIdTrabalho AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spImagemGravacao]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spImagemGravacao]
	@vchAcao VARCHAR(50),
	@intIdImagem INT = NULL,
	@datDataHoraGravacao DATETIME = NULL,
	@vchLocalGravacao VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblImg.IdImagem,
			tblImg.DataHoraGravacao,
			tblImg.LocalGravacao
		FROM
			tblImagemGravacao tblImg
		WHERE
		(
			((tblImg.IdImagem = @intIdImagem) OR (@intIdImagem IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
	
		IF NOT EXISTS(SELECT 1 FROM tblImagemGravacao WHERE IdImagem = @intIdImagem)
		BEGIN
			INSERT INTO tblImagemGravacao
						(
							IdImagem,
							DataHoraGravacao,
							LocalGravacao
						)
						VALUES
						(
							@intIdImagem,
							@datDataHoraGravacao,
							@vchLocalGravacao
						)
		END
		ELSE
		BEGIN
			UPDATE
				tblImagemGravacao
			SET
				DataHoraGravacao = @datDataHoraGravacao,
				LocalGravacao = @vchLocalGravacao
			WHERE
				IdImagem = @intIdImagem
		END
					
		SELECT @intIdImagem AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblImagemGravacao
		SET
			DataHoraGravacao = @datDataHoraGravacao,
			LocalGravacao = @vchLocalGravacao
		WHERE
			IdImagem = @intIdImagem
			
		SELECT @intIdImagem AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblImagemGravacao 
		WHERE
			IdImagem = @intIdImagem
			
		SELECT @intIdImagem AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spImagemArquivo]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spImagemArquivo]
	@vchAcao VARCHAR(50),
	@intIdImagem INT = NULL,
	@binImagem VARBINARY(MAX) = NULL,
	@vchExtensao VARCHAR(10) = NULL,
	@vchTamanho NCHAR(10) = NULL,
	@vchFormato VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblImg.IdImagem,
			tblImg.Imagem,
			tblImg.Extensao,
			tblImg.Tamanho,
			tblImg.Formato
		FROM
			tblImagemArquivo tblImg
		WHERE
		(
			((tblImg.IdImagem = @intIdImagem) OR (@intIdImagem IS NULL)) AND
			((tblImg.Extensao LIKE '%' + @vchExtensao + '%') OR (@vchExtensao IS NULL)) AND
			((tblImg.Formato LIKE '%' + @vchFormato + '%') OR (@vchFormato IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		INSERT INTO tblImagemArquivo
					(
						IdImagem,
						Imagem,
						Extensao,
						Tamanho,
						Formato
					)
					VALUES
					(
						@intIdImagem,
						@binImagem,
						@vchExtensao,
						@vchTamanho,
						@vchFormato
					)
					
		SELECT @intIdImagem AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblImagemArquivo
		SET
			Formato = @vchFormato
		WHERE
			IdImagem = @intIdImagem
			
		SELECT @intIdImagem AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblImagemArquivo 
		WHERE
			IdImagem = @intIdImagem
			
		SELECT @intIdImagem AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spPalavraChave]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPalavraChave]
	@vchAcao VARCHAR(50),
	@intIdPalavraChave INT = NULL,
	@intIdNoticia INT = NULL,
	@vchPalavraChave VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblPal.IdPalavraChave,
			tblPal.IdNoticia,
			tblPal.PalavraChave
		FROM
			tblPalavraChave tblPal
		WHERE
		(
			((tblPal.IdPalavraChave = @intIdPalavraChave) OR (@intIdPalavraChave IS NULL)) AND
			((tblPal.IdNoticia = @intIdNoticia) OR (@intIdNoticia IS NULL)) AND
			((tblPal.PalavraChave LIKE '%' + @vchPalavraChave + '%') OR (@vchPalavraChave IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM tblPalavraChave WHERE IdNoticia = @intIdNoticia AND PalavraChave = @vchPalavraChave)
		BEGIN
			INSERT INTO tblPalavraChave
						(
							IdNoticia,
							PalavraChave
						)
						VALUES
						(
							@intIdNoticia,
							@vchPalavraChave
						)
						
			SET @intIdPalavraChave = @@IDENTITY
		END
					
		SELECT @intIdNoticia AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblPalavraChave
		SET
			PalavraChave = @vchPalavraChave
		WHERE
			IdPalavraChave = @intIdPalavraChave
			
		SELECT @intIdPalavraChave AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblPalavraChave 
		WHERE
			IdNoticia = @intIdNoticia
			
		SELECT @intIdPalavraChave AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spNoticiaImagem]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNoticiaImagem]
	@vchAcao VARCHAR(50),
	@intIdNoticia INT = NULL,
	@intIdImagem INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblNotImg.IdNoticia,
			tblNotImg.IdImagem
		FROM
			tblNoticiaImagem tblNotImg
		WHERE
		(
			((tblNotImg.IdNoticia = @intIdNoticia) OR (@intIdNoticia IS NULL)) AND
			((tblNotImg.IdImagem = @intIdImagem) OR (@intIdImagem IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM tblNoticiaImagem WHERE IdNoticia = @intIdNoticia AND IdImagem = @intIdImagem)
		BEGIN
			INSERT INTO tblNoticiaImagem
						(
							IdNoticia,
							IdImagem
						)
						VALUES
						(
							@intIdNoticia,
							@intIdImagem
						)
		END
					
		SELECT @intIdNoticia AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblNoticiaImagem 
		WHERE
			IdNoticia = @intIdNoticia AND
			IdImagem = @intIdImagem
			
		SELECT @intIdNoticia AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spNoticiaGrupoTrabalho]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNoticiaGrupoTrabalho]
	@vchAcao VARCHAR(50),
	@intIdNoticia INT = NULL,
	@intIdGrupoTrabalho INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblTra.IdNoticia,
			tblTra.IdGrupoTrabalho
		FROM
			tblNoticiaGrupoTrabalho tblTra
		WHERE
		(
			((tblTra.IdNoticia = @intIdNoticia) OR (@intIdNoticia IS NULL)) AND
			((tblTra.IdGrupoTrabalho = @intIdGrupoTrabalho) OR (@intIdGrupoTrabalho IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM tblNoticiaGrupoTrabalho WHERE IdGrupoTrabalho = @intIdGrupoTrabalho AND IdNoticia = @intIdNoticia)
		BEGIN
	
			INSERT INTO tblNoticiaGrupoTrabalho
						(
							IdNoticia,
							IdGrupoTrabalho
						)
						VALUES
						(
							@intIdNoticia,
							@intIdGrupoTrabalho
						)
		END
					
		SELECT @intIdNoticia AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblNoticiaGrupoTrabalho 
		WHERE
			IdNoticia = @intIdNoticia AND
			IdGrupoTrabalho = @intIdGrupoTrabalho
			
		SELECT @intIdNoticia AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spUsuarioPermissao]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUsuarioPermissao]
	@vchAcao VARCHAR(50),
	@intIdUsuario INT = NULL,
	@intIdPermissao INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblUsuPer.IdUsuario,
			tblUsuPer.IdPermissao
		FROM
			tblUsuarioPermissao tblUsuPer
		WHERE
		(
			((tblUsuPer.IdUsuario = @intIdUsuario) OR (@intIdUsuario IS NULL)) AND
			((tblUsuPer.IdPermissao = @intIdPermissao) OR (@intIdPermissao IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM tblUsuarioPermissao WHERE IdUsuario = @intIdUsuario AND IdPermissao = @intIdPermissao)
		BEGIN
			INSERT INTO tblUsuarioPermissao
						(
							IdUsuario,
							IdPermissao
						)
						VALUES
						(
							@intIdUsuario,
							@intIdPermissao
						)
		END
		SELECT @intIdUsuario AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblUsuarioPermissao 
		WHERE
			IdUsuario = @intIdUsuario AND
			IdPermissao = @intIdPermissao
			
		SELECT @intIdUsuario AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR_POR_USUARIO')
	BEGIN
		DELETE FROM 
			tblUsuarioPermissao 
		WHERE
			IdUsuario = @intIdUsuario
			
		SELECT @intIdUsuario AS Retorno
	END	
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spUsuarioEndereco]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUsuarioEndereco]
	@vchAcao VARCHAR(50),
	@intIdUsuario INT = NULL,
	@vchEmail VARCHAR(50) = NULL,
	@vchTelefone VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblEnd.IdUsuario,
			tblEnd.Email,
			tblEnd.Telefone
		FROM
			tblUsuarioEndereco tblEnd
		WHERE
		(
			((tblEnd.IdUsuario = @intIdUsuario) OR (@intIdUsuario IS NULL)) AND
			((tblEnd.Email LIKE '%' + @vchEmail + '%') OR (@vchEmail IS NULL)) AND
			((tblEnd.Telefone LIKE '%' + @vchTelefone + '%') OR (@vchTelefone IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		INSERT INTO tblUsuarioEndereco
					(
						IdUsuario,
						Email,
						Telefone
					)
					VALUES
					(
						@intIdUsuario,
						@vchEmail,
						@vchTelefone
					)
					
		SELECT @intIdUsuario AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblUsuarioEndereco
		SET
			Email = @vchEmail,
			Telefone = @vchTelefone
		WHERE
			IdUsuario = @intIdUsuario
			
		SELECT @intIdUsuario AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblUsuarioEndereco 
		WHERE
			IdUsuario = @intIdUsuario
			
		SELECT @intIdUsuario AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spHistorico]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE
 PROCEDURE [dbo].[spHistorico]
	@vchAcao VARCHAR(50),
	@intIdHistorico INT = NULL,
	@intIdNoticia INT = NULL,
	@intIdUsuario INT = NULL,
	@intIdStatus INT = NULL,
	@datDataHora DATETIME = NULL,
	@vchVariosIdStatus VARCHAR(50) = NULL,
	@vchDescricao VARCHAR(MAX) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
	
		Declare @sql VARCHAR(MAX)

		SELECT
			tblHis.IdHistorico,
			tblHis.IdNoticia,
			tblHis.IdUsuario,
			tblHis.IdStatus,
			tblHis.DataHora,
			tblHis.Descricao
		FROM
			tblHistorico tblHis
		WHERE
		(
			((tblHis.IdHistorico = @intIdHistorico) OR (@intIdHistorico IS NULL)) AND
			((tblHis.IdNoticia = @intIdNoticia) OR (@intIdNoticia IS NULL)) AND
			((tblHis.IdUsuario = @intIdUsuario) OR (@intIdUsuario IS NULL)) AND
			((tblHis.IdStatus in (SELECT ID FROM fn_GetTableFromIntList(@vchVariosIdStatus,',')) OR (@vchVariosIdStatus IS NULL)))
		)
		
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		INSERT INTO tblHistorico
					(
						IdNoticia,
						IdUsuario,
						IdStatus,
						DataHora,
						Descricao
					)
					VALUES
					(
						@intIdNoticia,
						@intIdUsuario,
						@intIdStatus,
						@datDataHora,
						@vchDescricao
					)
					
		SELECT @intIdUsuario AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spGrupoTrabalhoUsuario]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGrupoTrabalhoUsuario]
	@vchAcao VARCHAR(50),
	@intIdUsuario INT = NULL,
	@intIdGrupoTrabalho INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblTra.IdUsuario,
			tblTra.IdGrupoTrabalho
		FROM
			tblGrupoTrabalhoUsuario tblTra
		WHERE
		(
			((tblTra.IdUsuario = @intIdUsuario) OR (@intIdUsuario IS NULL)) AND
			((tblTra.IdGrupoTrabalho = @intIdGrupoTrabalho) OR (@intIdGrupoTrabalho IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM tblGrupoTrabalhoUsuario WHERE IdUsuario = @intIdUsuario AND IdGrupoTrabalho = @intIdGrupoTrabalho)
		BEGIN
	
			INSERT INTO tblGrupoTrabalhoUsuario
						(
							IdUsuario,
							IdGrupoTrabalho
						)
						VALUES
						(
							@intIdUsuario,
							@intIdGrupoTrabalho
						)
		END
					
		SELECT @intIdUsuario AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblGrupoTrabalhoUsuario 
		WHERE
			IdUsuario = @intIdUsuario AND
			IdGrupoTrabalho = @intIdGrupoTrabalho
			
		SELECT @intIdUsuario AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR_POR_USUARIO')
	BEGIN
		DELETE FROM 
			tblGrupoTrabalhoUsuario 
		WHERE
			IdUsuario = @intIdUsuario
			
		SELECT @intIdUsuario AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spDiasTrabalhados]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDiasTrabalhados]
	@vchAcao VARCHAR(50),
	@intIdUsuario INT = NULL,
	@intIdDia INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblTra.IdUsuario,
			tblTra.IdDia
		FROM
			tblDiasTrabalhados tblTra
		WHERE
		(
			((tblTra.IdUsuario = @intIdUsuario) OR (@intIdUsuario IS NULL)) AND
			((tblTra.IdDia = @intIdDia) OR (@intIdDia IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM tblDiasTrabalhados WHERE IdUsuario = @intIdUsuario AND IdDia = @intIdDia)
		BEGIN
			INSERT INTO tblDiasTrabalhados
						(
							IdUsuario,
							IdDia
						)
						VALUES
						(
							@intIdUsuario,
							@intIdDia
						)
		END
					
		SELECT @intIdUsuario AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblDiasTrabalhados 
		WHERE
			IdUsuario = @intIdUsuario AND
			IdDia = @intIdDia
			
		SELECT @intIdUsuario AS Retorno
	END
	ELSE
	BEGIN
		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spContratacao]    Script Date: 06/21/2013 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spContratacao]
	@vchAcao VARCHAR(50),
	@intIdUsuario INT = NULL,
	@datDataHora DATETIME = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(upper(@vchAcao) = 'SELECIONAR')
	BEGIN
		SELECT
			tblCon.IdUsuario,
			tblCon.DataHora
		FROM
			tblContratacao tblCon
		WHERE
		(
			((tblCon.IdUsuario = @intIdUsuario) OR (@intIdUsuario IS NULL))
		)
	END
	ELSE IF(upper(@vchAcao) = 'INSERIR')
	BEGIN
		INSERT INTO tblContratacao
					(
						IdUsuario,
						DataHora
					)
					VALUES
					(
						@intIdUsuario,
						@datDataHora
					)
					
		SELECT @intIdUsuario AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'ALTERAR')
	BEGIN
		UPDATE
			tblContratacao
		SET
			DataHora = @datDataHora
		WHERE
			IdUsuario = @intIdUsuario
			
		SELECT @intIdUsuario AS Retorno
	END
	ELSE IF(upper(@vchAcao) = 'DELETAR')
	BEGIN
		DELETE FROM 
			tblContratacao 
		WHERE 
			IdUsuario = @intIdUsuario
			
		SELECT @intIdUsuario AS Retorno
	END
	ELSE
	BEGIN

		SELECT 'AÇÃO INEXISTENTE' AS Retorno
	END
END
GO
