ALTER PROCEDURE [dbo].[spNoticia]
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
