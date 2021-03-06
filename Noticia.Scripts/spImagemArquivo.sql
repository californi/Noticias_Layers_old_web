select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'tblImagemArquivo'
go

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
					
		SELECT @@IDENTITY AS Retorno
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
