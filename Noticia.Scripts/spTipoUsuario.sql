USE [Noticias]
GO
/****** Object:  StoredProcedure [dbo].[spTipoUsuario]    Script Date: 06/05/2013 23:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spTipoUsuario]
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
