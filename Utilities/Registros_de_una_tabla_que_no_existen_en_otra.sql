SELECT T1.* 
       FROM Tabla1 as T1 
       WHERE campo1='xxxx' AND campo1='yyyy' and NOT EXISTS (SELECT T2.* FROM Tabla2 as T2 WHERE T1.campo=T2.campo and T1.campo2=T2.campo3 /*aca va la calve primaria*/);