select * from tblDiasTrabalhados
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'tblDiasTrabalhados'
GO

ALTER PROCEDURE [dbo].[spDiasTrabalhados]
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
