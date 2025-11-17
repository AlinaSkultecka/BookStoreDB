CREATE PROCEDURE MoveBook
-- Input parameters:
    @ISBN13 CHAR(13),
    @AmountToMove INT = 1,
    @ShopIDMoveFrom INT,
    @ShopIDMoveTo INT
AS
BEGIN
	BEGIN TRAN;
		-- 1. Check that source row exists
		IF NOT EXISTS (
			SELECT 1 
			FROM StockBalance
			WHERE ShopID = @ShopIDMoveFrom AND ISBN13 = @ISBN13
		)
		BEGIN
			ROLLBACK TRAN;
			THROW 51000, 'Source shop does not have this book.', 1;
		END
		
		-- 2. Check that the source has enough copies
		IF (SELECT BookAmount 
			FROM StockBalance
			WHERE ShopID = @ShopIDMoveFrom AND ISBN13 = @ISBN13) < @AmountToMove
		BEGIN
			ROLLBACK TRAN;
			THROW 51000, 'Not enough books to move.', 1;
		END

		-- 3. Subtract from the source shop
		UPDATE StockBalance
		SET BookAmount = BookAmount - @AmountToMove
		WHERE ShopID = @ShopIDMoveFrom AND ISBN13 = @ISBN13;

		-- 4. Check if destination already has the book
		IF EXISTS (
			SELECT 1
			FROM StockBalance
			WHERE ShopID = @ShopIDMoveTo AND ISBN13 = @ISBN13
		)
		BEGIN
			-- Destination row exists ? UPDATE
			UPDATE StockBalance
			SET BookAmount = BookAmount + @AmountToMove
			WHERE ShopID = @ShopIDMoveTo AND ISBN13 = @ISBN13;
		END
		ELSE
		BEGIN
			-- Destination row does not exist ? INSERT
			INSERT INTO StockBalance (ShopID, ISBN13, BookAmount)
			VALUES (@ShopIDMoveTo, @ISBN13, @AmountToMove);
		END

		-- 5. Commit transaction
		COMMIT TRAN;
END;

--Move 3 copies of '9785000000001' from shop 1 to shop 2
EXEC MoveBook @ShopIDMoveFrom = 1, @ShopIDMoveTo = 2, @ISBN13 = '9785000000001', @AmountToMove = 3;

