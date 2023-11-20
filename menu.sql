CREATE DEFINER=`root`@`localhost` PROCEDURE `LibraryMenu`()
BEGIN
  DECLARE choice INT;
  
  menu: LOOP
    SELECT '1. Agregar nuevo libro' AS 'Menu';
    SELECT '2. Buscar libro por título' AS 'Menu';
    SELECT '3. Buscar libro por ISBN' AS 'Menu';
    SELECT '4. Listar todos los libros' AS 'Menu';
    SELECT '5. Abastecer libros' AS 'Menu';
    SELECT '6. Vender libros' AS 'Menu';
    SELECT '7. Ver transacciones de abastecimiento' AS 'Menu';
    SELECT '8. Obtener libro más costoso' AS 'Menu';
    SELECT '9. Obtener libro más vendido' AS 'Menu';
    SELECT '10. Salir' AS 'Menu';
    
    SELECT 'Ingrese el número de la opción deseada:' INTO choice;
        SET choice = IFNULL(choice, -1); 
    
    CASE choice
      WHEN 1 THEN CALL add_book();
      WHEN 2 THEN CALL search_book_by_title();
      WHEN 3 THEN CALL search_book_by_isbn();
      WHEN 4 THEN SELECT * FROM books;
      WHEN 5 THEN CALL supply_books();
      WHEN 6 THEN CALL sell_books();
      WHEN 7 THEN CALL get_supply_transactions();
      WHEN 8 THEN CALL get_most_expensive_book();
      WHEN 9 THEN CALL get_most_sold_book();
      WHEN 10 THEN LEAVE menu;
    END CASE;

  END LOOP menu;
END