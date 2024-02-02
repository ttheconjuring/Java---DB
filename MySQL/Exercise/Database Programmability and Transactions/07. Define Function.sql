CREATE FUNCTION ufn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 1;
    DECLARE len INT DEFAULT LENGTH(word);
    DECLARE set_len INT DEFAULT LENGTH(set_of_letters);
    DECLARE found INT DEFAULT 0;
    WHILE i <= len DO
        SET found = 0;
        WHILE j <= set_len DO
            IF SUBSTRING(word, i, 1) = SUBSTRING(set_of_letters, j, 1) THEN
                SET found = 1;
                SET j = set_len + 1;
            END IF;
            SET j = j + 1;
        END WHILE;
        IF found = 0 THEN
            RETURN 0;
        END IF;
        SET i = i + 1;
        SET j = 1;
    END WHILE;
    RETURN 1;
END
