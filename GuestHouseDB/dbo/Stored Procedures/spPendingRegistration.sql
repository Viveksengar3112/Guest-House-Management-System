CREATE PROCEDURE [dbo].[spPendingRegistration]
(
	@Action nvarchar(10),
	@Email varchar(50) =null
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--INSERT
	IF @Action = 'ACCEPT'
	BEGIN;
		INSERT INTO dbo.Login(
			FirstName,
			LastName,
			Email,
			MobileNo,
			ID,
			Password
		)
		SELECT 
			FirstName,
			LastName,
			Email,
			MobileNo,
			ID,
			Password
		FROM dbo.Registration
		WHERE Email=@Email;

		DELETE FROM dbo.Registration
		WHERE Email=@Email;

	END

	IF @Action = 'DELETE'
	BEGIN
		DELETE FROM dbo.Registration
		WHERE Email=@Email;
	END

END
RETURN 0