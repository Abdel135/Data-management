--------------------------------------------------------
--  File created - Friday-February-17-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure INCREASE_COLUMN_SIZE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "INCREASE_COLUMN_SIZE" (p_table_name IN VARCHAR2, size_ integer) AS
  col_name user_tab_columns.column_name%TYPE;
  col_type user_tab_columns.data_type%TYPE;
  col_size user_tab_columns.data_length%TYPE;
BEGIN
  FOR c IN (SELECT column_name, data_type, data_length
            FROM user_tab_columns
            WHERE table_name = p_table_name) LOOP
    col_name := c.column_name;
    col_type := c.data_type;
    col_size := c.data_length + size_;
    if col_type = 'VARCHAR2' THEN 
        EXECUTE IMMEDIATE 'ALTER TABLE ' || p_table_name || ' MODIFY ' || col_name || ' ' || col_type || '(' || col_size || ')';
    END IF;
  END LOOP;
END increase_column_size;

/
--------------------------------------------------------
--  DDL for Procedure CONVERT_TO_VARCHAR2
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "CONVERT_TO_VARCHAR2" (p_table_name IN VARCHAR2)
AS
  v_column_name VARCHAR2(50);
  v_data_type VARCHAR2(50);
  cursor v_cursor is  
  SELECT column_name, data_type
  FROM USER_TAB_COLUMNS
  WHERE table_name = p_table_name;
BEGIN
  OPEN v_cursor;
  LOOP
    FETCH v_cursor INTO v_column_name, v_data_type;
    EXIT WHEN v_cursor%NOTFOUND;

    IF v_data_type IN ('NUMBER', 'FLOAT', 'INTEGER', 'DOUBLE PRECISION')
    THEN
      EXECUTE IMMEDIATE 'ALTER TABLE ' || p_table_name || ' MODIFY ' || v_column_name || ' VARCHAR2(20)';
    END IF;
  END LOOP;
  CLOSE v_cursor;
END convert_to_varchar2;

/
--------------------------------------------------------
--  DDL for Procedure ADD_FLAGS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ADD_FLAGS" (tableName varchar2) is 
    query varchar2(1000);
    category varchar(20); 
    regex varchar2(100); 
    dest_table varchar2(100); 
    cursor cur is SELECT COLUMN_NAME, DATA_TYPE FROM all_tab_columns
    WHERE table_name = UPPER(tableName);
    begin 
        dest_table := UPPER(tableName||'_anomalies');
        query := 'create table '||dest_table||' as (select * from '||upper(tableName)||')';
        EXECUTE IMMEDIATE query;
        for col in cur loop 
            begin 
            if col.data_type = 'VARCHAR2' then 
                    EXECUTE IMMEDIATE 'select CONTRAINTE from META03_CONSTRAINTS where IDCONSTRAINT in 
                    (select NEGCONSTRAINTSINTRACOL from  META04_DATASTRUCTURES1 where upper(COLUMNNAME) ='''||col.column_name||''')' into regex;
                    query := 'update '||dest_table||' set '||col.column_name||' = '||col.column_name||'|| ''<?!1ANOMALY>'' where  not regexp_like('||col.column_name||','''||regex||''')';
                    EXECUTE IMMEDIATE query;
                query := 'UPDATE '||dest_table||' set '||col.column_name||' = ''<?MISSINGVALUE>''
                    WHERE  '||col.column_name||' IS NULL 
                    OR regexp_like('||col.column_name||','||chr(39)||'^[ ]*$'||chr(39)||') 
                    OR ltrim(rtrim(lower('||col.column_name||')))
                    IN ('||chr(39)||'~'||chr(39)||',
                    '||chr(39)||'-'||chr(39)||',
                    '||chr(39)||'nan'||chr(39)||',
                    '||chr(39)||'null'||chr(39)||',
                    '||chr(39)||'no-data'||chr(39)||',
                    '||chr(39)||'no data'||chr(39)||')';
                    EXECUTE IMMEDIATE query;
            end if;
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
               continue;
            end;

        end loop;
end;

/
--------------------------------------------------------
--  DDL for Function COUNT_NULL_OR_INVALID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "COUNT_NULL_OR_INVALID" (table_name VARCHAR2, column_name VARCHAR2)
RETURN NUMBER
AS
   count_ NUMBER;
   query varchar2(1000);
BEGIN
EXECUTE IMMEDIATE  'SELECT COUNT(*) 
   FROM   (SELECT '||column_name||'
           FROM   '||table_name||'
           WHERE  '||column_name||' IS NULL 
           OR regexp_like('||column_name||','||chr(39)||'^[ ]*$'||chr(39)||') 
           OR ltrim(rtrim(lower('||column_name||'))) 
           IN ('||chr(39)||'~'||chr(39)||',
                '||chr(39)||'-'||chr(39)||',
                '||chr(39)||'nan'||chr(39)||',
                '||chr(39)||'null'||chr(39)||',
                '||chr(39)||'no-data'||chr(39)||',
                '||chr(39)||'no data available'||chr(39)||',
                '||chr(39)||'no data'||chr(39)||')
          )' INTO count_;

    return count_;
END;

/
--------------------------------------------------------
--  DDL for Function GET_COLUMN_NAMES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "GET_COLUMN_NAMES" (table_ IN VARCHAR2) return varchar2 
is
  column_list VARCHAR2(4000);
  cursor curs is SELECT column_name FROM USER_TAB_COLUMNS WHERE table_name = table_;
BEGIN
    for cur in curs loop 
        column_list := column_list ||' ,'|| cur.column_name;
    end loop;
    column_list := substr(column_list,3,length(column_list)-2); 
--DBMS_OUTPUT.PUT_LINE(column_list); 
return column_list;
END;

/
