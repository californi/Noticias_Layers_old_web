select * from tblStatusNoticia
go

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
